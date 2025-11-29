defmodule Mce.Address do
  @moduledoc """
  Context for address lookup and validation.

  Routes to the appropriate API based on country code:
  - KR: Juso API (Korean Address API)
  - US, BR: Google Maps Places API
  """

  alias Mce.Address.{JusoApi, GoogleMapsApi, Geocoder}

  @type search_result :: %{
          id: String.t(),
          display: String.t(),
          data: map()
        }

  @doc """
  Search for addresses based on country.

  Returns a unified format for display in autocomplete components.

  ## Parameters

  - `query` - Search query string
  - `country` - ISO 3166-1 alpha-2 country code ("KR", "US", "BR")
  - `opts` - Optional parameters passed to the underlying API

  ## Returns

  - `{:ok, [search_result]}` - List of matching addresses
  - `{:error, reason}` - Error with reason
  """
  @spec search(String.t(), String.t(), keyword()) :: {:ok, [search_result()]} | {:error, term()}
  def search(query, country, opts \\ [])

  def search(query, "KR", opts) do
    case JusoApi.search(query, opts) do
      {:ok, addresses} ->
        results =
          addresses
          |> Enum.with_index()
          |> Enum.map(fn {addr, idx} ->
            %{
              id: "kr_#{idx}",
              display: format_korean_address(addr),
              data: addr
            }
          end)

        {:ok, results}

      {:error, reason} ->
        {:error, reason}
    end
  end

  def search(query, country, opts) when country in ["US", "BR"] do
    case GoogleMapsApi.autocomplete(query, country, opts) do
      {:ok, predictions} ->
        results =
          Enum.map(predictions, fn pred ->
            %{
              id: pred.place_id,
              display: pred.description,
              data: pred
            }
          end)

        {:ok, results}

      {:error, reason} ->
        {:error, reason}
    end
  end

  def search(_query, _country, _opts) do
    {:ok, []}
  end

  @doc """
  Get detailed address information for a selected result.

  For Korean addresses, the data is already complete from the search.
  For Google Places, fetches additional details using the place_id.

  ## Parameters

  - `result` - A search result from `search/3`
  - `country` - ISO 3166-1 alpha-2 country code

  ## Returns

  - `{:ok, address_data}` - Address data ready for form fields
  - `{:error, reason}` - Error with reason
  """
  @spec get_details(search_result(), String.t(), keyword()) :: {:ok, map()} | {:error, term()}
  def get_details(result, country, opts \\ [])

  def get_details(%{data: data}, "KR", _opts) do
    # Geocode the road address to get coordinates for map preview
    coords =
      case Geocoder.geocode(data.road_address, "KR") do
        {:ok, %{latitude: lat, longitude: lon}} -> %{latitude: lat, longitude: lon}
        _ -> %{latitude: nil, longitude: nil}
      end

    {:ok,
     %{
       road_address: data.road_address,
       jibun_address: data.jibun_address,
       building_name: data.building_name,
       postal_code: data.postal_code,
       city: data.sigungu,
       state_province: data.sido,
       latitude: coords.latitude,
       longitude: coords.longitude
     }}
  end

  def get_details(%{id: place_id, data: data}, country, opts) when country in ["US", "BR"] do
    if is_map_key(data, :address_line1) do
      {:ok,
       %{
         address_line1: data.address_line1,
         address_line2: data.address_line2,
         city: data.city,
         state_province: data.state_province,
         postal_code: data.postal_code,
         latitude: data.latitude,
         longitude: data.longitude
       }}
    else
      case GoogleMapsApi.get_place_details(place_id, opts) do
        {:ok, details} ->
          {:ok,
           %{
             address_line1: details.address_line1,
             address_line2: details.address_line2,
             city: details.city,
             state_province: details.state_province,
             postal_code: details.postal_code,
             latitude: details.latitude,
             longitude: details.longitude
           }}

        {:error, reason} ->
          {:error, reason}
      end
    end
  end

  def get_details(_result, _country, _opts) do
    {:error, :unsupported_country}
  end

  defp format_korean_address(addr) do
    parts =
      [
        addr.road_address,
        addr.building_name
      ]
      |> Enum.reject(&is_nil/1)
      |> Enum.reject(&(&1 == ""))

    Enum.join(parts, " ")
  end
end
