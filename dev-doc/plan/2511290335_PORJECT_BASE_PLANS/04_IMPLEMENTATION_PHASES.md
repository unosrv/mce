# Implementation Phases Plan

**Document ID**: 2511290341_IMPLEMENTATION_PHASES
**Created**: 29 November 2025, 03:41
**Status**: Planning

---

## Phase Overview

```
┌─────────────────────────────────────────────────────────────────────┐
│                    IMPLEMENTATION ROADMAP                            │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  PHASE 1: Foundation                                                │
│  ┌──────────────────────────────────────────────────────────────┐  │
│  │ i18n → Theme → Auth → DB Schema → Farm CRUD                  │  │
│  └──────────────────────────────────────────────────────────────┘  │
│                              ↓                                       │
│  PHASE 2: Core Features                                             │
│  ┌──────────────────────────────────────────────────────────────┐  │
│  │ Address API → 5-Step Form → IPCC Engine → Reports            │  │
│  └──────────────────────────────────────────────────────────────┘  │
│                              ↓                                       │
│  PHASE 3: Dashboard & Polish                                        │
│  ┌──────────────────────────────────────────────────────────────┐  │
│  │ Charts → Dashboard → PDF → Admin Panel → Refinement          │  │
│  └──────────────────────────────────────────────────────────────┘  │
│                              ↓                                       │
│  PHASE 4: Testing & Delivery                                        │
│  ┌──────────────────────────────────────────────────────────────┐  │
│  │ Integration Tests → Performance → Documentation → Deploy     │  │
│  └──────────────────────────────────────────────────────────────┘  │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Phase 1: Foundation

### Objective
Establish core infrastructure, authentication, and basic farm management.

### Prerequisites
- [x] PRD Documentation complete
- [x] Technical research complete
- [ ] Client ERD received (optional - can proceed with proposed schema)

### Tasks

#### 1.1 i18n Infrastructure Setup
| Task | Priority | Status |
|------|----------|--------|
| Configure Gettext with locales (ko, en, pt_BR) | P0 | ☐ |
| Create SetLocale plug | P0 | ☐ |
| Create LiveView locale hook | P0 | ☐ |
| Set up domain structure (default, errors, farms, emissions) | P0 | ☐ |
| Create language switcher component | P0 | ☐ |
| Implement unit conversion module | P0 | ☐ |
| Extract initial .pot files | P0 | ☐ |

**Acceptance Criteria**:
- Locale switching works across all pages
- Unit conversion displays correctly by locale
- All existing strings use gettext

#### 1.2 DaisyUI Theme Configuration
| Task | Priority | Status |
|------|----------|--------|
| Configure custom theme colours (mce-light, mce-dark) | P0 | ☐ |
| Remove default Phoenix styling | P0 | ☐ |
| Override core_components.ex for DaisyUI styling | P0 | ☐ |
| Create theme toggle component | P1 | ☐ |
| Set up design tokens file | P1 | ☐ |

**Acceptance Criteria**:
- App uses environmental colour scheme
- All form inputs styled with DaisyUI
- Light/dark theme toggle works

#### 1.3 Authentication System
| Task | Priority | Status |
|------|----------|--------|
| Generate auth with `mix phx.gen.auth Accounts User users` | P0 | ☐ |
| Translate all auth pages to Korean (default) | P0 | ☐ |
| Style auth forms with DaisyUI | P0 | ☐ |
| Add nickname field to registration | P0 | ☐ |
| Configure email confirmation (optional for MVP) | P2 | ☐ |

**Acceptance Criteria**:
- User can register with email, password, nickname
- User can log in and log out
- Auth pages match design system

#### 1.4 Database Schema Implementation
| Task | Priority | Status |
|------|----------|--------|
| Create users migration (via phx.gen.auth) | P0 | ☐ |
| Create farms migration | P0 | ☐ |
| Create livestock_groups migration | P0 | ☐ |
| Create feed_items migration | P0 | ☐ |
| Create housing_periods migration | P0 | ☐ |
| Create barn_info migration | P0 | ☐ |
| Create manure_systems migration | P0 | ☐ |
| Create emission_reports migration | P0 | ☐ |
| Create reference data migrations (presets, IPCC factors) | P1 | ☐ |
| Create seed data files | P1 | ☐ |

**Acceptance Criteria**:
- All migrations run without errors
- Schema matches PRD requirements
- Seed data loads correctly

#### 1.5 Farm Management CRUD
| Task | Priority | Status |
|------|----------|--------|
| Create Farms context module | P0 | ☐ |
| Create Farm schema with changesets | P0 | ☐ |
| Create FarmLive.Index (list view) | P0 | ☐ |
| Create FarmLive.Show (detail view) | P0 | ☐ |
| Create farm_card component | P0 | ☐ |
| Create farm form component | P0 | ☐ |
| Add country selection with flag icons | P0 | ☐ |
| Add fiscal year configuration | P1 | ☐ |

**Acceptance Criteria**:
- User can create, view, edit, delete farms
- Country selection shows flags
- Farm cards display on list page

---

## Phase 2: Core Features

### Objective
Implement address integration, livestock management, and IPCC calculation engine.

### Prerequisites
- Phase 1 complete
- [ ] Google Maps API key configured
- [ ] juso.go.kr API key configured

### Tasks

#### 2.1 Address API Integration
| Task | Priority | Status |
|------|----------|--------|
| Create Juso API client module | P0 | ☐ |
| Create Google Maps Places API client module | P0 | ☐ |
| Create address_input component (country-aware) | P0 | ☐ |
| Implement Korean address autocomplete | P0 | ☐ |
| Implement US/BR address autocomplete | P0 | ☐ |
| Add map preview to farm form | P2 | ☐ |
| Store coordinates from API responses | P1 | ☐ |

**Acceptance Criteria**:
- Korean farms use juso.go.kr autocomplete
- US/BR farms use Google Places autocomplete
- Address format adapts by country

#### 2.2 Livestock Group 5-Step Form
| Task | Priority | Status |
|------|----------|--------|
| Create Livestock context module | P0 | ☐ |
| Create LivestockGroup schema with changesets | P0 | ☐ |
| Create step_form wrapper component | P0 | ☐ |
| Create steps progress indicator component | P0 | ☐ |
| **Step 1: Basic Info** | | |
| - Species selection with icons | P0 | ☐ |
| - Head count, weight, milk yield inputs | P0 | ☐ |
| - Conditional dairy fields | P0 | ☐ |
| **Step 2: Feed** | | |
| - Dynamic feed item list (max 10) | P0 | ☐ |
| - Feed preset selector | P1 | ☐ |
| - Additive configuration | P1 | ☐ |
| **Step 3: Housing Environment** | | |
| - Monthly ratio inputs (12 months) | P0 | ☐ |
| - Percentage validation (sum = 100%) | P0 | ☐ |
| - Bulk fill options | P2 | ☐ |
| **Step 4: Barn Info** | | |
| - Barn type selection | P0 | ☐ |
| - Area calculations | P0 | ☐ |
| - Temperature/climate settings | P1 | ☐ |
| **Step 5: Manure Management** | | |
| - Management system selection | P0 | ☐ |
| - Branching logic for digesters | P0 | ☐ |
| - Separator configuration | P1 | ☐ |
| Create LivestockLive.WizardLive module | P0 | ☐ |
| Add step validation before progression | P0 | ☐ |
| Add save draft functionality | P2 | ☐ |

**Acceptance Criteria**:
- 5-step wizard navigates correctly
- Each step validates before allowing next
- Form saves complete livestock group
- Branching logic works for manure systems

#### 2.3 IPCC Calculation Engine
| Task | Priority | Status |
|------|----------|--------|
| Create Emissions context module | P0 | ☐ |
| Create Calculator module (main entry point) | P0 | ☐ |
| **Enteric Fermentation** | | |
| - Implement GE calculation | P0 | ☐ |
| - Implement NE components (m, a, l, p, g) | P0 | ☐ |
| - Implement Ym lookup by species/feed | P0 | ☐ |
| - Calculate CH₄ emissions | P0 | ☐ |
| **Manure Management** | | |
| - Implement VS calculation | P0 | ☐ |
| - Implement MCF lookup by system/climate | P0 | ☐ |
| - Calculate CH₄ from manure | P0 | ☐ |
| - Calculate N₂O (direct + indirect) | P0 | ☐ |
| **Aggregation** | | |
| - Sum emissions by source | P0 | ☐ |
| - Convert to CO₂e (GWP factors) | P0 | ☐ |
| - Calculate farm totals | P0 | ☐ |
| Create EmissionFactors module (IPCC defaults) | P0 | ☐ |
| Add calculation logging for audit trail | P1 | ☐ |
| Write unit tests for calculations | P0 | ☐ |

**Acceptance Criteria**:
- Calculations follow IPCC Tier 2 methodology
- Results match manual calculation verification
- Emission factors are configurable
- Calculations are testable and documented

#### 2.4 Emissions Report Generation
| Task | Priority | Status |
|------|----------|--------|
| Create Report schema | P0 | ☐ |
| Create report generation function | P0 | ☐ |
| Create ReportLive.Show module | P0 | ☐ |
| Design report layout with tabs | P0 | ☐ |
| Create summary view (total emissions) | P0 | ☐ |
| Create breakdown by emission source | P0 | ☐ |
| Create breakdown by livestock group | P0 | ☐ |
| Add comparison to previous period | P2 | ☐ |

**Acceptance Criteria**:
- Report generates for any farm
- Breakdown shows all emission sources
- Data matches calculation results
- Report displays correctly in all locales

---

## Phase 3: Dashboard & Polish

### Objective
Implement data visualisation, PDF export, admin panel, and UI refinement.

### Prerequisites
- Phase 2 complete
- [ ] ApexCharts JS library included

### Tasks

#### 3.1 Charts Integration
| Task | Priority | Status |
|------|----------|--------|
| Add ApexCharts via CDN or npm | P0 | ☐ |
| Create chart_container component | P0 | ☐ |
| Create phx-hook for ApexCharts | P0 | ☐ |
| Implement line chart (monthly trends) | P0 | ☐ |
| Implement pie chart (emissions by type) | P0 | ☐ |
| Implement bar chart (farm comparison) | P1 | ☐ |
| Add chart theme support (light/dark) | P1 | ☐ |
| Add locale support for chart labels | P0 | ☐ |

**Acceptance Criteria**:
- Charts render correctly
- Charts update with LiveView
- Charts respect theme settings
- Labels are translated

#### 3.2 Dashboard Implementation
| Task | Priority | Status |
|------|----------|--------|
| Create DashboardLive module | P0 | ☐ |
| Implement stats cards (KPIs) | P0 | ☐ |
| Implement monthly trend chart | P0 | ☐ |
| Implement emissions by type chart | P0 | ☐ |
| Implement recent farms table | P0 | ☐ |
| Add farm comparison view | P1 | ☐ |
| Add date range selector | P2 | ☐ |

**Acceptance Criteria**:
- Dashboard loads quickly
- Stats reflect accurate data
- Charts are interactive
- Responsive layout works

#### 3.3 PDF Export
| Task | Priority | Status |
|------|----------|--------|
| Evaluate PDF libraries (chromic_pdf vs pdf_generator) | P0 | ☐ |
| Create PDF template for report | P0 | ☐ |
| Implement PDF generation function | P0 | ☐ |
| Create PDF download controller | P0 | ☐ |
| Add farm branding (optional) | P2 | ☐ |
| Style PDF for print | P0 | ☐ |

**Acceptance Criteria**:
- PDF generates from report page
- PDF is downloadable
- PDF content matches report
- PDF is print-friendly

#### 3.4 Backpex Admin Panel
| Task | Priority | Status |
|------|----------|--------|
| Add Backpex dependency | P0 | ☐ |
| Configure Backpex for Users resource | P0 | ☐ |
| Configure Backpex for Farms resource | P0 | ☐ |
| Configure Backpex for LivestockGroups resource | P0 | ☐ |
| Configure Backpex for Feed Presets | P0 | ☐ |
| Configure Backpex for IPCC Factors | P1 | ☐ |
| Add admin authentication guard | P0 | ☐ |
| Add dashboard widget for admin | P2 | ☐ |

**Acceptance Criteria**:
- Admin can manage all resources
- Admin panel is protected
- CRUD operations work correctly

#### 3.5 UI/UX Refinement
| Task | Priority | Status |
|------|----------|--------|
| Review all pages for design consistency | P0 | ☐ |
| Add loading states/skeletons | P1 | ☐ |
| Add toast notifications | P1 | ☐ |
| Improve form error messages | P0 | ☐ |
| Add empty states | P1 | ☐ |
| Test and fix responsive layouts | P0 | ☐ |
| Add confirmation dialogs for destructive actions | P0 | ☐ |
| Implement keyboard shortcuts | P2 | ☐ |

**Acceptance Criteria**:
- Consistent visual design throughout
- Good UX feedback (loading, errors, success)
- Mobile-friendly layouts
- Accessible interactions

---

## Phase 4: Testing & Delivery

### Objective
Ensure quality, optimise performance, and prepare for deployment.

### Prerequisites
- Phase 3 complete

### Tasks

#### 4.1 Testing
| Task | Priority | Status |
|------|----------|--------|
| Write context unit tests | P0 | ☐ |
| Write calculation engine tests | P0 | ☐ |
| Write LiveView integration tests | P0 | ☐ |
| Write form submission tests | P0 | ☐ |
| Test i18n across all locales | P0 | ☐ |
| Test external API integrations | P1 | ☐ |
| Manual UI testing with playwright | P0 | ☐ |

**Acceptance Criteria**:
- Test coverage > 80% for contexts
- All LiveViews have integration tests
- Calculations verified with known values

#### 4.2 Performance Optimisation
| Task | Priority | Status |
|------|----------|--------|
| Profile database queries | P1 | ☐ |
| Add missing indexes | P1 | ☐ |
| Optimise LiveView streams | P1 | ☐ |
| Implement caching where appropriate | P2 | ☐ |
| Optimise asset loading | P1 | ☐ |
| Test with realistic data volumes | P1 | ☐ |

**Acceptance Criteria**:
- Page load < 2 seconds
- LiveView updates < 100ms
- No N+1 query issues

#### 4.3 Documentation
| Task | Priority | Status |
|------|----------|--------|
| Update README with setup instructions | P0 | ☐ |
| Document API keys and environment variables | P0 | ☐ |
| Document IPCC calculation methodology | P1 | ☐ |
| Create user guide (if required) | P2 | ☐ |

**Acceptance Criteria**:
- New developer can set up project
- Environment configuration documented
- Key decisions documented

#### 4.4 Deployment Preparation
| Task | Priority | Status |
|------|----------|--------|
| Configure production environment | P0 | ☐ |
| Set up SSL certificate | P0 | ☐ |
| Configure database backups | P0 | ☐ |
| Set up error monitoring | P1 | ☐ |
| Configure log aggregation | P1 | ☐ |
| Create deployment checklist | P0 | ☐ |

**Acceptance Criteria**:
- Production environment ready
- Deployment process documented
- Monitoring in place

---

## Task Dependencies

```
i18n Setup ─────────────────┐
                            ├──→ Farm CRUD ──→ Address API ──→ 5-Step Form
Theme Setup ────────────────┤                                      │
                            │                                      ↓
Auth Setup ─────────────────┘                              Calculation Engine
                                                                   │
DB Schema ──────────────────────────────────────────────────→ Report Generation
                                                                   │
                                                                   ↓
                                                              Dashboard
                                                                   │
                                                                   ↓
                                                            PDF Export ──→ Testing
                                                                   │
                                                            Admin Panel
```

---

## Risk Mitigation

| Risk | Mitigation |
|------|------------|
| ERD not received | Proceed with proposed schema, adapt later |
| API keys delayed | Use mock data during development |
| IPCC complexity | Validate calculations with external examples |
| Design feedback loops | Share prototypes early and often |

---

## Definition of Done

For each task:
- [ ] Code implemented and working
- [ ] All strings use gettext (i18n ready)
- [ ] DaisyUI styling applied
- [ ] Tests written (where applicable)
- [ ] Reviewed for AGENTS.md compliance
- [ ] `mix precommit` passes

---

## Change Log

| Date | Change | Author |
|------|--------|--------|
| 2511290341 | Initial implementation plan | Claude |

