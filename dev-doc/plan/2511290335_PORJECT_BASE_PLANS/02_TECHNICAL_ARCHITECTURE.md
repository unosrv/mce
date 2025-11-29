# Technical Architecture Plan

**Document ID**: 2511290341_TECHNICAL_ARCHITECTURE
**Created**: 29 November 2025, 03:41
**Status**: Planning

---

## System Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                         BROWSER                                 │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │                   Phoenix LiveView                       │   │
│  │  (Real-time updates, form validation, state management)  │   │
│  └──────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘
                              │ WebSocket
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                     PHOENIX APPLICATION                         │
│  ┌────────────────┐ ┌────────────────┐ ┌────────────────────┐   │
│  │   MceWeb       │ │   Mce          │ │   External APIs    │   │
│  │   (LiveViews,  │ │   (Contexts,   │ │   (Google Maps,    │   │
│  │    Components) │ │    Schemas)    │ │    juso.go.kr)     │   │
│  └────────────────┘ └────────────────┘ └────────────────────┘   │
│                              │                                  │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │              IPCC Calculation Engine                     │   │
│  │   (Tier 2 methodology, emissions factors, aggregation)   │   │
│  └──────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘
                              │ Ecto
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                      PostgreSQL 17                              │
│              (Port 5433, Local Development)                     │
└─────────────────────────────────────────────────────────────────┘
```

---

## Technology Stack

### Core Framework

| Component | Technology | Version | Notes |
|-----------|------------|---------|-------|
| Language | Elixir | ~> 1.17 | Functional, fault-tolerant |
| Framework | Phoenix | 1.8 | LiveView built-in |
| Database | PostgreSQL | 17 | Port 5433 (non-standard) |
| ORM | Ecto | 3.x | With PostgreSQL adapter |

### Frontend

| Component | Technology | Version | Notes |
|-----------|------------|---------|-------|
| UI Framework | Phoenix LiveView | Built-in | Real-time updates |
| CSS Framework | Tailwind CSS | 4 | Phoenix 1.8 default |
| Component Library | DaisyUI | 5 | Phoenix 1.8 default |
| Charts | ApexCharts | Latest | Via LiveCharts or JS hooks |
| Build Tool | esbuild | Built-in | Phoenix default |

### Supporting Libraries

| Component | Library | Purpose |
|-----------|---------|---------|
| HTTP Client | Req | External API calls |
| i18n | Gettext | Translation management |
| Admin Panel | Backpex | CRUD generation |
| PDF Generation | chromic_pdf or pdf_generator | Report export |
| Testing | ExUnit + Phoenix.LiveViewTest | Unit + integration tests |

---

## Module Architecture

### Business Logic Layer (`lib/mce/`)

```
lib/mce/
├── application.ex              # OTP application supervisor
├── repo.ex                     # Ecto repository
├── mailer.ex                   # Swoosh email
│
├── accounts/                   # User authentication context
│   ├── accounts.ex             # Context module
│   ├── user.ex                 # User schema
│   ├── user_token.ex           # Session tokens
│   └── user_notifier.ex        # Email notifications
│
├── farms/                      # Farm management context
│   ├── farms.ex                # Context module
│   ├── farm.ex                 # Farm schema
│   └── address.ex              # Address schema (embedded)
│
├── livestock/                  # Livestock management context
│   ├── livestock.ex            # Context module
│   ├── livestock_group.ex      # Group schema
│   ├── feed_item.ex            # Feed schema
│   ├── housing_period.ex       # Housing environment schema
│   ├── barn_info.ex            # Barn details schema
│   └── manure_system.ex        # Manure management schema
│
├── emissions/                  # IPCC calculation context
│   ├── emissions.ex            # Context module
│   ├── calculator.ex           # Tier 2 calculation engine
│   ├── enteric.ex              # Enteric fermentation calculations
│   ├── manure.ex               # Manure management calculations
│   ├── emission_factors.ex     # IPCC default values
│   └── report.ex               # Report schema
│
├── i18n/                       # Internationalisation
│   └── units.ex                # Unit conversion module
│
└── external/                   # External API integrations
    ├── juso.ex                 # Korean address API
    └── google_maps.ex          # Google Places API
