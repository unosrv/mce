defmodule MceWeb.Live.Components.LineChart do
  @moduledoc """
  A reusable line chart component using ApexCharts.

  ## Usage

      <.live_component
        module={MceWeb.Live.Components.LineChart}
        id="emissions-trend"
        title="Monthly Emissions"
        series={@emissions_series}
        categories={@months}
      />

  ## Assigns

  - `id` - Unique identifier for the chart (required)
  - `title` - Chart title (optional)
  - `series` - List of series data (required), format:
    ```elixir
    [
      %{name: "CO2", data: [10, 20, 30, 40]},
      %{name: "CH4", data: [5, 10, 15, 20]}
    ]
    ```
  - `categories` - X-axis labels (required for time series), e.g. ["Jan", "Feb", "Mar"]
  - `height` - Chart height in pixels (default: 300)
  - `colors` - List of hex colors (optional)
  - `y_axis_title` - Y-axis title (optional)
  - `y_axis_format` - Format string for y-axis values (optional), e.g. "{value} kg"
  - `stacked` - Whether to stack series (default: false)
  - `show_grid` - Show grid lines (default: true)
  - `show_legend` - Show legend (default: true)
  - `class` - Additional CSS classes
  """

  use MceWeb, :live_component

  @default_colors ["#22c55e", "#f59e0b", "#ef4444", "#3b82f6", "#8b5cf6", "#ec4899"]

  @impl true
  def render(assigns) do
    assigns =
      assigns
      |> assign_new(:title, fn -> nil end)
      |> assign_new(:height, fn -> 300 end)
      |> assign_new(:colors, fn -> @default_colors end)
      |> assign_new(:y_axis_title, fn -> nil end)
      |> assign_new(:y_axis_format, fn -> nil end)
      |> assign_new(:stacked, fn -> false end)
      |> assign_new(:show_grid, fn -> true end)
      |> assign_new(:show_legend, fn -> true end)
      |> assign_new(:class, fn -> nil end)

    ~H"""
    <div id={@id} class={["line-chart", @class]}>
      <h3 :if={@title} class="text-sm font-medium text-base-content/70 mb-2">{@title}</h3>
      <div
        id={"#{@id}-chart"}
        phx-hook="ApexChart"
        phx-update="ignore"
        data-chart-type="line"
        data-chart-height={@height}
        data-chart-series={encode_series(@series)}
        data-chart-colors={Jason.encode!(@colors)}
        data-chart-options={Jason.encode!(build_options(assigns))}
        class="w-full"
      />
    </div>
    """
  end

  @impl true
  def mount(socket) do
    {:ok, socket}
  end

  @impl true
  def update(assigns, socket) do
    {:ok, assign(socket, assigns)}
  end

  defp encode_series(series) when is_list(series) do
    Jason.encode!(series)
  end

  defp build_options(assigns) do
    %{
      chart: %{
        stacked: assigns.stacked,
        zoom: %{
          enabled: true,
          type: "x"
        }
      },
      xaxis: build_xaxis(assigns),
      yaxis: build_yaxis(assigns),
      grid: %{
        show: assigns.show_grid,
        borderColor: "#e5e7eb",
        strokeDashArray: 4
      },
      legend: %{
        show: assigns.show_legend,
        position: "top",
        horizontalAlign: "right"
      },
      stroke: %{
        width: 2,
        curve: "smooth"
      },
      markers: %{
        size: 4,
        hover: %{
          size: 6
        }
      },
      tooltip: %{
        x: %{
          show: true
        },
        y: %{
          formatter: build_tooltip_formatter(assigns)
        }
      }
    }
  end

  defp build_xaxis(assigns) do
    base = %{
      type: "category",
      labels: %{
        style: %{
          fontSize: "12px"
        }
      }
    }

    if Map.has_key?(assigns, :categories) and assigns.categories do
      Map.put(base, :categories, assigns.categories)
    else
      base
    end
  end

  defp build_yaxis(assigns) do
    yaxis = %{
      labels: %{
        style: %{
          fontSize: "12px"
        }
      }
    }

    yaxis =
      if assigns.y_axis_title do
        Map.put(yaxis, :title, %{text: assigns.y_axis_title})
      else
        yaxis
      end

    if assigns.y_axis_format do
      Map.put(yaxis, :labels, %{
        formatter: assigns.y_axis_format,
        style: %{fontSize: "12px"}
      })
    else
      yaxis
    end
  end

  defp build_tooltip_formatter(assigns) do
    if assigns.y_axis_format do
      # This will be processed client-side
      assigns.y_axis_format
    else
      nil
    end
  end
end
