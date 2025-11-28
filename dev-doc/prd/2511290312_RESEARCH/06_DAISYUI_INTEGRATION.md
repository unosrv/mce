# DaisyUI Integration with Phoenix 1.8

## Overview

Phoenix 1.8 ships with Tailwind CSS 4 and DaisyUI 5 out of the box, providing a flexible component and theming system. This document covers setup, theming, and component usage.

---

## Built-in Support (Phoenix 1.8+)

### What's Included
- Tailwind CSS 4
- DaisyUI 5
- Light/Dark theme toggle
- Pre-configured app.css

### No Additional Setup Required
```bash
# New Phoenix 1.8 project comes ready
mix phx.new mce
cd mce
mix phx.server
# DaisyUI classes work immediately
```

---

## Theme Configuration

### Available Themes

DaisyUI provides 32+ built-in themes. Recommended for MCE:

| Theme | Description | Use Case |
|-------|-------------|----------|
| `light` | Clean, professional | Default |
| `dark` | Dark mode | User preference |
| `corporate` | Business-focused | Alternative |
| `emerald` | Green-focused | Environmental context |

### Theme Setup in app.css

```css
/* assets/css/app.css */
@import "tailwindcss";

@plugin "daisyui";
@plugin "daisyui/theme" {
  name: "mce-light";
  default: true;
  color-scheme: light;
  --color-primary: oklch(0.45 0.14 145);    /* Green */
  --color-secondary: oklch(0.55 0.12 220);  /* Blue */
  --color-accent: oklch(0.65 0.15 85);      /* Yellow */
  --color-neutral: oklch(0.35 0.02 260);
  --color-base-100: oklch(0.98 0 0);
  --color-info: oklch(0.65 0.15 220);
  --color-success: oklch(0.65 0.18 145);
  --color-warning: oklch(0.75 0.15 85);
  --color-error: oklch(0.55 0.22 25);
  --radius-selector: 0.5rem;
  --radius-field: 0.375rem;
  --radius-box: 0.75rem;
}

@plugin "daisyui/theme" {
  name: "mce-dark";
  color-scheme: dark;
  --color-primary: oklch(0.55 0.16 145);
  --color-secondary: oklch(0.65 0.14 220);
  --color-accent: oklch(0.75 0.15 85);
  --color-neutral: oklch(0.25 0.02 260);
  --color-base-100: oklch(0.18 0.02 260);
  --color-info: oklch(0.70 0.15 220);
  --color-success: oklch(0.70 0.18 145);
  --color-warning: oklch(0.80 0.15 85);
  --color-error: oklch(0.60 0.22 25);
}
```

### Theme Toggle Component

```elixir
defmodule MceWeb.Components.ThemeToggle do
  use Phoenix.Component

  def theme_toggle(assigns) do
    ~H"""
    <label class="swap swap-rotate">
      <input type="checkbox" class="theme-controller" value="mce-dark" />
      <svg class="swap-on size-6 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
        <path d="M5.64,17l-.71.71a1,1,0,0,0,0,1.41,1,1,0,0,0,1.41,0l.71-.71A1,1,0,0,0,5.64,17ZM5,12a1,1,0,0,0-1-1H3a1,1,0,0,0,0,2H4A1,1,0,0,0,5,12Zm7-7a1,1,0,0,0,1-1V3a1,1,0,0,0-2,0V4A1,1,0,0,0,12,5ZM5.64,7.05a1,1,0,0,0,.7.29,1,1,0,0,0,.71-.29,1,1,0,0,0,0-1.41l-.71-.71A1,1,0,0,0,4.93,6.34Zm12,.29a1,1,0,0,0,.7-.29l.71-.71a1,1,0,1,0-1.41-1.41L17,5.64a1,1,0,0,0,0,1.41A1,1,0,0,0,17.66,7.34ZM21,11H20a1,1,0,0,0,0,2h1a1,1,0,0,0,0-2Zm-9,8a1,1,0,0,0-1,1v1a1,1,0,0,0,2,0V20A1,1,0,0,0,12,19ZM18.36,17A1,1,0,0,0,17,18.36l.71.71a1,1,0,0,0,1.41,0,1,1,0,0,0,0-1.41ZM12,6.5A5.5,5.5,0,1,0,17.5,12,5.51,5.51,0,0,0,12,6.5Zm0,9A3.5,3.5,0,1,1,15.5,12,3.5,3.5,0,0,1,12,15.5Z"/>
      </svg>
      <svg class="swap-off size-6 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
        <path d="M21.64,13a1,1,0,0,0-1.05-.14,8.05,8.05,0,0,1-3.37.73A8.15,8.15,0,0,1,9.08,5.49a8.59,8.59,0,0,1,.25-2A1,1,0,0,0,8,2.36,10.14,10.14,0,1,0,22,14.05,1,1,0,0,0,21.64,13Zm-9.5,6.69A8.14,8.14,0,0,1,7.08,5.22v.27A10.15,10.15,0,0,0,17.22,15.63a9.79,9.79,0,0,0,2.1-.22A8.11,8.11,0,0,1,12.14,19.73Z"/>
      </svg>
    </label>
    """
  end
end
```

