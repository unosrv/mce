/**
 * ApexChart LiveView Hook
 *
 * Integrates ApexCharts with Phoenix LiveView for real-time chart updates.
 *
 * Usage in HEEx:
 *   <div
 *     id="my-chart"
 *     phx-hook="ApexChart"
 *     phx-update="ignore"
 *     data-chart-type="donut"
 *     data-chart-series={Jason.encode!(@series)}
 *     data-chart-labels={Jason.encode!(@labels)}
 *     data-chart-colors={Jason.encode!(@colors)}
 *     data-chart-options={Jason.encode!(@extra_options)}
 *   />
 */

import ApexCharts from "../../vendor/apexcharts"

const ApexChart = {
  mounted() {
    this.chart = null
    this.initChart()

    // Listen for server-pushed updates
    this.handleEvent("update_chart", ({ series, labels }) => {
      if (this.chart) {
        if (labels) {
          this.chart.updateOptions({ labels: labels })
        }
        this.chart.updateSeries(series)
      }
    })
  },

  updated() {
    // Re-read data attributes when the element updates
    // Note: phx-update="ignore" should prevent updates, but handle gracefully
    if (this.chart) {
      const newSeries = this.getSeries()
      const newLabels = this.getLabels()
      if (newLabels) {
        this.chart.updateOptions({ labels: newLabels })
      }
      this.chart.updateSeries(newSeries)
    }
  },

  destroyed() {
    if (this.chart) {
      this.chart.destroy()
      this.chart = null
    }
  },

  initChart() {
    const type = this.el.dataset.chartType || "bar"
    const series = this.getSeries()
    const labels = this.getLabels()
    const colors = this.getColors()
    const extraOptions = this.getExtraOptions()

    const baseOptions = {
      chart: {
        type: type,
        height: this.el.dataset.chartHeight || 300,
        fontFamily: "inherit",
        toolbar: {
          show: false
        },
        animations: {
          enabled: true,
          easing: "easeinout",
          speed: 500
        }
      },
      series: series,
      colors: colors,
      stroke: {
        width: type === "donut" ? 0 : 2,
        curve: "smooth"
      },
      dataLabels: {
        enabled: type === "donut" || type === "pie"
      },
      legend: {
        position: type === "donut" || type === "pie" ? "bottom" : "top",
        horizontalAlign: "center"
      },
      tooltip: {
        theme: "light"
      }
    }

    // Add labels for pie/donut charts
    if (labels && (type === "donut" || type === "pie")) {
      baseOptions.labels = labels
    }

    // Merge with extra options
    const options = this.deepMerge(baseOptions, extraOptions)

    this.chart = new ApexCharts(this.el, options)
    this.chart.render()
  },

  getSeries() {
    try {
      return JSON.parse(this.el.dataset.chartSeries || "[]")
    } catch (e) {
      console.error("Failed to parse chart series:", e)
      return []
    }
  },

  getLabels() {
    try {
      const labels = this.el.dataset.chartLabels
      return labels ? JSON.parse(labels) : null
    } catch (e) {
      console.error("Failed to parse chart labels:", e)
      return null
    }
  },

  getColors() {
    try {
      return JSON.parse(this.el.dataset.chartColors || '["#22c55e", "#f59e0b", "#ef4444", "#3b82f6"]')
    } catch (e) {
      console.error("Failed to parse chart colors:", e)
      return ["#22c55e", "#f59e0b", "#ef4444", "#3b82f6"]
    }
  },

  getExtraOptions() {
    try {
      return JSON.parse(this.el.dataset.chartOptions || "{}")
    } catch (e) {
      console.error("Failed to parse chart options:", e)
      return {}
    }
  },

  deepMerge(target, source) {
    const result = { ...target }
    for (const key in source) {
      if (source[key] instanceof Object && key in target && target[key] instanceof Object) {
        result[key] = this.deepMerge(target[key], source[key])
      } else {
        result[key] = source[key]
      }
    }
    return result
  }
}

export { ApexChart }
