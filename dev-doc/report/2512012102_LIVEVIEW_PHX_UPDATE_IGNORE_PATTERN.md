# Preserving Client-Side State in Phoenix LiveView

**Date:** 2025-12-01
**Category:** Phoenix LiveView Patterns
**Tags:** LiveView, DOM patching, phx-update, DaisyUI, client-side state

## Overview

This report documents a common LiveView issue where client-side UI state (such as checkbox states, dropdown menus, or drawer toggles) gets unexpectedly reset during LiveView DOM updates. We explain the root cause and demonstrate the `phx-update="ignore"` pattern as a solution.

## The Problem

### Scenario

In our Backpex admin panel, we implemented a collapsible sidebar using DaisyUI's drawer component. The drawer state is controlled by a hidden checkbox:

```heex
<div class="drawer lg:drawer-open">
  <input id="admin-drawer" type="checkbox" class="drawer-toggle" />
  <!-- Sidebar and content -->
</div>
```

**Expected behaviour**: User clicks the toggle button to collapse/expand the sidebar. This state should persist while navigating and interacting with the page.

**Actual behaviour**: When clicking a checkbox in the admin table (which triggers a LiveView event), the sidebar would unexpectedly collapse back to its default state.

### Symptom

```
1. User expands sidebar (checkbox becomes checked)
2. User clicks a table row checkbox to select an item
3. LiveView processes the "update-selected-items" event
4. LiveView re-renders and patches the DOM
5. Sidebar collapses back (checkbox reset to unchecked) ← BUG
```

## Root Cause Analysis

### How LiveView DOM Patching Works

Phoenix LiveView uses a sophisticated DOM diffing algorithm called **morphdom** to efficiently update the page. When a LiveView event occurs:

1. Server processes the event and re-renders the template
2. Server sends a diff of changes to the client
3. Client-side JavaScript patches the DOM to match the new state

**Key insight**: LiveView tracks and updates DOM elements based on their server-rendered state. If an element's state is modified purely on the client-side (like a checkbox toggled by user interaction), LiveView has no knowledge of this change.

### The State Mismatch

```
Server state:     <input type="checkbox" />           (unchecked)
Client state:     <input type="checkbox" checked />   (user checked it)

After LiveView patch:
Server sends:     <input type="checkbox" />           (still unchecked)
Result:           Checkbox reset to unchecked!
```

The drawer toggle checkbox has no server-side binding (`phx-click`, `phx-change`, or value from assigns). Its state exists purely on the client. When LiveView patches the DOM, it sees the server says "unchecked" and dutifully resets the checkbox.

### Why This Doesn't Always Happen

You might wonder why form inputs bound with `phx-change` don't have this problem. That's because:

1. `phx-change` sends input changes to the server
2. Server updates its state and re-renders with the new value
3. DOM patch includes the correct value

But for UI elements like drawer toggles, theme switches, or accordion states that are purely client-side, there's no server round-trip to preserve state.

## The Solution: `phx-update="ignore"`

### What It Does

The `phx-update="ignore"` attribute tells LiveView's JavaScript client to **completely skip this element** during DOM patching. The element and all its children are left untouched.

### Implementation

```heex
<!-- Before: State gets reset on every LiveView update -->
<input id="admin-drawer" type="checkbox" class="drawer-toggle" />

<!-- After: State preserved across LiveView updates -->
<input id="admin-drawer" type="checkbox" class="drawer-toggle" phx-update="ignore" />
```

### How It Works

```
1. User expands sidebar (checkbox becomes checked)
2. User clicks a table row checkbox
3. LiveView processes the event
4. LiveView prepares to patch the DOM
5. LiveView sees phx-update="ignore" on drawer checkbox
6. LiveView SKIPS patching this element
7. Sidebar stays expanded ✓
```

## When to Use `phx-update="ignore"`

### Good Use Cases

| Element | Why Ignore? |
|---------|-------------|
| DaisyUI drawer toggle | Pure CSS state, no server binding |
| Theme toggle checkbox | CSS-only dark/light mode |
| Accordion open/close | UI state, not data |
| Dropdown menu state | Temporary UI interaction |
| CSS animation triggers | Visual-only changes |
| Third-party widget containers | External JS manages state |

### When NOT to Use