---

## daisy_ui_components Library

### Installation

```elixir
# mix.exs
defp deps do
  [
    {:daisy_ui_components, "~> 0.9"}
  ]
end
```

### Import Components

```elixir
# lib/mce_web.ex
defp html_helpers do
  quote do
    import DaisyUIComponents.Alert
    import DaisyUIComponents.Badge
    import DaisyUIComponents.Button
    import DaisyUIComponents.Card
    import DaisyUIComponents.Dropdown
    import DaisyUIComponents.Modal
    import DaisyUIComponents.Navbar
    import DaisyUIComponents.Stats
    import DaisyUIComponents.Table
    # ... more as needed
  end
end
```

---

## Key Components for MCE

### 1. Stats (Dashboard KPIs)

```heex
<div class="stats shadow">
  <div class="stat">
    <div class="stat-figure text-primary">
      <.icon name="hero-fire" class="size-8" />
    </div>
    <div class="stat-title"><%= gettext("Total Emissions") %></div>
    <div class="stat-value text-primary">1,250</div>
    <div class="stat-desc"><%= gettext("tonnes CO₂e") %></div>
  </div>

  <div class="stat">
    <div class="stat-figure text-secondary">
      <.icon name="hero-building-office" class="size-8" />
    </div>
    <div class="stat-title"><%= gettext("Active Farms") %></div>
    <div class="stat-value text-secondary">12</div>
    <div class="stat-desc"><%= gettext("across 3 countries") %></div>
  </div>
</div>
```

### 2. Steps (5-Step Form)

```heex
<ul class="steps w-full">
  <li class={["step", @current_step >= 1 && "step-primary"]}>
    <%= gettext("Basic Info") %>
  </li>
  <li class={["step", @current_step >= 2 && "step-primary"]}>
    <%= gettext("Feed") %>
  </li>
  <li class={["step", @current_step >= 3 && "step-primary"]}>
    <%= gettext("Housing") %>
  </li>
  <li class={["step", @current_step >= 4 && "step-primary"]}>
    <%= gettext("Barn Info") %>
  </li>
  <li class={["step", @current_step >= 5 && "step-primary"]}>
    <%= gettext("Manure") %>
  </li>
</ul>
```

### 3. Card (Farm Cards)

```heex
<div class="card bg-base-100 shadow-xl">
  <div class="card-body">
    <h2 class="card-title">
      <.icon name="hero-building-office-2" class="size-5" />
      <%= @farm.name %>
    </h2>
    <p><%= @farm.formatted_address %></p>
    <div class="badge badge-outline"><%= @farm.country %></div>
    <div class="card-actions justify-end">
      <.link navigate={~p"/farms/#{@farm}"} class="btn btn-primary btn-sm">
        <%= gettext("View Details") %>
      </.link>
    </div>
  </div>
</div>
```