```

### Web Layer (`lib/mce_web/`)

```
lib/mce_web/
├── mce_web.ex                  # Web module definitions
├── endpoint.ex                 # HTTP endpoint
├── router.ex                   # Route definitions
├── gettext.ex                  # Gettext configuration
│
├── components/                 # Reusable UI components
│   ├── core_components.ex      # DaisyUI-styled inputs, buttons
│   ├── layouts.ex              # App shell, flash groups
│   ├── language_switcher.ex    # Locale selector
│   ├── theme_toggle.ex         # Dark mode toggle
│   ├── farm_card.ex            # Farm display card
│   ├── step_form.ex            # Multi-step form wrapper
│   ├── address_input.ex        # Address autocomplete
│   └── chart_components.ex     # ApexCharts wrappers
│
├── live/                       # LiveView modules
│   ├── dashboard_live.ex       # Main dashboard
│   ├── farm_live/
│   │   ├── index.ex            # Farm list
│   │   ├── show.ex             # Farm details
│   │   └── form_component.ex   # Farm create/edit form
│   ├── livestock_live/
│   │   ├── index.ex            # Livestock list per farm
│   │   ├── wizard_live.ex      # 5-step form wizard
│   │   └── step_components/
│   │       ├── basic_info.ex   # Step 1
│   │       ├── feed.ex         # Step 2
│   │       ├── housing.ex      # Step 3
│   │       ├── barn.ex         # Step 4
│   │       └── manure.ex       # Step 5
│   └── report_live/
│       ├── show.ex             # Report view
│       └── pdf_component.ex    # PDF preview/download
│
├── controllers/                # Traditional controllers
│   ├── page_controller.ex      # Static pages
│   ├── user_session_controller.ex
│   └── pdf_controller.ex       # PDF download endpoint
│
└── plugs/                      # Custom plugs
    └── set_locale.ex           # Locale middleware
```

---

## IPCC Calculation Engine Architecture

### Calculation Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                    CALCULATION PIPELINE                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. INPUT VALIDATION                                            │
│     └─> Validate livestock group data                           │
│     └─> Apply country defaults where missing                    │
│                                                                 │
│  2. GROSS ENERGY CALCULATION                                    │
│     └─> Calculate NE_m (maintenance)                            │
│     └─> Calculate NE_a (activity)                               │
│     └─> Calculate NE_l (lactation) - dairy only                 │
│     └─> Calculate NE_p (pregnancy) - if applicable              │
│     └─> Calculate NE_g (growth) - growing animals               │
│     └─> Aggregate to GE (gross energy intake)                   │
│                                                                 │
│  3. ENTERIC FERMENTATION                                        │
│     └─> Apply Ym factor (methane conversion)                    │
│     └─> Calculate CH₄ emissions                                 │
│     └─> Convert to CO₂e (GWP: 28)                               │
│                                                                 │
│  4. MANURE MANAGEMENT                                           │
│     └─> Calculate VS (volatile solids)                          │
│     └─> Apply MCF by management system                          │
│     └─> Calculate CH₄ from manure                               │
│     └─> Calculate N₂O (direct + indirect)                       │
│     └─> Convert to CO₂e (GWP: CH₄=28, N₂O=265)                  │
│                                                                 │
│  5. AGGREGATION                                                 │
│     └─> Sum by emission source                                  │
│     └─> Sum by livestock group                                  │
│     └─> Calculate farm totals                                   │
│                                                                 │
│  6. REPORT GENERATION                                           │
│     └─> Store calculation results                               │
│     └─> Generate breakdown tables                               │
│     └─> Create visualisation data                               │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Core Calculation Modules

```elixir
# lib/mce/emissions/calculator.ex
defmodule Mce.Emissions.Calculator do
  @moduledoc """
  Main entry point for IPCC Tier 2 calculations.
  Orchestrates the calculation pipeline.
  """

  alias Mce.Emissions.{Enteric, Manure, EmissionFactors}

  def calculate_farm_emissions(farm) do
    farm
    |> load_livestock_groups()
    |> Enum.map(&calculate_group_emissions/1)
    |> aggregate_results()
  end

  def calculate_group_emissions(livestock_group) do
    %{
      enteric: Enteric.calculate(livestock_group),
      manure_ch4: Manure.calculate_ch4(livestock_group),
      manure_n2o: Manure.calculate_n2o(livestock_group)
    }
    |> calculate_co2e()
  end
end
```

---

## External API Integration

### Korean Address API (juso.go.kr)

```elixir
# lib/mce/external/juso.ex
defmodule Mce.External.Juso do
  @moduledoc "Korean address search API integration"

  @base_url "https://www.juso.go.kr/addrlink/addrLinkApi.do"

  def search(keyword, opts \\ []) do
    Req.get(@base_url,
      params: [
        confmKey: api_key(),
        currentPage: opts[:page] || 1,
        countPerPage: opts[:limit] || 10,
        keyword: keyword,
        resultType: "json"
      ]
    )
    |> parse_response()
  end
end
```

### Google Maps Places API

```elixir
# lib/mce/external/google_maps.ex
defmodule Mce.External.GoogleMaps do
  @moduledoc "Google Maps Places API integration"

  @base_url "https://maps.googleapis.com/maps/api/place"

  def autocomplete(input, country) do
    Req.get("#{@base_url}/autocomplete/json",
      params: [
        input: input,
        types: "address",
        components: "country:#{country}",
        key: api_key()
      ]
    )
    |> parse_response()
  end

  def place_details(place_id) do
    Req.get("#{@base_url}/details/json",
      params: [
        place_id: place_id,
        fields: "formatted_address,geometry,address_components",
        key: api_key()
      ]
    )
    |> parse_response()
  end
