defmodule MceWeb.Live.Components.DonutChart do
  @moduledoc """
  A reusable donut chart component using ApexCharts.

  ## Usage

      <.live_component
        module={MceWeb.Live.Components.DonutChart}
        id="emissions-by-type"
        title="Emissions by Source"
        series={[40, 30, 20, 10]}
        labels={["Enteric", "Manure", "Feed", "Energy"]}
      />

  ## Assigns

  - `id` - Unique identifier for the chart (required)
  - `title` - Chart title (optional)
  - `series` - List of numeric values (required), e.g. [40, 30, 20, 10]
  - `labels` - List of labels (required), e.g. ["Enteric", "Manure", "Feed", "Energy"]
  - `height` - Chart height in pixels (default: 300)
  - `colors` - List of hex colors (optional)
  - `show_legend` - Show legend (default: true)
  - `show_labels` - Show data labels (default: true)
  - `format` - Value format (optional), e.g. "{value}%"
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
      |> assign_new(:show_legend, fn -> true end)
      |> assign_new(:show_labels, fn -> true end)
      |> assign_new(:format, fn -> nil end)
      |> assign_new(:class, fn -> nil end)

    ~H"""
    <div id={@id} class={["donut-chart", @class]}>
      <h3 :if={@title} class="text-sm font-medium text-base-content/70 mb-2">{@title}</h3>
      <div
        id={"#{@id}-chart"}
        phx-hook="ApexChart"
        phx-update="ignore"
        data-chart-type="donut"
        data-chart-height={@height}
        data-chart-series={Jason.encode!(@series)}
        data-chart-labels={Jason.encode!(@labels)}
        data-chart-colors={Jason.encode!(Enum.take(@colors, length(@series)))}
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

  defp build_options(assigns) do
    %{
      plotOptions: %{
        pie: %{
          donut: %{
            size: "60%",
            labels: %{
              show: true,
              name: %{
                show: true,
                fontSize: "14px"
              },
              value: %{
                show: true,
                fontSize: "16px",
                fontWeight: 600
              },
              total: %{
                show: true,
                showAlways: true,
                fontSize: "12px"
              }
            }
          }
        }
      },
      legend: %{
        show: assigns.show_legend,
        position: "bottom",
        horizontalAlign: "center"
      },
      dataLabels: %{
        enabled: assigns.show_labels
      },
      tooltip: %{
        y: %{
          formatter: assigns.format
        }
      }
    }
  end
end
