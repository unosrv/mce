defmodule MceWeb.ReportController do
  use MceWeb, :controller

  alias Mce.Farms
  alias Mce.Emissions
  alias Mce.Reports.PdfGenerator

  def download_emission_report(conn, %{"farm_id" => farm_id, "year" => year}) do
    user = conn.assigns.current_scope.user
    year = String.to_integer(year)

    with {:ok, farm} <- get_farm_for_user(user, farm_id),
         {:ok, report} <- get_or_build_report(farm, year),
         {:ok, pdf_binary} <- PdfGenerator.generate_emission_report(farm, report) do
      filename = "#{slugify(farm.name)}_emission_report_#{year}.pdf"

      conn
      |> put_resp_content_type("application/pdf")
      |> put_resp_header("content-disposition", ~s(attachment; filename="#{filename}"))
      |> send_resp(200, pdf_binary)
    else
      {:error, :not_found} ->
        conn
        |> put_flash(:error, gettext("Farm not found"))
        |> redirect(to: ~p"/farms")

      {:error, reason} ->
        conn
        |> put_flash(
          :error,
          gettext("Failed to generate PDF: %{reason}", reason: inspect(reason))
        )
        |> redirect(to: ~p"/farms/#{farm_id}")
    end
  end

  def download_comparison_report(conn, %{"year" => year} = params) do
    user = conn.assigns.current_scope.user
    year = String.to_integer(year)
    farm_ids = parse_farm_ids(params["farm_ids"])

    with {:ok, farms_with_reports} <- get_farms_with_reports(user, farm_ids, year),
         {:ok, pdf_binary} <- PdfGenerator.generate_comparison_report(farms_with_reports, year) do
      filename = "farm_comparison_report_#{year}.pdf"

      conn
      |> put_resp_content_type("application/pdf")
      |> put_resp_header("content-disposition", ~s(attachment; filename="#{filename}"))
      |> send_resp(200, pdf_binary)
    else
      {:error, reason} ->
        conn
        |> put_flash(
          :error,
          gettext("Failed to generate PDF: %{reason}", reason: inspect(reason))
        )
        |> redirect(to: ~p"/compare")
    end
  end

  defp get_farm_for_user(user, farm_id) do
    case Farms.get_farm_for_user(farm_id, user.id) do
      nil -> {:error, :not_found}
      farm -> {:ok, farm}
    end
  end

  defp get_or_build_report(farm, year) do
    case Emissions.get_emission_report_for_year(farm.id, year) do
      nil ->
        {:ok,
         %{
           report_year: year,
           fiscal_year_label: "#{year}",
           total_emissions: nil,
           enteric_emissions: nil,
           manure_ch4_emissions: nil,
           manure_n2o_emissions: nil,
           breakdown_by_source: nil
         }}

      report ->
        {:ok, report}
    end
  end

  defp get_farms_with_reports(user, farm_ids, year) do
    farms =
      if Enum.empty?(farm_ids) do
        Farms.list_farms_for_user(user.id)
      else
        Farms.list_farms_for_user(user.id)
        |> Enum.filter(&(&1.id in farm_ids))
      end

    farms_with_reports =
      Enum.map(farms, fn farm ->
        report = Emissions.get_emission_report_for_year(farm.id, year)
        {farm, report}
      end)

    {:ok, farms_with_reports}
  end

  defp parse_farm_ids(nil), do: []
  defp parse_farm_ids(""), do: []

  defp parse_farm_ids(ids) when is_binary(ids) do
    ids
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(&String.to_integer/1)
  end

  defp parse_farm_ids(ids) when is_list(ids), do: Enum.map(ids, &String.to_integer/1)

  defp slugify(name) do
    name
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9]+/, "_")
    |> String.trim("_")
  end
end
