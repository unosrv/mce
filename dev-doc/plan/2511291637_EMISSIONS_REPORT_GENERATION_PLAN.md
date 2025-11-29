# Emissions Report Generation Implementation Plan

**Document ID:** 2511291637_EMISSIONS_REPORT_GENERATION_PLAN
**Task:** 2.4 Emissions Report Generation
**Status:** Planning

---

## Overview

Implement a comprehensive emissions report view with interactive charts, detailed breakdowns by livestock group and emission source, and PDF export capability.

---

## Requirements (from PRD)

1. **Emissions Report**
   - Automatic generation per farm
   - Emissions by category (enteric fermentation, manure CH₄, manure N₂O)
   - Detailed breakdown by livestock group
   - PDF export

2. **Dashboard Visualisations**
   - Emissions breakdown by source (donut chart)
   - Emissions breakdown by livestock group (bar chart)
   - Summary statistics cards

---

## Architecture

### Route Structure

```
/farms/:farm_id/emissions                 # Emissions report view
/farms/:farm_id/emissions/calculate       # Recalculate emissions action
/farms/:farm_id/emissions/export          # PDF export
```

### Components

1. **EmissionsReportLive.Show** - Main report LiveView
2. **EmissionsComponents** - Reusable chart components
3. **ApexChart JS Hook** - Client-side chart rendering
4. **EmissionsPdfExport** - PDF generation module

---

## Implementation Steps

### Step 1: ApexCharts Integration

**Files:**
- `assets/js/hooks/apex_chart.js` (new)
- `assets/js/app.js` (modify)

**Actions:**
1. Install apexcharts npm package
2. Create ApexChart hook for LiveView integration
3. Register hook in app.js

### Step 2: Chart Components

**File:** `lib/mce_web/components/emissions_components.ex` (new)

**Components:**
- `emissions_donut_chart/1` - Source breakdown
- `emissions_bar_chart/1` - Group breakdown
- `stat_card/1` - Summary statistics

### Step 3: Emissions Report LiveView

**File:** `lib/mce_web/live/emissions_live/show.ex` (new)

**Features:**
- Load or calculate emissions report on mount
- Display summary statistics (total, per source)
- Render charts for visualisation
- Recalculate button
- Export to PDF button

**Assigns:**
- `@farm` - Farm data
- `@report` - Emission report data
- `@chart_data` - Prepared chart data

### Step 4: Router Updates

**File:** `lib/mce_web/router.ex` (modify)

Add routes within authenticated live_session:
```elixir
live "/farms/:farm_id/emissions", EmissionsLive.Show, :show
```

### Step 5: Farm Show Integration

**File:** `lib/mce_web/live/farm_live/show.ex` (modify)

Add emissions summary card and link to full report:
- Quick stats: total emissions, calculation date
- "View Report" button linking to `/farms/:id/emissions`

### Step 6: PDF Export (Stretch Goal)

**Options:**
1. **Client-side (print-to-PDF)** - Use browser print with print styles
2. **Server-side (pdf_generator)** - Generate PDF on server

For MVP, implement print-friendly styles and browser print dialog.

---

## Chart Specifications

### 1. Source Breakdown (Donut Chart)

```javascript
{
  type: 'donut',
  series: [enteric, manure_ch4, manure_n2o],
  labels: ['Enteric Fermentation', 'Manure CH₄', 'Manure N₂O'],
  colors: ['#22c55e', '#f59e0b', '#ef4444']
}
```

### 2. Group Breakdown (Bar Chart)

```javascript
{
  type: 'bar',
  series: [{
    name: 'Emissions (t CO₂e)',
    data: [group1_total, group2_total, ...]
  }],
  xaxis: {
    categories: ['Group 1', 'Group 2', ...]
  }
}
```

### 3. Stacked Bar by Source per Group

```javascript
{
  type: 'bar',
  stacked: true,
  series: [
    { name: 'Enteric', data: [...] },
    { name: 'Manure CH₄', data: [...] },
    { name: 'Manure N₂O', data: [...] }
  ]
}
```

---

## UI Design

### Report Page Layout

```
┌────────────────────────────────────────────────────┐
│ ← Back to Farm                                     │
├────────────────────────────────────────────────────┤
│ [Farm Name] - Emissions Report [Year]              │
│                                                    │
│ ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌────────┐ │
│ │  Total   │ │ Enteric  │ │ Manure   │ │ Manure │ │
│ │ 389.1 t  │ │ 275.5 t  │ │ 12.6 t   │ │ 100 t  │ │
│ │  CO₂e    │ │  CH₄     │ │  CH₄     │ │  N₂O   │ │
│ └──────────┘ └──────────┘ └──────────┘ └────────┘ │
│                                                    │
│ ┌──────────────────────┐ ┌──────────────────────┐ │
│ │   Source Breakdown   │ │   Group Breakdown    │ │
│ │   [Donut Chart]      │ │   [Stacked Bar]      │ │
│ └──────────────────────┘ └──────────────────────┘ │
│                                                    │
│ ┌──────────────────────────────────────────────┐  │
│ │ Livestock Group Details                      │  │
│ ├──────────────────────────────────────────────┤  │
│ │ Group Name | Head | Enteric | Manure | Total │  │
│ │ Dairy Herd |  50  |  137.7  |  50.0  | 193.8 │  │
│ │ Beef Cattle| 100  |  151.6  |  13.0  | 171.9 │  │
│ └──────────────────────────────────────────────┘  │
│                                                    │
│ [Recalculate]  [Export PDF]                        │
│                                                    │
│ Calculated: 2025-11-29 16:37 | Version: 1.0.0     │
└────────────────────────────────────────────────────┘
```

---

## File List

### New Files
1. `assets/js/hooks/apex_chart.js`
2. `lib/mce_web/components/emissions_components.ex`
3. `lib/mce_web/live/emissions_live/show.ex`

### Modified Files
1. `assets/js/app.js` - Register chart hook
2. `assets/package.json` - Add apexcharts dependency
3. `lib/mce_web/router.ex` - Add emissions routes
4. `lib/mce_web/live/farm_live/show.ex` - Add emissions summary/link

---

## Testing

### Unit Tests
- Chart data preparation functions
- Emissions context functions (already exist)

### LiveView Tests
- `test/mce_web/live/emissions_live/show_test.exs`
- Page loads with report data
- Recalculate button works
- Charts render (element presence)

---

## i18n Keys

```elixir
# Gettext entries
gettext("Emissions Report")
gettext("Total Emissions")
gettext("Enteric Fermentation")
gettext("Manure CH₄")
gettext("Manure N₂O")
gettext("Recalculate")
gettext("Export PDF")
gettext("Calculated at")
gettext("tonnes CO₂e")
gettext("Livestock Group Details")
gettext("View Emissions Report")
```

---

## Estimate

| Step | Complexity |
|------|------------|
| 1. ApexCharts Integration | Low |
| 2. Chart Components | Medium |
| 3. Emissions LiveView | Medium |
| 4. Router Updates | Low |
| 5. Farm Show Integration | Low |
| 6. PDF Export (Basic) | Low |

---

## Dependencies

- `apexcharts` npm package (client-side)
- Existing `Mce.Emissions` context
- Existing `Mce.Emissions.Calculator` module

---

## Out of Scope

- Monthly trend charts (requires time-series data)
- Farm comparison (requires multiple farms context)
- Historical report versioning
- Feed/energy emissions (not yet implemented in calculator)

These features can be added in future iterations.
