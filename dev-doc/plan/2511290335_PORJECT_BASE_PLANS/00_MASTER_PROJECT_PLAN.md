# MCE Project Master Plan

**Document ID**: 2511290341_MASTER_PROJECT_PLAN
**Created**: 29 November 2025, 03:41
**Project**: MCE - Livestock Carbon Emissions SaaS Platform
**Status**: Planning Phase

---

## Executive Summary

MCE is a SaaS platform for measuring greenhouse gas emissions from livestock farms using IPCC Tier 2 methodology. The platform targets farmers in Korea, USA, and Brazil, providing automated carbon emission reports with multi-language support.

### Key Differentiators
1. **Superior UI/UX** - Modern, clean interface vs dated competitor designs
2. **True i18n** - Native language support with automatic unit conversion
3. **Real-time Feedback** - Phoenix LiveView for instant updates
4. **Korean Market Optimisation** - Native address integration via juso.go.kr

---

## Plan Document Index

| # | Document | Description |
|---|----------|-------------|
| 00 | [MASTER_PROJECT_PLAN.md](./00_MASTER_PROJECT_PLAN.md) | This document - overview and navigation |
| 01 | [UI_UX_DESIGN_PLAN.md](./01_UI_UX_DESIGN_PLAN.md) | Design system, components, visual language |
| 02 | [TECHNICAL_ARCHITECTURE.md](./02_TECHNICAL_ARCHITECTURE.md) | System architecture, technology stack |
| 03 | [DATABASE_SCHEMA_PLAN.md](./03_DATABASE_SCHEMA_PLAN.md) | Data models, relationships, migrations |
| 04 | [IMPLEMENTATION_PHASES.md](./04_IMPLEMENTATION_PHASES.md) | Phased delivery plan with tasks |
| 05 | [TASK_TRACKER.md](./05_TASK_TRACKER.md) | Progress tracking template |

---

## Project Scope

### Core Features (MVP)

| Feature | Priority | Complexity |
|---------|----------|------------|
| User Authentication | P0 | Medium |
| Farm Management | P0 | Medium |
| Livestock Group Management (5-step form) | P0 | High |
| IPCC Tier 2 Calculation Engine | P0 | High |
| Emissions Report Generation | P0 | Medium |
| Dashboard with Visualisations | P1 | Medium |
| PDF Export | P1 | Medium |
| Admin Panel (Backpex) | P1 | Low |

### Non-Functional Requirements

| Requirement | Target |
|-------------|--------|
| Languages | Korean (primary), English (US), Portuguese (Brazil) |
| Platform | PC Web only (responsive recommended) |
| Browser Support | Chrome, Edge, Safari (latest) |
| Calculation Accuracy | IPCC Tier 2 compliance (±20% uncertainty) |

---

## Technology Stack

### Core
| Layer | Technology |
|-------|------------|
| Backend | Elixir / Phoenix 1.8 |
| Frontend | Phoenix LiveView |
| Database | PostgreSQL 17 |
| CSS | Tailwind CSS 4 + DaisyUI 5 |

### Supporting
| Component | Technology |
|-----------|------------|
| Admin Panel | Backpex |
| Charts | ApexCharts (LiveCharts) |
| HTTP Client | Req |
| i18n | Gettext |
| Address (KR) | juso.go.kr API |
| Address (US/BR) | Google Maps Places API |
| PDF | TBD (chromic_pdf or pdf_generator) |

---

## High-Level Phases

### Phase 1: Foundation
- [x] PRD Documentation
- [x] Technical Research
- [ ] i18n Infrastructure Setup
- [ ] DaisyUI Theme Configuration
- [ ] Authentication System
- [ ] Database Schema Design

### Phase 2: Core Features
- [ ] Farm Management CRUD
- [ ] Address Integration (KR + Google Maps)
- [ ] Livestock Group 5-Step Form
- [ ] IPCC Calculation Engine

### Phase 3: Reporting & Polish
- [ ] Emissions Report Generation
- [ ] Dashboard with Charts
- [ ] PDF Export
- [ ] Backpex Admin Panel
- [ ] UI/UX Refinement

### Phase 4: Testing & Delivery
- [ ] Integration Testing
- [ ] Performance Optimisation
- [ ] Documentation
- [ ] Deployment

---

## Success Criteria

### Functional
- [ ] All PRD features implemented and functional
- [ ] IPCC Tier 2 calculations verified
- [ ] Multi-language support working (KO/EN/PT_BR)
- [ ] PDF reports generate correctly

### Quality
- [ ] UI/UX superior to reference platforms
- [ ] Consistent design language throughout
- [ ] Responsive layout (PC primary)
- [ ] No critical bugs in core flows

### Performance
- [ ] Page load < 2 seconds
- [ ] LiveView updates < 100ms
- [ ] PDF generation < 10 seconds

---

## Risk Register

| Risk | Severity | Mitigation |
|------|----------|------------|
| IPCC calculation complexity | High | Thorough methodology research (completed) |
| Multi-language validation | Medium | Early i18n infrastructure setup |
| Google Maps API costs | Medium | Session-based pricing, caching |
| PDF generation quality | Medium | Evaluate multiple libraries |
| Design approval delays | Medium | Early prototype sharing |

---

## Dependencies / Awaiting

| Item | Status | Impact |
|------|--------|--------|
| ERD from client | Pending | Database schema finalisation |
| Figma designs | Pending | UI component implementation |
| Detailed specification (A4 3p) | Pending | Feature clarification |
| Feed preset data | Pending | Data seeding |
| Report format requirements | Pending | PDF layout design |

---

## Clarified Requirements

| Question | Answer |
|----------|--------|
| **User Roles** | Admin users can access Backpex admin dashboard; regular users have standard farm management access |
| **Data Migration** | No existing data to import - fresh start |
| **Feed Presets** | Default preset data for major farming countries (USA, UK, Australia) |
| **Report Branding** | Yes, include farm logos in PDF reports if provided by user |
| **Fiscal Year Logic** | Determines start/end dates for annual reports, affecting data aggregation and period comparisons |

---

## Related Documents

### PRD
- `dev-doc/prd/2511290229_BASE_PRD_EN.md`
- `dev-doc/prd/2511290229_BASE_PRD_EN_WITH_DEV_COMMENTS.md`

### Research
- `dev-doc/prd/2511290312_RESEARCH/` (7 documents)

### Reference
- CLAUDE.md - Development guidelines
- AGENTS.md - Coding patterns

---

## Change Log

| Date | Change | Author |
|------|--------|--------|
| 2511290341 | Initial plan creation | Claude |
| 2511291124 | Added clarified requirements (user roles, data migration, feed presets, branding, fiscal year) | Claude |

