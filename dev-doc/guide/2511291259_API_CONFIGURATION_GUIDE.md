# MCE API Configuration Guide

This guide covers all external API integrations used in the MCE project, including how to obtain API keys and configure them properly following Elixir/Phoenix best practices.

---

## Table of Contents

1. [Overview](#overview)
2. [APIs Used in MCE](#apis-used-in-mce)
3. [Configuration Best Practices](#configuration-best-practices)
4. [Korean Juso API Setup](#korean-juso-api-setup)
5. [Google Maps Places API Setup](#google-maps-places-api-setup)
6. [Development vs Production Configuration](#development-vs-production-configuration)
7. [Troubleshooting](#troubleshooting)
8. [References](#references)

---

## Overview

MCE uses external APIs for address autocomplete functionality:

| API | Purpose | Countries | Required |
|-----|---------|-----------|----------|
| Korean Juso API | Address search/autocomplete | Korea (KR) | Optional* |
| Google Maps Places API | Address search/autocomplete | US, Brazil | Optional* |

*Both APIs have mock data fallback enabled by default for development without API keys.

---

## APIs Used in MCE

### 1. Korean Juso API (Juso.go.kr)

- **Purpose**: Korean road name address (도로명주소) search and autocomplete
- **Provider**: Korean Government Address Information System
- **Cost**: Free for all users
- **Module**: `Mce.Address.JusoApi`

### 2. Google Maps Places API

- **Purpose**: International address autocomplete (US, Brazil)
- **Provider**: Google Cloud Platform
- **Cost**: Pay-as-you-go with $200/month free credit
- **Module**: `Mce.Address.GoogleMapsApi`

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

For local development, use a `.env` file with [dotenv_parser](https://hex.pm/packages/dotenv_parser):

```bash
# .env (gitignored)
JUSO_API_KEY=your_confm_key_here
GOOGLE_MAPS_API_KEY=your_google_api_key_here
```

---

## Korean Juso API Setup

### Step 1: Register for an API Key

1. Visit the [Juso.go.kr Developer Center](https://www.juso.go.kr/addrlink/devAddrLinkRequestWrite.do)
2. Click "OpenAPI 연계 신청" (OpenAPI Connection Request)
3. Fill in the registration form:
   - 서비스명 (Service Name): Your project name
   - 서비스 URL: Your domain or localhost for development
   - 서비스 유형: Web Service
   - 연락처 (Contact): Your email/phone
4. Submit and wait for approval (usually immediate for development)
5. Once approved, you'll receive a **승인키 (confmKey)**

### Step 2: Test Key for Development

For testing purposes, you can use the test key: `TESTJUSOGOKR`

> Note: This test key has rate limits and is only suitable for development/testing.

### Step 3: Configure in MCE

Add to your `.env` file:

```bash
JUSO_API_KEY=your_confm_key_here
```

The configuration is already set up in the project:

```elixir
# lib/mce/address/juso_api.ex reads from:
# Application.get_env(:mce, Mce.Address.JusoApi, [])
# |> Keyword.get(:confm_key)
```

---

## Google Maps Places API Setup

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
2. Search for "Places API"
3. Click "Enable"

You may also want to enable:
- Places API (New) - for newer features
- Geocoding API - for coordinate lookups

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
   - Choose only the APIs you need (Places API, Geocoding API)
4. Save changes

### Step 6: Configure in MCE

Add to your `.env` file:

```bash
GOOGLE_MAPS_API_KEY=your_api_key_here
```

---

## Development vs Production Configuration

### Development Configuration

**Option A: Mock Data (No API Keys Required)**

By default, both APIs use mock data. This is configured in:

```elixir
# config/dev.exs
config :mce, Mce.Address.JusoApi,
  use_mock: true

config :mce, Mce.Address.GoogleMapsApi,
  use_mock: true
```

**Option B: Using Real APIs in Development**

1. Create a `.env` file in the project root:

```bash
# .env (gitignored - never commit this file!)
JUSO_API_KEY=your_juso_confm_key
GOOGLE_MAPS_API_KEY=your_google_api_key
```

2. Update `config/runtime.exs` to load environment variables:

```elixir
# config/runtime.exs
import Config

# Address API Configuration (all environments)
if juso_key = System.get_env("JUSO_API_KEY") do
  config :mce, Mce.Address.JusoApi,
    confm_key: juso_key,
    use_mock: false
end

if google_key = System.get_env("GOOGLE_MAPS_API_KEY") do
  config :mce, Mce.Address.GoogleMapsApi,
    api_key: google_key,
    use_mock: false
end

# ... rest of runtime.exs
```

3. Add dotenv_parser to your dependencies (for development):

```elixir
# mix.exs
defp deps do
  [
    # ...
    {:dotenv_parser, "~> 2.0", only: [:dev, :test]}
  ]
end
```

4. Load .env in `config/runtime.exs`:

```elixir
# At the top of config/runtime.exs
if config_env() in [:dev, :test] do
  DotenvParser.load_file(".env")
end
```

### Production Configuration

For production deployments, set environment variables directly:

```bash
# Linux/macOS
export JUSO_API_KEY=your_production_juso_key
export GOOGLE_MAPS_API_KEY=your_production_google_key

# Docker
docker run -e JUSO_API_KEY=... -e GOOGLE_MAPS_API_KEY=... myapp

# Kubernetes
kubectl create secret generic api-keys \
  --from-literal=JUSO_API_KEY=... \
  --from-literal=GOOGLE_MAPS_API_KEY=...

# fly.io
fly secrets set JUSO_API_KEY=... GOOGLE_MAPS_API_KEY=...
```

---

## Troubleshooting

### Mock Data Not Working

If you're not seeing any address suggestions:
1. Check the browser console for JavaScript errors
2. Verify the country selection matches the mock data available
3. Ensure `use_mock: true` is set in your config

### API Key Not Working

**Juso API:**
- Verify the key at [Juso API Test Page](https://business.juso.go.kr/addrlink/openApi/searchApi.do)
- Check if the key has expired or been revoked
- Ensure the domain matches your registration

**Google Maps API:**
- Check the [Google Cloud Console](https://console.cloud.google.com/) for errors
- Verify billing is enabled
- Check API restrictions aren't blocking your requests
- Look for quota exceeded errors

### Environment Variables Not Loading

1. Verify `.env` file exists and has correct format
2. Check `dotenv_parser` is installed and configured
3. Restart the Phoenix server after changes
4. Use `System.get_env("KEY")` in `iex` to debug

---

## References

### Official Documentation

- [Korean Juso API Documentation](https://business.juso.go.kr/addrlink/openApi/searchApi.do)
- [Google Maps Places API Documentation](https://developers.google.com/maps/documentation/places/web-service/overview)
- [Google Maps Places API Key Setup](https://developers.google.com/maps/documentation/places/web-service/get-api-key)

### Elixir/Phoenix Configuration

- [Phoenix Deployment Guide](https://hexdocs.pm/phoenix/deployment.html)
- [Elixir Configuration Best Practices](https://hexdocs.pm/elixir/Config.html)
- [Understanding Application Configuration in Elixir](https://www.wiserfirst.com/blog/understand-configs-in-elixir/)

### Community Resources

- [Phoenix: Setting up ENV Variables](https://medium.com/@techrally/phoenix-setting-up-env-variables-6557eb1370ee)
- [Protecting Secrets with Environment Variables](https://medium.com/@erickipnis/elixir-phoenix-decoded-protecting-your-config-secret-keys-with-environment-variables-637bc8f9e708)
- [Elixir Configuration & Environment Variables](https://dev.to/manhvanvu/elixir-configuration-environment-variables-4j1h)

---

## Quick Reference

### Environment Variables

| Variable | API | Description |
|----------|-----|-------------|
| `JUSO_API_KEY` | Korean Juso | 승인키 (confmKey) from juso.go.kr |
| `GOOGLE_MAPS_API_KEY` | Google Maps | API key from Google Cloud Console |

### Configuration Modules

| Module | File |
|--------|------|
| `Mce.Address.JusoApi` | `lib/mce/address/juso_api.ex` |
| `Mce.Address.GoogleMapsApi` | `lib/mce/address/google_maps_api.ex` |
| `Mce.Address` | `lib/mce/address.ex` (unified interface) |

### Key Files

| File | Purpose |
|------|---------|
| `config/runtime.exs` | Runtime configuration (load env vars here) |
| `.env` | Local environment variables (gitignored) |
| `.env.example` | Template for required env vars (committed) |

---

*Document created: 2024-11-29*
*Last updated: 2024-11-29*
