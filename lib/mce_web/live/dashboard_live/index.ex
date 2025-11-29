defmodule MceWeb.DashboardLive.Index do
  use MceWeb, :live_view

  alias Mce.Farms

  @impl true
  def mount(_params, _session, socket) do
    user_id = socket.assigns.current_scope.user.id
    stats = Farms.get_dashboard_stats(user_id)
    recent_farms = Farms.list_recent_farms_with_stats(user_id, 5)

    {:ok,
     socket
     |> assign(:page_title, gettext("Dashboard"))
     |> assign(:stats, stats)
     |> assign(:recent_farms, recent_farms)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash} current_scope={@current_scope}>
      <div class="container mx-auto px-4 py-6">
        <.header>
          <div class="flex items-center gap-2">
            <.icon name="hero-chart-bar" class="size-8 text-primary" />
            <span>{gettext("Dashboard")}</span>
          </div>
        </.header>

        <%!-- Stats Row --%>
        <div class="mt-8 grid grid-cols-1 gap-4 sm:grid-cols-3">
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
                      <span class="text-xl">{country_flag(farm.country)}</span>
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
    </Layouts.app>
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

  defp country_flag("KR"), do: "🇰🇷"
  defp country_flag("US"), do: "🇺🇸"
  defp country_flag("BR"), do: "🇧🇷"
  defp country_flag(_), do: "🌍"

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
end
