defmodule MceWeb.Live.Components.AddressAutocomplete do
  @moduledoc """
  LiveComponent for address autocomplete with country-aware API routing.

  Supports:
  - Korean addresses via Juso API
  - US/Brazil addresses via Google Maps Places API

  ## Usage

      <.live_component
        module={MceWeb.Live.Components.AddressAutocomplete}
        id="farm-address"
        country={@selected_country}
        on_select={fn data -> send(self(), {:address_selected, data}) end}
      />

  The `on_select` callback receives a map with address fields appropriate for the country.
  """

  use MceWeb, :live_component

  alias Mce.Address

  @debounce_ms 300

  @impl true
  def render(assigns) do
    ~H"""
    <div class="relative" id={@id}>
      <div class="form-control w-full">
        <label class="label">
          <span class="label-text">{@label}</span>
        </label>
        <div class="relative">
          <input
            type="text"
            id={"#{@id}-input"}
            name={"#{@id}-input"}
            value={@query}
            placeholder={@placeholder}
            autocomplete="off"
            phx-debounce={@debounce_ms}
            phx-target={@myself}
            phx-keyup="search"
            phx-focus="focus"
            phx-blur="blur"
            class={[
              "input input-bordered w-full pr-10",
              @loading && "animate-pulse"
            ]}
          />
          <div class="absolute right-3 top-1/2 -translate-y-1/2">
            <.icon
              :if={@loading}
              name="hero-arrow-path"
              class="size-5 animate-spin text-base-content/50"
            />
            <.icon
              :if={!@loading && @query != ""}
              name="hero-magnifying-glass"
              class="size-5 text-base-content/50"
            />
          </div>
        </div>
      </div>

      <div
        :if={@show_dropdown && length(@results) > 0}
        class="absolute z-50 mt-1 w-full rounded-lg border border-base-300 bg-base-100 shadow-lg"
        phx-click-away="close"
        phx-target={@myself}
      >
        <ul class="menu menu-compact p-2">
          <li :for={result <- @results}>
            <button
              type="button"
              phx-click="select"
              phx-value-id={result.id}
              phx-target={@myself}
              class="flex flex-col items-start gap-0.5 text-left"
            >
              <span class="font-medium">{result.display}</span>
              <span :if={result[:secondary]} class="text-xs text-base-content/60">
                {result[:secondary]}
              </span>
            </button>
          </li>
        </ul>
      </div>

      <div
        :if={@show_dropdown && length(@results) == 0 && @query != "" && !@loading}
        class="absolute z-50 mt-1 w-full rounded-lg border border-base-300 bg-base-100 p-4 text-center shadow-lg"
      >
        <p class="text-base-content/60">{gettext("No addresses found")}</p>
      </div>
    </div>
    """
  end

  @impl true
  def mount(socket) do
    {:ok,
     socket
     |> assign(:query, "")
     |> assign(:results, [])
     |> assign(:loading, false)
     |> assign(:show_dropdown, false)
     |> assign(:debounce_ms, @debounce_ms)
     |> assign(:selected, nil)}
  end

  @impl true
  def update(assigns, socket) do
    socket =
      socket
      |> assign(assigns)
      |> assign_new(:label, fn -> gettext("Address") end)
      |> assign_new(:placeholder, fn -> placeholder_for_country(assigns[:country]) end)
      |> assign_new(:country, fn -> "KR" end)
      |> assign_new(:on_select, fn -> nil end)

    {:ok, socket}
  end

  @impl true
  def handle_event("search", %{"value" => query}, socket) do
    if String.length(query) >= 2 do
      send(self(), {:address_search, socket.assigns.id, query, socket.assigns.country})

      {:noreply,
       socket
       |> assign(:query, query)
       |> assign(:loading, true)
       |> assign(:show_dropdown, true)}
    else
      {:noreply,
       socket
       |> assign(:query, query)
       |> assign(:results, [])
       |> assign(:show_dropdown, false)}
    end
  end

  @impl true
  def handle_event("focus", _params, socket) do
    show = socket.assigns.query != "" && length(socket.assigns.results) > 0
    {:noreply, assign(socket, :show_dropdown, show)}
  end

  @impl true
  def handle_event("blur", _params, socket) do
    Process.send_after(self(), {:address_blur, socket.assigns.id}, 200)
    {:noreply, socket}
  end

  @impl true
  def handle_event("close", _params, socket) do
    {:noreply, assign(socket, :show_dropdown, false)}
  end

  @impl true
  def handle_event("select", %{"id" => id}, socket) do
    result = Enum.find(socket.assigns.results, &(&1.id == id))

    if result do
      case Address.get_details(result, socket.assigns.country) do
        {:ok, data} ->
          if socket.assigns.on_select do
            socket.assigns.on_select.(data)
          end

          {:noreply,
           socket
           |> assign(:query, result.display)
           |> assign(:selected, result)
           |> assign(:show_dropdown, false)}

        {:error, _reason} ->
          {:noreply, socket}
      end
    else
      {:noreply, socket}
    end
  end

  @doc """
  Handle search results from the parent LiveView.

  Call this from the parent's `handle_info` callback:

      def handle_info({:address_search, id, query, country}, socket) do
        send_update(MceWeb.Live.Components.AddressAutocomplete,
          id: id,
          results: perform_search(query, country)
        )
        {:noreply, socket}
      end
  """
  def handle_search_results(results) when is_list(results) do
    Enum.map(results, fn result ->
      %{
        id: result.id,
        display: result.display,
        secondary: Map.get(result.data, :secondary_text),
        data: result.data
      }
    end)
  end

  defp placeholder_for_country("KR"), do: gettext("Search by road name, building, or address")
  defp placeholder_for_country("US"), do: gettext("Enter street address")
  defp placeholder_for_country("BR"), do: gettext("Digite o endereco")
  defp placeholder_for_country(_), do: gettext("Enter address")
end
