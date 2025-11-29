defmodule MceWeb.Live.Components.KoreanAddressInput do
  @moduledoc """
  LiveComponent for Korean address input using Daum Postcode service.

  Unlike the generic AddressAutocomplete component, this uses Daum's popup-based
  address search which provides a better UX for Korean addresses and requires
  no API key.

  ## Usage

      <.live_component
        module={MceWeb.Live.Components.KoreanAddressInput}
        id="farm-address"
        on_select={fn data -> send(self(), {:address_selected, data}) end}
      />

  ## Address Data Structure

  The `on_select` callback receives a map with:
  - `road_address` - Road name address (도로명주소)
  - `jibun_address` - Jibun address (지번주소)
  - `postal_code` - Postal code (우편번호)
  - `building_name` - Building name (건물명)
  - `sido` - Province/City (시/도)
  - `sigungu` - District (시/군/구)
  - `bname` - Legal district name (법정동/리)
  """

  use MceWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div id={@id} phx-hook="DaumPostcode" class="form-control w-full">
      <label :if={@label} class="label">
        <span class="label-text">{@label}</span>
      </label>
      <div class="join w-full">
        <input
          type="text"
          id={"#{@id}-input"}
          name={@name}
          value={@value}
          placeholder={@placeholder}
          readonly={@readonly}
          class={[
            "input input-bordered join-item flex-1",
            @readonly && "bg-base-200"
          ]}
        />
        <button
          type="button"
          data-postcode-trigger
          class="btn btn-primary join-item"
        >
          <.icon name="hero-magnifying-glass" class="size-4" />
          <span class="hidden sm:inline">{gettext("Search")}</span>
        </button>
      </div>
      <label :if={@hint} class="label">
        <span class="label-text-alt text-base-content/60">{@hint}</span>
      </label>

      <input
        :if={@include_hidden_fields}
        type="hidden"
        name={"#{@field_prefix}[postal_code]"}
        value={@address_data[:postal_code] || ""}
      />
      <input
        :if={@include_hidden_fields}
        type="hidden"
        name={"#{@field_prefix}[road_address]"}
        value={@address_data[:road_address] || ""}
      />
      <input
        :if={@include_hidden_fields}
        type="hidden"
        name={"#{@field_prefix}[jibun_address]"}
        value={@address_data[:jibun_address] || ""}
      />
      <input
        :if={@include_hidden_fields}
        type="hidden"
        name={"#{@field_prefix}[sido]"}
        value={@address_data[:sido] || ""}
      />
      <input
        :if={@include_hidden_fields}
        type="hidden"
        name={"#{@field_prefix}[sigungu]"}
        value={@address_data[:sigungu] || ""}
      />
    </div>
    """
  end

  @impl true
  def mount(socket) do
    {:ok,
     socket
     |> assign(:value, "")
     |> assign(:address_data, %{})}
  end

  @impl true
  def update(assigns, socket) do
    socket =
      socket
      |> assign(assigns)
      |> assign_new(:label, fn -> gettext("Address") end)
      |> assign_new(:placeholder, fn -> gettext("Click to search for address") end)
      |> assign_new(:hint, fn -> nil end)
      |> assign_new(:name, fn -> "address" end)
      |> assign_new(:readonly, fn -> true end)
      |> assign_new(:on_select, fn -> nil end)
      |> assign_new(:include_hidden_fields, fn -> false end)
      |> assign_new(:field_prefix, fn -> "address" end)

    {:ok, socket}
  end

  @impl true
  def handle_event("address-selected", params, socket) do
    # Transform JS camelCase to Elixir snake_case
    address_data = %{
      road_address: params["roadAddress"] || "",
      jibun_address: params["jibunAddress"] || "",
      postal_code: params["postalCode"] || "",
      building_name: params["buildingName"] || "",
      sido: params["sido"] || "",
      sigungu: params["sigungu"] || "",
      bname: params["bname"] || "",
      road_address_english: params["roadAddressEnglish"] || "",
      jibun_address_english: params["jibunAddressEnglish"] || "",
      apartment: params["apartment"] || false
    }

    # Format display value
    display_value = format_display_address(address_data)

    # Call the on_select callback if provided
    if socket.assigns.on_select do
      socket.assigns.on_select.(address_data)
    end

    {:noreply,
     socket
     |> assign(:value, display_value)
     |> assign(:address_data, address_data)}
  end

  @impl true
  def handle_event("address-cancelled", _params, socket) do
    {:noreply, socket}
  end

  defp format_display_address(data) do
    parts =
      [
        data.road_address,
        if(data.building_name != "", do: "(#{data.building_name})", else: nil)
      ]
      |> Enum.reject(&is_nil/1)

    Enum.join(parts, " ")
  end
end
