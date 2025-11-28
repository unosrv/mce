# Address Input APIs by Country

## Overview

The platform requires country-specific address input for Korea, USA, and Brazil. Each country has different address formats and available APIs.

---

## Korea: 도로명주소 API (juso.go.kr)

### Official Provider
**행정안전부 (Ministry of the Interior and Safety)**
- Portal: https://www.juso.go.kr/
- Developer Centre: https://business.juso.go.kr/

### Available APIs

#### 1. Search API (검색API)
- **Purpose**: Real-time address search without local DB
- **Response**: JSON/XML
- **Features**:
  - No DB setup required
  - Platform/language agnostic
  - Instant approval and use

#### 2. Popup API (팝업API)
- **Purpose**: Embedded search popup
- **Features**:
  - Pre-built UI component
  - Detailed address selection (동/층/호)
  - Mobile-optimised version available

### Registration Process
1. Visit https://www.juso.go.kr/
2. Navigate to 개발자센터 → OpenAPI 연계
3. Register application
4. Receive approval key (승인키)

### API Request Parameters

| Parameter | Description | Required |
|-----------|-------------|----------|
| confmKey | Approval key | Yes |
| currentPage | Page number | Yes |
| countPerPage | Results per page | Yes |
| keyword | Search term | Yes |
| resultType | json/xml | No |

### Response Format (도로명주소)

```
시/도 + 시/군/구 + 읍/면 + 도로명 + 건물번호(본번-부번) + 상세주소(동/층/호) + (참고항목)
```

Example: `서울특별시 강남구 테헤란로 123 (역삼동)`

### Implementation Recommendation

```elixir
defmodule Mce.Address.Korea do
  @base_url "https://www.juso.go.kr/addrlink/addrLinkApi.do"

  def search(keyword, opts \\ []) do
    params = %{
      confmKey: Application.get_env(:mce, :juso_api_key),
      currentPage: Keyword.get(opts, :page, 1),
      countPerPage: Keyword.get(opts, :per_page, 10),
      keyword: keyword,
      resultType: "json"
    }

    Req.get!(@base_url, params: params)
    |> Map.get(:body)
    |> parse_response()
  end
end
```

---

## USA & Brazil: Google Maps Places API

### API Overview
**Google Maps Places Autocomplete (New)**
- Released: May 2024 (GA)
- Features:
  - ~200 supported place types
  - Seamless Address Validation integration
  - Session-based pricing

### Key Features

#### Place Autocomplete
- Real-time predictions as user types
- Full word and substring matching
- Address, place name, and plus code resolution

#### Address Form Integration
- Auto-populate form fields from selection
- Country-specific address component parsing
- Bias results by location

### Implementation

#### JavaScript Integration

```javascript
// Initialize autocomplete
const autocomplete = new google.maps.places.Autocomplete(
  document.getElementById('address-input'),
  {
    types: ['address'],
    componentRestrictions: { country: ['us', 'br'] },
    fields: ['address_components', 'geometry', 'formatted_address']
  }
);

// Handle selection
autocomplete.addListener('place_changed', () => {
  const place = autocomplete.getPlace();
  populateAddressFields(place.address_components);
});
```

#### LiveView Hook

```javascript
// assets/js/hooks/google_address.js
export const GoogleAddressAutocomplete = {
  mounted() {
    const input = this.el;
    const country = input.dataset.country;

    const autocomplete = new google.maps.places.Autocomplete(input, {
      types: ['address'],
      componentRestrictions: { country: country },
      fields: ['address_components', 'formatted_address']
    });

    autocomplete.addListener('place_changed', () => {
      const place = autocomplete.getPlace();
      this.pushEvent('address_selected', {
        formatted: place.formatted_address,
        components: place.address_components
      });
    });
  }
};
```

### Address Component Mapping

#### USA Format
| Component | Type | Example |
|-----------|------|---------|
| Street Number | street_number | 1600 |
| Street Name | route | Pennsylvania Avenue |
| City | locality | Washington |
| State | administrative_area_level_1 | DC |
| ZIP Code | postal_code | 20500 |
| Country | country | US |

#### Brazil Format
| Component | Type | Example |
|-----------|------|---------|
| Street Number | street_number | 1000 |
| Street Name | route | Avenida Paulista |
| Neighbourhood | sublocality_level_1 | Bela Vista |
| City | administrative_area_level_2 | São Paulo |
| State | administrative_area_level_1 | SP |
| CEP | postal_code | 01310-100 |
| Country | country | BR |

### Pricing Considerations

#### Session-Based Pricing (New API)
- If user doesn't complete: Billed per request (up to 12)
- If user selects address: Session-based rate applies
- Recommendation: Use sessions for better cost predictability

---

## Dynamic Form Strategy

### Country Selection Flow

```
1. User selects country (Korea/USA/Brazil)
2. Form dynamically loads appropriate input component
3. Korea → juso.go.kr popup/search
4. USA/Brazil → Google Places Autocomplete
5. Address components stored in normalised schema
```

### Database Schema (Normalised)

```elixir
schema "farm_addresses" do
  field :country, :string           # "KR", "US", "BR"
  field :formatted_address, :string # Full display address
  field :street_address, :string    # Street + number
  field :city, :string              # City/Municipality
  field :state_province, :string    # State/Province/Do
  field :postal_code, :string       # ZIP/CEP/우편번호
  field :latitude, :decimal         # For mapping
  field :longitude, :decimal        # For mapping
  field :raw_components, :map       # Original API response

  belongs_to :farm, Mce.Farms.Farm
  timestamps()
end
```

---

## API Keys Management

### Environment Variables

```elixir
# config/runtime.exs
config :mce,
  juso_api_key: System.get_env("JUSO_API_KEY"),
  google_maps_api_key: System.get_env("GOOGLE_MAPS_API_KEY")
```

### Security Notes
- Never expose API keys in client-side code
- Use server-side proxy for Korea API
- Google Maps key can be restricted by domain/IP
- Implement rate limiting

---

## References

- [juso.go.kr API Documentation](https://www.juso.go.kr/addrlink/openApi/apiReqstList.do)
- [공공데이터포털 - 주소검색 API](https://www.data.go.kr/data/15057017/openapi.do)
- [Google Places Autocomplete (New)](https://developers.google.com/maps/documentation/places/web-service/place-autocomplete)
- [Google Address Form Example](https://developers.google.com/maps/documentation/javascript/examples/places-autocomplete-addressform)
- [Next Generation Autocomplete Announcement](https://mapsplatform.google.com/resources/blog/the-next-generation-of-autocomplete-is-now-generally-available/)