| Scenario | Better Alternative |
|----------|-------------------|
| Form inputs | Use `phx-change` binding |
| Data-driven UI | Bind to server assigns |
| Selection state | Track in LiveView assigns |
| Persistent preferences | Store in session/database |

## Related LiveView Patterns

### 1. `phx-update` Options

```heex
<!-- Replace entire content (default) -->
<div phx-update="replace">...</div>

<!-- Append new items to end -->
<ul phx-update="stream">...</ul>

<!-- Never touch this element -->
<div phx-update="ignore">...</div>
```

### 2. JavaScript Hooks for Complex State

When you need bidirectional communication:

```javascript
// assets/js/hooks.js
Hooks.DrawerState = {
  mounted() {
    // Restore state from localStorage
    const saved = localStorage.getItem('drawer-state');
    if (saved === 'open') {
      this.el.checked = true;
    }

    // Save state on change
    this.el.addEventListener('change', (e) => {
      localStorage.setItem('drawer-state', e.target.checked ? 'open' : 'closed');
    });
  }
}
```

```heex
<input
  id="admin-drawer"
  type="checkbox"
  class="drawer-toggle"
  phx-hook="DrawerState"
  phx-update="ignore"
/>
```

### 3. Combining with `phx-hook`

When using `phx-update="ignore"` with hooks, remember:

- `mounted()` callback fires once when element first appears
- `updated()` callback will **never fire** (element is ignored)
- `destroyed()` fires if element is removed entirely

### 4. Preserving State During Navigation

For LiveView navigation (`live_patch`, `live_redirect`):

```elixir
# In your LiveView
def handle_params(params, _uri, socket) do
  # State in assigns persists across patches
  {:noreply, socket}
end
```

## Testing Considerations

When testing LiveViews with ignored elements:

```elixir
# This won't work - element is ignored during patches
test "drawer toggle preserves state", %{conn: conn} do
  {:ok, view, _html} = live(conn, "/admin")

  # Initial render
  assert has_element?(view, "#admin-drawer:not(:checked)")

  # Client-side toggle won't be visible to LiveViewTest
  # because it's purely client-side state
end
```

For ignored elements, use Playwright or Wallaby for end-to-end testing:

```javascript
// Playwright test
test('drawer state preserved after interaction', async ({ page }) => {
  await page.click('label[for="admin-drawer"]'); // Toggle drawer
  await page.click('table input[type="checkbox"]'); // Trigger LiveView

  // Verify drawer state preserved
  expect(await page.locator('#admin-drawer').isChecked()).toBe(true);
});
```

## Summary

### The Pattern

```heex
<!-- For client-side-only state that should survive LiveView updates -->
<element phx-update="ignore">
  <!-- This subtree is never touched by LiveView patches -->
</element>
```

### Key Takeaways

1. **LiveView patches reset client-side state** - Elements without server bindings return to their rendered default on each patch

2. **`phx-update="ignore"` opts out of patching** - Use for pure UI state that doesn't need server synchronisation

3. **Combine with hooks for persistence** - Add `phx-hook` to save/restore state across page loads

4. **Test with E2E tools** - LiveViewTest can't verify client-side state; use Playwright or similar

### Files Changed in This Fix

```
lib/mce_web/components/layouts.ex
  - Line 223: Added phx-update="ignore" to admin drawer checkbox
  - Line 393: Added phx-update="ignore" to dashboard drawer checkbox
```

## References

- [Phoenix LiveView Documentation - DOM Patching](https://hexdocs.pm/phoenix_live_view/dom-patching.html)
- [LiveView JavaScript Hooks](https://hexdocs.pm/phoenix_live_view/js-interop.html)
- [DaisyUI Drawer Component](https://daisyui.com/components/drawer/)
- [morphdom - Fast DOM diffing](https://github.com/patrick-steele-idem/morphdom)

## Appendix: Debug Checklist

When client-side state unexpectedly resets in LiveView:

- [ ] Is the element bound to server state (`phx-change`, `phx-click`)?
- [ ] Does the element have a unique, stable `id`?
- [ ] Is the state purely client-side (CSS, localStorage, JS)?
- [ ] Would `phx-update="ignore"` be appropriate?
- [ ] Is there a hook that needs the `updated()` callback?
- [ ] Could the element be outside the LiveView entirely?
