# Backpex Admin Collapsible Sidebar Implementation Report

**Date:** 2025-12-01
**Author:** Development Team
**Status:** Completed

## Overview

This report documents the implementation of a responsive collapsible icon-only drawer sidebar for the Backpex admin panel. The implementation uses DaisyUI 5.5.5's `is-drawer-open` and `is-drawer-close` variants to create a sidebar that collapses to show only icons on desktop while providing full overlay on mobile.

## Background

### The Challenge

Backpex provides a default admin layout via `Backpex.HTML.Layout.app_shell`, but this layout may not fit all design requirements. Our goal was to:

1. Create a collapsible sidebar that shows icons-only when collapsed
2. Display tooltips on hover in collapsed mode
3. Support mobile overlay drawer
4. Maintain Backpex functionality (flash messages, resource views)

### Key Technologies

| Technology | Version | Purpose |
|------------|---------|---------|
| Phoenix LiveView | 1.1.18 | Real-time UI framework |
| Backpex | 0.16.3 | Admin panel generator |
| DaisyUI | 5.5.5 | Tailwind CSS component library |
| Tailwind CSS | 4.x | Utility-first CSS framework |

## Understanding Backpex Layout System

### How Backpex Uses Layouts

Backpex LiveResources specify their layout via the `layout` option:

```elixir
defmodule MceWeb.Admin.UserLive do
  use Backpex.LiveResource,
    adapter: Backpex.Adapters.Ecto,
    adapter_config: [...],
    layout: {MceWeb.Layouts, :admin}  # <-- Custom layout
```

This tells Backpex to use the `admin/1` function from `MceWeb.Layouts` instead of the default `Backpex.HTML.Layout.app_shell`.

### Default Backpex Layout Structure

The default Backpex layout (`deps/backpex/priv/templates/layouts/admin.html.heex`) uses:

```heex
<Backpex.HTML.Layout.app_shell fluid={@fluid?}>
  <:topbar>...</:topbar>
  <:sidebar>...</:sidebar>
  <Backpex.HTML.Layout.flash_messages flash={@flash} />
  {render_slot(@inner_block)}
</Backpex.HTML.Layout.app_shell>
```

### Custom Layout Requirements

When creating a custom layout for Backpex, you must:

1. Accept the required assigns (`flash`, `current_url`, `fluid?`, etc.)
2. Include `Backpex.HTML.Layout.flash_messages` for notifications
3. Render `@inner_block` for the resource content

## DaisyUI Drawer Component Pattern

### The `is-drawer-open` / `is-drawer-close` Variants

DaisyUI 5.5.5 introduced conditional styling variants:

- `is-drawer-open:*` - Styles applied when drawer checkbox is checked
- `is-drawer-close:*` - Styles applied when drawer checkbox is unchecked

These variants work within the `.drawer-side` element and its children.

### Reference Pattern from DaisyUI Docs

```html
<div class="drawer lg:drawer-open">
  <input id="my-drawer" type="checkbox" class="drawer-toggle" />
  <div class="drawer-content">
    <!-- Navbar with toggle button -->
    <nav class="navbar">
      <label for="my-drawer" class="btn btn-square btn-ghost">
        <!-- Toggle icon -->
      </label>
    </nav>
    <!-- Page content -->
  </div>

  <div class="drawer-side is-drawer-close:overflow-visible">
    <label for="my-drawer" class="drawer-overlay"></label>
    <div class="is-drawer-close:w-14 is-drawer-open:w-64">
      <!-- Sidebar content with conditional visibility -->
      <span class="is-drawer-close:hidden">Label Text</span>
    </div>
  </div>
</div>
```

### Key CSS Classes

| Class | Purpose |
|-------|---------|
| `drawer` | Container for drawer pattern |
| `lg:drawer-open` | Auto-open drawer on large screens |
| `drawer-toggle` | Hidden checkbox controlling state |
| `drawer-content` | Main content area |
| `drawer-side` | Sidebar container |
| `drawer-overlay` | Click-to-close overlay on mobile |
| `is-drawer-close:w-14` | Narrow width when closed |
| `is-drawer-open:w-64` | Full width when open |
| `is-drawer-close:hidden` | Hide element when closed |
| `is-drawer-close:tooltip` | Show tooltip when closed |

## Implementation Details

### Step 1: Define Layout Attributes

