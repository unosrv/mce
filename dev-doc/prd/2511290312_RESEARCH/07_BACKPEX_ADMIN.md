# Backpex Admin Panel for Phoenix

## Overview

Backpex is a highly customisable administration panel for Phoenix LiveView applications. It provides rapid CRUD view generation with extensive customisation options.

---

## Installation

### Add Dependency

```elixir
# mix.exs
defp deps do
  [
    {:backpex, "~> 0.16"}
  ]
end
```

### Fetch Dependencies

```bash
mix deps.get
```

---

## Core Concepts

### LiveResources
Primary building block for Backpex. Each LiveResource represents a CRUD interface for an Ecto schema.

### Key Features
- Configurable CRUD views
- Search and filtering
- Custom actions
- Association handling
- Authorisation support

---

## Basic LiveResource Example

```elixir
defmodule MceWeb.Admin.FarmLive do
  use Backpex.LiveResource,
    adapter: Backpex.Adapters.Ecto,
    adapter_config: [
      schema: Mce.Farms.Farm,
      repo: Mce.Repo,
      update_changeset: &Mce.Farms.Farm.changeset/2,
      create_changeset: &Mce.Farms.Farm.changeset/2
    ]

  @impl Backpex.LiveResource
  def singular_name, do: "Farm"

  @impl Backpex.LiveResource
  def plural_name, do: "Farms"

  @impl Backpex.LiveResource
  def fields do
    [
      name: %{
        module: Backpex.Fields.Text,
        label: "Farm Name",
        searchable: true
      },
      country: %{
        module: Backpex.Fields.Select,
        label: "Country",
        options: [
          {"Korea", "KR"},
          {"USA", "US"},
          {"Brazil", "BR"}
        ]
      },
      fiscal_year_start: %{
        module: Backpex.Fields.Date,
        label: "Fiscal Year Start"
      },
      user: %{
        module: Backpex.Fields.BelongsTo,
        label: "Owner",
        display_field: :email
      },
      inserted_at: %{
        module: Backpex.Fields.DateTime,
        label: "Created",
        only: [:index, :show]
      }
    ]
  end
end
```

---

## Router Configuration

```elixir
# lib/mce_web/router.ex

scope "/admin", MceWeb.Admin do
  pipe_through [:browser, :require_admin]

  live_session :admin,
    on_mount: [{MceWeb.UserAuth, :ensure_authenticated}] do

    backpex_routes(FarmLive, "/farms")
    backpex_routes(LivestockGroupLive, "/livestock-groups")
    backpex_routes(EmissionsReportLive, "/reports")
    backpex_routes(UserLive, "/users")
  end
end
```

---

## Field Types for MCE

### Available Field Modules

| Module | Use Case |
|--------|----------|
| `Backpex.Fields.Text` | Farm name, address |
| `Backpex.Fields.Number` | Head count, weights |
| `Backpex.Fields.Decimal` | Emissions values |
| `Backpex.Fields.Select` | Country, livestock type |
| `Backpex.Fields.MultiSelect` | Feed additives |
| `Backpex.Fields.Date` | Fiscal year |
| `Backpex.Fields.DateTime` | Timestamps |
| `Backpex.Fields.BelongsTo` | User → Farm |
| `Backpex.Fields.HasMany` | Farm → Livestock Groups |
| `Backpex.Fields.Boolean` | Active status |
| `Backpex.Fields.Textarea` | Notes, descriptions |
| `Backpex.Fields.Upload` | Farm documents |

### Custom Field Example (Emissions Display)

```elixir
defmodule MceWeb.Admin.Fields.Emissions do
  use Backpex.Field

  @impl Backpex.Field
  def render_value(assigns) do
    ~H"""
    <span class={emission_class(@value)}>
      <%= Float.round(@value, 2) %> tonnes CO₂e
    </span>
    """
  end

  defp emission_class(value) when value > 1000, do: "text-error font-bold"
  defp emission_class(value) when value > 500, do: "text-warning"
  defp emission_class(_), do: "text-success"
end
```

---

## Search and Filters

### Searchable Fields

```elixir
@impl Backpex.LiveResource
def fields do
  [
    name: %{
      module: Backpex.Fields.Text,
      label: "Farm Name",
      searchable: true  # Enables search
    }
  ]
end
```

### Custom Filters

```elixir
@impl Backpex.LiveResource
def filters do
  [
    country: %{
      module: Backpex.Filters.Select,
      label: "Country",
      options: [
        {"All Countries", nil},
        {"Korea", "KR"},
        {"USA", "US"},
        {"Brazil", "BR"}
      ]
    },
    date_range: %{
      module: Backpex.Filters.DateRange,
      label: "Created Between"
    },
    high_emissions: %{
      module: Backpex.Filters.Boolean,
      label: "High Emissions Only",
      predicate: fn query, _value ->
        from(f in query, where: f.total_emissions > 1000)
      end
    }
  ]
end
```

