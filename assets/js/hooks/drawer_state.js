/**
 * DrawerState Hook
 *
 * Persists DaisyUI drawer checkbox state to localStorage.
 * This allows the drawer collapsed/expanded state to survive page navigation.
 *
 * Usage:
 *   <input
 *     id="admin-drawer"
 *     type="checkbox"
 *     class="drawer-toggle"
 *     phx-hook="DrawerState"
 *     phx-update="ignore"
 *     data-drawer-key="admin-drawer"
 *   />
 *
 * The data-drawer-key attribute is used as the localStorage key.
 * If not provided, the element's id is used.
 */

export const DrawerState = {
  mounted() {
    const key = this.getStorageKey();

    // Restore state from localStorage
    const savedState = localStorage.getItem(key);
    if (savedState !== null) {
      this.el.checked = savedState === "true";
    }

    // Save state on change
    this.el.addEventListener("change", () => {
      localStorage.setItem(key, this.el.checked.toString());
    });
  },

  getStorageKey() {
    return this.el.dataset.drawerKey || this.el.id || "drawer-state";
  },
};