```elixir
@doc """
Admin layout for Backpex admin panel with responsive collapsible sidebar.
"""
attr :flash, :map, required: true, doc: "the map of flash messages"
attr :fluid?, :boolean, default: true, doc: "if the content uses full width"
attr :current_url, :string, required: true, doc: "the current url"
attr :current_scope, :map, default: nil, doc: "the current scope with user info"
attr :locale, :string, default: "ko", doc: "the current locale"

slot :inner_block, required: true
```

### Step 2: Drawer Container Structure

```heex
<div class="drawer lg:drawer-open h-screen overflow-hidden">
  <input id="admin-drawer" type="checkbox" class="drawer-toggle" />

  <!-- Main Content Area -->
  <div class="drawer-content flex flex-col min-w-0 h-full overflow-hidden">
    ...
  </div>

  <!-- Sidebar -->
  <div class="drawer-side z-50 is-drawer-close:overflow-visible">
    ...
  </div>
</div>
```

### Step 3: Toggle Button in Navbar

```heex
<nav class="navbar w-full bg-base-100 border-b border-base-300 sticky top-0 z-40">
  <label for="admin-drawer" aria-label="toggle sidebar" class="btn btn-square btn-ghost">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="size-5" ...>
      <path d="M4 4m0 2a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2z" />
      <path d="M9 4v16" />
      <path d="M14 10l2 2l-2 2" />
    </svg>
  </label>
  ...
</nav>
```

### Step 4: Collapsible Sidebar Content

```heex
<div class="drawer-side z-50 is-drawer-close:overflow-visible">
  <label for="admin-drawer" aria-label="close sidebar" class="drawer-overlay"></label>
  <div class="flex min-h-full flex-col items-start bg-base-100 border-r border-base-300
              is-drawer-close:w-14 is-drawer-open:w-64 transition-[width] duration-200">

    <!-- Sidebar Header -->
    <div class="flex h-16 w-full items-center border-b border-base-300 px-4
                is-drawer-close:justify-center is-drawer-open:justify-start">
      <.link href={~p"/admin/users"} class="flex items-center gap-2 text-primary">
        <.icon name="hero-cog-8-tooth" class="size-7 shrink-0" />
        <span class="text-lg font-bold is-drawer-close:hidden">{gettext("Admin")}</span>
      </.link>
    </div>

    <!-- Navigation Menu -->
    <ul class="menu w-full grow gap-1 p-2">
      <li>
        <.link
          navigate={~p"/admin/users"}
          class={[
            "flex items-center gap-3",
            "is-drawer-close:justify-center",
            "is-drawer-close:tooltip is-drawer-close:tooltip-right",
            active_admin_link?(@current_url, "/admin/users") && "bg-primary/10 text-primary"
          ]}
          data-tip={gettext("Users")}
        >
          <.icon name="hero-users" class="size-5 shrink-0" />
          <span class="is-drawer-close:hidden">{gettext("Users")}</span>
        </.link>
      </li>
      ...
    </ul>
  </div>
</div>
```

### Step 5: Main Content Area with Backpex Integration

```heex
<main class="flex-1 min-h-0 bg-base-200/50 overflow-auto p-6">
  <Backpex.HTML.Layout.flash_messages flash={@flash} />
  <div class="max-w-full overflow-x-auto">
    {render_slot(@inner_block)}
  </div>
</main>
```

## Key Implementation Patterns

### 1. Active Link Highlighting

```elixir
defp active_admin_link?(current_url, path) do
  String.starts_with?(current_url, path)
end
```

Used in templates:
```heex
class={[
  "flex items-center gap-3",
  active_admin_link?(@current_url, "/admin/users") && "bg-primary/10 text-primary"
]}
```

### 2. Tooltip Integration

When sidebar is collapsed, tooltips show the menu item name:

```heex
<.link
  class="is-drawer-close:tooltip is-drawer-close:tooltip-right"
  data-tip={gettext("Users")}
>
```

### 3. Icon Shrink Prevention

Use `shrink-0` to prevent icons from shrinking when space is limited:

```heex
<.icon name="hero-users" class="size-5 shrink-0" />
```

### 4. Smooth Width Transition

```heex
<div class="is-drawer-close:w-14 is-drawer-open:w-64 transition-[width] duration-200">
```

## Backpex Configuration Updates

### Translator Functions

Backpex requires translator functions for internationalisation. Added to `lib/mce_web/components/core_components.ex`:

```elixir
def translate_backpex({msg, opts}) do
  if count = opts[:count] do
    Gettext.dngettext(MceWeb.Gettext, "backpex", msg, msg, count, opts)
  else
    Gettext.dgettext(MceWeb.Gettext, "backpex", msg, opts)
  end
end
```

Configuration in `config/config.exs`:

```elixir
config :backpex,
  pubsub_server: Mce.PubSub,
  translator_function: {MceWeb.CoreComponents, :translate_backpex},
  error_translator_function: {MceWeb.CoreComponents, :translate_error}
```

## Testing Approach

### Playwright Automated Tests

Created comprehensive UI tests covering:

1. **Desktop sidebar open** - Default expanded state on lg+ screens
2. **Toggle to collapsed** - Click toggle button, verify icon-only mode
3. **Tooltip on hover** - Verify tooltips appear in collapsed mode
4. **Toggle to expanded** - Verify full labels return
5. **Tablet view** - Verify responsive behaviour
6. **Mobile sidebar hidden** - Default hidden state
7. **Mobile drawer overlay** - Verify overlay opens correctly
8. **Navigation** - Verify links work and active state updates

### Test Script Structure

```javascript
// Login as admin
await page.fill('#login_form_password input[name="user[email]"]', 'admin@anysite.kr');
await page.fill('#login_form_password input[name="user[password]"]', 'AdminPassword123!');

// Navigate to admin
await page.goto(`${TARGET_URL}/admin/users`);

// Test toggle
const toggleButton = page.locator('label[for="admin-drawer"]').first();
await toggleButton.click();

// Verify tooltip
const usersMenuLink = page.locator('.drawer-side a[data-tip="Users"]');
await usersMenuLink.hover();
```

## File Changes Summary

| File | Changes |
|------|---------|
| `lib/mce_web/components/layouts.ex` | Replaced fixed sidebar with drawer pattern (~120 lines) |
| `lib/mce_web/components/core_components.ex` | Added `translate_backpex/1` function |
| `config/config.exs` | Added Backpex translator configuration |

## Responsive Behaviour Summary

| Breakpoint | Behaviour |
|------------|-----------|
| Mobile (<768px) | Sidebar hidden, opens as overlay |
| Tablet (768-1023px) | Same as mobile |
| Desktop (1024px+) | Sidebar open by default, toggle collapses to icons |

## Lessons Learned

### 1. DaisyUI Variants Work Within Context

The `is-drawer-open` and `is-drawer-close` variants only work on elements within `.drawer-side`. They check the state of the `.drawer-toggle` checkbox.

### 2. Overflow Handling is Critical

```heex
<div class="drawer-side is-drawer-close:overflow-visible">
```

Without `is-drawer-close:overflow-visible`, tooltips would be clipped by the narrow sidebar.

### 3. Custom Layouts Preserve Backpex Functionality

By including `Backpex.HTML.Layout.flash_messages` and properly rendering `@inner_block`, all Backpex resource features continue to work.

### 4. Height Management for Full-Screen Layout

```heex
<div class="drawer lg:drawer-open h-screen overflow-hidden">
  <div class="drawer-content flex flex-col min-w-0 h-full overflow-hidden">
    <main class="flex-1 min-h-0 overflow-auto">
```

This pattern ensures proper scrolling within the content area.

## Future Improvements

1. **State Persistence**: Use JavaScript localStorage to remember drawer state across navigation
2. **Toggle Icon Rotation**: Animate the toggle icon to indicate open/close state
3. **Submenu Support**: Add collapsible submenus for grouped navigation items
4. **Keyboard Navigation**: Add keyboard shortcuts for sidebar toggle

## References

- [DaisyUI Drawer Component](https://daisyui.com/components/drawer/)
- [DaisyUI 5.5.5 Changelog](https://daisyui.com/docs/changelog/) - `is-drawer-open`/`is-drawer-close` variants
- [Backpex Documentation](https://hexdocs.pm/backpex/readme.html)
- [Phoenix LiveView Layouts](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#module-layouts)

## Conclusion

Customising Backpex admin layouts is straightforward when you understand the layout system. By creating a custom layout function and specifying it in your LiveResource modules, you can fully control the admin panel's appearance while maintaining all Backpex functionality. The DaisyUI drawer component provides an elegant solution for responsive, collapsible sidebars with minimal JavaScript.
