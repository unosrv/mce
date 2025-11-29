defmodule MceWeb.Live.Components.MapPreview do
  @moduledoc """
  A simple map preview component using OpenStreetMap.

  Shows a static map image centered on the given coordinates. Optionally
  can link to an external map service for full interactivity.

  ## Usage

      <.live_component
        module={MceWeb.Live.Components.MapPreview}
        id="farm-map"
        latitude={@farm.latitude}
        longitude={@farm.longitude}
      />

  ## Assigns

  - `latitude` - Latitude coordinate (required when showing map)
  - `longitude` - Longitude coordinate (required when showing map)
  - `zoom` - Zoom level (default: 15)
  - `width` - Map width in pixels (default: 300)
  - `height` - Map height in pixels (default: 200)
  - `show_link` - Show link to external map service (default: true)
  - `class` - Additional CSS classes for the container
  """

  use MceWeb, :live_component

  @default_zoom 15
  @default_width 300
  @default_height 200

  @impl true
  def render(assigns) do
    ~H"""
    <div id={@id} class={["map-preview", @class]}>
      <%= if has_coordinates?(assigns) do %>
        <div class="relative overflow-hidden rounded-lg border border-base-300">
          <img
            src={static_map_url(@latitude, @longitude, @zoom, @width, @height)}
            alt={gettext("Map preview")}
            class="w-full"
            loading="lazy"
          />
          <%!-- Map marker overlay --%>
          <div class="pointer-events-none absolute inset-0 flex items-center justify-center">
            <.icon name="hero-map-pin-solid" class="size-8 -mt-4 text-error drop-shadow-lg" />
          </div>
          <%!-- External link overlay --%>
          <a
            :if={@show_link}
            href={external_map_url(@latitude, @longitude)}
            target="_blank"
            rel="noopener noreferrer"
            class="absolute bottom-2 right-2 btn btn-xs btn-ghost bg-base-100/80 hover:bg-base-100"
          >
            <.icon name="hero-arrow-top-right-on-square-mini" class="size-3" />
            {gettext("Open Map")}
          </a>
        </div>
        <p class="mt-1 text-xs text-base-content/60">
          {format_coordinates(@latitude, @longitude)}
        </p>
      <% else %>
        <div class={[
          "flex flex-col items-center justify-center rounded-lg border-2 border-dashed border-base-300 bg-base-200/50 p-4",
          "h-[#{@height}px]"
        ]}>
          <.icon name="hero-map" class="size-12 text-base-content/30" />
          <p class="mt-2 text-sm text-base-content/50">{gettext("No location set")}</p>
          <p class="text-xs text-base-content/40">{gettext("Search for an address to show map")}</p>
        </div>
      <% end %>
    </div>
    """
  end

  @impl true
  def mount(socket) do
    {:ok,
     socket
     |> assign(:latitude, nil)
     |> assign(:longitude, nil)
     |> assign(:zoom, @default_zoom)
     |> assign(:width, @default_width)
     |> assign(:height, @default_height)
     |> assign(:show_link, true)
     |> assign(:class, nil)}
  end

  @impl true
  def update(assigns, socket) do
    socket =
      socket
      |> assign(assigns)
      |> assign_new(:zoom, fn -> @default_zoom end)
      |> assign_new(:width, fn -> @default_width end)
      |> assign_new(:height, fn -> @default_height end)
      |> assign_new(:show_link, fn -> true end)
      |> assign_new(:class, fn -> nil end)

    {:ok, socket}
  end

  defp has_coordinates?(assigns) do
    is_number(assigns.latitude) or is_struct(assigns.latitude, Decimal)
  end

  defp static_map_url(lat, lon, zoom, width, height) do
    # Use OpenStreetMap static map service
    # Note: This uses a simple static map tile approach
    lat = to_float(lat)
    lon = to_float(lon)

    # Use OpenStreetMap's static map service via staticmaps.org
    # This is a free service that doesn't require an API key
    "https://staticmap.openstreetmap.de/staticmap.php?" <>
      URI.encode_query(%{
        "center" => "#{lat},#{lon}",
        "zoom" => zoom,
        "size" => "#{width}x#{height}",
        "maptype" => "osmarenderer",
        "markers" => "#{lat},#{lon},red-pushpin"
      })
  end

  defp external_map_url(lat, lon) do
    lat = to_float(lat)
    lon = to_float(lon)
    "https://www.openstreetmap.org/?mlat=#{lat}&mlon=#{lon}&zoom=16"
  end

  defp format_coordinates(lat, lon) do
    lat = to_float(lat)
    lon = to_float(lon)

    lat_dir = if lat >= 0, do: "N", else: "S"
    lon_dir = if lon >= 0, do: "E", else: "W"

    "#{abs(lat) |> Float.round(6)}° #{lat_dir}, #{abs(lon) |> Float.round(6)}° #{lon_dir}"
  end

  defp to_float(%Decimal{} = d), do: Decimal.to_float(d)
  defp to_float(n) when is_float(n), do: n
  defp to_float(n) when is_integer(n), do: n * 1.0
  defp to_float(nil), do: 0.0
end
