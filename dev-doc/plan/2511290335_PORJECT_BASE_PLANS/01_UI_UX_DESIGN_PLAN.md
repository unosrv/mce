# UI/UX Design Plan

**Document ID**: 2511290341_UI_UX_DESIGN_PLAN
**Created**: 29 November 2025, 03:41
**Status**: Planning

---

## Design Philosophy

### Core Principles

1. **Clarity First** - Complex data presented simply
2. **Professional Trust** - Clean, authoritative aesthetic for scientific calculations
3. **Progressive Disclosure** - Multi-step forms to reduce cognitive load
4. **Instant Feedback** - LiveView for real-time validation and updates
5. **Accessibility** - Clear contrast, readable typography, keyboard navigation

### Competitive Advantage

Most livestock carbon calculators have dated, form-heavy interfaces. MCE will differentiate through:
- Modern dashboard design with data visualisation
- Clean, minimal form layouts
- Professional colour scheme (environmental green tones)
- Consistent component library

---

## Design System

### Colour Palette

Based on DaisyUI theming with environmental context:

| Colour | OKLCH Value | Usage |
|--------|-------------|-------|
| **Primary** (Forest Green) | `oklch(0.45 0.14 145)` | Primary actions, CTAs, active states |
| **Secondary** (Ocean Blue) | `oklch(0.55 0.12 220)` | Secondary actions, links, info |
| **Accent** (Sunlight Gold) | `oklch(0.65 0.15 85)` | Highlights, badges, emphasis |
| **Neutral** | `oklch(0.35 0.02 260)` | Text, borders |
| **Base-100** | `oklch(0.98 0 0)` | Background (light) |
| **Success** | `oklch(0.65 0.18 145)` | Positive emissions, targets met |
| **Warning** | `oklch(0.75 0.15 85)` | Medium emissions, alerts |
| **Error** | `oklch(0.55 0.22 25)` | High emissions, validation errors |

### Typography

| Element | Font | Size | Weight |
|---------|------|------|--------|
| H1 | System sans-serif | 2rem / 32px | Bold (700) |
| H2 | System sans-serif | 1.5rem / 24px | Semibold (600) |
| H3 | System sans-serif | 1.25rem / 20px | Semibold (600) |
| Body | System sans-serif | 1rem / 16px | Regular (400) |
| Small | System sans-serif | 0.875rem / 14px | Regular (400) |
| Caption | System sans-serif | 0.75rem / 12px | Regular (400) |

### Spacing Scale

Based on 4px grid:
- `xs`: 4px
- `sm`: 8px
- `md`: 16px
- `lg`: 24px
- `xl`: 32px
- `2xl`: 48px

### Border Radius

| Element | Radius |
|---------|--------|
| Buttons | 0.375rem (6px) |
| Inputs | 0.375rem (6px) |
| Cards | 0.75rem (12px) |
| Modals | 1rem (16px) |

---

## Component Library

### Core Components (DaisyUI)

| Component | Usage | DaisyUI Class |
|-----------|-------|---------------|
| **Button** | Actions | `btn btn-primary`, `btn-secondary`, `btn-ghost` |
| **Card** | Content containers | `card bg-base-100 shadow-xl` |
| **Stats** | KPI display | `stats shadow` |
| **Steps** | Multi-step form progress | `steps` |
| **Tabs** | Section navigation | `tabs tabs-lifted` |
| **Modal** | Dialogs, confirmations | `modal` |
| **Alert** | Notifications | `alert alert-info`, `alert-error` |
| **Badge** | Labels, tags | `badge badge-primary` |
| **Dropdown** | Menus | `dropdown` |
| **Table** | Data display | `table` |

### Custom Components to Build

| Component | Purpose |
|-----------|---------|
| `<.language_switcher>` | Locale selection with flags |
| `<.theme_toggle>` | Light/dark mode switch |
| `<.farm_card>` | Farm summary display |
| `<.emission_stat>` | Emissions KPI with icon |
| `<.step_form>` | Multi-step form wrapper |
| `<.address_input>` | Country-specific address autocomplete |
| `<.chart_container>` | ApexCharts wrapper component |

---

## Page Layouts

### Dashboard Layout

