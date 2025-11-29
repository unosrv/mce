# MCE API Configuration Guide

This guide covers all external API integrations used in the MCE project, including how to obtain API keys and configure them properly following Elixir/Phoenix best practices.

---

## Table of Contents

1. [Overview](#overview)
2. [APIs Used in MCE](#apis-used-in-mce)
3. [Configuration Best Practices](#configuration-best-practices)
4. [Daum Postcode Service (Korean Addresses)](#daum-postcode-service-korean-addresses)
5. [Korean Juso API (Legacy)](#korean-juso-api-legacy)
6. [Google Maps Places API](#google-maps-places-api)
7. [Development vs Production Configuration](#development-vs-production-configuration)
8. [Troubleshooting](#troubleshooting)
9. [References](#references)

---

## Overview

MCE uses external APIs for address autocomplete functionality:

| API | Purpose | Countries | Required | Status |
|-----|---------|-----------|----------|--------|
| Daum Postcode | Address search/autocomplete | Korea (KR) | **No API key needed** | **Recommended** |
| Korean Juso API | Address search/autocomplete | Korea (KR) | Optional | Legacy |
| Google Maps Places API | Address search/autocomplete | US, Brazil | Optional* | Active |

*Google Maps API has mock data fallback enabled by default for development.

---

## APIs Used in MCE

### 1. Daum Postcode Service (Recommended for Korean Addresses)

- **Purpose**: Korean road name address (도로명주소) search and autocomplete
- **Provider**: Kakao (Daum)
- **Cost**: **Free** for all users, including commercial use
- **Rate Limits**: **None**
- **API Key Required**: **No**
- **Module**: `MceWeb.Live.Components.KoreanAddressInput`
- **Hook**: `DaumPostcode` (assets/js/hooks/daum_postcode.js)

### 2. Korean Juso API (Legacy)

- **Purpose**: Korean road name address search via server-side API
- **Provider**: Korean Government Address Information System
- **Cost**: Free for all users
- **API Key Required**: Yes (registration required)
- **Module**: `Mce.Address.JusoApi`
- **Status**: Legacy - kept for backward compatibility

### 3. Google Maps Places API

- **Purpose**: International address autocomplete (US, Brazil)
- **Provider**: Google Cloud Platform
- **Cost**: Pay-as-you-go with $200/month free credit
- **Module**: `Mce.Address.GoogleMapsApi`

> **Important Deprecation Notice**: Google deprecated the legacy Places API as of March 1, 2025.
> New projects created after this date cannot use the legacy `Autocomplete` class.
> MCE currently uses the legacy API which continues to work for existing projects.

---

## Configuration Best Practices

Following the Elixir/Phoenix community standards and [The Twelve-Factor App](https://12factor.net/config) methodology:

### Environment Variables (Recommended)

Store all API keys as environment variables and load them in `config/runtime.exs`. This approach:
- Keeps secrets out of version control
- Allows different configurations per environment
- Works seamlessly with `mix release` deployments

### File Structure

```
config/
├── config.exs       # Compile-time config (non-sensitive)
├── dev.exs          # Development overrides
├── test.exs         # Test overrides
├── prod.exs         # Production compile-time config
└── runtime.exs      # Runtime config (secrets loaded here)
```

### Local Development: Using .env Files

For local development, use a `.env` file:

```bash
# .env (gitignored)
GOOGLE_MAPS_API_KEY=your_google_api_key_here
```

---

## Daum Postcode Service (Korean Addresses)

### Why Use Daum Postcode?

| Feature | Daum Postcode | Juso API |
|---------|---------------|----------|
| API Key | Not required | Required |
| Rate Limits | None | Yes |
| Setup | Zero config | Registration needed |
| Features | More robust | Basic |
| Building Detection | Excellent | Good |
| Apartment Support | Yes | Limited |

### Integration

The service is integrated via a client-side JavaScript widget:

**Component**: `MceWeb.Live.Components.KoreanAddressInput`
**Hook**: `DaumPostcode`

### Usage in LiveView

```elixir
<.live_component
  module={MceWeb.Live.Components.KoreanAddressInput}
  id="farm-address"
  label="Farm Address"
  on_select={fn data -> send(self(), {:address_selected, data}) end}
/>
```

### Data Structure

The component returns:

```elixir
%{
  road_address: "서울특별시 강남구 테헤란로 152",
  jibun_address: "서울특별시 강남구 역삼동 737",
  postal_code: "06236",
  building_name: "강남파이낸스센터",
  sido: "서울특별시",
  sigungu: "강남구",
  bname: "역삼동"
}
```

### Limitations

- Requires internet connection (no intranet support)
- Uses popup/iframe (not inline autocomplete)
- Client-side only (no server-side API)

---

## Korean Juso API (Legacy)

> **Note**: For new implementations, prefer Daum Postcode service.

### Step 1: Register for an API Key

1. Visit the [Juso.go.kr Developer Center](https://www.juso.go.kr/addrlink/devAddrLinkRequestWrite.do)
2. Click "OpenAPI 연계 신청" (OpenAPI Connection Request)
3. Fill in the registration form
4. Once approved, you'll receive a **승인키 (confmKey)**

### Step 2: Configure in MCE

Add to your `.env` file:

```bash
JUSO_API_KEY=your_confm_key_here
```

---

## Google Maps Places API

### Important: API Deprecation Timeline

| Date | Change |
|------|--------|
| March 1, 2025 | Legacy `Autocomplete` class deprecated |
| March 1, 2025 | New projects cannot use legacy API |
| TBD (12+ months notice) | Legacy API discontinued for existing projects |

### Current Implementation Status

MCE uses the legacy Places API endpoints:
- `https://maps.googleapis.com/maps/api/place/autocomplete/json`
- `https://maps.googleapis.com/maps/api/place/details/json`

This continues to work for existing projects but new projects should use Places API (New).

### Step 1: Create a Google Cloud Project

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Note your **Project ID**

### Step 2: Enable Billing

1. Navigate to "Billing" in the Cloud Console
2. Link a billing account to your project
3. Note: Google provides **$200 free credit per month**

> Important: Billing must be enabled even for free tier usage.

### Step 3: Enable the Places API

1. Go to "APIs & Services" > "Library"
2. Search for "Places API" (for legacy) or "Places API (New)" for new projects
3. Click "Enable"

### Step 4: Create an API Key

1. Go to "APIs & Services" > "Credentials"
2. Click "Create Credentials" > "API Key"
3. Copy the generated key

### Step 5: Restrict the API Key (Recommended)

1. Click on your newly created API key
2. Under "Application restrictions":
   - For development: "None" or "IP addresses"
   - For production: "HTTP referrers" with your domain
3. Under "API restrictions":
   - Select "Restrict key"
   - Choose only the APIs you need
4. Save changes

### Step 6: Configure in MCE

Add to your `.env` file:

```bash
GOOGLE_MAPS_API_KEY=your_api_key_here
```

### Future Migration to Places API (New)

When migrating to the new API:

1. Enable "Places API (New)" in Google Cloud Console
2. Update API endpoints to use POST requests
3. Update event handlers:
   - `gmp-placeselect` → `gmp-select`
   - Event now returns `placePrediction` instead of `place`

See [Google Migration Guide](https://developers.google.com/maps/documentation/places/web-service/legacy/migrate-autocomplete) for details.

---

## Development vs Production Configuration

### Development Configuration

**Option A: No API Keys (Default)**

Both Korean and international addresses work without API keys:
- Korean: Uses Daum Postcode service (no key needed)
- US/BR: Uses mock data

**Option B: Using Real APIs**

1. Create a `.env` file in the project root:

```bash
# .env (gitignored - never commit this file!)
GOOGLE_MAPS_API_KEY=your_google_api_key
```

2. Runtime config is already set up in `config/runtime.exs`

### Production Configuration

For production deployments, set environment variables directly:

```bash
# Linux/macOS
export GOOGLE_MAPS_API_KEY=your_production_google_key

# Docker
docker run -e GOOGLE_MAPS_API_KEY=... myapp

# fly.io
fly secrets set GOOGLE_MAPS_API_KEY=...
```

---

## Troubleshooting

### Daum Postcode Not Working

1. Check browser console for JavaScript errors
2. Verify internet connection (intranet not supported)
3. Ensure the hook is properly registered in `app.js`

### Google Maps API Not Working

- Check the [Google Cloud Console](https://console.cloud.google.com/) for errors
- Verify billing is enabled
- Check API restrictions aren't blocking your requests
- Look for quota exceeded errors

### Environment Variables Not Loading

1. Verify `.env` file exists and has correct format
2. Restart the Phoenix server after changes
3. Use `System.get_env("KEY")` in `iex` to debug

---

## References

### Official Documentation

- [Daum Postcode Service Guide](https://postcode.map.daum.net/guide)
- [Korean Juso API Documentation](https://business.juso.go.kr/addrlink/openApi/searchApi.do)
- [Google Maps Places API Documentation](https://developers.google.com/maps/documentation/places/web-service/overview)
- [Google Places API Migration Guide](https://developers.google.com/maps/documentation/places/web-service/legacy/migrate-autocomplete)
- [Google Maps Deprecations](https://developers.google.com/maps/deprecations)

### Elixir/Phoenix Configuration

- [Phoenix Deployment Guide](https://hexdocs.pm/phoenix/deployment.html)
- [Elixir Configuration Best Practices](https://hexdocs.pm/elixir/Config.html)

---

## Quick Reference

### Environment Variables

| Variable | API | Description |
|----------|-----|-------------|
| `GOOGLE_MAPS_API_KEY` | Google Maps | API key from Google Cloud Console |

### Configuration Modules

| Module | File | Purpose |
|--------|------|---------|
| `MceWeb.Live.Components.KoreanAddressInput` | `lib/mce_web/live/components/korean_address_input.ex` | Daum Postcode integration |
| `Mce.Address.JusoApi` | `lib/mce/address/juso_api.ex` | Legacy Juso API client |
| `Mce.Address.GoogleMapsApi` | `lib/mce/address/google_maps_api.ex` | Google Maps client |
| `Mce.Address` | `lib/mce/address.ex` | Unified interface |

### Key Files

| File | Purpose |
|------|---------|
| `assets/js/hooks/daum_postcode.js` | Daum Postcode JavaScript hook |
| `config/runtime.exs` | Runtime configuration (load env vars here) |
| `.env` | Local environment variables (gitignored) |

---

*Document created: 2024-11-29*
*Last updated: 2024-11-29*
