# PRD Documentation Complete

## Task Summary

Session focused on organising and translating the base PRD (Product Requirements Document) for the MCE carbon emissions SaaS platform.

### Completed

- Converted Korean PRD (`2511290229_BASE_PRD_KR.md`) from plain text to well-structured markdown
- Created English translation (`2511290229_BASE_PRD_EN.md`) using British English conventions
- Updated `CLAUDE.md` with language style preferences
- Added technical terms to `codebook.toml` dictionary

## Key Information from PRD

### Project Overview
- SaaS platform for measuring greenhouse gas emissions from livestock farms
- Target countries: Korea, USA, Brazil
- Uses IPCC Tier 2 methodology for emissions calculation
- PC Web only (no mobile)

### Core Features
1. **User Authentication**: Email-based login, nicknames
2. **Farm Management**: Multiple farms, Google Maps integration, fiscal year config
3. **Livestock Group Management**: 5-step input form (basic info, feed, housing environment, barn info, manure management)
4. **Emissions Report**: Auto-generated per farm, category breakdown, PDF export
5. **Dashboard**: Statistics, trends, comparisons

### Technical Requirements
- 22 database tables with complex relationships
- Multilingual support (Korean, English, Portuguese)
- Automatic unit conversion between regions

### Reference Sites
- https://app.coolfarmtool.org/
- https://comet-farm.com/

## Files Modified/Created

- `dev-doc/prd/2511290229_BASE_PRD_KR.md` - Reorganised Korean PRD
- `dev-doc/prd/2511290229_BASE_PRD_EN.md` - English translation
- `dev-doc/prd/2511290229_BASE_PRD_EN_WITH_DEV_COMMENTS.md` - English with dev notes
- `CLAUDE.md` - Added British English preference
- `codebook.toml` - Added: erd, figma, ipcc, prd, saa

## Next Steps

1. Review detailed work specification when provided (A4 3p)
2. Review ERD when provided
3. Review Figma designs when provided
4. Begin database schema design based on PRD requirements
5. Set up i18n infrastructure for Korean/English/Portuguese

## Technical Context

- Stack: Phoenix 1.8 / Elixir / PostgreSQL (port 5433)
- Client originally requested Node.js/Python but project uses Phoenix
- 3-week development timeline mentioned in original PRD
