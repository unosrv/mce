/**
 * AutoDismiss Hook
 *
 * Automatically dismisses flash messages after a configurable timeout.
 * Respects user interaction - if user hovers over the element, the timer pauses.
 */
export const AutoDismiss = {
  mounted() {
    const dismissTime = parseInt(this.el.dataset.autoDismiss, 10)
    if (!dismissTime || dismissTime <= 0) return

    this.timeoutId = null
    this.remainingTime = dismissTime
    this.startTime = null
    this.isPaused = false

    // Start the dismiss timer
    this.startTimer()

    // Pause on hover
    this.el.addEventListener("mouseenter", () => this.pauseTimer())
    this.el.addEventListener("mouseleave", () => this.resumeTimer())
  },

  destroyed() {
    if (this.timeoutId) {
      clearTimeout(this.timeoutId)
    }
  },

  startTimer() {
    this.startTime = Date.now()
    this.isPaused = false
    this.timeoutId = setTimeout(() => {
      this.dismiss()
    }, this.remainingTime)
  },

  pauseTimer() {
    if (this.isPaused || !this.timeoutId) return

    this.isPaused = true
    clearTimeout(this.timeoutId)
    this.timeoutId = null

    // Calculate remaining time
    const elapsed = Date.now() - this.startTime
    this.remainingTime = Math.max(0, this.remainingTime - elapsed)
  },

  resumeTimer() {
    if (!this.isPaused || this.remainingTime <= 0) return
    this.startTimer()
  },

  dismiss() {
    // Animate out
    this.el.style.transition = "opacity 200ms ease-out, transform 200ms ease-out"
    this.el.style.opacity = "0"
    this.el.style.transform = "translateX(100%)"

    // Clear the flash after animation
    setTimeout(() => {
      // Get the flash kind from the element id (flash-info or flash-error)
      const kind = this.el.id.replace("flash-", "")
      this.pushEvent("lv:clear-flash", { key: kind })
    }, 200)
  }
}