### 4. Tabs (Report Sections)

```heex
<div role="tablist" class="tabs tabs-lifted">
  <a role="tab" class={["tab", @active_tab == :overview && "tab-active"]}>
    <%= gettext("Overview") %>
  </a>
  <a role="tab" class={["tab", @active_tab == :enteric && "tab-active"]}>
    <%= gettext("Enteric Fermentation") %>
  </a>
  <a role="tab" class={["tab", @active_tab == :manure && "tab-active"]}>
    <%= gettext("Manure Management") %>
  </a>
  <a role="tab" class={["tab", @active_tab == :feed && "tab-active"]}>
    <%= gettext("Feed") %>
  </a>
</div>
```

### 5. Modal (Confirmation Dialogs)

```heex
<dialog id="delete_modal" class="modal">
  <div class="modal-box">
    <h3 class="text-lg font-bold"><%= gettext("Confirm Deletion") %></h3>
    <p class="py-4"><%= gettext("Are you sure you want to delete this farm?") %></p>
    <div class="modal-action">
      <form method="dialog">
        <button class="btn"><%= gettext("Cancel") %></button>
      </form>
      <button class="btn btn-error" phx-click="delete_farm">
        <%= gettext("Delete") %>
      </button>
    </div>
  </div>
</dialog>
```

### 6. Alert (Flash Messages)

```heex
<div :if={@flash[:info]} class="alert alert-info">
  <.icon name="hero-information-circle" class="size-6" />
  <span><%= @flash[:info] %></span>
</div>

<div :if={@flash[:error]} class="alert alert-error">
  <.icon name="hero-exclamation-circle" class="size-6" />
  <span><%= @flash[:error] %></span>
</div>
```

---

## Form Styling

### Override core_components.ex Input

```elixir
def input(assigns) do
  ~H"""
  <div>
    <label class="label">
      <span class="label-text"><%= @label %></span>
    </label>
    <input
      type={@type}
      name={@name}
      value={@value}
      class={[
        "input input-bordered w-full",
        @errors != [] && "input-error"
      ]}
      {@rest}
    />
    <.error :for={msg <- @errors}><%= msg %></.error>
  </div>
  """
end
```

### Select Input

```heex
<select class="select select-bordered w-full">
  <option disabled selected><%= gettext("Select country") %></option>
  <option value="KR">🇰🇷 <%= gettext("Korea") %></option>
  <option value="US">🇺🇸 <%= gettext("USA") %></option>
  <option value="BR">🇧🇷 <%= gettext("Brazil") %></option>
</select>
```

---

## Colour Palette Recommendation

### Environmental/Agricultural Theme

| Colour | OKLCH | Usage |
|--------|-------|-------|
| Primary (Green) | `oklch(0.55 0.16 145)` | Actions, CTAs |
| Secondary (Blue) | `oklch(0.60 0.14 220)` | Info, links |
| Accent (Gold) | `oklch(0.70 0.15 85)` | Highlights |
| Success | `oklch(0.65 0.18 145)` | Positive values |
| Warning | `oklch(0.75 0.15 85)` | Alerts |
| Error | `oklch(0.55 0.22 25)` | Validation, high emissions |

---

## References

- [DaisyUI Documentation](https://daisyui.com/)
- [DaisyUI Phoenix Installation](https://daisyui.com/docs/install/phoenix/)
- [DaisyUI Themes](https://daisyui.com/docs/themes/)
- [daisy_ui_components GitHub](https://github.com/phcurado/daisy_ui_components)
- [Phoenix 1.8 Release Notes](https://www.phoenixframework.org/blog/phoenix-1-8-released)
- [Phoenix Forum Discussion](https://elixirforum.com/t/phoenix-liveview-tailwindcss-daisyui-themer-demo/54387)
