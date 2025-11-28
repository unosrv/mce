# Charting Libraries for Phoenix LiveView

## Overview

The dashboard requires interactive charts for emissions data visualisation. This document evaluates charting options compatible with Phoenix LiveView.

---

## Recommended Libraries

### 1. ApexCharts (Recommended)

**Why ApexCharts:**
- Modern, interactive charts
- Excellent documentation
- Active development
- Built-in responsiveness
- Real-time update support

#### Hex Package: `live_charts`

```elixir
# mix.exs
{:live_charts, "~> 0.4"}
```

#### Features
- LiveView component integration
- Supports: line, bar, pie, donut, area, and more
- Real-time data updates via LiveView hooks
- Customisable themes

#### Usage Example

```elixir
defmodule MceWeb.DashboardLive do
  use MceWeb, :live_view
  import LiveCharts

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:emissions_data, fetch_emissions_data())
     |> assign(:chart_options, build_chart_options())}
  end

  def render(assigns) do
    ~H"""
    <.live_chart
      id="emissions-chart"
      type={:bar}
      series={@emissions_data}
      options={@chart_options}
    />
    """
  end

  defp build_chart_options do
    %{
      chart: %{height: 350},
      xaxis: %{categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]},
      colors: ["#22c55e", "#f59e0b", "#ef4444", "#3b82f6"]
    }
  end
end
```

#### JavaScript Hook (assets/js/hooks/apex_chart.js)

```javascript
import ApexCharts from 'apexcharts';

export const ApexChart = {
  mounted() {
    const options = JSON.parse(this.el.dataset.options);
    this.chart = new ApexCharts(this.el, options);
    this.chart.render();

    this.handleEvent("update_chart", ({ series }) => {
      this.chart.updateSeries(series);
    });
  },

  destroyed() {
    this.chart.destroy();
  }
};
```

---

### 2. Chart.js

**Alternative option with strong community support.**

#### Hex Package: `chart_js`

```elixir
# mix.exs
{:chart_js, "~> 0.1"}
```

#### Features
- Lightweight (~60KB)
- Simple API
- Good animation support
- Extensive plugin ecosystem

#### Usage with LiveView

```elixir
defmodule MceWeb.Components.EmissionsChart do
  use Phoenix.Component

  attr :id, :string, required: true
  attr :data, :map, required: true
  attr :type, :string, default: "bar"

  def emissions_chart(assigns) do
    ~H"""
    <canvas
      id={@id}
      phx-hook="ChartJS"
      data-type={@type}
      data-config={Jason.encode!(@data)}
    />
    """
  end
end
```

#### JavaScript Hook

```javascript
import Chart from 'chart.js/auto';

export const ChartJS = {
  mounted() {
    const ctx = this.el.getContext('2d');
    const config = JSON.parse(this.el.dataset.config);

    this.chart = new Chart(ctx, {
      type: this.el.dataset.type,
      data: config.data,
      options: config.options
    });

    this.handleEvent("update_data", ({ data }) => {
      this.chart.data = data;
      this.chart.update();
    });
  },

  destroyed() {
    this.chart.destroy();
  }
};
```

---

## Chart Types for MCE Dashboard

### 1. Emissions Overview (Stacked Bar)
- Categories: Enteric Fermentation, Manure, Feed, Energy
- X-axis: Months or Livestock Groups
- Y-axis: CO₂ equivalent (tonnes)

```javascript
{
  type: 'bar',
  options: {
    stacked: true,
    colors: ['#22c55e', '#f59e0b', '#ef4444', '#3b82f6']
  }
}
```

### 2. Monthly Trends (Line Chart)
- Compare emissions over time
- Multiple series for different farms

```javascript
{
  type: 'line',
  options: {
    stroke: { curve: 'smooth' },
    markers: { size: 4 }
  }
}
```

### 3. Emissions Breakdown (Donut Chart)
- Show proportion by category
- Interactive legend

```javascript
{
  type: 'donut',
  options: {
    labels: ['Enteric', 'Manure', 'Feed', 'Energy'],
    legend: { position: 'bottom' }
  }
}
```

### 4. Farm Comparison (Horizontal Bar)
- Rank farms by emissions
- Colour-coded by performance

```javascript
{
  type: 'bar',
  options: {
    horizontal: true,
    dataLabels: { enabled: true }
  }
}
```

### 5. Heatmap (Monthly by Category)
- 12 months × 4 categories
- Colour intensity = emission level

```javascript
{
  type: 'heatmap',
  options: {
    colorScale: {
      ranges: [
        { from: 0, to: 100, color: '#22c55e' },
        { from: 100, to: 500, color: '#f59e0b' },
        { from: 500, to: 1000, color: '#ef4444' }
      ]
    }
  }
}
```

---

## Real-Time Updates

### Server Push Pattern

```elixir
defmodule MceWeb.DashboardLive do
  def handle_info(:refresh_data, socket) do
    new_data = fetch_latest_emissions()

    {:noreply,
     socket
     |> assign(:emissions_data, new_data)
     |> push_event("update_chart", %{series: new_data})}
  end
end
```

### Periodic Refresh

```elixir
def mount(_params, _session, socket) do
  if connected?(socket) do
    :timer.send_interval(30_000, self(), :refresh_data)
  end

  {:ok, assign(socket, :data, initial_data())}
end
```

---

## Theming for DaisyUI Integration

### ApexCharts Theme Configuration

```javascript
// Match DaisyUI theme variables
const themeConfig = {
  theme: {
    mode: 'light',  // or 'dark'
    palette: 'palette1'
  },
  colors: [
    'oklch(var(--p))',   // primary
    'oklch(var(--s))',   // secondary
    'oklch(var(--a))',   // accent
    'oklch(var(--n))'    // neutral
  ],
  chart: {
    background: 'oklch(var(--b1))',
    foreColor: 'oklch(var(--bc))'
  }
};
```

---

## Performance Considerations

1. **Lazy Loading**: Load charts only when visible
2. **Data Pagination**: Limit data points for large datasets
3. **Debouncing**: Throttle real-time updates
4. **SVG vs Canvas**: ApexCharts uses SVG (better for < 1000 points)

---

## Installation Steps

### 1. Add Dependencies

```elixir
# mix.exs
defp deps do
  [
    {:live_charts, "~> 0.4"},
    {:jason, "~> 1.4"}
  ]
end
```

### 2. Install npm Package

```bash
cd assets
npm install apexcharts --save
```

### 3. Import in app.js

```javascript
// assets/js/app.js
import ApexCharts from 'apexcharts';
window.ApexCharts = ApexCharts;

import { ApexChart } from './hooks/apex_chart';

let liveSocket = new LiveSocket("/live", Socket, {
  hooks: { ApexChart }
});
```

---

## References

- [LiveCharts Documentation](https://hexdocs.pm/live_charts/LiveCharts.html)
- [ApexCharts Documentation](https://apexcharts.com/docs/installation/)
- [FullStackPhoenix - Realtime ApexCharts](https://fullstackphoenix.com/tutorials/realtime-apex-charts-phoenix-liveview)
- [Chart.js Phoenix Integration](https://medium.com/@lionel.aimerie/integrating-chart-js-into-elixir-phoenix-for-visual-impact-9a3991f0690f)
- [ElixirCasts - Charts with Chart.js](https://elixircasts.io/charts-with-chart.js-part-1)