```
┌─────────────────────────────────────────────────────────────┐
│ NAVBAR (Logo | Navigation | Language | Theme | User)        │
├─────────────────────────────────────────────────────────────┤
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ STATS ROW                                               │ │
│ │ [Total Emissions] [Active Farms] [Livestock Groups]    │ │
│ └─────────────────────────────────────────────────────────┘ │
│ ┌───────────────────────────┐ ┌───────────────────────────┐ │
│ │ CHART: Monthly Trend      │ │ CHART: Emissions by Type  │ │
│ │                           │ │                           │ │
│ │                           │ │                           │ │
│ └───────────────────────────┘ └───────────────────────────┘ │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ RECENT FARMS TABLE                                      │ │
│ │ Name | Country | Livestock | Emissions | Actions        │ │
│ └─────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

### Farm Management Layout

```
┌─────────────────────────────────────────────────────────────┐
│ NAVBAR                                                      │
├─────────────────────────────────────────────────────────────┤
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ PAGE HEADER: Farms | [+ Add Farm]                       │ │
│ └─────────────────────────────────────────────────────────┘ │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ FILTER BAR: [Country ▼] [Search...]                     │ │
│ └─────────────────────────────────────────────────────────┘ │
│ ┌───────────┐ ┌───────────┐ ┌───────────┐ ┌───────────┐     │
│ │ Farm Card │ │ Farm Card │ │ Farm Card │ │ Farm Card │     │
│ │           │ │           │ │           │ │           │     │
│ └───────────┘ └───────────┘ └───────────┘ └───────────┘     │
│ ┌───────────┐ ┌───────────┐                                 │
│ │ Farm Card │ │ Farm Card │                                 │
│ └───────────┘ └───────────┘                                 │
└─────────────────────────────────────────────────────────────┘
```

### 5-Step Form Layout

```
┌─────────────────────────────────────────────────────────────┐
│ NAVBAR                                                      │
├─────────────────────────────────────────────────────────────┤
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ STEPS INDICATOR                                         │ │
│ │ [1.Basic●]──[2.Feed○]──[3.Housing○]──[4.Barn○]──[5.Manure○] │
│ └─────────────────────────────────────────────────────────┘ │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ FORM CARD                                               │ │
│ │ ┌─────────────────────────────────────────────────────┐ │ │
│ │ │ Step Title: "Basic Information"                     │ │ │
│ │ ├─────────────────────────────────────────────────────┤ │ │
│ │ │ Form Fields...                                      │ │ │
│ │ │ [Species ▼] [Head Count ___] [Avg Weight ___]      │ │ │
│ │ │ [Milk Yield ___] (conditional)                     │ │ │
│ │ └─────────────────────────────────────────────────────┘ │ │
│ │ ┌─────────────────────────────────────────────────────┐ │ │
│ │ │ [← Previous]                         [Next Step →] │ │ │
│ │ └─────────────────────────────────────────────────────┘ │ │
│ └─────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

### Report Layout

