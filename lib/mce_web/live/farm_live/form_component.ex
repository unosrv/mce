defmodule MceWeb.FarmLive.FormComponent do
  use MceWeb, :live_component

  alias Mce.Farms

  @countries [
    {"KR", "🇰🇷", "Korea"},
    {"US", "🇺🇸", "United States"},
    {"BR", "🇧🇷", "Brazil"}
  ]

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>{gettext("Manage your farm information and settings.")}</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="farm-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <div class="space-y-6">
          <.input field={@form[:name]} type="text" label={gettext("Farm Name")} required />

          <div class="form-control w-full">
            <label class="label">
              <span class="label-text">{gettext("Country")} <span class="text-error">*</span></span>
            </label>
            <div class="flex gap-4">
              <label
                :for={{code, flag, name} <- @countries}
                class={[
                  "flex-1 cursor-pointer rounded-lg border-2 p-4 text-center transition-all",
                  "hover:border-primary/50",
                  if(@selected_country == code,
                    do: "border-primary bg-primary/5",
                    else: "border-base-300"
                  )
                ]}
              >
                <input
                  type="radio"
                  name={@form[:country].name}
                  value={code}
                  checked={@selected_country == code}
                  phx-click="select_country"
                  phx-value-country={code}
                  phx-target={@myself}
                  class="hidden"
                />
                <span class="text-3xl">{flag}</span>
                <p class="mt-2 font-medium">{name}</p>
              </label>
            </div>
            <.error :for={msg <- Enum.map(@form[:country].errors, &translate_error/1)}>
              {msg}
            </.error>
          </div>

          <div :if={@selected_country == "KR"} class="space-y-4">
            <.input
              field={@form[:road_address]}
              type="text"
              label={gettext("Road Address")}
              placeholder={gettext("Enter road-based address")}
            />
            <.input
              field={@form[:jibun_address]}
              type="text"
              label={gettext("Jibun Address")}
              placeholder={gettext("Enter parcel number address")}
            />
            <.input
              field={@form[:building_name]}
              type="text"
              label={gettext("Building Name")}
              placeholder={gettext("Building or complex name (optional)")}
            />
          </div>

          <div :if={@selected_country != "KR"} class="space-y-4">
            <.input
              field={@form[:address_line1]}
              type="text"
              label={gettext("Address Line 1")}
              placeholder={gettext("Street address")}
            />
            <.input
              field={@form[:address_line2]}
              type="text"
              label={gettext("Address Line 2")}
              placeholder={gettext("Apartment, suite, unit, etc. (optional)")}
            />
            <div class="grid grid-cols-2 gap-4">
              <.input
                field={@form[:city]}
                type="text"
                label={gettext("City")}
              />
              <.input
                field={@form[:state_province]}
                type="text"
                label={gettext("State / Province")}
              />
            </div>
            <.input
              field={@form[:postal_code]}
              type="text"
              label={gettext("Postal Code")}
            />
          </div>

          <div class="divider">{gettext("Fiscal Year Settings")}</div>

          <div class="grid grid-cols-2 gap-4">
            <.input
              field={@form[:fiscal_year_start_month]}
              type="select"
              label={gettext("Fiscal Year Start Month")}
              options={month_options()}
            />
            <.input
              field={@form[:fiscal_year_start_day]}
              type="select"
              label={gettext("Start Day")}
              options={Enum.map(1..31, fn d -> {d, d} end)}
            />
          </div>
        </div>

        <:actions>
          <.button type="submit" phx-disable-with={gettext("Saving...")} class="btn-primary w-full">
            {gettext("Save Farm")}
          </.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{farm: farm} = assigns, socket) do
    selected_country = farm.country || "KR"

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:countries, @countries)
     |> assign(:selected_country, selected_country)
     |> assign_new(:form, fn ->
       to_form(Farms.change_farm(farm, %{country: selected_country}))
     end)}
  end

  @impl true
  def handle_event("select_country", %{"country" => country}, socket) do
    form =
      socket.assigns.farm
      |> Farms.change_farm(%{country: country})
      |> to_form()

    {:noreply,
     socket
     |> assign(:selected_country, country)
     |> assign(:form, form)}
  end

  @impl true
  def handle_event("validate", %{"farm" => farm_params}, socket) do
    changeset =
      socket.assigns.farm
      |> Farms.change_farm(farm_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, form: to_form(changeset))}
  end

  @impl true
  def handle_event("save", %{"farm" => farm_params}, socket) do
    save_farm(socket, socket.assigns.action, farm_params)
  end

  defp save_farm(socket, :edit, farm_params) do
    case Farms.update_farm(socket.assigns.farm, farm_params) do
      {:ok, farm} ->
        notify_parent({:saved, farm})

        {:noreply,
         socket
         |> put_flash(:info, gettext("Farm updated successfully"))
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_farm(socket, :new, farm_params) do
    farm_params = Map.put(farm_params, "user_id", socket.assigns.current_scope.user.id)

    case Farms.create_farm(farm_params) do
      {:ok, farm} ->
        notify_parent({:saved, farm})

        {:noreply,
         socket
         |> put_flash(:info, gettext("Farm created successfully"))
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})

  defp month_options do
    [
      {gettext("January"), 1},
      {gettext("February"), 2},
      {gettext("March"), 3},
      {gettext("April"), 4},
      {gettext("May"), 5},
      {gettext("June"), 6},
      {gettext("July"), 7},
      {gettext("August"), 8},
      {gettext("September"), 9},
      {gettext("October"), 10},
      {gettext("November"), 11},
      {gettext("December"), 12}
    ]
  end
end
