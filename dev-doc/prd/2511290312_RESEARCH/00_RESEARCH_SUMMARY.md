# Research Summary for MCE Project Planning

**Document ID**: 2511290312_RESEARCH
**Date**: 29 November 2025
**Purpose**: Comprehensive research compilation for project planning and bid preparation

---

## Executive Summary

This research package provides the technical foundation for building a livestock carbon emissions SaaS platform. The project aims to win a Wishket bid by demonstrating superior technical architecture and UI/UX design compared to existing solutions.

---

## Project Context

### Business Objective
Build a production-ready SaaS platform that:
- Measures GHG emissions from livestock farms (Korea, USA, Brazil)
- Calculates emissions using IPCC Tier 2 methodology
- Generates automated carbon emission reports
- Provides multi-language support (Korean, English, Portuguese)

### Success Criteria
1. **Functional completeness**: All PRD features implemented
2. **Superior UI/UX**: Better than reference platforms
3. **Technical robustness**: Production-grade architecture
4. **Compliance**: IPCC Tier 2 methodology adherence

---

## Technical Stack Decisions

### Core Framework
| Component | Technology | Rationale |
|-----------|------------|-----------|
| Backend | Elixir/Phoenix 1.8 | LiveView for reactive UI, robust OTP |
| Frontend | Phoenix LiveView + DaisyUI | Built-in support, rapid development |
| Database | PostgreSQL | Complex relationships, JSON support |
| Admin | Backpex | Rapid CRUD, customisable |
| HTTP Client | Req | Phoenix default, simple API |

### Supporting Technologies
| Component | Technology | Rationale |
|-----------|------------|-----------|
| CSS Framework | Tailwind CSS 4 | Phoenix default, utility-first |
| UI Components | DaisyUI 5 | Phoenix 1.8 built-in |
| Charts | ApexCharts (LiveCharts) | Modern, reactive updates |
| i18n | Gettext | Phoenix standard |
| Address (Korea) | juso.go.kr API | Official government API |
| Address (US/BR) | Google Maps Places | Global coverage |
| PDF Generation | TBD | Investigate options |

---

## Research Documents Index

| # | Document | Key Contents |
|---|----------|--------------|
| 01 | [IPCC_TIER2_METHODOLOGY.md](./01_IPCC_TIER2_METHODOLOGY.md) | Emission calculation formulas, parameters, country considerations |
| 02 | [REFERENCE_PLATFORMS.md](./02_REFERENCE_PLATFORMS.md) | UI/UX research, competitor analysis, design recommendations |
| 03 | [PHOENIX_I18N.md](./03_PHOENIX_I18N.md) | Internationalisation strategy, unit conversion, locale handling |
| 04 | [ADDRESS_APIS.md](./04_ADDRESS_APIS.md) | Korean and Google Maps API integration |
| 05 | [CHARTING_LIBRARIES.md](./05_CHARTING_LIBRARIES.md) | Dashboard visualisation options |
| 06 | [DAISYUI_INTEGRATION.md](./06_DAISYUI_INTEGRATION.md) | UI framework, theming, components |
| 07 | [BACKPEX_ADMIN.md](./07_BACKPEX_ADMIN.md) | Admin panel configuration |

---

## Key Technical Findings

### IPCC Tier 2 Implementation
- **Complexity**: High - requires iterative calculations for gross energy intake
- **Data Requirements**: Animal performance, feed composition, management systems
- **Precision**: ±20% uncertainty (vs ±30-50% for Tier 1)
- **Country Variations**: Different climate zones, management practices

### Calculation Engine Architecture
```
Input Data → Validation → GE Calculation → EF Calculation → Aggregation → Report
     ↑                         ↓
     └─── IPCC Default Values ─┘
```

### UI/UX Competitive Advantage
- Most competitors have dated, form-heavy interfaces
- Opportunity: Modern dashboard with real-time visualisation
- Best reference: Farm Carbon Calculator (UK) for UX patterns

### i18n Complexity
- Not just text translation: unit conversion required
- Korea/Brazil: Metric (kg, hectares, °C)
- USA: Imperial (lbs, acres, °F)
- Implementation: Gettext + custom unit formatter

---

## Risk Assessment

### Technical Risks

| Risk | Severity | Mitigation |
|------|----------|------------|
| IPCC calculation complexity | High | Thorough methodology study, expert review |
| Multi-language form validation | Medium | Early i18n infrastructure setup |
| Google Maps API costs | Medium | Session-based pricing, caching |
| PDF generation quality | Medium | Evaluate multiple libraries |

### Project Risks

| Risk | Severity | Mitigation |
|------|----------|------------|
| 3-week timeline (PRD) | High | Prioritise MVP features, phased delivery |
| 22-table database complexity | Medium | ERD review before implementation |
| Client design feedback | Medium | Early prototype sharing |

---

## Recommended Implementation Order

### Phase 1: Foundation (Week 1)
1. Database schema design (pending ERD review)
2. i18n infrastructure setup
3. DaisyUI theme configuration
4. Authentication system
5. Farm CRUD with address integration

### Phase 2: Core Features (Week 2)
1. Livestock group 5-step form
2. IPCC calculation engine
3. Emissions report generation
4. Backpex admin panel

### Phase 3: Polish (Week 3)
1. Dashboard with charts
2. PDF export
3. UI/UX refinement
4. Testing and bug fixes

---

## Open Questions for Client/User

1. **ERD Review**: When will the detailed ERD be available?
2. **Figma Designs**: Timeline for design delivery?
3. **Feed Presets**: What preset data should be included?
4. **Report Format**: Specific PDF layout requirements?
5. **User Roles**: Admin vs regular user permissions?
6. **Data Migration**: Any existing data to import?

---

## Next Steps

1. **Review this research** with the development team
2. **Create detailed project plan** based on findings
3. **Set up development environment** with chosen stack
4. **Begin database schema design** once ERD is received
5. **Establish i18n infrastructure** as first implementation task

---

## References Summary

### Official Documentation
- [IPCC 2019 Refinement Guidelines](https://www.ipcc-nggip.iges.or.jp/public/2019rf/)
- [Phoenix Framework](https://hexdocs.pm/phoenix/)
- [DaisyUI](https://daisyui.com/)
- [Backpex](https://hexdocs.pm/backpex/)

### APIs
- [juso.go.kr Developer Centre](https://www.juso.go.kr/)
- [Google Maps Places API](https://developers.google.com/maps/documentation/places/)

### Community Resources
- [ElixirForum](https://elixirforum.com/)
- [FullStackPhoenix Tutorials](https://fullstackphoenix.com/)
