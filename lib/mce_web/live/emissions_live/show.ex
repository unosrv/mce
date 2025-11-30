defmodule MceWeb.EmissionsLive.Show do
  use MceWeb, :live_view

  alias Mce.Farms
  alias Mce.Emissions

  import MceWeb.EmissionsComponents

  @impl true
  def mount(%{"farm_id" => farm_id}, _session, socket) do
    farm = Farms.get_farm_for_user(farm_id, socket.assigns.current_scope.user.id)

    if farm do
      # Get current year for the report
      current_year = Date.utc_today().year

      # Try to get existing report or calculate new one
      {report, calculated_now?} = get_or_calculate_report(farm_id, current_year)

      {:ok,
       socket
       |> assign(:page_title, gettext("Emissions Report"))
       |> assign(:farm, farm)
       |> assign(:report, report)
       |> assign(:report_year, current_year)
       |> assign(:calculated_now?, calculated_now?)
       |> assign(:calculating?, false)
       |> assign(:current_url, "/farms")
       |> maybe_show_calculation_flash(calculated_now?)}
    else
      {:ok,
       socket
       |> put_flash(:error, gettext("Farm not found"))
       |> push_navigate(to: ~p"/farms")}
    end
  end

  defp get_or_calculate_report(farm_id, year) do
    case Emissions.get_emission_report_for_year(farm_id, year) do
      nil ->
        # No report exists, calculate one
        case Emissions.calculate_and_save_report(farm_id, year) do
          {:ok, report} -> {report, true}
          {:error, _} -> {nil, false}
        end

      report ->
        {report, false}
    end
  end

  defp maybe_show_calculation_flash(socket, true) do
    put_flash(socket, :info, gettext("Emissions report calculated successfully"))
  end

  defp maybe_show_calculation_flash(socket, false), do: socket

  @impl true
  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("recalculate", _params, socket) do
    socket = assign(socket, :calculating?, true)

    case Emissions.calculate_and_save_report(socket.assigns.farm.id, socket.assigns.report_year) do
      {:ok, report} ->
        {:noreply,
         socket
         |> assign(:report, report)
         |> assign(:calculating?, false)
         |> put_flash(:info, gettext("Emissions report recalculated successfully"))}

      {:error, _changeset} ->
        {:noreply,
         socket
         |> assign(:calculating?, false)
         |> put_flash(:error, gettext("Failed to recalculate emissions"))}
    end
  end

  @impl true
  def handle_event("print", _params, socket) do
    {:noreply, push_event(socket, "print", %{})}
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
      <div class="container mx-auto px-4 py-6 print:p-0">
        <%!-- Header --%>
        <div class="mb-6 print:hidden">
          <.link navigate={~p"/farms/#{@farm}"} class="btn btn-ghost btn-sm gap-2">
            <.icon name="hero-arrow-left" class="size-4" />
            {gettext("Back to Farm")}
          </.link>
        </div>

        <%!-- Title --%>
        <div class="flex flex-wrap items-center justify-between gap-4 mb-6">
          <div>
            <h1 class="text-2xl font-bold">
              {gettext("Emissions Report")} - {@farm.name}
            </h1>
            <p class="text-base-content/60">
              {gettext("Fiscal Year")} {@report_year}
            </p>
          </div>
          <div class="flex gap-2 print:hidden">
            <button
              phx-click="recalculate"
              disabled={@calculating?}
              class={["btn btn-outline gap-2", @calculating? && "loading"]}
            >
              <.icon :if={!@calculating?} name="hero-arrow-path" class="size-5" />
              {gettext("Recalculate")}
            </button>
            <button phx-click="print" class="btn btn-primary gap-2">
              <.icon name="hero-printer" class="size-5" />
              {gettext("Print / PDF")}
            </button>
          </div>
        </div>

        <%= if @report do %>
          <%!-- Stats Cards --%>
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-6">
            <.stat_card
              title={gettext("Total Emissions")}
              value={@report.total_emissions}
              unit="t CO₂e"
              icon="hero-globe-alt"
              color="primary"
            />
            <.stat_card
              title={gettext("Enteric Fermentation")}
              value={@report.enteric_emissions}
              unit="t CO₂e"
              icon="hero-beaker"
              color="success"
            />
            <.stat_card
              title={gettext("Manure CH₄")}
              value={@report.manure_ch4_emissions}
              unit="t CO₂e"
              icon="hero-fire"
              color="warning"
            />
            <.stat_card
              title={gettext("Manure N₂O")}
              value={@report.manure_n2o_emissions}
              unit="t CO₂e"
              icon="hero-cloud"
              color="error"
            />
          </div>

          <%!-- Charts Row --%>
          <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6 print:grid-cols-2">
            <.emissions_donut_chart
              id="source-breakdown-chart"
              enteric={@report.enteric_emissions}
              manure_ch4={@report.manure_ch4_emissions}
              manure_n2o={@report.manure_n2o_emissions}
            />

            <%= if @report.breakdown_by_group && length(@report.breakdown_by_group) > 0 do %>
              <.emissions_group_chart
                id="group-breakdown-chart"
                groups={@report.breakdown_by_group}
              />
            <% else %>
              <div class="card bg-base-100 shadow-xl">
                <div class="card-body items-center justify-center">
                  <.icon name="hero-chart-bar" class="size-16 text-base-content/30" />
                  <p class="text-base-content/60">{gettext("No livestock groups to display")}</p>
                </div>
              </div>
            <% end %>
          </div>

          <%!-- Detailed Table --%>
          <%= if @report.breakdown_by_group && length(@report.breakdown_by_group) > 0 do %>
            <.emissions_table groups={@report.breakdown_by_group} class="mb-6" />
          <% end %>

          <%!-- Metadata Footer --%>
          <div class="text-sm text-base-content/60 flex flex-wrap gap-4 mt-8">
            <span>
              <.icon name="hero-clock" class="size-4 inline" />
              {gettext("Calculated")}: {format_datetime(@report.calculated_at)}
            </span>
            <span>
              <.icon name="hero-code-bracket" class="size-4 inline" />
              {gettext("Version")}: {@report.calculation_version}
            </span>
          </div>
        <% else %>
          <%!-- No Report State --%>
          <div class="card bg-base-200 p-8 text-center">
            <.icon name="hero-document-chart-bar" class="mx-auto size-16 text-base-content/30" />
            <h3 class="mt-4 text-lg font-semibold">{gettext("No emissions data available")}</h3>
            <p class="mt-2 text-base-content/60">
              {gettext("Add livestock groups to your farm to generate emissions reports.")}
            </p>
            <.link navigate={~p"/farms/#{@farm.id}/livestock/new"} class="mt-4 inline-block">
              <button class="btn btn-primary gap-2">
                <.icon name="hero-plus" class="size-5" />
                {gettext("Add Livestock Group")}
              </button>
            </.link>
          </div>
        <% end %>
      </div>

      <%!-- Print Styles Script --%>
      <script>
        window.addEventListener("phx:print", () => {
          window.print();
        });
      </script>
    </Layouts.dashboard_layout>
    """
  end

  defp format_datetime(nil), do: "-"

  defp format_datetime(%DateTime{} = dt) do
    Calendar.strftime(dt, "%Y-%m-%d %H:%M")
  end

  defp format_datetime(_), do: "-"
end
