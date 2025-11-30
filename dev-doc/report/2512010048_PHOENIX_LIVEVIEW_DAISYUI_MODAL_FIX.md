# Phoenix LiveView + DaisyUI v5 Modal Integration Fix Report

**Date:** 2025-12-01
**Issue:** Edit modal on Farm page not opening when clicking Edit button
**Status:** Resolved

## Problem Summary

When clicking the Edit button in the farm card dropdown menu on the Farms page, the URL changed to `/farms/{id}/edit` but the modal did not appear. The browser console showed the following JavaScript error:

```
js.js:62 Uncaught Error: expected showModal() to contain JS command on "#farm-modal"
    at js.js:62:13
    at Array.forEach (<anonymous>)
    at Object.exec (js.js:57:22)
    at js.js:174:20
    at js.js:42:45
    at Array.forEach (<anonymous>)
    at Object.exec (js.js:42:27)
    at executeJS (morphdom.js:158:6)
    at applyPhxUpdate (morphdom.js:188:7)
    at morphdomStep (morphdom.js:225:7)
```

## Root Cause Analysis

### Technical Background

Phoenix LiveView's `JS` module provides two approaches for triggering JavaScript actions:

1. **`JS.exec(command_name, to: selector)`** - Executes a named JS command that must be defined on the target element via a `data-*` attribute
2. **`JS.dispatch(event_name, to: selector)`** - Dispatches a custom DOM event to the target element

### The Problem

The original `show_modal/2` function in `core_components.ex` used `JS.exec`:

```elixir
def show_modal(js \\ %JS{}, id) when is_binary(id) do
  js
  |> JS.push_focus()
  |> JS.exec("showModal()", to: "##{id}")
end
```

`JS.exec("showModal()", ...)` expects the target element to have a `data-showModal` attribute containing a valid JS command definition. However, when using DaisyUI v5's native `<dialog>` element approach, the modal component did not have this attribute properly configured to trigger the native `showModal()` method.

### Why This Is Confusing

The error message `expected showModal() to contain JS command on "#farm-modal"` is misleading because:
- It suggests `showModal()` should contain something, but actually `JS.exec` is looking for a `data-showModal` attribute on `#farm-modal`
- The parentheses in `showModal()` make it look like a function call, but it's actually the attribute name without the `data-` prefix

## Failed Approaches

### Attempt 1: Add data attributes to modal component

Added `data-showModal` and `data-close` attributes to the dialog element:

```elixir
<dialog
  id={@id}
  class="modal"
  data-showModal={JS.dispatch("modal:open")}
  data-close={JS.dispatch("modal:close")}
>
```

**Result:** Still failed with the same error. The `JS.exec` mechanism wasn't correctly finding/executing the command.

### Attempt 2: Update JavaScript event listeners

Changed from `window.addEventListener` to `document.addEventListener` with capture phase:

```javascript
document.addEventListener("modal:open", (event) => {
  const dialog = event.target.closest("dialog") || event.target
  if (dialog instanceof HTMLDialogElement && !dialog.open) {
    dialog.showModal()
  }
}, true)
```

**Result:** Still failed because the events weren't being dispatched in the first place due to `JS.exec` error.

## Solution

### The Fix

Changed `show_modal/2` and `hide_modal/2` functions to use `JS.dispatch` directly instead of `JS.exec`:

**File:** `lib/mce_web/components/core_components.ex`

```elixir
def show_modal(js \\ %JS{}, id) when is_binary(id) do
  js
  |> JS.dispatch("modal:open", to: "##{id}")
end

def hide_modal(js \\ %JS{}, id) do
  js
  |> JS.dispatch("modal:close", to: "##{id}")
end
```

**File:** `assets/js/app.js`

```javascript
// Modal event handlers for DaisyUI dialog elements
// These handle the custom events dispatched by Phoenix JS.dispatch
// Use capturing to ensure we catch events on the target element
document.addEventListener("modal:open", (event) => {
  const dialog = event.target.closest("dialog") || event.target
  if (dialog instanceof HTMLDialogElement && !dialog.open) {
    dialog.showModal()
  }
}, true)

document.addEventListener("modal:close", (event) => {
  const dialog = event.target.closest("dialog") || event.target
  if (dialog instanceof HTMLDialogElement && dialog.open) {
    dialog.close()
  }
}, true)
```

### Why This Works

1. `JS.dispatch` directly dispatches a custom DOM event without requiring any `data-*` attributes
2. The JavaScript event listeners catch these custom events and call the native HTML `<dialog>` methods (`showModal()` and `close()`)
3. Using document-level capture phase (`true` as third argument) ensures the event is caught regardless of where it bubbles

## Key Takeaways

### When to Use `JS.exec` vs `JS.dispatch`

| Use Case | Approach |
|----------|----------|
| Trigger a named command defined via `data-*` attribute | `JS.exec("commandName()", to: selector)` |
| Dispatch a custom event for JavaScript to handle | `JS.dispatch("event:name", to: selector)` |
| Need to call native DOM methods (showModal, close, etc.) | `JS.dispatch` + JavaScript event listener |

### DaisyUI v5 Modal Pattern

DaisyUI v5 uses native HTML `<dialog>` elements. To integrate with Phoenix LiveView:

1. Use `JS.dispatch` to trigger custom events
2. Add JavaScript event listeners that call native `<dialog>` methods
3. The `data-*` attributes approach with `JS.exec` is more complex and error-prone for this use case

### Debugging Tips

1. Check the browser console for the exact error message
2. Understand that `JS.exec("name()")` looks for `data-name` attribute
3. When dealing with native DOM APIs, prefer `JS.dispatch` over `JS.exec`
4. Use Playwright tests to verify modal visibility with multiple selectors:
   - `.modal-box` visibility
   - `dialog.modal[open]` existence
   - `dialog[open]` attribute presence

## Files Modified

1. `lib/mce_web/components/core_components.ex` - `show_modal/2` and `hide_modal/2` functions
2. `assets/js/app.js` - Modal event listeners

## Testing

Verified with Playwright automation test:
- Login to application
- Navigate to Farms page
- Click dropdown menu on farm card
- Click Edit button
- Verify URL changes to `/farms/{id}/edit`
- Verify modal is visible (`.modal-box`, `dialog[open]`)
- Verify form fields are populated

## References

- [Phoenix.LiveView.JS documentation](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.JS.html)
- [DaisyUI Modal documentation](https://daisyui.com/components/modal/)
- [MDN HTMLDialogElement](https://developer.mozilla.org/en-US/docs/Web/API/HTMLDialogElement)