---

## Resource Actions

### Global Actions (Index Page)

```elixir
@impl Backpex.LiveResource
def resource_actions do
  [
    export_csv: %{
      module: MceWeb.Admin.Actions.ExportCsv,
      label: "Export CSV",
      icon: "hero-arrow-down-tray"
    },
    generate_reports: %{
      module: MceWeb.Admin.Actions.GenerateReports,
      label: "Generate Reports",
      icon: "hero-document-chart-bar"
    }
  ]
end
```

### Action Module

```elixir
defmodule MceWeb.Admin.Actions.ExportCsv do
  use Backpex.ResourceAction

  @impl Backpex.ResourceAction
  def label, do: "Export to CSV"

  @impl Backpex.ResourceAction
  def handle(socket, items) do
    csv_content = generate_csv(items)

    {:ok, socket
     |> assign(:csv_download, csv_content)
     |> push_event("download", %{filename: "farms_export.csv"})}
  end
end
```

### Item Actions (Per-Row)

```elixir
@impl Backpex.LiveResource
def item_actions(default) do
  default ++
  [
    view_report: %{
      module: MceWeb.Admin.Actions.ViewReport,
      label: "View Report",
      icon: "hero-document-text"
    },
    duplicate: %{
      module: MceWeb.Admin.Actions.DuplicateFarm,
      label: "Duplicate",
      icon: "hero-document-duplicate"
    }
  ]
end
```

---

## Dashboard Integration

### Custom Dashboard Panel

```elixir
defmodule MceWeb.Admin.DashboardLive do
  use MceWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:total_farms, Mce.Farms.count_farms())
     |> assign(:total_emissions, Mce.Emissions.total_emissions())
     |> assign(:recent_reports, Mce.Reports.recent(5))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 p-6">
      <div class="stat bg-base-100 shadow rounded-box">
        <div class="stat-title">Total Farms</div>
        <div class="stat-value text-primary"><%= @total_farms %></div>
      </div>

      <div class="stat bg-base-100 shadow rounded-box">
        <div class="stat-title">Total Emissions</div>
        <div class="stat-value text-secondary">
          <%= Float.round(@total_emissions, 1) %> t
        </div>
      </div>

      <div class="stat bg-base-100 shadow rounded-box">
        <div class="stat-title">Reports Generated</div>
        <div class="stat-value"><%= length(@recent_reports) %></div>
      </div>
    </div>

    <!-- Charts would go here -->
    <div class="p-6">
      <div id="emissions-chart" phx-hook="ApexChart" data-options={chart_options()}>
      </div>
    </div>
    """
  end
end
```

---

## Authorisation

### Per-Resource Authorisation

```elixir
@impl Backpex.LiveResource
def can?(socket, :index, _item), do: true
def can?(socket, :show, _item), do: true
def can?(socket, :new, _item), do: admin?(socket)
def can?(socket, :edit, item), do: owner?(socket, item) || admin?(socket)
def can?(socket, :delete, item), do: admin?(socket)

defp admin?(socket), do: socket.assigns.current_user.role == :admin
defp owner?(socket, item), do: socket.assigns.current_user.id == item.user_id
```

---

## Customisation

### Custom Layout

```elixir
@impl Backpex.LiveResource
def layout do
  {MceWeb.Layouts, :admin}
end
```

### Custom Styling

```elixir
# In your CSS
.backpex-index-table {
  @apply table table-zebra;
}

.backpex-form {
  @apply card bg-base-100 shadow-xl;
}
```

---

## MCE-Specific Resources

### Recommended LiveResources

1. **FarmLive** - Farm management
2. **LivestockGroupLive** - Livestock group CRUD
3. **FeedPresetLive** - Feed presets library
4. **EmissionsReportLive** - Report management
5. **UserLive** - User administration
6. **AuditLogLive** - System audit trail

---

## References

- [Backpex Documentation](https://hexdocs.pm/backpex/readme.html)
- [Backpex GitHub](https://github.com/naymspace/backpex)
- [ElixirCasts - Backpex Tutorial](https://elixircasts.io/backpex-phoenix-admin-panel)
- [Elixir Merge - Introduction to Backpex](https://elixirmerge.com/p/introduction-to-backpex-phoenix-admin-panel)
- [Building Admin Dashboards with Backpex](https://james-carr.org/posts/2024-08-27-phoenix-admin-with-backpex/)