end
```

---

## i18n Architecture

### Locale Flow

```
Request → SetLocale Plug → Session Storage → LiveView Hook → Gettext
                              ↓
                        User Preference
                              ↓
                        Accept-Language Header
                              ↓
                        Default (ko)
```

### Unit Conversion Strategy

```elixir
# lib/mce/i18n/units.ex
defmodule Mce.I18n.Units do
  @locale_units %{
    "ko" => %{weight: :kg, area: :hectares, temp: :celsius},
    "en" => %{weight: :lbs, area: :acres, temp: :fahrenheit},
    "pt_BR" => %{weight: :kg, area: :hectares, temp: :celsius}
  }

  def format(value, :weight, locale) do
    case @locale_units[locale].weight do
      :kg -> "#{round(value, 1)} kg"
      :lbs -> "#{round(value * 2.20462, 1)} lbs"
    end
  end

  # Additional formatters for area, temperature, etc.
end
```

---

## Authentication Architecture

Using Phoenix 1.8 built-in authentication generator:

```
mix phx.gen.auth Accounts User users
```

### Auth Flow

```
Registration → Email Confirmation → Login → Session → LiveView Access
                                              ↓
                                         Token Refresh
```

### Session Management

- Token-based authentication
- LiveView session persistence
- Secure cookie storage
- Automatic session refresh

---

## Routing Structure

```elixir
# lib/mce_web/router.ex

scope "/", MceWeb do
  pipe_through [:browser, :redirect_if_user_is_authenticated]

  live_session :redirect_if_user_is_authenticated,
    on_mount: [{MceWeb.UserAuth, :redirect_if_user_is_authenticated}] do
    live "/users/register", UserRegistrationLive, :new
    live "/users/log_in", UserLoginLive, :new
  end
end

scope "/", MceWeb do
  pipe_through [:browser, :require_authenticated_user]

  live_session :require_authenticated_user,
    on_mount: [
      {MceWeb.UserAuth, :ensure_authenticated},
      {MceWeb.LiveLocale, :default}
    ] do
    live "/", DashboardLive, :index
    live "/farms", FarmLive.Index, :index
    live "/farms/new", FarmLive.Index, :new
    live "/farms/:id", FarmLive.Show, :show
    live "/farms/:id/edit", FarmLive.Show, :edit
    live "/farms/:farm_id/livestock", LivestockLive.Index, :index
    live "/farms/:farm_id/livestock/new", LivestockLive.WizardLive, :new
    live "/farms/:farm_id/livestock/:id", LivestockLive.WizardLive, :edit
    live "/farms/:farm_id/report", ReportLive.Show, :show
  end
end

# Admin routes (Backpex)
scope "/admin", MceWeb.Admin do
  pipe_through [:browser, :require_admin_user]
  # Backpex resources
end
```

---

## Error Handling Strategy

### Validation Errors

- Ecto changeset errors translated via Gettext
- Real-time validation feedback via LiveView
- Clear error messages with field highlighting

### System Errors

- Graceful degradation for external API failures
- Fallback values for optional calculations
- Logging with structured metadata

### User-Facing Errors

- Translated error messages
- Actionable guidance
- Support contact information

---

## Performance Considerations

### LiveView Optimisation

- Use streams for lists
- Lazy loading for heavy components
- Debounce form validation
- Pagination for data tables

### Database Optimisation

- Proper indexing on foreign keys
- Preload associations in queries
- Connection pooling configuration

### Caching Strategy

- Cache IPCC default values
- Cache address API responses (session-based)
- Consider ETS for emission factors

---

## Security Considerations

### Authentication

- Secure password hashing (bcrypt via Pbkdf2)
- CSRF protection
- Secure session cookies
- Rate limiting on auth endpoints

### Data Protection

- Input sanitisation
- SQL injection prevention (Ecto parameterised queries)
- XSS prevention (Phoenix HTML escaping)

### API Security

- API keys stored in environment variables
- HTTPS enforcement
- Request validation

---

## Testing Strategy

### Unit Tests

- Context module tests
- Calculation engine tests (IPCC formulas)
- Unit conversion tests

### Integration Tests

- LiveView tests with Phoenix.LiveViewTest
- Form submission flows
- Navigation tests

### External API Tests

- Mock API responses for testing
- Contract testing for API changes

---

## Deployment Considerations

### Environment Variables

```bash
DATABASE_URL=postgres://...
SECRET_KEY_BASE=...
JUSO_API_KEY=...
GOOGLE_MAPS_API_KEY=...
PHX_HOST=...
```

### Production Checklist

- [ ] SSL certificate configured
- [ ] Database connection pooling
- [ ] Log aggregation setup
- [ ] Error monitoring (Sentry/AppSignal)
- [ ] Backup strategy

---

## Change Log

| Date | Change | Author |
|------|--------|--------|
| 2511290341 | Initial architecture plan | Claude |
