defmodule Mce.Reports.PdfGenerator do
  @moduledoc """
  Generates PDF reports for emission data using ChromicPDF.
  Includes farm logo support.
  """

  use Gettext, backend: MceWeb.Gettext

  @doc """
  Generates a PDF report for farm emissions.

  Returns `{:ok, binary}` with the PDF content or `{:error, reason}`.
  """
  def generate_emission_report(farm, report, opts \\ []) do
    html = build_emission_report_html(farm, report, opts)

    ChromicPDF.print_to_pdf({:html, html},
      print_to_pdf: %{
        preferCSSPageSize: true,
        marginTop: 0.4,
        marginBottom: 0.4,
        marginLeft: 0.4,
        marginRight: 0.4
      }
    )
  end

  @doc """
  Generates a PDF comparison report for multiple farms.
  """
  def generate_comparison_report(farms, report_year, opts \\ []) do
    html = build_comparison_report_html(farms, report_year, opts)

    ChromicPDF.print_to_pdf({:html, html},
      print_to_pdf: %{
        preferCSSPageSize: true,
        marginTop: 0.4,
        marginBottom: 0.4,
        marginLeft: 0.4,
        marginRight: 0.4,
        landscape: true
      }
    )
  end

  defp build_emission_report_html(farm, report, _opts) do
    logo_html = build_logo_html(farm.logo_path)

    """
    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="UTF-8">
      <style>
        #{pdf_styles()}
      </style>
    </head>
    <body>
      <header class="report-header">
        <div class="header-content">
          #{logo_html}
          <div class="header-text">
            <h1>#{escape_html(farm.name)}</h1>
            <p class="subtitle">#{gettext("Emission Report")} - #{report.fiscal_year_label || report.report_year}</p>
          </div>
        </div>
        <div class="generated-date">
          #{gettext("Generated")}: #{format_date(DateTime.utc_now())}
        </div>
      </header>

      <section class="summary-section">
        <h2>#{gettext("Summary")}</h2>
        <div class="summary-grid">
          <div class="summary-card total">
            <div class="value">#{format_emission(report.total_emissions)}</div>
            <div class="label">#{gettext("Total Emissions")} (tCO₂e)</div>
          </div>
          <div class="summary-card">
            <div class="value">#{format_emission(report.enteric_emissions)}</div>
            <div class="label">#{gettext("Enteric Fermentation")}</div>
          </div>
          <div class="summary-card">
            <div class="value">#{format_emission(report.manure_ch4_emissions)}</div>
            <div class="label">#{gettext("Manure CH₄")}</div>
          </div>
          <div class="summary-card">
            <div class="value">#{format_emission(report.manure_n2o_emissions)}</div>
            <div class="label">#{gettext("Manure N₂O")}</div>
          </div>
        </div>
      </section>

      #{build_breakdown_section(report)}

      <footer class="report-footer">
        <p>#{gettext("Calculated using IPCC Tier 2 methodology")}</p>
        <p>MCE - #{gettext("Methane & Carbon Emissions")}</p>
      </footer>
    </body>
    </html>
    """
  end

  defp build_comparison_report_html(farms, report_year, _opts) do
    """
    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="UTF-8">
      <style>
        #{pdf_styles()}
        .comparison-table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        .comparison-table th, .comparison-table td { border: 1px solid #ddd; padding: 8px; text-align: right; }
        .comparison-table th { background: #f5f5f5; }
        .comparison-table td:first-child, .comparison-table th:first-child { text-align: left; }
        .farm-logo-cell { display: flex; align-items: center; gap: 8px; }
        .farm-logo-cell img { width: 24px; height: 24px; border-radius: 4px; object-fit: cover; }
      </style>
    </head>
    <body>
      <header class="report-header">
        <div class="header-content">
          <div class="header-text">
            <h1>#{gettext("Farm Comparison Report")}</h1>
            <p class="subtitle">#{gettext("Fiscal Year")} #{report_year}</p>
          </div>
        </div>
        <div class="generated-date">
          #{gettext("Generated")}: #{format_date(DateTime.utc_now())}
        </div>
      </header>

      <section class="comparison-section">
        <table class="comparison-table">
          <thead>
            <tr>
              <th>#{gettext("Farm")}</th>
              <th>#{gettext("Total Emissions")} (tCO₂e)</th>
              <th>#{gettext("Enteric")}</th>
              <th>#{gettext("Manure CH₄")}</th>
              <th>#{gettext("Manure N₂O")}</th>
            </tr>
          </thead>
          <tbody>
            #{Enum.map_join(farms, "\n", &build_comparison_row/1)}
          </tbody>
        </table>
      </section>

      <footer class="report-footer">
        <p>#{gettext("Calculated using IPCC Tier 2 methodology")}</p>
        <p>MCE - #{gettext("Methane & Carbon Emissions")}</p>
      </footer>
    </body>
    </html>
    """
  end

  defp build_comparison_row({farm, report}) do
    logo_img =
      if farm.logo_path do
        ~s(<img src="#{logo_data_uri(farm.logo_path)}" alt="">)
      else
        ""
      end

    """
    <tr>
      <td><div class="farm-logo-cell">#{logo_img} #{escape_html(farm.name)}</div></td>
      <td>#{format_emission(report && report.total_emissions)}</td>
      <td>#{format_emission(report && report.enteric_emissions)}</td>
      <td>#{format_emission(report && report.manure_ch4_emissions)}</td>
      <td>#{format_emission(report && report.manure_n2o_emissions)}</td>
    </tr>
    """
  end

  defp build_logo_html(nil), do: ""

  defp build_logo_html(logo_path) do
    data_uri = logo_data_uri(logo_path)

    """
    <div class="farm-logo">
      <img src="#{data_uri}" alt="Farm logo">
    </div>
    """
  end

  defp logo_data_uri(logo_path) do
    full_path = Path.join([:code.priv_dir(:mce), "static", logo_path])

    if File.exists?(full_path) do
      content = File.read!(full_path)
      mime_type = mime_type_from_path(logo_path)
      base64 = Base.encode64(content)
      "data:#{mime_type};base64,#{base64}"
    else
      ""
    end
  end

  defp mime_type_from_path(path) do
    case Path.extname(path) |> String.downcase() do
      ".png" -> "image/png"
      ".jpg" -> "image/jpeg"
      ".jpeg" -> "image/jpeg"
      ".gif" -> "image/gif"
      ".svg" -> "image/svg+xml"
      _ -> "image/png"
    end
  end

  defp build_breakdown_section(%{breakdown_by_source: nil}), do: ""

  defp build_breakdown_section(%{breakdown_by_source: breakdown}) when is_map(breakdown) do
    rows =
      breakdown
      |> Enum.map(fn {source, value} ->
        """
        <tr>
          <td>#{format_source_name(source)}</td>
          <td>#{format_emission(value)}</td>
        </tr>
        """
      end)
      |> Enum.join("\n")

    """
    <section class="breakdown-section">
      <h2>#{gettext("Breakdown by Source")}</h2>
      <table class="breakdown-table">
        <thead>
          <tr>
            <th>#{gettext("Source")}</th>
            <th>#{gettext("Emissions")} (tCO₂e)</th>
          </tr>
        </thead>
        <tbody>
          #{rows}
        </tbody>
      </table>
    </section>
    """
  end

  defp build_breakdown_section(_), do: ""

  defp format_source_name(source) when is_binary(source) do
    source
    |> String.replace("_", " ")
    |> String.split()
    |> Enum.map_join(" ", &String.capitalize/1)
  end

  defp format_source_name(source), do: to_string(source)

  defp format_emission(nil), do: "-"
  defp format_emission(%Decimal{} = value), do: Decimal.round(value, 2) |> Decimal.to_string()

  defp format_emission(value) when is_number(value),
    do: :erlang.float_to_binary(value / 1, decimals: 2)

  defp format_emission(_), do: "-"

  defp format_date(%DateTime{} = dt) do
    Calendar.strftime(dt, "%Y-%m-%d %H:%M UTC")
  end

  defp escape_html(nil), do: ""

  defp escape_html(text) when is_binary(text) do
    text
    |> String.replace("&", "&amp;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
    |> String.replace("\"", "&quot;")
  end

  defp pdf_styles do
    """
    @page {
      size: A4;
      margin: 20mm;
    }
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
      font-size: 12px;
      line-height: 1.5;
      color: #333;
      margin: 0;
      padding: 0;
    }
    .report-header {
      border-bottom: 2px solid #22c55e;
      padding-bottom: 16px;
      margin-bottom: 24px;
    }
    .header-content {
      display: flex;
      align-items: center;
      gap: 16px;
    }
    .farm-logo img {
      width: 64px;
      height: 64px;
      border-radius: 8px;
      object-fit: cover;
      border: 1px solid #e5e7eb;
    }
    .header-text h1 {
      margin: 0;
      font-size: 24px;
      color: #111;
    }
    .header-text .subtitle {
      margin: 4px 0 0;
      color: #666;
      font-size: 14px;
    }
    .generated-date {
      margin-top: 8px;
      color: #999;
      font-size: 11px;
    }
    h2 {
      font-size: 16px;
      color: #111;
      border-bottom: 1px solid #e5e7eb;
      padding-bottom: 8px;
      margin-top: 24px;
    }
    .summary-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 16px;
      margin-top: 16px;
    }
    .summary-card {
      background: #f9fafb;
      border: 1px solid #e5e7eb;
      border-radius: 8px;
      padding: 16px;
      text-align: center;
    }
    .summary-card.total {
      background: #dcfce7;
      border-color: #22c55e;
    }
    .summary-card .value {
      font-size: 24px;
      font-weight: bold;
      color: #111;
    }
    .summary-card .label {
      font-size: 11px;
      color: #666;
      margin-top: 4px;
    }
    .breakdown-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 16px;
    }
    .breakdown-table th,
    .breakdown-table td {
      border: 1px solid #e5e7eb;
      padding: 8px 12px;
      text-align: left;
    }
    .breakdown-table th {
      background: #f9fafb;
      font-weight: 600;
    }
    .breakdown-table td:last-child {
      text-align: right;
    }
    .report-footer {
      margin-top: 40px;
      padding-top: 16px;
      border-top: 1px solid #e5e7eb;
      text-align: center;
      color: #999;
      font-size: 10px;
    }
    .report-footer p {
      margin: 4px 0;
    }
    """
  end
end
