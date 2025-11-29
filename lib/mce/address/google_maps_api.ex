defmodule Mce.Address.GoogleMapsApi do
  @moduledoc """
  Client for the Google Maps Places API.

  Provides address autocomplete for US and Brazil addresses.
  API Documentation: https://developers.google.com/maps/documentation/places/web-service/autocomplete

  ## Configuration

  Set the API key in your config:

      config :mce, Mce.Address.GoogleMapsApi,
        api_key: "your-api-key",
        use_mock: false

  When `use_mock` is true, returns mock data for development without an API key.
  """

  require Logger

  @autocomplete_url "https://maps.googleapis.com/maps/api/place/autocomplete/json"
  @details_url "https://maps.googleapis.com/maps/api/place/details/json"

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
  Search for addresses using Google Places Autocomplete.

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

  defp autocomplete_api(input, country, opts) do
    api_key = get_api_key()

    if is_nil(api_key) or api_key == "" do
      Logger.warning("Google Maps API key not configured, falling back to mock data")
      autocomplete_mock(input, country)
    else
      params =
        %{
          input: input,
          types: "address",
          components: "country:#{String.downcase(country)}",
          key: api_key
        }
        |> maybe_add_session_token(opts)

      case Req.get(@autocomplete_url, params: params) do
        {:ok, %{status: 200, body: body}} ->
          parse_autocomplete_response(body)

        {:ok, %{status: status}} ->
          {:error, {:http_error, status}}

        {:error, reason} ->
          Logger.error("Google Maps API request failed: #{inspect(reason)}")
          {:error, reason}
      end
    end
  end

  defp get_place_details_api(place_id, opts) do
    api_key = get_api_key()

    if is_nil(api_key) or api_key == "" do
      Logger.warning("Google Maps API key not configured, falling back to mock data")
      get_place_details_mock(place_id)
    else
      params =
        %{
          place_id: place_id,
          fields: "address_components,formatted_address,geometry",
          key: api_key
        }
        |> maybe_add_session_token(opts)

      case Req.get(@details_url, params: params) do
        {:ok, %{status: 200, body: body}} ->
          parse_details_response(body)

        {:ok, %{status: status}} ->
          {:error, {:http_error, status}}

        {:error, reason} ->
          Logger.error("Google Maps API request failed: #{inspect(reason)}")
          {:error, reason}
      end
    end
  end

  defp maybe_add_session_token(params, opts) do
    case Keyword.get(opts, :session_token) do
      nil -> params
      token -> Map.put(params, :sessiontoken, token)
    end
  end

  defp parse_autocomplete_response(%{"status" => "OK", "predictions" => predictions}) do
    parsed =
      Enum.map(predictions, fn pred ->
        %{
          place_id: pred["place_id"],
          description: pred["description"],
          main_text: get_in(pred, ["structured_formatting", "main_text"]),
          secondary_text: get_in(pred, ["structured_formatting", "secondary_text"])
        }
      end)

    {:ok, parsed}
  end

  defp parse_autocomplete_response(%{"status" => "ZERO_RESULTS"}) do
    {:ok, []}
  end

  defp parse_autocomplete_response(%{"status" => status, "error_message" => message}) do
    {:error, {:api_error, status, message}}
  end

  defp parse_autocomplete_response(%{"status" => status}) do
    {:error, {:api_error, status, nil}}
  end

  defp parse_autocomplete_response(_), do: {:error, :invalid_response}

  defp parse_details_response(%{"status" => "OK", "result" => result}) do
    components = result["address_components"] || []
    geometry = result["geometry"] || %{}
    location = geometry["location"] || %{}

    address = %{
      place_id: nil,
      description: result["formatted_address"],
      address_line1: extract_street_address(components),
      address_line2: nil,
      city: find_component(components, "locality") || find_component(components, "sublocality"),
      state_province: find_component(components, "administrative_area_level_1", :short_name),
      postal_code: find_component(components, "postal_code"),
      country: find_component(components, "country", :short_name),
      latitude: location["lat"],
      longitude: location["lng"]
    }

    {:ok, address}
  end

  defp parse_details_response(%{"status" => status, "error_message" => message}) do
    {:error, {:api_error, status, message}}
  end

  defp parse_details_response(%{"status" => status}) do
    {:error, {:api_error, status, nil}}
  end

  defp parse_details_response(_), do: {:error, :invalid_response}

  defp extract_street_address(components) do
    street_number = find_component(components, "street_number")
    route = find_component(components, "route")

    case {street_number, route} do
      {nil, nil} -> nil
      {nil, route} -> route
      {number, nil} -> number
      {number, route} -> "#{number} #{route}"
    end
  end

  defp find_component(components, type, name_type \\ :long_name) do
    name_key = if name_type == :short_name, do: "short_name", else: "long_name"

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
