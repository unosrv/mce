# Phoenix i18n Strategy and Implementation

## Overview

Phoenix applications include Gettext support out of the box, providing a robust foundation for internationalisation. This document outlines the strategy for supporting Korean, English (US), and Portuguese (Brazil).

---

## Locale Configuration

### Target Locales
| Locale Code | Language | Region | Primary Use |
|-------------|----------|--------|-------------|
| `ko` | Korean | Korea | Primary UI |
| `en` | English | USA | International |
| `pt_BR` | Portuguese | Brazil | Latin America |

### Configuration in `config/config.exs`

```elixir
config :mce, MceWeb.Gettext,
  default_locale: "ko",
  locales: ~w(ko en pt_BR)
```

---

## Gettext Workflow

### 1. Mark Strings for Translation

```elixir
# In LiveView/Controller
gettext("Dashboard")

# With domain separation
dgettext("farms", "Add new farm")

# With interpolation
gettext("Welcome, %{name}!", name: user.nickname)

# Pluralisation
ngettext("1 farm", "%{count} farms", count)
```

### 2. Extract Translations

```bash
# Extract to .pot template files
mix gettext.extract

# Merge into locale-specific .po files
mix gettext.merge priv/gettext

# Combined command
mix gettext.extract --merge
```

### 3. File Structure

```
priv/gettext/
├── default.pot           # Template for default domain
├── errors.pot            # Template for errors domain
├── ko/
│   └── LC_MESSAGES/
│       ├── default.po    # Korean translations
│       └── errors.po
├── en/
│   └── LC_MESSAGES/
│       ├── default.po    # English translations
│       └── errors.po
└── pt_BR/
    └── LC_MESSAGES/
        ├── default.po    # Portuguese translations
        └── errors.po
```

---

## Domain Organisation

### Recommended Domains

| Domain | Purpose | Example |
|--------|---------|---------|
| `default` | General UI | Navigation, buttons |
| `errors` | Validation messages | "is required" |
| `farms` | Farm management | "Add livestock group" |
| `emissions` | Calculation terms | "Enteric fermentation" |
| `reports` | Report content | "Annual emissions summary" |
| `dashboard` | Dashboard labels | "Monthly trends" |
| `auth` | Authentication | "Sign in", "Sign out" |

### Usage

```elixir
# Farm domain
dgettext("farms", "Livestock group")

# Emissions domain
dgettext("emissions", "Methane from enteric fermentation")
```

---

## LiveView Locale Handling

### Session-Based Locale Storage

```elixir
# In router.ex
pipeline :browser do
  plug :accepts, ["html"]
  plug :fetch_session
  plug :put_root_layout, html: {MceWeb.Layouts, :root}
  plug MceWeb.Plugs.SetLocale  # Custom plug
  plug :protect_from_forgery
  plug :put_secure_browser_headers
end
```

### SetLocale Plug

```elixir
defmodule MceWeb.Plugs.SetLocale do
  import Plug.Conn

  @locales ~w(ko en pt_BR)
  @default_locale "ko"

  def init(opts), do: opts

  def call(conn, _opts) do
    locale =
      get_session(conn, :locale) ||
      get_preferred_locale(conn) ||
      @default_locale

    Gettext.put_locale(MceWeb.Gettext, locale)
    assign(conn, :locale, locale)
  end

  defp get_preferred_locale(conn) do
    conn
    |> get_req_header("accept-language")
    |> parse_accept_language()
    |> Enum.find(&(&1 in @locales))
  end
end
```

### LiveView on_mount Hook

```elixir
defmodule MceWeb.LiveLocale do
  import Phoenix.LiveView
  import Phoenix.Component

  def on_mount(:default, _params, session, socket) do
    locale = session["locale"] || "ko"
    Gettext.put_locale(MceWeb.Gettext, locale)
    {:cont, assign(socket, :locale, locale)}
  end
end

# In router.ex
live_session :authenticated,
  on_mount: [{MceWeb.LiveLocale, :default}] do
  # routes...
end
```

### Language Switcher Component

