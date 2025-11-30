defmodule MceWeb.CompareLive.Index do
  @moduledoc """
  LiveView for comparing emissions across multiple farms.

  Allows users to select 2-4 farms and compare their emissions
  using charts and tables.
  """
  use MceWeb, :live_view

  alias Mce.Farms

  import MceWeb.EmissionsComponents

  @impl true
  def mount(_params, _session, socket) do
    user_id = socket.assigns.current_scope.user.id
    farms = Farms.list_farms_with_emissions(user_id)

    {:ok,
     socket
     |> assign(:page_title, gettext("Compare Farms"))
     |> assign(:farms, farms)
     |> assign(:selected_ids, MapSet.new())
     |> assign(:comparison_data, [])
     |> assign(:current_url, "/compare")}
  end

  @impl true
  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("toggle_farm", %{"id" => id}, socket) do
    selected_ids = socket.assigns.selected_ids

    selected_ids =
      if MapSet.member?(selected_ids, id) do
        MapSet.delete(selected_ids, id)
      else
        # Limit to 4 farms for comparison
        if MapSet.size(selected_ids) < 4 do
          MapSet.put(selected_ids, id)
        else
          selected_ids
        end
      end

    comparison_data =
      if MapSet.size(selected_ids) >= 2 do
        build_comparison_data(socket.assigns.farms, selected_ids)
      else
        []
      end

    {:noreply,
     socket
     |> assign(:selected_ids, selected_ids)
     |> assign(:comparison_data, comparison_data)}
  end

  defp build_comparison_data(farms, selected_ids) do
    farms
    |> Enum.filter(&MapSet.member?(selected_ids, &1.id))
    |> Enum.map(fn farm ->
      report = get_latest_report(farm)

      %{
        id: farm.id,
        name: farm.name,
        total: get_decimal_value(report, :total_emissions),
        enteric: get_decimal_value(report, :enteric_emissions),
        manure_ch4: get_decimal_value(report, :manure_ch4_emissions),
        manure_n2o: get_decimal_value(report, :manure_n2o_emissions)
      }
    end)
  end

  defp get_latest_report(farm) do
    farm.emission_reports
    |> Enum.sort_by(& &1.report_year, :desc)
    |> List.first()
  end

  defp get_decimal_value(nil, _field), do: Decimal.new(0)
  defp get_decimal_value(report, field), do: Map.get(report, field) || Decimal.new(0)

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
        <%!-- Header --%>
        <div class="mb-6">
          <.link navigate={~p"/dashboard"} class="btn btn-ghost btn-sm gap-2">
            <.icon name="hero-arrow-left" class="size-4" />
            {gettext("Back to Dashboard")}
          </.link>
        </div>

        <.header>
          <div class="flex items-center gap-2">
            <.icon name="hero-scale" class="size-8 text-primary" />
            <span>{gettext("Compare Farms")}</span>
          </div>
          <:subtitle>
            {gettext("Select 2-4 farms to compare their emissions")}
          </:subtitle>
        </.header>

        <div class="mt-8 grid grid-cols-1 lg:grid-cols-3 gap-6">
          <%!-- Farm Selection Panel --%>
          <div class="lg:col-span-1">
            <div class="card bg-base-100 shadow-xl">
              <div class="card-body">
                <h2 class="card-title text-base-content/80">
                  <.icon name="hero-building-office-2" class="size-5" />
                  {gettext("Select Farms")}
                  <span class="badge badge-primary badge-sm">
                    {MapSet.size(@selected_ids)}/4
                  </span>
                </h2>

                <div :if={@farms == []} class="py-8 text-center">
                  <.icon name="hero-building-office-2" class="mx-auto size-12 text-base-content/30" />
                  <p class="mt-2 text-base-content/60">{gettext("No farms available")}</p>
                  <.link navigate={~p"/farms/new"} class="mt-4 inline-block">
                    <.button class="btn-primary btn-sm gap-2">
                      <.icon name="hero-plus" class="size-4" />
                      {gettext("Create Farm")}
                    </.button>
                  </.link>
                </div>

                <div :if={@farms != []} class="space-y-2 max-h-[400px] overflow-y-auto">
                  <div
                    :for={farm <- @farms}
                    id={"farm-select-#{farm.id}"}
                    class={[
                      "p-3 rounded-lg border-2 cursor-pointer transition-all",
                      if(MapSet.member?(@selected_ids, farm.id),
                        do: "border-primary bg-primary/10",
                        else: "border-base-300 hover:border-base-content/30"
                      )
                    ]}
                    phx-click="toggle_farm"
                    phx-value-id={farm.id}
                  >
                    <div class="flex items-center gap-3">
                      <div class={[
                        "w-5 h-5 rounded border-2 flex items-center justify-center",
                        if(MapSet.member?(@selected_ids, farm.id),
                          do: "border-primary bg-primary",
                          else: "border-base-300"
                        )
                      ]}>
                        <.icon
                          :if={MapSet.member?(@selected_ids, farm.id)}
                          name="hero-check"
                          class="size-3 text-primary-content"
                        />
                      </div>
                      <div class="flex-1 min-w-0">
                        <p class="font-medium truncate">{farm.name}</p>
                        <p class="text-sm text-base-content/60 truncate">
                          {format_emissions_summary(farm)}
                        </p>
                      </div>
                    </div>
                  </div>
                </div>

                <div :if={MapSet.size(@selected_ids) < 2} class="alert alert-info mt-4">
                  <.icon name="hero-information-circle" class="size-5" />
                  <span>{gettext("Select at least 2 farms to compare")}</span>
                </div>
              </div>
            </div>
          </div>

          <%!-- Comparison Results --%>
          <div class="lg:col-span-2">
            <div :if={@comparison_data == []} class="card bg-base-200 p-8 text-center">
              <.icon name="hero-scale" class="mx-auto size-16 text-base-content/30" />
              <h3 class="mt-4 text-lg font-semibold">{gettext("No comparison yet")}</h3>
              <p class="mt-2 text-base-content/60">
                {gettext("Select 2 or more farms from the list to see their emissions compared.")}
              </p>
            </div>

            <div :if={@comparison_data != []} class="space-y-6">
              <%!-- Comparison Chart --%>
              <.farm_comparison_chart id="farm-comparison-chart" farms={@comparison_data} />

              <%!-- Comparison Table --%>
              <.farm_comparison_table farms={@comparison_data} />
            </div>
          </div>
        </div>
      </div>
    </Layouts.dashboard_layout>
    """
  end

  defp format_emissions_summary(farm) do
    case get_latest_report(farm) do
      nil ->
        gettext("No emissions data")

      report ->
        total = Decimal.round(report.total_emissions, 1) |> Decimal.to_string()
        "#{total} t CO₂e"
    end
  end
end
