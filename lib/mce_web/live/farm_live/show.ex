defmodule MceWeb.FarmLive.Show do
  use MceWeb, :live_view

  alias Mce.Farms
  alias Mce.Livestock
  alias Mce.Emissions

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    farm = Farms.get_farm_for_user(id, socket.assigns.current_scope.user.id)

    if farm do
      livestock_groups = Livestock.list_livestock_groups(farm.id)
      current_year = Date.utc_today().year
      emission_report = Emissions.get_emission_report_for_year(farm.id, current_year)

      {:ok,
       socket
       |> assign(:page_title, farm.name)
       |> assign(:farm, farm)
       |> assign(:livestock_empty?, Enum.empty?(livestock_groups))
       |> assign(:emission_report, emission_report)
       |> assign(:report_year, current_year)
       |> stream(:livestock_groups, livestock_groups)
       |> allow_upload(:logo,
         accept: ~w(.jpg .jpeg .png .gif .svg),
         max_entries: 1,
         max_file_size: 2_000_000
       )}
    else
      {:ok,
       socket
       |> put_flash(:error, gettext("Farm not found"))
       |> push_navigate(to: ~p"/farms")}
    end
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, _params) do
    socket
    |> assign(:page_title, gettext("Edit Farm"))
  end

  defp apply_action(socket, :show, _params) do
    socket
    |> assign(:page_title, socket.assigns.farm.name)
  end

  @impl true
  def handle_info({MceWeb.FarmLive.FormComponent, {:saved, farm}}, socket) do
    {:noreply,
     socket
     |> assign(:farm, farm)
     |> assign(:page_title, farm.name)}
  end

  @impl true
  def handle_event("delete_livestock", %{"id" => id}, socket) do
    livestock_group = Livestock.get_livestock_group!(id)
    {:ok, _} = Livestock.delete_livestock_group(livestock_group)

    livestock_groups = Livestock.list_livestock_groups(socket.assigns.farm.id)

    {:noreply,
     socket
     |> assign(:livestock_empty?, Enum.empty?(livestock_groups))
     |> stream_delete(:livestock_groups, livestock_group)
     |> put_flash(:info, gettext("Livestock group deleted successfully"))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash} current_scope={@current_scope}>
      <div class="container mx-auto px-4 py-6">
        <div class="mb-6">
          <.link navigate={~p"/farms"} class="btn btn-ghost btn-sm gap-2">
            <.icon name="hero-arrow-left" class="size-4" />
            {gettext("Back to Farms")}
          </.link>
        </div>

        <div class="card bg-base-100 shadow-xl">
          <div class="card-body">
            <div class="flex items-start justify-between">
              <div class="flex items-center gap-4">
                <span class="text-4xl">{country_flag(@farm.country)}</span>
                <div>
                  <h1 class="text-2xl font-bold">{@farm.name}</h1>
                  <p class="text-base-content/60">{country_name(@farm.country)}</p>
                </div>
              </div>
              <.link patch={~p"/farms/#{@farm}/show/edit"}>
                <.button class="btn-ghost gap-2">
                  <.icon name="hero-pencil" class="size-5" />
                  {gettext("Edit")}
                </.button>
              </.link>
            </div>

            <div class="divider"></div>

            <div class="grid gap-6 md:grid-cols-2">
              <div>
                <h3 class="mb-3 font-semibold text-base-content/60">{gettext("Address")}</h3>
                <div class="space-y-1">
                  <p :if={@farm.road_address}>{@farm.road_address}</p>
                  <p :if={@farm.jibun_address} class="text-sm text-base-content/60">
                    {gettext("Jibun")}: {@farm.jibun_address}
                  </p>
                  <p :if={@farm.building_name} class="text-sm text-base-content/60">
                    {@farm.building_name}
                  </p>
                  <p :if={@farm.address_line1}>{@farm.address_line1}</p>
                  <p :if={@farm.address_line2}>{@farm.address_line2}</p>
                  <p :if={@farm.city || @farm.state_province || @farm.postal_code}>
                    {@farm.city}{if @farm.city && @farm.state_province, do: ", "}{@farm.state_province} {@farm.postal_code}
                  </p>
                  <p
                    :if={!@farm.road_address && !@farm.address_line1 && !@farm.city}
                    class="text-base-content/40"
                  >
                    {gettext("No address provided")}
                  </p>
                </div>
              </div>

              <div>
                <h3 class="mb-3 font-semibold text-base-content/60">{gettext("Fiscal Year")}</h3>
                <p>
                  {gettext("Starts")}: <span class="font-medium">{format_fiscal_year(@farm)}</span>
                </p>
              </div>
            </div>
          </div>
        </div>

        <%!-- Emissions Summary Card --%>
        <div class="mt-8">
          <div class="card bg-base-100 shadow-xl">
            <div class="card-body">
              <div class="flex flex-wrap items-center justify-between gap-4">
                <div class="flex items-center gap-3">
                  <div class="bg-primary/10 p-3 rounded-full">
                    <.icon name="hero-chart-pie" class="size-8 text-primary" />
                  </div>
                  <div>
                    <h2 class="card-title">{gettext("Emissions Report")}</h2>
                    <p class="text-sm text-base-content/60">
                      {gettext("Fiscal Year")} {@report_year}
                    </p>
                  </div>
                </div>

                <%= if @emission_report do %>
                  <div class="flex flex-wrap items-center gap-6">
                    <div class="text-center">
                      <p class="text-2xl font-bold text-primary">
                        {format_emissions(@emission_report.total_emissions)}
                      </p>
                      <p class="text-xs text-base-content/60">{gettext("t CO₂e Total")}</p>
                    </div>
                    <.link navigate={~p"/farms/#{@farm.id}/emissions"}>
                      <.button class="btn-primary gap-2">
                        <.icon name="hero-document-chart-bar" class="size-5" />
                        {gettext("View Report")}
                      </.button>
                    </.link>
                  </div>
                <% else %>
                  <div class="flex items-center gap-4">
                    <p class="text-base-content/60">{gettext("No report calculated yet")}</p>
                    <.link navigate={~p"/farms/#{@farm.id}/emissions"}>
                      <.button class="btn-primary gap-2">
                        <.icon name="hero-calculator" class="size-5" />
                        {gettext("Calculate Emissions")}
                      </.button>
                    </.link>
                  </div>
                <% end %>
              </div>

              <%= if @emission_report do %>
                <div class="divider"></div>
                <div class="grid grid-cols-3 gap-4 text-center">
                  <div>
                    <p class="font-semibold text-success">
                      {format_emissions(@emission_report.enteric_emissions)}
                    </p>
                    <p class="text-xs text-base-content/60">{gettext("Enteric")}</p>
                  </div>
                  <div>
                    <p class="font-semibold text-warning">
                      {format_emissions(@emission_report.manure_ch4_emissions)}
                    </p>
                    <p class="text-xs text-base-content/60">{gettext("Manure CH₄")}</p>
                  </div>
                  <div>
                    <p class="font-semibold text-error">
                      {format_emissions(@emission_report.manure_n2o_emissions)}
                    </p>
                    <p class="text-xs text-base-content/60">{gettext("Manure N₂O")}</p>
                  </div>
                </div>
              <% end %>
            </div>
          </div>
        </div>

        <div class="mt-8">
          <.header>
            <div class="flex items-center gap-2">
              <.icon name="hero-beaker" class="size-6 text-primary" />
              <span>{gettext("Livestock Groups")}</span>
            </div>
            <:subtitle>{gettext("Manage animals and their emissions data")}</:subtitle>
            <:actions>
              <.link navigate={~p"/farms/#{@farm.id}/livestock/new"}>
                <.button class="btn-primary gap-2">
                  <.icon name="hero-plus" class="size-5" />
                  {gettext("Add Group")}
                </.button>
              </.link>
            </:actions>
          </.header>

          <div class="mt-6">
            <div
              :if={@livestock_empty?}
              class="card bg-base-200 p-8 text-center"
            >
              <.icon name="hero-beaker" class="mx-auto size-16 text-base-content/30" />
              <h3 class="mt-4 text-lg font-semibold">{gettext("No livestock groups yet")}</h3>
              <p class="mt-2 text-base-content/60">
                {gettext("Add livestock groups to start calculating emissions.")}
              </p>
              <.link navigate={~p"/farms/#{@farm.id}/livestock/new"} class="mt-4 inline-block">
                <.button class="btn-primary gap-2">
                  <.icon name="hero-plus" class="size-5" />
                  {gettext("Add Livestock Group")}
                </.button>
              </.link>
            </div>

            <div
              id="livestock-groups"
              phx-update="stream"
              class="grid grid-cols-1 gap-4 md:grid-cols-2"
            >
              <div
                :for={{id, group} <- @streams.livestock_groups}
                id={id}
                class="card bg-base-100 shadow hover:shadow-lg transition-shadow"
              >
                <div class="card-body">
                  <div class="flex items-start justify-between">
                    <div>
                      <div class="flex items-center gap-2">
                        <h3 class="card-title">{group.name}</h3>
                        <span
                          :if={group.status == "draft"}
                          class="badge badge-warning badge-sm gap-1"
                        >
                          <.icon name="hero-pencil-square" class="size-3" />
                          {gettext("Draft")}
                        </span>
                      </div>
                      <p class="text-sm text-base-content/60">
                        {species_label(group.species)} · {group.head_count} {gettext("head")}
                      </p>
                    </div>
                    <div class="dropdown dropdown-end">
                      <div tabindex="0" role="button" class="btn btn-ghost btn-sm btn-square">
                        <.icon name="hero-ellipsis-vertical" class="size-5" />
                      </div>
                      <ul
                        tabindex="0"
                        class="dropdown-content menu bg-base-100 rounded-box z-50 w-40 p-2 shadow-lg"
                      >
                        <li>
                          <.link
                            navigate={~p"/farms/#{@farm.id}/livestock/#{group.id}/edit"}
                            class="gap-2"
                          >
                            <.icon name="hero-pencil" class="size-4" />
                            {gettext("Edit")}
                          </.link>
                        </li>
                        <li>
                          <button
                            phx-click="delete_livestock"
                            phx-value-id={group.id}
                            class="gap-2 text-error"
                            data-confirm={
                              gettext("Are you sure you want to delete this livestock group?")
                            }
                          >
                            <.icon name="hero-trash" class="size-4" />
                            {gettext("Delete")}
                          </button>
                        </li>
                      </ul>
                    </div>
                  </div>

                  <div class="mt-2 grid grid-cols-2 gap-2 text-sm">
                    <div :if={group.average_weight}>
                      <span class="text-base-content/60">{gettext("Avg Weight")}:</span>
                      <span class="font-medium">{group.average_weight} kg</span>
                    </div>
                    <div :if={group.milk_yield}>
                      <span class="text-base-content/60">{gettext("Milk Yield")}:</span>
                      <span class="font-medium">{group.milk_yield} L/day</span>
                    </div>
                  </div>

                  <div class="card-actions justify-end mt-2">
                    <.link
                      navigate={~p"/farms/#{@farm.id}/livestock/#{group.id}/edit"}
                      class={[
                        "btn btn-sm gap-1",
                        if(group.status == "draft", do: "btn-warning", else: "btn-ghost")
                      ]}
                    >
                      <%= if group.status == "draft" do %>
                        <.icon name="hero-arrow-right" class="size-4" />
                        {gettext("Continue")}
                      <% else %>
                        <.icon name="hero-pencil-square" class="size-4" />
                        {gettext("Edit Details")}
                      <% end %>
                    </.link>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <.modal
        :if={@live_action == :edit}
        id="farm-modal"
        show
        on_cancel={JS.patch(~p"/farms/#{@farm}")}
      >
        <.live_component
          module={MceWeb.FarmLive.FormComponent}
          id={@farm.id}
          title={gettext("Edit Farm")}
          action={:edit}
          farm={@farm}
          current_scope={@current_scope}
          uploads={@uploads}
          patch={~p"/farms/#{@farm}"}
        />
      </.modal>
    </Layouts.app>
    """
  end

  defp country_flag("KR"), do: "🇰🇷"
  defp country_flag("US"), do: "🇺🇸"
  defp country_flag("BR"), do: "🇧🇷"
  defp country_flag(_), do: "🌍"

  defp country_name("KR"), do: gettext("Korea")
  defp country_name("US"), do: gettext("United States")
  defp country_name("BR"), do: gettext("Brazil")
  defp country_name(_), do: gettext("Other")

  defp format_fiscal_year(farm) do
    month_names = [
      nil,
      gettext("January"),
      gettext("February"),
      gettext("March"),
      gettext("April"),
      gettext("May"),
      gettext("June"),
      gettext("July"),
      gettext("August"),
      gettext("September"),
      gettext("October"),
      gettext("November"),
      gettext("December")
    ]

    month = Enum.at(month_names, farm.fiscal_year_start_month || 1)
    day = farm.fiscal_year_start_day || 1
    "#{month} #{day}"
  end

  defp species_label("dairy_cattle"), do: gettext("Dairy Cattle")
  defp species_label("beef_cattle"), do: gettext("Beef Cattle")
  defp species_label("swine"), do: gettext("Swine")
  defp species_label(_), do: gettext("Unknown")

  defp format_emissions(nil), do: "-"

  defp format_emissions(%Decimal{} = value) do
    value
    |> Decimal.round(1)
    |> Decimal.to_string()
  end

  defp format_emissions(value) when is_float(value) do
    :erlang.float_to_binary(value, decimals: 1)
  end

  defp format_emissions(value), do: to_string(value)
end
