# MCE - Methane Carbon Emissions Calculator

A Phoenix 1.8 web application for calculating and managing methane emissions from livestock farming operations, following IPCC Tier 2 methodology.

## Features

- **Multi-tenant farm management** - Users can manage multiple farms
- **Livestock tracking** - Track livestock groups with species-specific data
- **Feed management** - Record feed intake with nutritional parameters
- **Emission calculations** - IPCC Tier 2 compliant calculations for:
  - Enteric fermentation (CH₄)
  - Manure management (CH₄ and N₂O)
- **PDF report generation** - Export emission reports
- **Multi-language support** - Korean (primary), English, Portuguese (Brazil)

## Requirements

- Elixir 1.15+
- Erlang/OTP 26+
- PostgreSQL 15+ (running on port 5433)
- Node.js 18+ (for asset compilation)

## Quick Start

```bash
# Install dependencies and setup database
mix setup

# Start Phoenix server
mix phx.server

# Or start with interactive shell
iex -S mix phx.server
```

Visit [localhost:4000](http://localhost:4000) in your browser.

## Development Commands

```bash
# Database
mix ecto.create           # Create database
mix ecto.migrate          # Run migrations
mix ecto.reset            # Drop + create + migrate + seed

# Testing
mix test                  # Run all tests
mix test test/path_test.exs  # Run specific test file
mix test --failed         # Re-run failed tests

# Pre-commit (run before completing changes)
mix precommit             # Compile with warnings-as-errors, format, test
```

## Environment Variables

### Required for Production

| Variable | Description |
|----------|-------------|
| `DATABASE_URL` | PostgreSQL connection string |
| `SECRET_KEY_BASE` | Phoenix secret key |
| `PHX_HOST` | Production hostname |

### Optional (Address APIs)

| Variable | Description |
|----------|-------------|
| `GOOGLE_MAPS_API_KEY` | Google Maps Places API key (US/BR addresses) |

**Note**: Korean address lookup uses Daum Postcode service which requires no API key.

For detailed API configuration, see `dev-doc/guide/2511291259_API_CONFIGURATION_GUIDE.md`.

## Project Structure

```
lib/
├── mce/                  # Business logic (contexts)
│   ├── accounts/         # User authentication
│   ├── farms/           # Farm management
│   ├── livestock/       # Livestock, feed, manure systems
│   ├── emissions/       # Emission calculations
│   └── reference/       # IPCC factors, feed presets
│
└── mce_web/             # Web layer
    ├── components/      # Reusable UI components
    ├── controllers/     # Traditional controllers
    └── live/           # LiveView modules

dev-doc/
├── guide/              # Developer guides
├── prd/               # Product requirements
└── plan/              # Implementation plans
```

## Technologies

- **Framework**: Phoenix 1.8 with LiveView
- **Database**: PostgreSQL with Ecto
- **UI**: Tailwind CSS + DaisyUI
- **i18n**: Gettext (ko, en, pt_BR locales)
- **Testing**: ExUnit

## Documentation

- [API Configuration Guide](dev-doc/guide/2511291259_API_CONFIGURATION_GUIDE.md) - External API setup
- [IPCC Tier 2 Methodology](dev-doc/prd/2511290312_RESEARCH/01_IPCC_TIER2_METHODOLOGY.md) - Emission calculation methodology
- [Database Schema](dev-doc/plan/2511290335_PORJECT_BASE_PLANS/03_DATABASE_SCHEMA_PLAN.md) - Database design

## Development Notes

- PostgreSQL runs on port **5433** (non-standard)
- Default locale is Korean (`ko`)
- Dev routes available at `/dev/dashboard` (LiveDashboard) and `/dev/mailbox` (Swoosh)

## Contributing

1. Run `mix precommit` before submitting changes
2. Write tests for new functionality
3. Follow existing code patterns and conventions

## Licence

Proprietary - All rights reserved.
