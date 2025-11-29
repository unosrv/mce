defmodule Mce.Address.Geocoder do
  @moduledoc """
  Geocoding service for converting addresses to coordinates.

  Uses Nominatim (OpenStreetMap) for geocoding. This is a free service
  but has rate limits (1 request/second). For production use with high
  volume, consider using Kakao Maps API or Google Geocoding API.

  ## Configuration

      config :mce, Mce.Address.Geocoder,
        use_mock: true  # Set to false to use real API
  """

  require Logger

  @nominatim_url "https://nominatim.openstreetmap.org/search"

  @doc """
  Geocode an address string to coordinates.

  ## Parameters

  - `address` - Full address string to geocode
  - `country_code` - ISO country code (e.g., "KR", "US", "BR")

  ## Returns

  - `{:ok, %{latitude: float, longitude: float}}` - Coordinates
  - `{:error, :not_found}` - Address could not be geocoded
  - `{:error, reason}` - Other error
  """
  @spec geocode(String.t(), String.t()) :: {:ok, map()} | {:error, term()}
  def geocode(address, country_code \\ nil)

  def geocode(address, country_code) when is_binary(address) do
    if use_mock?() do
      geocode_mock(address, country_code)
    else
      geocode_nominatim(address, country_code)
    end
  end

  def geocode(_, _), do: {:error, :invalid_address}

  defp geocode_nominatim(address, country_code) do
    params = %{
      q: address,
      format: "json",
      limit: 1,
      addressdetails: 1
    }

    params =
      if country_code do
        Map.put(params, :countrycodes, String.downcase(country_code))
      else
        params
      end

    headers = [
      {"User-Agent", "MCE/1.0 (Methane Carbon Emissions Calculator)"}
    ]

    case Req.get(@nominatim_url, params: params, headers: headers) do
      {:ok, %{status: 200, body: [result | _]}} ->
        lat = parse_coordinate(result["lat"])
        lon = parse_coordinate(result["lon"])

        if lat && lon do
          {:ok, %{latitude: lat, longitude: lon}}
        else
          {:error, :not_found}
        end

      {:ok, %{status: 200, body: []}} ->
        {:error, :not_found}

      {:ok, %{status: status}} ->
        {:error, {:http_error, status}}

      {:error, reason} ->
        Logger.error("Geocoding request failed: #{inspect(reason)}")
        {:error, reason}
    end
  end

  defp geocode_mock(address, _country_code) do
    # Mock coordinates for Korean addresses
    mock_coords = %{
      "서울특별시 강남구 테헤란로 152" => {37.5000, 127.0365},
      "서울특별시 강남구 역삼동 737" => {37.5000, 127.0365},
      "강남파이낸스센터" => {37.5000, 127.0365},
      "서울특별시 서초구 서초대로 411" => {37.4915, 127.0073},
      "서울특별시 서초구 서초동 1685-8" => {37.4915, 127.0073},
      "GT타워" => {37.4915, 127.0073},
      "경기도 성남시 분당구 판교역로 235" => {37.3947, 127.1109},
      "경기도 성남시 분당구 삼평동 681" => {37.3947, 127.1109},
      "에이치스퀘어" => {37.3947, 127.1109},
      "경기도 화성시 삼성전자로 1" => {37.2114, 127.0575},
      "경기도 화성시 반월동 1" => {37.2114, 127.0575},
      "삼성전자 화성캠퍼스" => {37.2114, 127.0575},
      "충청남도 천안시 동남구 풍세면 삼성1로 1" => {36.8169, 127.1140},
      "충청남도 천안시 동남구 풍세면 용정리" => {36.8169, 127.1140}
    }

    # Try to find a match by checking if address contains any key
    result =
      Enum.find(mock_coords, fn {key, _} ->
        String.contains?(address, key) or String.contains?(key, address)
      end)

    case result do
      {_, {lat, lon}} ->
        {:ok, %{latitude: lat, longitude: lon}}

      nil ->
        # Return a default Seoul coordinate for unmatched Korean addresses
        if String.contains?(address, "서울") do
          {:ok, %{latitude: 37.5665, longitude: 126.9780}}
        else
          {:error, :not_found}
        end
    end
  end

  defp parse_coordinate(value) when is_binary(value) do
    case Float.parse(value) do
      {float, _} -> float
      :error -> nil
    end
  end

  defp parse_coordinate(value) when is_float(value), do: value
  defp parse_coordinate(value) when is_integer(value), do: value * 1.0
  defp parse_coordinate(_), do: nil

  defp use_mock? do
    config = Application.get_env(:mce, __MODULE__, [])
    Keyword.get(config, :use_mock, true)
  end
end
