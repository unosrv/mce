defmodule MceWeb.FarmLive.FormComponent do
  use MceWeb, :live_component

  alias Mce.Farms
  alias Mce.Address

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

          <%!-- Logo Upload Section --%>
          <div class="form-control w-full">
            <label class="label">
              <span class="label-text">{gettext("Farm Logo")}</span>
            </label>

            <div class="flex items-start gap-4">
              <%!-- Current/Preview Logo --%>
              <div class="shrink-0">
                <%= cond do %>
                  <% has_pending_upload?(@parent_uploads.logo.entries) -> %>
                    <%!-- Show pending upload preview --%>
                    <div :for={entry <- @parent_uploads.logo.entries} class="relative">
                      <.live_img_preview
                        entry={entry}
                        class="h-20 w-20 rounded-lg border border-base-300 object-cover"
                      />
                      <button
                        type="button"
                        phx-click="cancel_upload"
                        phx-value-ref={entry.ref}
                        phx-target={@myself}
                        class="btn btn-circle btn-error btn-xs absolute -top-2 -right-2"
                      >
                        <.icon name="hero-x-mark" class="size-3" />
                      </button>
                    </div>
                  <% @farm.logo_path && !@remove_logo -> %>
                    <%!-- Show existing logo --%>
                    <div class="relative">
                      <img
                        src={@farm.logo_path}
                        class="h-20 w-20 rounded-lg border border-base-300 object-cover"
                        alt={gettext("Farm logo")}
                      />
                      <button
                        type="button"
                        phx-click="remove_logo"
                        phx-target={@myself}
                        class="btn btn-circle btn-error btn-xs absolute -top-2 -right-2"
                      >
                        <.icon name="hero-x-mark" class="size-3" />
                      </button>
                    </div>
                  <% true -> %>
                    <%!-- Empty state placeholder --%>
                    <div class="flex h-20 w-20 items-center justify-center rounded-lg border-2 border-dashed border-base-300 bg-base-200">
                      <.icon name="hero-photo" class="size-8 text-base-content/30" />
                    </div>
                <% end %>
              </div>

              <%!-- Upload Zone --%>
              <div class="flex-1">
                <div
                  phx-drop-target={@parent_uploads.logo.ref}
                  class={[
                    "flex cursor-pointer flex-col items-center justify-center rounded-lg border-2 border-dashed p-4 transition-colors",
                    "hover:border-primary hover:bg-primary/5",
                    "border-base-300"
                  ]}
                >
                  <.live_file_input upload={@parent_uploads.logo} class="hidden" />
                  <label for={@parent_uploads.logo.ref} class="cursor-pointer text-center">
                    <.icon name="hero-cloud-arrow-up" class="mx-auto size-8 text-base-content/50" />
                    <p class="mt-2 text-sm text-base-content/70">
                      {gettext("Click to upload or drag and drop")}
                    </p>
                    <p class="text-xs text-base-content/50">
                      {gettext("PNG, JPG, GIF, SVG up to 2MB")}
                    </p>
                  </label>
                </div>

                <%!-- Upload Errors --%>
                <div :for={entry <- @parent_uploads.logo.entries} class="mt-2">
                  <div
                    :for={err <- upload_errors(@parent_uploads.logo, entry)}
                    class="text-sm text-error"
                  >
                    {upload_error_message(err)}
                  </div>
                </div>
                <div :for={err <- upload_errors(@parent_uploads.logo)} class="mt-2 text-sm text-error">
                  {upload_error_message(err)}
                </div>
              </div>
            </div>
          </div>

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

          <%!-- Address Search Section --%>
          <div class="space-y-4">
            <div class="form-control w-full">
              <label class="label">
                <span class="label-text">{gettext("Address Search")}</span>
              </label>
              <div class="relative">
                <input
                  type="text"
                  id="address-search"
                  name="address_search"
                  value={@address_query}
                  placeholder={address_placeholder(@selected_country)}
                  autocomplete="off"
                  phx-debounce="300"
                  phx-target={@myself}
                  phx-change="address_search"
                  phx-focus="show_suggestions"
                  class={[
                    "input input-bordered w-full pr-10",
                    @address_loading && "animate-pulse"
                  ]}
                />
                <div class="absolute right-3 top-1/2 -translate-y-1/2">
                  <.icon
                    :if={@address_loading}
                    name="hero-arrow-path"
                    class="size-5 animate-spin text-base-content/50"
                  />
                  <.icon
                    :if={!@address_loading}
                    name="hero-magnifying-glass"
                    class="size-5 text-base-content/50"
                  />
                </div>
              </div>

              <%!-- Suggestions Dropdown --%>
              <div
                :if={@show_suggestions && length(@address_results) > 0}
                class="relative z-50"
              >
                <div class="absolute mt-1 w-full rounded-lg border border-base-300 bg-base-100 shadow-lg">
                  <ul class="menu menu-compact max-h-60 overflow-y-auto p-2">
                    <li :for={result <- @address_results}>
                      <button
                        type="button"
                        phx-click="select_address"
                        phx-value-id={result.id}
                        phx-target={@myself}
                        class="flex flex-col items-start gap-0.5 text-left"
                      >
                        <span class="font-medium">{result.display}</span>
                      </button>
                    </li>
                  </ul>
                </div>
              </div>

              <div
                :if={
                  @show_suggestions && length(@address_results) == 0 && @address_query != "" &&
                    !@address_loading
                }
                class="relative z-50"
              >
                <div class="absolute mt-1 w-full rounded-lg border border-base-300 bg-base-100 p-4 text-center shadow-lg">
                  <p class="text-base-content/60">{gettext("No addresses found")}</p>
                </div>
              </div>
            </div>

            <%!-- Korean Address Fields --%>
            <div :if={@selected_country == "KR"} class="space-y-4">
              <.input
                field={@form[:road_address]}
                type="text"
                label={gettext("Road Address")}
                placeholder={gettext("Selected from search above")}
              />
              <.input
                field={@form[:jibun_address]}
                type="text"
                label={gettext("Jibun Address")}
                placeholder={gettext("Auto-filled from search")}
              />
              <.input
                field={@form[:building_name]}
                type="text"
                label={gettext("Building Name")}
                placeholder={gettext("Building or complex name (optional)")}
              />
            </div>

            <%!-- International Address Fields --%>
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

            <%!-- Map Preview (for addresses with coordinates) --%>
            <div :if={has_coordinates?(@map_latitude, @map_longitude)} class="mt-4">
              <label class="label">
                <span class="label-text">{gettext("Location Preview")}</span>
              </label>
              <.live_component
                module={MceWeb.Live.Components.MapPreview}
                id="farm-map-preview"
                latitude={@map_latitude}
                longitude={@map_longitude}
                width={400}
                height={200}
              />
            </div>
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

    # Exclude :uploads from assigns since it's a reserved key in LiveComponents
    # Pass it as :parent_uploads instead
    {uploads, assigns} = Map.pop(assigns, :uploads)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:parent_uploads, uploads)
     |> assign(:countries, @countries)
     |> assign(:selected_country, selected_country)
     |> assign_new(:address_query, fn -> "" end)
     |> assign_new(:address_results, fn -> [] end)
     |> assign_new(:address_loading, fn -> false end)
     |> assign_new(:show_suggestions, fn -> false end)
     |> assign_new(:remove_logo, fn -> false end)
     |> assign_new(:map_latitude, fn -> farm.latitude end)
     |> assign_new(:map_longitude, fn -> farm.longitude end)
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
     |> assign(:form, form)
     |> assign(:address_query, "")
     |> assign(:address_results, [])
     |> assign(:show_suggestions, false)}
  end

  @impl true
  def handle_event("address_search", %{"address_search" => query}, socket) do
    country = socket.assigns.selected_country

    if String.length(query) >= 2 do
      case Address.search(query, country) do
        {:ok, results} ->
          {:noreply,
           socket
           |> assign(:address_query, query)
           |> assign(:address_results, results)
           |> assign(:address_loading, false)
           |> assign(:show_suggestions, true)}

        {:error, _reason} ->
          {:noreply,
           socket
           |> assign(:address_query, query)
           |> assign(:address_results, [])
           |> assign(:address_loading, false)
           |> assign(:show_suggestions, true)}
      end
    else
      {:noreply,
       socket
       |> assign(:address_query, query)
       |> assign(:address_results, [])
       |> assign(:show_suggestions, false)}
    end
  end

  @impl true
  def handle_event("show_suggestions", _params, socket) do
    show = socket.assigns.address_query != "" && length(socket.assigns.address_results) > 0
    {:noreply, assign(socket, :show_suggestions, show)}
  end

  @impl true
  def handle_event("select_address", %{"id" => id}, socket) do
    result = Enum.find(socket.assigns.address_results, &(&1.id == id))
    country = socket.assigns.selected_country

    if result do
      case Address.get_details(result, country) do
        {:ok, data} ->
          form_params = build_address_params(data, country)

          form =
            socket.assigns.farm
            |> Farms.change_farm(form_params)
            |> to_form()

          {:noreply,
           socket
           |> assign(:form, form)
           |> assign(:address_query, result.display)
           |> assign(:map_latitude, data[:latitude])
           |> assign(:map_longitude, data[:longitude])
           |> assign(:show_suggestions, false)}

        {:error, _reason} ->
          {:noreply, assign(socket, :show_suggestions, false)}
      end
    else
      {:noreply, assign(socket, :show_suggestions, false)}
    end
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
  def handle_event("cancel_upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :logo, ref)}
  end

  @impl true
  def handle_event("remove_logo", _params, socket) do
    {:noreply, assign(socket, :remove_logo, true)}
  end

  @impl true
  def handle_event("save", %{"farm" => farm_params}, socket) do
    save_farm(socket, socket.assigns.action, farm_params)
  end

  defp save_farm(socket, :edit, farm_params) do
    farm_params = handle_logo_upload(socket, farm_params)

    # Handle logo removal
    farm_params =
      if socket.assigns[:remove_logo] do
        delete_old_logo(socket.assigns.farm.logo_path)
        Map.put(farm_params, "logo_path", nil)
      else
        farm_params
      end

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
    farm_params =
      farm_params
      |> Map.put("user_id", socket.assigns.current_scope.user.id)

    farm_params = handle_logo_upload(socket, farm_params)

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

  defp handle_logo_upload(socket, farm_params) do
    # Check if uploads are configured before trying to consume
    if Map.has_key?(socket.assigns, :uploads) and Map.has_key?(socket.assigns.uploads, :logo) do
      case consume_uploaded_entries(socket, :logo, fn %{path: path}, entry ->
             dest_filename = generate_filename(entry.client_name)
             dest_path = Path.join(uploads_dir(), dest_filename)
             File.cp!(path, dest_path)
             {:ok, "/uploads/logos/#{dest_filename}"}
           end) do
        [logo_path] ->
          # Delete old logo if exists
          delete_old_logo(socket.assigns.farm.logo_path)
          Map.put(farm_params, "logo_path", logo_path)

        [] ->
          farm_params
      end
    else
      farm_params
    end
  end

  defp generate_filename(original_name) do
    ext = Path.extname(original_name)
    "#{Ecto.UUID.generate()}#{ext}"
  end

  defp uploads_dir do
    Path.join([:code.priv_dir(:mce), "static", "uploads", "logos"])
  end

  defp delete_old_logo(nil), do: :ok

  defp delete_old_logo(logo_path) do
    full_path = Path.join([:code.priv_dir(:mce), "static", logo_path])

    if File.exists?(full_path) do
      File.rm(full_path)
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})

  defp has_pending_upload?(entries), do: length(entries) > 0

  defp upload_error_message(:too_large), do: gettext("File is too large. Maximum size is 2MB.")
  defp upload_error_message(:too_many_files), do: gettext("You can only upload one file.")

  defp upload_error_message(:not_accepted),
    do: gettext("Invalid file type. Please upload PNG, JPG, GIF, or SVG.")

  defp upload_error_message(_), do: gettext("Upload error. Please try again.")

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

  defp address_placeholder("KR"), do: gettext("Search by road name, building, or address")
  defp address_placeholder("US"), do: gettext("Enter street address")
  defp address_placeholder("BR"), do: gettext("Digite o endereco")
  defp address_placeholder(_), do: gettext("Enter address")

  defp build_address_params(data, "KR") do
    %{
      "country" => "KR",
      "road_address" => data[:road_address] || "",
      "jibun_address" => data[:jibun_address] || "",
      "building_name" => data[:building_name] || "",
      "postal_code" => data[:postal_code] || "",
      "city" => data[:city] || "",
      "state_province" => data[:state_province] || "",
      "latitude" => data[:latitude],
      "longitude" => data[:longitude]
    }
  end

  defp build_address_params(data, country) when country in ["US", "BR"] do
    %{
      "country" => country,
      "address_line1" => data[:address_line1] || "",
      "address_line2" => data[:address_line2] || "",
      "city" => data[:city] || "",
      "state_province" => data[:state_province] || "",
      "postal_code" => data[:postal_code] || "",
      "latitude" => data[:latitude],
      "longitude" => data[:longitude]
    }
  end

  defp build_address_params(data, country) do
    %{"country" => country}
    |> Map.merge(Map.new(data, fn {k, v} -> {to_string(k), v} end))
  end

  defp has_coordinates?(lat, _lon) do
    is_number(lat) or is_struct(lat, Decimal)
  end
end
