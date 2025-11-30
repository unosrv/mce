defmodule MceWeb.FarmLive.Index do
  use MceWeb, :live_view

  alias Mce.Farms
  alias Mce.Farms.Farm

  @impl true
  def mount(_params, _session, socket) do
    farms = Farms.list_farms_for_user(socket.assigns.current_scope.user.id)

    {:ok,
     socket
     |> assign(:page_title, gettext("Farms"))
     |> assign(:farms_empty?, Enum.empty?(farms))
     |> stream(:farms, farms)
     |> allow_upload(:logo,
       accept: ~w(.jpg .jpeg .png .gif .svg),
       max_entries: 1,
       max_file_size: 2_000_000
     )}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    farm = Farms.get_farm_for_user(id, socket.assigns.current_scope.user.id)

    if farm do
      socket
      |> assign(:page_title, gettext("Edit Farm"))
      |> assign(:farm, farm)
    else
      socket
      |> put_flash(:error, gettext("Farm not found"))
      |> push_navigate(to: ~p"/farms")
    end
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, gettext("New Farm"))
    |> assign(:farm, %Farm{user_id: socket.assigns.current_scope.user.id})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, gettext("Farms"))
    |> assign(:farm, nil)
  end

  @impl true
  def handle_info({MceWeb.FarmLive.FormComponent, {:saved, farm}}, socket) do
    {:noreply,
     socket
     |> assign(:farms_empty?, false)
     |> stream_insert(:farms, farm)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    farm = Farms.get_farm_for_user(id, socket.assigns.current_scope.user.id)

    if farm do
      {:ok, _} = Farms.delete_farm(farm)
      {:noreply, stream_delete(socket, :farms, farm)}
    else
      {:noreply, put_flash(socket, :error, gettext("Farm not found"))}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash} current_scope={@current_scope}>
      <div class="container mx-auto px-4 py-6">
        <%!-- Add Farm button (top right) --%>
        <div class="flex justify-end mb-6">
          <.link patch={~p"/farms/new"}>
            <.button class="btn-primary gap-2">
              <.icon name="hero-plus" class="size-5" />
              {gettext("Add Farm")}
            </.button>
          </.link>
        </div>

        <div>
          <div
            :if={@farms_empty?}
            class="card bg-base-200 p-8 text-center"
          >
            <.icon name="hero-building-office-2" class="mx-auto size-16 text-base-content/30" />
            <h3 class="mt-4 text-lg font-semibold">{gettext("No farms yet")}</h3>
            <p class="mt-2 text-base-content/60">
              {gettext("Create your first farm to start tracking emissions.")}
            </p>
            <.link patch={~p"/farms/new"} class="mt-4">
              <.button class="btn-primary gap-2">
                <.icon name="hero-plus" class="size-5" />
                {gettext("Add Farm")}
              </.button>
            </.link>
          </div>

          <div
            id="farms"
            phx-update="stream"
            class="grid grid-cols-1 gap-6 md:grid-cols-2 lg:grid-cols-3"
          >
            <.farm_card
              :for={{id, farm} <- @streams.farms}
              id={id}
              farm={farm}
              on_edit={~p"/farms/#{farm}/edit"}
              on_delete={JS.push("delete", value: %{id: farm.id})}
            />
          </div>
        </div>
      </div>

      <.modal
        :if={@live_action in [:new, :edit]}
        id="farm-modal"
        show
        on_cancel={JS.patch(~p"/farms")}
      >
        <.live_component
          module={MceWeb.FarmLive.FormComponent}
          id={@farm.id || :new}
          title={@page_title}
          action={@live_action}
          farm={@farm}
          current_scope={@current_scope}
          uploads={@uploads}
          patch={~p"/farms"}
        />
      </.modal>
    </Layouts.app>
    """
  end

  attr :id, :string, required: true
  attr :farm, Farm, required: true
  attr :on_edit, :string, required: true
  attr :on_delete, :any, required: true

  defp farm_card(assigns) do
    ~H"""
    <div id={@id} class="card bg-base-100 shadow-xl hover:shadow-2xl transition-shadow">
      <div class="card-body">
        <div class="flex items-start justify-between">
          <div class="flex items-center gap-3">
            <span class="text-2xl">{country_flag(@farm.country)}</span>
            <div>
              <h2 class="card-title text-lg">{@farm.name}</h2>
              <p class="text-sm text-base-content/60">{country_name(@farm.country)}</p>
            </div>
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
                <.link patch={@on_edit} class="gap-2">
                  <.icon name="hero-pencil" class="size-4" />
                  {gettext("Edit")}
                </.link>
              </li>
              <li>
                <button
                  phx-click={@on_delete}
                  class="gap-2 text-error"
                  data-confirm={
                    gettext(
                      "Are you sure you want to delete this farm? This action cannot be undone."
                    )
                  }
                >
                  <.icon name="hero-trash" class="size-4" />
                  {gettext("Delete")}
                </button>
              </li>
            </ul>
          </div>
        </div>

        <div class="mt-4 grid grid-cols-2 gap-4 text-sm">
          <div>
            <span class="text-base-content/60">{gettext("Address")}</span>
            <p class="font-medium">{format_address(@farm)}</p>
          </div>
          <div>
            <span class="text-base-content/60">{gettext("Fiscal Year")}</span>
            <p class="font-medium">{format_fiscal_year(@farm)}</p>
          </div>
        </div>

        <div class="card-actions mt-4 justify-end">
          <.link navigate={~p"/farms/#{@farm}"} class="btn btn-primary btn-sm gap-2">
            <.icon name="hero-eye" class="size-4" />
            {gettext("View Details")}
          </.link>
        </div>
      </div>
    </div>
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

  defp format_address(farm) do
    cond do
      farm.road_address -> farm.road_address
      farm.address_line1 -> farm.address_line1
      farm.city -> farm.city
      true -> gettext("No address")
    end
  end

  defp format_fiscal_year(farm) do
    month_names = [
      nil,
      gettext("Jan"),
      gettext("Feb"),
      gettext("Mar"),
      gettext("Apr"),
      gettext("May"),
      gettext("Jun"),
      gettext("Jul"),
      gettext("Aug"),
      gettext("Sep"),
      gettext("Oct"),
      gettext("Nov"),
      gettext("Dec")
    ]

    month = Enum.at(month_names, farm.fiscal_year_start_month || 1)
    day = farm.fiscal_year_start_day || 1
    "#{month} #{day}"
  end
end