```elixir
defmodule MceWeb.Components.LanguageSwitcher do
  use Phoenix.Component
  import MceWeb.Gettext

  attr :locale, :string, required: true

  def language_switcher(assigns) do
    ~H"""
    <div class="dropdown dropdown-end">
      <div tabindex="0" role="button" class="btn btn-ghost btn-sm">
        <%= locale_flag(@locale) %>
        <%= locale_name(@locale) %>
      </div>
      <ul tabindex="0" class="dropdown-content menu bg-base-100 rounded-box z-1 w-32 p-2 shadow">
        <li :for={locale <- ~w(ko en pt_BR)}>
          <a phx-click="set_locale" phx-value-locale={locale}>
            <%= locale_flag(locale) %> <%= locale_name(locale) %>
          </a>
        </li>
      </ul>
    </div>
    """
  end

  defp locale_flag("ko"), do: "🇰🇷"
  defp locale_flag("en"), do: "🇺🇸"
  defp locale_flag("pt_BR"), do: "🇧🇷"

  defp locale_name("ko"), do: "한국어"
  defp locale_name("en"), do: "English"
  defp locale_name("pt_BR"), do: "Português"
end
```

---

## Unit Conversion by Locale

### Requirements
- Korea: Metric (kg, hectares, °C)
- USA: Imperial (lbs, acres, °F)
- Brazil: Metric (kg, hectares, °C)

### Implementation

```elixir
defmodule Mce.Units do
  @conversions %{
    weight: %{
      ko: :kg,
      en: :lbs,
      pt_BR: :kg
    },
    area: %{
      ko: :hectares,
      en: :acres,
      pt_BR: :hectares
    },
    temperature: %{
      ko: :celsius,
      en: :fahrenheit,
      pt_BR: :celsius
    }
  }

  def format_weight(kg, locale) do
    case @conversions.weight[String.to_atom(locale)] do
      :kg -> "#{Float.round(kg, 1)} kg"
      :lbs -> "#{Float.round(kg * 2.20462, 1)} lbs"
    end
  end

  def format_area(hectares, locale) do
    case @conversions.area[String.to_atom(locale)] do
      :hectares -> "#{Float.round(hectares, 2)} ha"
      :acres -> "#{Float.round(hectares * 2.47105, 2)} ac"
    end
  end

  def format_temperature(celsius, locale) do
    case @conversions.temperature[String.to_atom(locale)] do
      :celsius -> "#{Float.round(celsius, 1)}°C"
      :fahrenheit -> "#{Float.round(celsius * 9/5 + 32, 1)}°F"
    end
  end
end
```

---

## Form Validation Messages

### Ecto Changeset Translation

```elixir
# In changeset
def changeset(farm, attrs) do
  farm
  |> cast(attrs, [:name, :country, :fiscal_year])
  |> validate_required([:name, :country], message: dgettext("errors", "is required"))
  |> validate_length(:name, max: 100, message: dgettext("errors", "is too long (max %{count} characters)"))
end
```

### Error Translation Helper

```elixir
defmodule MceWeb.ErrorHelpers do
  use Phoenix.HTML
  import MceWeb.Gettext

  def translate_error({msg, opts}) do
    Gettext.dngettext(MceWeb.Gettext, "errors", msg, msg, opts[:count] || 1, opts)
  end
end
```

---

## Testing i18n

### Pseudolocalisation

Use `gettext_pseudolocalize` for testing text expansion:

```elixir
# In mix.exs
{:gettext_pseudolocalize, "~> 0.1", only: [:dev, :test]}
```

This transforms English text to show potential issues with:
- Text expansion (German/Finnish can be 30-40% longer)
- Character encoding
- RTL issues (if needed later)

---

## Implementation Checklist

- [ ] Configure locales in config.exs
- [ ] Create SetLocale plug
- [ ] Create LiveView locale hook
- [ ] Set up domain structure
- [ ] Create language switcher component
- [ ] Implement unit conversion module
- [ ] Replace all hard-coded strings with gettext
- [ ] Extract and create .po files for each locale
- [ ] Test with pseudolocalisation
- [ ] Coordinate with translators for ko/pt_BR

---

## References

- [GitHub - elixir-gettext/gettext](https://github.com/elixir-gettext/gettext)
- [Lokalise Phoenix Tutorial](https://lokalise.com/blog/localization-of-phoenix-applications/)
- [Phrase Phoenix Guide](https://phrase.com/blog/posts/i18n-for-phoenix-applications-with-gettext/)
- [Phoenix Internationalization (DEV.to)](https://dev.to/iagocavalcante/phoenix-internationalization-25ec)
- [Pseudolocalisation in Phoenix](https://dev.to/dkuku/pseudolocalization-in-phoenix-with-gettextpseudolocalize-epf)