```
┌─────────────────────────────────────────────────────────────┐
│ NAVBAR                                                      │
├─────────────────────────────────────────────────────────────┤
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ REPORT HEADER                                           │ │
│ │ Farm Name | Period: 2025 | [Download PDF] [Print]       │ │
│ └─────────────────────────────────────────────────────────┘ │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ TABS: [Overview●] [Enteric] [Manure] [Feed] [Energy]    │ │
│ └─────────────────────────────────────────────────────────┘ │
│ ┌───────────────────────────┐ ┌───────────────────────────┐ │
│ │ TOTAL EMISSIONS           │ │ PIE CHART                 │ │
│ │ 1,250 tonnes CO₂e         │ │ Emissions by Category     │ │
│ └───────────────────────────┘ └───────────────────────────┘ │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ BREAKDOWN TABLE                                         │ │
│ │ Category | Livestock Group | CH₄ | N₂O | CO₂e          │ │
│ └─────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

---

## Design References

### Best-in-Class Inspiration

| Platform | Strengths | Apply To |
|----------|-----------|----------|
| **Farm Carbon Calculator (UK)** | Clean forms, progress indicators | 5-step form, results |
| **Agrecalc** | Professional dashboard, reports | Dashboard, PDF export |
| **CarbonCloud** | Modern SaaS aesthetic, visualisation | Overall styling, charts |
| **Carbon Maps** | Enterprise dashboard patterns | KPI cards, tables |
| **Terrascope** | Premium styling, data presentation | Report pages |

### Visual Reference URLs

1. Farm Carbon Calculator: https://calculator.farmcarbontoolkit.org.uk/
2. Agrecalc: https://agrecalc.com/
3. CarbonCloud: https://carboncloud.com/
4. Carbon Maps: https://www.carbonmaps.io/
5. Terrascope: https://www.terrascope.com

### DaisyUI Resources

- Theme Generator: https://daisyui.com/theme-generator/
- Component Library: https://daisyui.com/components/
- Tailwind CSS Docs: https://tailwindcss.com/docs

---

## Icons

Use Heroicons via Phoenix's built-in `<.icon>` component:

| Context | Icon | Class |
|---------|------|-------|
| Farms | `hero-building-office-2` | Navigation, cards |
| Livestock | `hero-beaker` | Livestock groups |
| Emissions | `hero-fire` | Reports, stats |
| Dashboard | `hero-chart-bar` | Navigation |
| Settings | `hero-cog-6-tooth` | User menu |
| Add | `hero-plus` | Create buttons |
| Edit | `hero-pencil` | Edit actions |
| Delete | `hero-trash` | Delete actions |
| Download | `hero-arrow-down-tray` | PDF export |
| Success | `hero-check-circle` | Confirmations |
| Warning | `hero-exclamation-triangle` | Alerts |
| Error | `hero-x-circle` | Errors |

---

## Responsive Breakpoints

PC-first design with responsive support:

| Breakpoint | Width | Layout |
|------------|-------|--------|
| `sm` | 640px | Single column |
| `md` | 768px | Two columns |
| `lg` | 1024px | Full layout |
| `xl` | 1280px | Full layout with sidebar |
| `2xl` | 1536px | Wide layout |

---

## Motion & Animation

Keep animations subtle and purposeful:

| Element | Animation | Duration |
|---------|-----------|----------|
| Page transitions | Fade | 150ms |
| Modal open/close | Scale + fade | 200ms |
| Button hover | Background colour | 150ms |
| Form validation | Shake (error) | 300ms |
| Toast notifications | Slide in | 200ms |
| Loading states | Pulse | Infinite |

---

## Dark Mode

Support light/dark themes via DaisyUI theme controller:

- Default: Light theme (`mce-light`)
- Alternative: Dark theme (`mce-dark`)
- Persistence: localStorage
- Toggle: Theme toggle component in navbar

---

## Accessibility Checklist

- [ ] Colour contrast ratio ≥ 4.5:1 (WCAG AA)
- [ ] Focus indicators visible on all interactive elements
- [ ] Form labels properly associated with inputs
- [ ] Error messages announced to screen readers
- [ ] Keyboard navigation for all actions
- [ ] Alt text for informational images
- [ ] Skip to content link

---

## Implementation Priority

### Phase 1 (Foundation)
1. Configure DaisyUI custom theme
2. Set up layout components (navbar, footer)
3. Override core_components.ex inputs for DaisyUI styling
4. Create language switcher component

### Phase 2 (Core Pages)
1. Dashboard layout with stat cards
2. Farm cards and list views
3. 5-step form with progress indicator
4. Address input components

### Phase 3 (Polish)
1. Report page with tabs
2. Chart components integration
3. Modal dialogs
4. Toast notifications
5. Loading states

---

## Design Tokens File

Create `assets/css/tokens.css`:

```css
:root {
  /* Colours - use OKLCH for DaisyUI 5 */
  --color-brand-green: oklch(0.45 0.14 145);
  --color-brand-blue: oklch(0.55 0.12 220);
  --color-brand-gold: oklch(0.65 0.15 85);

  /* Spacing */
  --space-xs: 0.25rem;
  --space-sm: 0.5rem;
  --space-md: 1rem;
  --space-lg: 1.5rem;
  --space-xl: 2rem;
  --space-2xl: 3rem;

  /* Typography */
  --font-size-xs: 0.75rem;
  --font-size-sm: 0.875rem;
  --font-size-base: 1rem;
  --font-size-lg: 1.125rem;
  --font-size-xl: 1.25rem;
  --font-size-2xl: 1.5rem;
  --font-size-3xl: 2rem;

  /* Borders */
  --radius-sm: 0.25rem;
  --radius-md: 0.375rem;
  --radius-lg: 0.75rem;
  --radius-xl: 1rem;

  /* Shadows */
  --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
  --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1);
  --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1);
}
```

---

## Change Log

| Date | Change | Author |
|------|--------|--------|
| 2511290341 | Initial design plan creation | Claude |

