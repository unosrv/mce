defmodule Mce.Address.GoogleMapsApi do
  @moduledoc """
  Client for the Google Maps Places API (New).

  Provides address autocomplete for US and Brazil addresses using the new
  Places API endpoints with POST requests.

  API Documentation: https://developers.google.com/maps/documentation/places/web-service/place-autocomplete

  ## Configuration

  Set the API key in your config:

      config :mce, Mce.Address.GoogleMapsApi,
        api_key: "your-api-key",
        use_mock: false

  When `use_mock` is true, returns mock data for development without an API key.

  ## API Version

  This module uses the Places API (New) which:
  - Uses POST requests for autocomplete
  - Uses `X-Goog-Api-Key` header for authentication
  - Returns a different response structure than the legacy API
  """

  require Logger

  # New Places API endpoints
  @autocomplete_url "https://places.googleapis.com/v1/places:autocomplete"
  @details_base_url "https://places.googleapis.com/v1/places"

  @type address_result :: %{
          place_id: String.t(),
          description: String.t(),
          address_line1: String.t() | nil,
          address_line2: String.t() | nil,
          city: String.t() | nil,
          state_province: String.t() | nil,
          postal_code: String.t() | nil,
          country: String.t() | nil,
          latitude: float() | nil,
          longitude: float() | nil
        }

  @doc """
  Search for addresses using Google Places Autocomplete (New).

  ## Parameters

  - `input` - Search input string
  - `country` - Country code ("US" or "BR")
  - `opts` - Optional parameters:
    - `:session_token` - Session token for billing optimization

  ## Returns

  - `{:ok, [prediction]}` - List of autocomplete predictions
  - `{:error, reason}` - Error with reason
  """
  @spec autocomplete(String.t(), String.t(), keyword()) :: {:ok, [map()]} | {:error, term()}
  def autocomplete(input, country, opts \\ []) when is_binary(input) and is_binary(country) do
    if use_mock?() do
      autocomplete_mock(input, country)
    else
      autocomplete_api(input, country, opts)
    end
  end

  @doc """
  Get detailed address information for a place ID.

  ## Parameters

  - `place_id` - Google Place ID from autocomplete results
  - `opts` - Optional parameters:
    - `:session_token` - Session token for billing optimization

  ## Returns

  - `{:ok, address_result}` - Detailed address information
  - `{:error, reason}` - Error with reason
  """
  @spec get_place_details(String.t(), keyword()) :: {:ok, address_result()} | {:error, term()}
  def get_place_details(place_id, opts \\ []) when is_binary(place_id) do
    if use_mock?() do
      get_place_details_mock(place_id)
    else
      get_place_details_api(place_id, opts)
    end
  end

  # New API: POST request with JSON body
  defp autocomplete_api(input, country, opts) do
    api_key = get_api_key()

    if is_nil(api_key) or api_key == "" do
      Logger.warning("Google Maps API key not configured, falling back to mock data")
      autocomplete_mock(input, country)
    else
      body =
        %{
          input: input,
          includedRegionCodes: [String.downcase(country)],
          includedPrimaryTypes: ["street_address", "route", "premise", "subpremise"]
        }
        |> maybe_add_session_token_to_body(opts)

      headers = [
        {"Content-Type", "application/json"},
        {"X-Goog-Api-Key", api_key}
      ]

      case Req.post(@autocomplete_url, json: body, headers: headers) do
        {:ok, %{status: 200, body: response_body}} ->
          parse_autocomplete_response(response_body)

        {:ok, %{status: status, body: error_body}} ->
          Logger.error("Google Maps API error: status=#{status}, body=#{inspect(error_body)}")
          {:error, {:http_error, status, error_body}}

        {:error, reason} ->
          Logger.error("Google Maps API request failed: #{inspect(reason)}")
          {:error, reason}
      end
    end
  end

  # New API: GET request with headers
  defp get_place_details_api(place_id, opts) do
    api_key = get_api_key()

    if is_nil(api_key) or api_key == "" do
      Logger.warning("Google Maps API key not configured, falling back to mock data")
      get_place_details_mock(place_id)
    else
      # Build URL with place ID
      url = "#{@details_base_url}/#{place_id}"

      # Fields we need for address details
      field_mask =
        "id,displayName,formattedAddress,addressComponents,location,shortFormattedAddress"

      headers =
        [
          {"Content-Type", "application/json"},
          {"X-Goog-Api-Key", api_key},
          {"X-Goog-FieldMask", field_mask}
        ]
        |> maybe_add_session_token_to_headers(opts)

      case Req.get(url, headers: headers) do
        {:ok, %{status: 200, body: response_body}} ->
          parse_details_response(response_body)

        {:ok, %{status: status, body: error_body}} ->
          Logger.error("Google Maps API error: status=#{status}, body=#{inspect(error_body)}")
          {:error, {:http_error, status, error_body}}

        {:error, reason} ->
          Logger.error("Google Maps API request failed: #{inspect(reason)}")
          {:error, reason}
      end
    end
  end

  defp maybe_add_session_token_to_body(body, opts) do
    case Keyword.get(opts, :session_token) do
      nil -> body
      token -> Map.put(body, :sessionToken, token)
    end
  end

  defp maybe_add_session_token_to_headers(headers, opts) do
    case Keyword.get(opts, :session_token) do
      nil -> headers
      token -> [{"X-Goog-Session-Token", token} | headers]
    end
  end

  # Parse new API response format
  defp parse_autocomplete_response(%{"suggestions" => suggestions}) when is_list(suggestions) do
    parsed =
      suggestions
      |> Enum.filter(&Map.has_key?(&1, "placePrediction"))
      |> Enum.map(fn %{"placePrediction" => pred} ->
        %{
          place_id: pred["placeId"],
          description: get_in(pred, ["text", "text"]) || "",
          main_text: get_in(pred, ["structuredFormat", "mainText", "text"]),
          secondary_text: get_in(pred, ["structuredFormat", "secondaryText", "text"])
        }
      end)

    {:ok, parsed}
  end

  defp parse_autocomplete_response(%{"suggestions" => []}) do
    {:ok, []}
  end

  defp parse_autocomplete_response(%{} = response) when map_size(response) == 0 do
    {:ok, []}
  end

  defp parse_autocomplete_response(%{"error" => error}) do
    {:error, {:api_error, error["code"], error["message"]}}
  end

  defp parse_autocomplete_response(_), do: {:error, :invalid_response}

  # Parse new API place details response
  defp parse_details_response(%{"id" => place_id} = result) do
    components = result["addressComponents"] || []
    location = result["location"] || %{}

    address = %{
      place_id: place_id,
      description: result["formattedAddress"] || result["shortFormattedAddress"],
      address_line1: extract_street_address_new(components),
      address_line2: nil,
      city:
        find_component_new(components, "locality") ||
          find_component_new(components, "sublocality") ||
          find_component_new(components, "administrative_area_level_2"),
      state_province: find_component_new(components, "administrative_area_level_1", :short),
      postal_code: find_component_new(components, "postal_code"),
      country: find_component_new(components, "country", :short),
      latitude: location["latitude"],
      longitude: location["longitude"]
    }

    {:ok, address}
  end

  defp parse_details_response(%{"error" => error}) do
    {:error, {:api_error, error["code"], error["message"]}}
  end

  defp parse_details_response(_), do: {:error, :invalid_response}

  # New API uses different component structure
  defp extract_street_address_new(components) do
    street_number = find_component_new(components, "street_number")
    route = find_component_new(components, "route")

    case {street_number, route} do
      {nil, nil} -> nil
      {nil, route} -> route
      {number, nil} -> number
      {number, route} -> "#{number} #{route}"
    end
  end

  # New API component structure: {types: [...], longText: "...", shortText: "..."}
  defp find_component_new(components, type, name_type \\ :long) do
    name_key = if name_type == :short, do: "shortText", else: "longText"

    components
    |> Enum.find(fn comp ->
      type in (comp["types"] || [])
    end)
    |> case do
      nil -> nil
      comp -> comp[name_key]
    end
  end

  # Mock data for development
  defp autocomplete_mock(input, country) do
    mock_data =
      case country do
        "US" -> us_mock_addresses()
        "BR" -> br_mock_addresses()
        _ -> []
      end

    filtered =
      if input == "" do
        []
      else
        Enum.filter(mock_data, fn addr ->
          String.contains?(String.downcase(addr.description), String.downcase(input))
        end)
      end

    {:ok, filtered}
  end

  defp get_place_details_mock(place_id) do
    all_mocks = us_mock_addresses() ++ br_mock_addresses()

    case Enum.find(all_mocks, fn addr -> addr.place_id == place_id end) do
      nil -> {:error, :not_found}
      addr -> {:ok, addr}
    end
  end

  defp us_mock_addresses do
    [
      %{
        place_id: "mock_us_1",
        description: "123 Main Street, San Francisco, CA 94102, USA",
        main_text: "123 Main Street",
        secondary_text: "San Francisco, CA, USA",
        address_line1: "123 Main Street",
        address_line2: nil,
        city: "San Francisco",
        state_province: "CA",
        postal_code: "94102",
        country: "US",
        latitude: 37.7749,
        longitude: -122.4194
      },
      %{
        place_id: "mock_us_2",
        description: "456 Oak Avenue, Los Angeles, CA 90001, USA",
        main_text: "456 Oak Avenue",
        secondary_text: "Los Angeles, CA, USA",
        address_line1: "456 Oak Avenue",
        address_line2: nil,
        city: "Los Angeles",
        state_province: "CA",
        postal_code: "90001",
        country: "US",
        latitude: 34.0522,
        longitude: -118.2437
      },
      %{
        place_id: "mock_us_3",
        description: "789 Farm Road, Austin, TX 78701, USA",
        main_text: "789 Farm Road",
        secondary_text: "Austin, TX, USA",
        address_line1: "789 Farm Road",
        address_line2: nil,
        city: "Austin",
        state_province: "TX",
        postal_code: "78701",
        country: "US",
        latitude: 30.2672,
        longitude: -97.7431
      },
      %{
        place_id: "mock_us_4",
        description: "100 Rural Route 5, Omaha, NE 68102, USA",
        main_text: "100 Rural Route 5",
        secondary_text: "Omaha, NE, USA",
        address_line1: "100 Rural Route 5",
        address_line2: nil,
        city: "Omaha",
        state_province: "NE",
        postal_code: "68102",
        country: "US",
        latitude: 41.2565,
        longitude: -95.9345
      }
    ]
  end

  defp br_mock_addresses do
    [
      %{
        place_id: "mock_br_1",
        description: "Av. Paulista, 1000 - Bela Vista, Sao Paulo - SP, 01310-100, Brazil",
        main_text: "Av. Paulista, 1000",
        secondary_text: "Bela Vista, Sao Paulo - SP, Brazil",
        address_line1: "Av. Paulista, 1000",
        address_line2: "Bela Vista",
        city: "Sao Paulo",
        state_province: "SP",
        postal_code: "01310-100",
        country: "BR",
        latitude: -23.5505,
        longitude: -46.6333
      },
      %{
        place_id: "mock_br_2",
        description: "Rua das Flores, 200 - Centro, Rio de Janeiro - RJ, 20040-020, Brazil",
        main_text: "Rua das Flores, 200",
        secondary_text: "Centro, Rio de Janeiro - RJ, Brazil",
        address_line1: "Rua das Flores, 200",
        address_line2: "Centro",
        city: "Rio de Janeiro",
        state_province: "RJ",
        postal_code: "20040-020",
        country: "BR",
        latitude: -22.9068,
        longitude: -43.1729
      },
      %{
        place_id: "mock_br_3",
        description: "Estrada Rural, 50 - Zona Rural, Goiania - GO, 74000-000, Brazil",
        main_text: "Estrada Rural, 50",
        secondary_text: "Zona Rural, Goiania - GO, Brazil",
        address_line1: "Estrada Rural, 50",
        address_line2: "Zona Rural",
        city: "Goiania",
        state_province: "GO",
        postal_code: "74000-000",
        country: "BR",
        latitude: -16.6869,
        longitude: -49.2648
      },
      %{
        place_id: "mock_br_4",
        description: "Fazenda Boa Vista, SN - Zona Rural, Ribeirao Preto - SP, 14000-000, Brazil",
        main_text: "Fazenda Boa Vista, SN",
        secondary_text: "Zona Rural, Ribeirao Preto - SP, Brazil",
        address_line1: "Fazenda Boa Vista, SN",
        address_line2: "Zona Rural",
        city: "Ribeirao Preto",
        state_province: "SP",
        postal_code: "14000-000",
        country: "BR",
        latitude: -21.1775,
        longitude: -47.8103
      }
    ]
  end

  defp get_api_key do
    Application.get_env(:mce, __MODULE__, [])
    |> Keyword.get(:api_key)
  end

  defp use_mock? do
    config = Application.get_env(:mce, __MODULE__, [])
    Keyword.get(config, :use_mock, true)
  end
end
