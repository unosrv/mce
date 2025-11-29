defmodule MceWeb.FarmLive.Show do
  use MceWeb, :live_view

  alias Mce.Farms
  alias Mce.Livestock

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    farm = Farms.get_farm_for_user(id, socket.assigns.current_scope.user.id)

    if farm do
      livestock_groups = Livestock.list_livestock_groups(farm.id)

      {:ok,
       socket
       |> assign(:page_title, farm.name)
       |> assign(:farm, farm)
       |> stream(:livestock_groups, livestock_groups)}
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

        <div class="mt-8">
          <.header>
            <div class="flex items-center gap-2">
              <.icon name="hero-beaker" class="size-6 text-primary" />
              <span>{gettext("Livestock Groups")}</span>
            </div>
            <:subtitle>{gettext("Manage animals and their emissions data")}</:subtitle>
            <:actions>
              <.button class="btn-primary gap-2" disabled>
                <.icon name="hero-plus" class="size-5" />
                {gettext("Add Group")}
              </.button>
            </:actions>
          </.header>

          <div class="mt-6">
            <div
              :if={Enum.empty?(@streams.livestock_groups |> Enum.to_list())}
              class="card bg-base-200 p-8 text-center"
            >
              <.icon name="hero-beaker" class="mx-auto size-16 text-base-content/30" />
              <h3 class="mt-4 text-lg font-semibold">{gettext("No livestock groups yet")}</h3>
              <p class="mt-2 text-base-content/60">
                {gettext("Add livestock groups to start calculating emissions.")}
              </p>
              <.button class="btn-primary mt-4 gap-2" disabled>
                <.icon name="hero-plus" class="size-5" />
                {gettext("Add Livestock Group")}
              </.button>
            </div>

            <div
              id="livestock-groups"
              phx-update="stream"
              class="grid grid-cols-1 gap-4 md:grid-cols-2"
            >
              <div
                :for={{id, group} <- @streams.livestock_groups}
                id={id}
                class="card bg-base-100 shadow"
              >
                <div class="card-body">
                  <h3 class="card-title">{group.name}</h3>
                  <p class="text-sm text-base-content/60">
                    {species_label(group.species)} · {group.head_count} {gettext("head")}
                  </p>
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
end
