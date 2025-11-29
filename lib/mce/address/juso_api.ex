defmodule Mce.Address.JusoApi do
  @moduledoc """
  Client for the Korean Juso (Address) API.

  The Juso API provides address autocomplete and validation for Korean addresses.
  API Documentation: https://www.juso.go.kr/openApiPage.do

  ## Configuration

  Set the API key in your config:

      config :mce, Mce.Address.JusoApi,
        api_key: "your-api-key",
        use_mock: false

  When `use_mock` is true, returns mock data for development without an API key.
  """

  require Logger

  @base_url "https://www.juso.go.kr/addrlink/addrLinkApi.do"
  @default_count_per_page 10

  @type address_result :: %{
          road_address: String.t(),
          jibun_address: String.t(),
          building_name: String.t() | nil,
          postal_code: String.t(),
          sido: String.t(),
          sigungu: String.t(),
          eup_myeon_dong: String.t()
        }

  @doc """
  Search for Korean addresses using the Juso API.

  ## Parameters

  - `keyword` - Search keyword (street name, building name, etc.)
  - `opts` - Optional parameters:
    - `:page` - Page number (default: 1)
    - `:per_page` - Results per page (default: 10, max: 100)

  ## Returns

  - `{:ok, [address_result]}` - List of matching addresses
  - `{:error, reason}` - Error with reason
  """
  @spec search(String.t(), keyword()) :: {:ok, [address_result()]} | {:error, term()}
  def search(keyword, opts \\ []) when is_binary(keyword) do
    if use_mock?() do
      search_mock(keyword, opts)
    else
      search_api(keyword, opts)
    end
  end

  defp search_api(keyword, opts) do
    api_key = get_api_key()

    if is_nil(api_key) or api_key == "" do
      Logger.warning("Juso API key not configured, falling back to mock data")
      search_mock(keyword, opts)
    else
      page = Keyword.get(opts, :page, 1)
      per_page = Keyword.get(opts, :per_page, @default_count_per_page)

      params = %{
        confmKey: api_key,
        currentPage: page,
        countPerPage: per_page,
        keyword: keyword,
        resultType: "json"
      }

      case Req.get(@base_url, params: params) do
        {:ok, %{status: 200, body: body}} ->
          parse_response(body)

        {:ok, %{status: status}} ->
          {:error, {:http_error, status}}

        {:error, reason} ->
          Logger.error("Juso API request failed: #{inspect(reason)}")
          {:error, reason}
      end
    end
  end

  defp parse_response(%{"results" => %{"common" => common, "juso" => addresses}})
       when is_list(addresses) do
    case common["errorCode"] do
      "0" ->
        parsed =
          Enum.map(addresses, fn addr ->
            %{
              road_address: addr["roadAddr"] || "",
              jibun_address: addr["jibunAddr"] || "",
              building_name: addr["bdNm"],
              postal_code: addr["zipNo"] || "",
              sido: addr["siNm"] || "",
              sigungu: addr["sggNm"] || "",
              eup_myeon_dong: addr["emdNm"] || ""
            }
          end)

        {:ok, parsed}

      error_code ->
        {:error, {:api_error, error_code, common["errorMessage"]}}
    end
  end

  defp parse_response(%{"results" => %{"common" => common}}) do
    {:error, {:api_error, common["errorCode"], common["errorMessage"]}}
  end

  defp parse_response(_), do: {:error, :invalid_response}

  defp search_mock(keyword, _opts) do
    mock_addresses = [
      %{
        road_address: "서울특별시 강남구 테헤란로 152",
        jibun_address: "서울특별시 강남구 역삼동 737",
        building_name: "강남파이낸스센터",
        postal_code: "06236",
        sido: "서울특별시",
        sigungu: "강남구",
        eup_myeon_dong: "역삼동"
      },
      %{
        road_address: "서울특별시 서초구 서초대로 411",
        jibun_address: "서울특별시 서초구 서초동 1685-8",
        building_name: "GT타워",
        postal_code: "06615",
        sido: "서울특별시",
        sigungu: "서초구",
        eup_myeon_dong: "서초동"
      },
      %{
        road_address: "경기도 성남시 분당구 판교역로 235",
        jibun_address: "경기도 성남시 분당구 삼평동 681",
        building_name: "에이치스퀘어 N동",
        postal_code: "13494",
        sido: "경기도",
        sigungu: "성남시 분당구",
        eup_myeon_dong: "삼평동"
      },
      %{
        road_address: "경기도 화성시 삼성전자로 1",
        jibun_address: "경기도 화성시 반월동 1",
        building_name: "삼성전자 화성캠퍼스",
        postal_code: "18448",
        sido: "경기도",
        sigungu: "화성시",
        eup_myeon_dong: "반월동"
      },
      %{
        road_address: "충청남도 천안시 동남구 풍세면 삼성1로 1",
        jibun_address: "충청남도 천안시 동남구 풍세면 용정리 산15",
        building_name: nil,
        postal_code: "31177",
        sido: "충청남도",
        sigungu: "천안시 동남구",
        eup_myeon_dong: "풍세면"
      }
    ]

    filtered =
      if keyword == "" do
        []
      else
        Enum.filter(mock_addresses, fn addr ->
          String.contains?(String.downcase(addr.road_address), String.downcase(keyword)) or
            String.contains?(String.downcase(addr.jibun_address), String.downcase(keyword)) or
            (addr.building_name &&
               String.contains?(String.downcase(addr.building_name), String.downcase(keyword)))
        end)
      end

    {:ok, filtered}
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
