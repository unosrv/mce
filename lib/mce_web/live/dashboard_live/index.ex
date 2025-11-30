defmodule MceWeb.DashboardLive.Index do
  use MceWeb, :live_view

  alias Mce.Farms
  alias MceWeb.Live.Components.{LineChart, DonutChart}

  @impl true
  def mount(_params, _session, socket) do
    user_id = socket.assigns.current_scope.user.id
    stats = Farms.get_dashboard_stats(user_id)
    recent_farms = Farms.list_recent_farms_with_stats(user_id, 5)
    trend_data = Farms.get_emissions_trend_data(user_id)
    breakdown_data = Farms.get_emissions_breakdown(user_id)

    {:ok,
     socket
     |> assign(:page_title, gettext("Dashboard"))
     |> assign(:stats, stats)
     |> assign(:recent_farms, recent_farms)
     |> assign(:trend_data, trend_data)
     |> assign(:breakdown_data, breakdown_data)
     |> assign(:current_url, "/dashboard")}
  end

  @impl true
  def handle_params(_params, uri, socket) do
    current_url = URI.parse(uri).path
    {:noreply, assign(socket, :current_url, current_url)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.dashboard_layout
      flash={@flash}
      current_scope={@current_scope}
      current_url={@current_url}
      locale={@locale}
    >
      <div class="container mx-auto px-4 py-6">
        <%!-- Stats Row --%>
        <div class="grid grid-cols-1 gap-4 sm:grid-cols-3">
          <.stat_card
            title={gettext("Total Emissions")}
            value={format_emissions(@stats.total_emissions)}
            unit="tonnes CO₂e"
            icon="hero-fire"
            color="error"
          />
          <.stat_card
            title={gettext("Active Farms")}
            value={@stats.farm_count}
            unit={ngettext("farm", "farms", @stats.farm_count)}
            icon="hero-building-office-2"
            color="primary"
          />
          <.stat_card
            title={gettext("Livestock Groups")}
            value={@stats.livestock_group_count}
            unit={ngettext("group", "groups", @stats.livestock_group_count)}
            icon="hero-beaker"
            color="secondary"
          />
        </div>

        <%!-- Charts Section --%>
        <div
          :if={has_chart_data?(@trend_data, @breakdown_data)}
          class="mt-8 grid grid-cols-1 gap-6 lg:grid-cols-3"
        >
          <%!-- Emissions Trend Chart --%>
          <div class="card bg-base-100 shadow-lg lg:col-span-2">
            <div class="card-body">
              <h2 class="card-title flex items-center gap-2">
                <.icon name="hero-chart-bar" class="size-5 text-primary" />
                {gettext("Emissions Trend")}
              </h2>
              <.live_component
                module={LineChart}
                id="emissions-trend-chart"
                series={@trend_data.series}
                categories={Enum.map(@trend_data.years, &to_string/1)}
                height={300}
                y_axis_title={gettext("tonnes CO₂e")}
                show_legend={true}
              />
            </div>
          </div>

          <%!-- Emissions by Type Donut Chart --%>
          <div class="card bg-base-100 shadow-lg">
            <div class="card-body">
              <h2 class="card-title flex items-center gap-2">
                <.icon name="hero-chart-pie" class="size-5 text-secondary" />
                {gettext("Emissions by Type")}
              </h2>
              <.live_component
                module={DonutChart}
                id="emissions-breakdown-chart"
                series={@breakdown_data.series}
                labels={@breakdown_data.labels}
                height={280}
                show_legend={true}
              />
            </div>
          </div>
        </div>

        <%!-- Empty Charts State --%>
        <div :if={not has_chart_data?(@trend_data, @breakdown_data)} class="mt-8">
          <div class="card bg-base-200 p-8 text-center">
            <.icon name="hero-chart-bar" class="mx-auto size-16 text-base-content/30" />
            <h3 class="mt-4 text-lg font-semibold">{gettext("No emissions data yet")}</h3>
            <p class="mt-2 text-base-content/60">
              {gettext("Charts will appear once you have emission reports for your farms.")}
            </p>
          </div>
        </div>

        <%!-- Quick Actions --%>
        <div class="mt-8 flex flex-wrap gap-4">
          <.link navigate={~p"/farms/new"}>
            <.button class="btn-primary gap-2">
              <.icon name="hero-plus" class="size-5" />
              {gettext("Add Farm")}
            </.button>
          </.link>
          <.link navigate={~p"/farms"}>
            <.button class="btn-outline gap-2">
              <.icon name="hero-building-office-2" class="size-5" />
              {gettext("View All Farms")}
            </.button>
          </.link>
          <.link navigate={~p"/compare"}>
            <.button class="btn-outline gap-2">
              <.icon name="hero-scale" class="size-5" />
              {gettext("Compare Farms")}
            </.button>
          </.link>
        </div>

        <%!-- Recent Farms Table --%>
        <div class="mt-8">
          <h2 class="mb-4 flex items-center gap-2 text-lg font-semibold">
            <.icon name="hero-clock" class="size-5 text-base-content/60" />
            {gettext("Recent Farms")}
          </h2>

          <div :if={@recent_farms == []} class="card bg-base-200 p-8 text-center">
            <.icon name="hero-building-office-2" class="mx-auto size-16 text-base-content/30" />
            <h3 class="mt-4 text-lg font-semibold">{gettext("No farms yet")}</h3>
            <p class="mt-2 text-base-content/60">
              {gettext("Create your first farm to start tracking emissions.")}
            </p>
          </div>

          <div :if={@recent_farms != []} class="overflow-x-auto">
            <table class="table" id="recent-farms-table">
              <thead>
                <tr>
                  <th>{gettext("Name")}</th>
                  <th>{gettext("Country")}</th>
                  <th class="text-right">{gettext("Livestock Groups")}</th>
                  <th class="text-right">{gettext("Total Emissions")}</th>
                  <th class="text-center">{gettext("Actions")}</th>
                </tr>
              </thead>
              <tbody>
                <tr :for={farm <- @recent_farms} id={"farm-#{farm.id}"} class="hover">
                  <td>
                    <div class="flex items-center gap-3">
                      <img src={country_flag_src(farm.country)} alt="" class="size-6 rounded-sm" />
                      <div>
                        <div class="font-medium">{farm.name}</div>
                        <div class="text-sm text-base-content/60">
                          {format_address(farm)}
                        </div>
                      </div>
                    </div>
                  </td>
                  <td>{country_name(farm.country)}</td>
                  <td class="text-right">
                    <span class="badge badge-ghost">{length(farm.livestock_groups)}</span>
                  </td>
                  <td class="text-right">
                    <span class={[
                      "font-medium",
                      emissions_color_class(farm)
                    ]}>
                      {format_farm_emissions(farm)}
                    </span>
                  </td>
                  <td class="text-center">
                    <div class="flex justify-center gap-2">
                      <.link
                        navigate={~p"/farms/#{farm}"}
                        class="btn btn-ghost btn-sm btn-square"
                        title={gettext("View")}
                      >
                        <.icon name="hero-eye" class="size-4" />
                      </.link>
                      <.link
                        navigate={~p"/farms/#{farm}/emissions"}
                        class="btn btn-ghost btn-sm btn-square"
                        title={gettext("Emissions Report")}
                      >
                        <.icon name="hero-fire" class="size-4" />
                      </.link>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </Layouts.dashboard_layout>
    """
  end

  # Stat card component
  attr :title, :string, required: true
  attr :value, :any, required: true
  attr :unit, :string, required: true
  attr :icon, :string, required: true
  attr :color, :string, default: "primary"

  defp stat_card(assigns) do
    ~H"""
    <div class="card bg-base-100 shadow-lg">
      <div class="card-body">
        <div class="flex items-center justify-between">
          <div>
            <p class="text-sm text-base-content/60">{@title}</p>
            <p class="mt-1 text-3xl font-bold">{@value}</p>
            <p class="text-sm text-base-content/60">{@unit}</p>
          </div>
          <div class={[
            "rounded-full p-3",
            stat_icon_bg_class(@color)
          ]}>
            <.icon name={@icon} class={"size-8 " <> stat_icon_text_class(@color)} />
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp stat_icon_bg_class("primary"), do: "bg-primary/10"
  defp stat_icon_bg_class("secondary"), do: "bg-secondary/10"
  defp stat_icon_bg_class("error"), do: "bg-error/10"
  defp stat_icon_bg_class(_), do: "bg-base-200"

  defp stat_icon_text_class("primary"), do: "text-primary"
  defp stat_icon_text_class("secondary"), do: "text-secondary"
  defp stat_icon_text_class("error"), do: "text-error"
  defp stat_icon_text_class(_), do: "text-base-content"

  defp format_emissions(decimal) do
    decimal
    |> Decimal.round(2)
    |> Decimal.to_string()
  end

  defp country_flag_src("KR"), do: ~p"/images/flags/1x1/kr.svg"
  defp country_flag_src("US"), do: ~p"/images/flags/1x1/us.svg"
  defp country_flag_src("BR"), do: ~p"/images/flags/1x1/br.svg"
  defp country_flag_src(_), do: ~p"/images/flags/1x1/kr.svg"

  defp country_name("KR"), do: gettext("Korea")
  defp country_name("US"), do: gettext("United States")
  defp country_name("BR"), do: gettext("Brazil")
  defp country_name(_), do: gettext("Other")

  defp format_address(farm) do
    cond do
      farm.road_address -> farm.road_address
      farm.address_line1 -> farm.address_line1
      farm.city -> farm.city
      true -> gettext("No address")
    end
  end

  defp format_farm_emissions(farm) do
    case get_latest_emission_report(farm) do
      nil -> "-"
      report -> format_emissions(report.total_emissions) <> " t"
    end
  end

  defp emissions_color_class(farm) do
    case get_latest_emission_report(farm) do
      nil -> "text-base-content/60"
      _report -> "text-error"
    end
  end

  defp get_latest_emission_report(farm) do
    farm.emission_reports
    |> Enum.sort_by(& &1.report_year, :desc)
    |> List.first()
  end

  defp has_chart_data?(trend_data, breakdown_data) do
    trend_data.years != [] or breakdown_data.series != []
  end
end
