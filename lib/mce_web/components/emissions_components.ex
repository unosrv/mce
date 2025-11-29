defmodule MceWeb.EmissionsComponents do
  @moduledoc """
  Components for displaying emissions data and charts.
  """
  use Phoenix.Component
  use Gettext, backend: MceWeb.Gettext

  @doc """
  Renders a statistics card for emissions data.

  ## Examples

      <.stat_card
        title="Total Emissions"
        value={389.1}
        unit="t CO₂e"
        icon="hero-chart-bar"
        color="primary"
      />
  """
  attr :title, :string, required: true
  attr :value, :any, required: true
  attr :unit, :string, default: nil
  attr :icon, :string, default: nil
  attr :color, :string, default: "primary"
  attr :class, :string, default: nil

  def stat_card(assigns) do
    ~H"""
    <div class={[
      "stat bg-base-100 rounded-box shadow",
      @class
    ]}>
      <div :if={@icon} class={"stat-figure text-#{@color}"}>
        <.icon name={@icon} class="size-8" />
      </div>
      <div class="stat-title">{@title}</div>
      <div class={"stat-value text-#{@color}"}>
        {format_value(@value)}
        <span :if={@unit} class="text-lg font-normal text-base-content/60">{@unit}</span>
      </div>
    </div>
    """
  end

  defp format_value(value) when is_float(value) do
    :erlang.float_to_binary(value, decimals: 1)
  end

  defp format_value(%Decimal{} = value) do
    value
    |> Decimal.round(1)
    |> Decimal.to_string()
  end

  defp format_value(value), do: to_string(value)

  @doc """
  Renders a donut chart for emissions source breakdown.

  ## Examples

      <.emissions_donut_chart
        id="source-chart"
        enteric={275.5}
        manure_ch4={12.6}
        manure_n2o={100.0}
      />
  """
  attr :id, :string, required: true
  attr :enteric, :any, required: true
  attr :manure_ch4, :any, required: true
  attr :manure_n2o, :any, required: true
  attr :class, :string, default: nil

  def emissions_donut_chart(assigns) do
    series = [
      to_float(assigns.enteric),
      to_float(assigns.manure_ch4),
      to_float(assigns.manure_n2o)
    ]

    labels = [
      gettext("Enteric Fermentation"),
      gettext("Manure CH₄"),
      gettext("Manure N₂O")
    ]

    colors = ["#22c55e", "#f59e0b", "#ef4444"]

    assigns =
      assigns
      |> assign(:series, Jason.encode!(series))
      |> assign(:labels, Jason.encode!(labels))
      |> assign(:colors, Jason.encode!(colors))

    ~H"""
    <div class={["card bg-base-100 shadow-xl", @class]}>
      <div class="card-body">
        <h2 class="card-title text-base-content/80">
          <.icon name="hero-chart-pie" class="size-5" />
          {gettext("Emissions by Source")}
        </h2>
        <div
          id={@id}
          phx-hook="ApexChart"
          phx-update="ignore"
          data-chart-type="donut"
          data-chart-series={@series}
          data-chart-labels={@labels}
          data-chart-colors={@colors}
          data-chart-height="280"
          class="w-full"
        >
        </div>
      </div>
    </div>
    """
  end

  @doc """
  Renders a stacked bar chart for emissions by livestock group.

  ## Examples

      <.emissions_group_chart
        id="group-chart"
        groups={[
          %{name: "Dairy Herd", enteric: 137.7, manure_ch4: 6.3, manure_n2o: 50.0},
          %{name: "Beef Cattle", enteric: 151.6, manure_ch4: 6.5, manure_n2o: 26.0}
        ]}
      />
  """
  attr :id, :string, required: true
  attr :groups, :list, required: true
  attr :class, :string, default: nil

  def emissions_group_chart(assigns) do
    categories = Enum.map(assigns.groups, & &1["group_name"])

    series = [
      %{
        name: gettext("Enteric"),
        data: Enum.map(assigns.groups, &to_float(&1["enteric_co2e"]))
      },
      %{
        name: gettext("Manure CH₄"),
        data: Enum.map(assigns.groups, &to_float(&1["manure_ch4_co2e"]))
      },
      %{
        name: gettext("Manure N₂O"),
        data: Enum.map(assigns.groups, &to_float(&1["manure_n2o_co2e"]))
      }
    ]

    colors = ["#22c55e", "#f59e0b", "#ef4444"]

    options = %{
      chart: %{stacked: true},
      xaxis: %{categories: categories},
      plotOptions: %{bar: %{horizontal: false, columnWidth: "60%"}},
      legend: %{position: "top"}
    }

    assigns =
      assigns
      |> assign(:series, Jason.encode!(series))
      |> assign(:colors, Jason.encode!(colors))
      |> assign(:options, Jason.encode!(options))

    ~H"""
    <div class={["card bg-base-100 shadow-xl", @class]}>
      <div class="card-body">
        <h2 class="card-title text-base-content/80">
          <.icon name="hero-chart-bar" class="size-5" />
          {gettext("Emissions by Group")}
        </h2>
        <div
          id={@id}
          phx-hook="ApexChart"
          phx-update="ignore"
          data-chart-type="bar"
          data-chart-series={@series}
          data-chart-colors={@colors}
          data-chart-options={@options}
          data-chart-height="300"
          class="w-full"
        >
        </div>
      </div>
    </div>
    """
  end

  @doc """
  Renders a detailed table of emissions by livestock group.

  ## Examples

      <.emissions_table groups={@report.breakdown_by_group} />
  """
  attr :groups, :list, required: true
  attr :class, :string, default: nil

  def emissions_table(assigns) do
    ~H"""
    <div class={["card bg-base-100 shadow-xl", @class]}>
      <div class="card-body">
        <h2 class="card-title text-base-content/80">
          <.icon name="hero-table-cells" class="size-5" />
          {gettext("Livestock Group Details")}
        </h2>
        <div class="overflow-x-auto">
          <table class="table table-zebra">
            <thead>
              <tr>
                <th>{gettext("Group Name")}</th>
                <th class="text-right">{gettext("Head Count")}</th>
                <th class="text-right">{gettext("Enteric")}</th>
                <th class="text-right">{gettext("Manure CH₄")}</th>
                <th class="text-right">{gettext("Manure N₂O")}</th>
                <th class="text-right">{gettext("Total")}</th>
              </tr>
            </thead>
            <tbody>
              <tr :for={group <- @groups}>
                <td class="font-medium">{group["group_name"]}</td>
                <td class="text-right">{group["head_count"]}</td>
                <td class="text-right text-success">{format_emission(group["enteric_co2e"])}</td>
                <td class="text-right text-warning">{format_emission(group["manure_ch4_co2e"])}</td>
                <td class="text-right text-error">{format_emission(group["manure_n2o_co2e"])}</td>
                <td class="text-right font-bold">{format_emission(group["total_co2e"])}</td>
              </tr>
            </tbody>
            <tfoot>
              <tr class="font-bold">
                <td>{gettext("Total")}</td>
                <td class="text-right">{sum_field(@groups, "head_count")}</td>
                <td class="text-right text-success">
                  {format_emission(sum_field(@groups, "enteric_co2e"))}
                </td>
                <td class="text-right text-warning">
                  {format_emission(sum_field(@groups, "manure_ch4_co2e"))}
                </td>
                <td class="text-right text-error">
                  {format_emission(sum_field(@groups, "manure_n2o_co2e"))}
                </td>
                <td class="text-right">{format_emission(sum_field(@groups, "total_co2e"))}</td>
              </tr>
            </tfoot>
          </table>
        </div>
        <p class="text-sm text-base-content/60 mt-2">
          {gettext("All values in tonnes CO₂ equivalent")}
        </p>
      </div>
    </div>
    """
  end

  defp format_emission(value) when is_float(value) do
    :erlang.float_to_binary(value, decimals: 2)
  end

  defp format_emission(%Decimal{} = value) do
    value
    |> Decimal.round(2)
    |> Decimal.to_string()
  end

  defp format_emission(value) when is_integer(value) do
    :erlang.float_to_binary(value / 1, decimals: 2)
  end

  defp format_emission(nil), do: "0.00"
  defp format_emission(value), do: to_string(value)

  defp sum_field(groups, field) do
    Enum.reduce(groups, 0, fn group, acc ->
      acc + to_float(group[field])
    end)
  end

  defp to_float(%Decimal{} = d), do: Decimal.to_float(d)
  defp to_float(f) when is_float(f), do: f
  defp to_float(i) when is_integer(i), do: i / 1
  defp to_float(nil), do: 0.0
  defp to_float(_), do: 0.0

  @doc """
  Renders a grouped bar chart comparing emissions across multiple farms.

  ## Examples

      <.farm_comparison_chart
        id="comparison-chart"
        farms={[
          %{name: "Farm A", total: 100.0, enteric: 60.0, manure_ch4: 25.0, manure_n2o: 15.0},
          %{name: "Farm B", total: 150.0, enteric: 90.0, manure_ch4: 35.0, manure_n2o: 25.0}
        ]}
      />
  """
  attr :id, :string, required: true
  attr :farms, :list, required: true
  attr :class, :string, default: nil

  def farm_comparison_chart(assigns) do
    categories = Enum.map(assigns.farms, & &1.name)

    series = [
      %{
        name: gettext("Enteric"),
        data: Enum.map(assigns.farms, &to_float(&1.enteric))
      },
      %{
        name: gettext("Manure CH₄"),
        data: Enum.map(assigns.farms, &to_float(&1.manure_ch4))
      },
      %{
        name: gettext("Manure N₂O"),
        data: Enum.map(assigns.farms, &to_float(&1.manure_n2o))
      }
    ]

    colors = ["#22c55e", "#f59e0b", "#ef4444"]

    options = %{
      chart: %{stacked: true},
      xaxis: %{categories: categories},
      plotOptions: %{bar: %{horizontal: false, columnWidth: "50%"}},
      legend: %{position: "top"},
      yaxis: %{title: %{text: gettext("tonnes CO₂e")}}
    }

    assigns =
      assigns
      |> assign(:series, Jason.encode!(series))
      |> assign(:colors, Jason.encode!(colors))
      |> assign(:options, Jason.encode!(options))

    ~H"""
    <div class={["card bg-base-100 shadow-xl", @class]}>
      <div class="card-body">
        <h2 class="card-title text-base-content/80">
          <.icon name="hero-chart-bar" class="size-5" />
          {gettext("Emissions Comparison")}
        </h2>
        <div
          id={@id}
          phx-hook="ApexChart"
          phx-update="ignore"
          data-chart-type="bar"
          data-chart-series={@series}
          data-chart-colors={@colors}
          data-chart-options={@options}
          data-chart-height="350"
          class="w-full"
        >
        </div>
      </div>
    </div>
    """
  end

  @doc """
  Renders a comparison table for multiple farms.

  ## Examples

      <.farm_comparison_table farms={farms_data} />
  """
  attr :farms, :list, required: true
  attr :class, :string, default: nil

  def farm_comparison_table(assigns) do
    ~H"""
    <div class={["card bg-base-100 shadow-xl", @class]}>
      <div class="card-body">
        <h2 class="card-title text-base-content/80">
          <.icon name="hero-table-cells" class="size-5" />
          {gettext("Comparison Details")}
        </h2>
        <div class="overflow-x-auto">
          <table class="table table-zebra">
            <thead>
              <tr>
                <th>{gettext("Farm")}</th>
                <th class="text-right">{gettext("Enteric")}</th>
                <th class="text-right">{gettext("Manure CH₄")}</th>
                <th class="text-right">{gettext("Manure N₂O")}</th>
                <th class="text-right">{gettext("Total")}</th>
              </tr>
            </thead>
            <tbody>
              <tr :for={farm <- @farms}>
                <td class="font-medium">{farm.name}</td>
                <td class="text-right text-success">{format_emission(farm.enteric)}</td>
                <td class="text-right text-warning">{format_emission(farm.manure_ch4)}</td>
                <td class="text-right text-error">{format_emission(farm.manure_n2o)}</td>
                <td class="text-right font-bold">{format_emission(farm.total)}</td>
              </tr>
            </tbody>
          </table>
        </div>
        <p class="text-sm text-base-content/60 mt-2">
          {gettext("All values in tonnes CO₂ equivalent")}
        </p>
      </div>
    </div>
    """
  end

  # Import icon component from core_components
  defp icon(assigns) do
    MceWeb.CoreComponents.icon(assigns)
  end
end
