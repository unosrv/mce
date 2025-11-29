# Database Schema Plan

**Document ID**: 2511290341_DATABASE_SCHEMA_PLAN
**Created**: 29 November 2025, 03:41
**Status**: Planning (Awaiting Client ERD)

---

## Overview

This document outlines the proposed database schema based on PRD requirements. The final schema will be refined after reviewing the client-provided ERD.

**Note**: PRD mentions 22 tables with complex relationships. This plan provides a starting point that aligns with IPCC Tier 2 data requirements.

---

## Entity Relationship Overview

```
┌─────────────┐     ┌─────────────┐     ┌──────────────────┐
│    User     │────<│    Farm     │────<│ Livestock Group  │
└─────────────┘     └─────────────┘     └──────────────────┘
                          │                      │
                          │                      ├──< Feed Item
                          │                      ├──< Housing Period
                          │                      ├──< Barn Info
                          │                      └──< Manure System
                          │
                          └────────< Emission Report
```

---

## Core Tables

### 1. Users

Authentication and user management.

```sql
CREATE TABLE users (
  id BIGSERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  nickname VARCHAR(100) NOT NULL,
  hashed_password VARCHAR(255) NOT NULL,
  confirmed_at TIMESTAMP,
  locale VARCHAR(10) DEFAULT 'ko',
  inserted_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE UNIQUE INDEX users_email_index ON users (email);
```

**Ecto Schema**:
```elixir
schema "users" do
  field :email, :string
  field :nickname, :string
  field :password, :string, virtual: true, redact: true
  field :hashed_password, :string, redact: true
  field :confirmed_at, :utc_datetime
  field :locale, :string, default: "ko"

  has_many :farms, Mce.Farms.Farm

  timestamps(type: :utc_datetime)
end
```

### 2. User Tokens

Session management.

```sql
CREATE TABLE users_tokens (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  token BYTEA NOT NULL,
  context VARCHAR(255) NOT NULL,
  sent_to VARCHAR(255),
  inserted_at TIMESTAMP NOT NULL
);

CREATE INDEX users_tokens_user_id_index ON users_tokens (user_id);
CREATE UNIQUE INDEX users_tokens_context_token_index ON users_tokens (context, token);
```

---

### 3. Farms

Farm entities with country-specific address handling.

```sql
CREATE TABLE farms (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  country VARCHAR(2) NOT NULL,  -- ISO 3166-1 alpha-2: KR, US, BR

  -- Address fields (flexible for different countries)
  address_line1 VARCHAR(500),
  address_line2 VARCHAR(500),
  city VARCHAR(255),
  state_province VARCHAR(255),
  postal_code VARCHAR(20),

  -- Korean-specific (from juso.go.kr)
  road_address VARCHAR(500),
  jibun_address VARCHAR(500),
  building_name VARCHAR(255),

  -- Coordinates (from Google Maps or juso.go.kr)
  latitude DECIMAL(10, 8),
  longitude DECIMAL(11, 8),

  -- Fiscal year configuration
  fiscal_year_start_month INTEGER DEFAULT 1,  -- 1-12
  fiscal_year_start_day INTEGER DEFAULT 1,    -- 1-31

  inserted_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE INDEX farms_user_id_index ON farms (user_id);
CREATE INDEX farms_country_index ON farms (country);
```

**Ecto Schema**:
```elixir
schema "farms" do
  field :name, :string
  field :country, :string
  field :address_line1, :string
  field :address_line2, :string
  field :city, :string
  field :state_province, :string
  field :postal_code, :string
  field :road_address, :string
  field :jibun_address, :string
  field :building_name, :string
  field :latitude, :decimal
  field :longitude, :decimal
  field :fiscal_year_start_month, :integer, default: 1
  field :fiscal_year_start_day, :integer, default: 1

  belongs_to :user, Mce.Accounts.User
  has_many :livestock_groups, Mce.Livestock.LivestockGroup
  has_many :emission_reports, Mce.Emissions.Report

  timestamps(type: :utc_datetime)
end
```

---

### 4. Livestock Groups

Core livestock entity containing basic information.

```sql
CREATE TABLE livestock_groups (
  id BIGSERIAL PRIMARY KEY,
  farm_id BIGINT NOT NULL REFERENCES farms(id) ON DELETE CASCADE,

  -- Basic Info (Step 1)
  name VARCHAR(255) NOT NULL,
  species VARCHAR(50) NOT NULL,        -- cattle_dairy, cattle_beef, swine, sheep, goats
  sub_category VARCHAR(50),            -- e.g., hanwoo, holstein, heifer, etc.
  head_count INTEGER NOT NULL,
  average_weight DECIMAL(10, 2),       -- kg (stored in metric)
  mature_weight DECIMAL(10, 2),        -- kg
  daily_weight_gain DECIMAL(6, 3),     -- kg/day

  -- Dairy-specific
  milk_yield DECIMAL(10, 2),           -- kg/day
  milk_fat_content DECIMAL(5, 2),      -- percentage

  -- Pregnancy info
  pregnant_percentage DECIMAL(5, 2),   -- percentage of herd pregnant
  days_pregnant INTEGER,               -- average days

  -- Activity
  grazing_hours_per_day DECIMAL(4, 1), -- 0-24

  inserted_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE INDEX livestock_groups_farm_id_index ON livestock_groups (farm_id);
CREATE INDEX livestock_groups_species_index ON livestock_groups (species);
```

**Ecto Schema**:
```elixir
schema "livestock_groups" do
  field :name, :string
  field :species, :string
  field :sub_category, :string
  field :head_count, :integer
  field :average_weight, :decimal
  field :mature_weight, :decimal
  field :daily_weight_gain, :decimal
  field :milk_yield, :decimal
  field :milk_fat_content, :decimal
  field :pregnant_percentage, :decimal
  field :days_pregnant, :integer
  field :grazing_hours_per_day, :decimal

  belongs_to :farm, Mce.Farms.Farm
  has_many :feed_items, Mce.Livestock.FeedItem
  has_many :housing_periods, Mce.Livestock.HousingPeriod
  has_one :barn_info, Mce.Livestock.BarnInfo
  has_many :manure_systems, Mce.Livestock.ManureSystem

  timestamps(type: :utc_datetime)
end
```

---

### 5. Feed Items

Feed composition data (Step 2: max 10 items per group).

```sql
CREATE TABLE feed_items (
  id BIGSERIAL PRIMARY KEY,
  livestock_group_id BIGINT NOT NULL REFERENCES livestock_groups(id) ON DELETE CASCADE,

  name VARCHAR(255) NOT NULL,
  feed_type VARCHAR(50) NOT NULL,      -- forage, concentrate, supplement, additive
  preset_id INTEGER,                    -- reference to preset feed data

  -- Composition
  daily_amount DECIMAL(10, 2),          -- kg/day per animal
  dry_matter_percentage DECIMAL(5, 2),  -- %
  gross_energy DECIMAL(10, 4),          -- MJ/kg DM
  digestibility DECIMAL(5, 2),          -- DE%
  crude_protein DECIMAL(5, 2),          -- %

  -- Additives (if applicable)
  additive_type VARCHAR(50),            -- lipid, ionophore, etc.
  additive_amount DECIMAL(10, 4),       -- g/day

  sort_order INTEGER DEFAULT 0,

  inserted_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE INDEX feed_items_livestock_group_id_index ON feed_items (livestock_group_id);
```

**Ecto Schema**:
```elixir
schema "feed_items" do
  field :name, :string
  field :feed_type, :string
  field :preset_id, :integer
  field :daily_amount, :decimal
  field :dry_matter_percentage, :decimal
  field :gross_energy, :decimal
  field :digestibility, :decimal
  field :crude_protein, :decimal
  field :additive_type, :string
  field :additive_amount, :decimal
  field :sort_order, :integer, default: 0

  belongs_to :livestock_group, Mce.Livestock.LivestockGroup

  timestamps(type: :utc_datetime)
end
```

---

### 6. Housing Periods

Monthly housing environment distribution (Step 3).

```sql
CREATE TABLE housing_periods (
  id BIGSERIAL PRIMARY KEY,
  livestock_group_id BIGINT NOT NULL REFERENCES livestock_groups(id) ON DELETE CASCADE,

  month INTEGER NOT NULL,              -- 1-12
  barn_percentage DECIMAL(5, 2),       -- % time in barn
  exercise_yard_percentage DECIMAL(5, 2),
  grazing_percentage DECIMAL(5, 2),

  -- Must sum to 100%
  CONSTRAINT housing_percentage_sum CHECK (
    barn_percentage + exercise_yard_percentage + grazing_percentage = 100
  ),

  inserted_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE INDEX housing_periods_livestock_group_id_index ON housing_periods (livestock_group_id);
CREATE UNIQUE INDEX housing_periods_group_month_index ON housing_periods (livestock_group_id, month);
```

**Ecto Schema**:
```elixir
schema "housing_periods" do
  field :month, :integer
  field :barn_percentage, :decimal
  field :exercise_yard_percentage, :decimal
  field :grazing_percentage, :decimal

  belongs_to :livestock_group, Mce.Livestock.LivestockGroup

  timestamps(type: :utc_datetime)
end
```

---

### 7. Barn Info

Barn specifications (Step 4).

```sql
CREATE TABLE barn_info (
  id BIGSERIAL PRIMARY KEY,
  livestock_group_id BIGINT NOT NULL REFERENCES livestock_groups(id) ON DELETE CASCADE,

  barn_type VARCHAR(50) NOT NULL,      -- open, enclosed, naturally_ventilated, mechanically_ventilated
  total_area DECIMAL(10, 2),            -- m² (stored in metric)
  area_per_animal DECIMAL(10, 2),       -- m² per head

  -- Temperature control
  temperature_controlled BOOLEAN DEFAULT FALSE,
  average_temperature DECIMAL(5, 2),    -- °C (stored in Celsius)
  heating_type VARCHAR(50),             -- none, electric, gas, biomass
  cooling_type VARCHAR(50),             -- none, fans, evaporative, ac

  -- Bedding
  bedding_type VARCHAR(50),             -- straw, sawdust, sand, rubber_mat, none
  bedding_change_frequency VARCHAR(50), -- daily, weekly, monthly

  inserted_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE UNIQUE INDEX barn_info_livestock_group_id_index ON barn_info (livestock_group_id);
```

**Ecto Schema**:
```elixir
schema "barn_info" do
  field :barn_type, :string
  field :total_area, :decimal
  field :area_per_animal, :decimal
  field :temperature_controlled, :boolean, default: false
  field :average_temperature, :decimal
  field :heating_type, :string
  field :cooling_type, :string
  field :bedding_type, :string
  field :bedding_change_frequency, :string

  belongs_to :livestock_group, Mce.Livestock.LivestockGroup

  timestamps(type: :utc_datetime)
end
```

---

### 8. Manure Systems

Manure management configuration (Step 5 - branching logic).

```sql
CREATE TABLE manure_systems (
  id BIGSERIAL PRIMARY KEY,
  livestock_group_id BIGINT NOT NULL REFERENCES livestock_groups(id) ON DELETE CASCADE,

  system_type VARCHAR(50) NOT NULL,    -- See IPCC MCF table
  percentage DECIMAL(5, 2) NOT NULL,   -- % of manure handled by this system

  -- Anaerobic digester options
  has_anaerobic_digester BOOLEAN DEFAULT FALSE,
  digester_type VARCHAR(50),           -- covered_lagoon, complete_mix, plug_flow
  biogas_captured BOOLEAN DEFAULT FALSE,
  biogas_use VARCHAR(50),              -- flared, electricity, heat

  -- Solid-liquid separation
  has_separator BOOLEAN DEFAULT FALSE,
  separator_efficiency DECIMAL(5, 2),  -- % solids removal

  -- Additional treatment
  treatment_type VARCHAR(50),          -- composting, aerobic_treatment, none

  -- Storage duration (affects MCF)
  storage_duration_days INTEGER,

  inserted_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE INDEX manure_systems_livestock_group_id_index ON manure_systems (livestock_group_id);
```

**Ecto Schema**:
```elixir
schema "manure_systems" do
  field :system_type, :string
  field :percentage, :decimal
  field :has_anaerobic_digester, :boolean, default: false
  field :digester_type, :string
  field :biogas_captured, :boolean, default: false
  field :biogas_use, :string
  field :has_separator, :boolean, default: false
  field :separator_efficiency, :decimal
  field :treatment_type, :string
  field :storage_duration_days, :integer

  belongs_to :livestock_group, Mce.Livestock.LivestockGroup

  timestamps(type: :utc_datetime)
end
```

---

### 9. Emission Reports

Calculated emissions stored per farm/period.

```sql
CREATE TABLE emission_reports (
  id BIGSERIAL PRIMARY KEY,
  farm_id BIGINT NOT NULL REFERENCES farms(id) ON DELETE CASCADE,

  -- Report period
  report_year INTEGER NOT NULL,
  fiscal_year_label VARCHAR(50),       -- e.g., "FY2025" or "2025"

  -- Totals (all in tonnes CO₂e)
  total_emissions DECIMAL(15, 4),
  enteric_emissions DECIMAL(15, 4),
  manure_ch4_emissions DECIMAL(15, 4),
  manure_n2o_emissions DECIMAL(15, 4),

  -- Metadata
  calculation_version VARCHAR(20),     -- IPCC methodology version
  calculated_at TIMESTAMP NOT NULL,

  -- Detailed breakdown (JSON for flexibility)
  breakdown_by_group JSONB,
  breakdown_by_source JSONB,

  inserted_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE INDEX emission_reports_farm_id_index ON emission_reports (farm_id);
CREATE UNIQUE INDEX emission_reports_farm_year_index ON emission_reports (farm_id, report_year);
```

**Ecto Schema**:
```elixir
schema "emission_reports" do
  field :report_year, :integer
  field :fiscal_year_label, :string
  field :total_emissions, :decimal
  field :enteric_emissions, :decimal
  field :manure_ch4_emissions, :decimal
  field :manure_n2o_emissions, :decimal
  field :calculation_version, :string
  field :calculated_at, :utc_datetime
  field :breakdown_by_group, :map
  field :breakdown_by_source, :map

  belongs_to :farm, Mce.Farms.Farm

  timestamps(type: :utc_datetime)
end
```

---

## Reference Data Tables

### 10. Feed Presets

Pre-defined feed compositions by country.

```sql
CREATE TABLE feed_presets (
  id BIGSERIAL PRIMARY KEY,
  country VARCHAR(2) NOT NULL,         -- KR, US, BR
  name_ko VARCHAR(255),
  name_en VARCHAR(255),
  name_pt_br VARCHAR(255),
  feed_type VARCHAR(50) NOT NULL,
  dry_matter_percentage DECIMAL(5, 2),
  gross_energy DECIMAL(10, 4),
  digestibility DECIMAL(5, 2),
  crude_protein DECIMAL(5, 2),
  is_active BOOLEAN DEFAULT TRUE,
  inserted_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE INDEX feed_presets_country_index ON feed_presets (country);
CREATE INDEX feed_presets_feed_type_index ON feed_presets (feed_type);
```

### 11. IPCC Emission Factors

IPCC default values for calculations.

```sql
CREATE TABLE ipcc_emission_factors (
  id BIGSERIAL PRIMARY KEY,
  factor_type VARCHAR(50) NOT NULL,    -- ym, mcf, bo, ef3, etc.
  species VARCHAR(50),
  climate_zone VARCHAR(50),            -- cool, temperate, warm
  management_system VARCHAR(50),
  country VARCHAR(2),                   -- NULL for global defaults
  value DECIMAL(15, 8) NOT NULL,
  unit VARCHAR(50),
  source VARCHAR(255),                  -- IPCC 2019, etc.
  notes TEXT,
  inserted_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE INDEX ipcc_factors_type_index ON ipcc_emission_factors (factor_type);
CREATE INDEX ipcc_factors_species_index ON ipcc_emission_factors (species);
```

---

## Migration Strategy

### Phase 1: Core Structure
1. `create_users` - Authentication tables
2. `create_farms` - Farm management
3. `create_livestock_groups` - Basic livestock info

### Phase 2: Detailed Data
4. `create_feed_items` - Feed composition
5. `create_housing_periods` - Housing environment
6. `create_barn_info` - Barn specifications
7. `create_manure_systems` - Manure management

### Phase 3: Calculations & Reference
8. `create_emission_reports` - Calculated results
9. `create_feed_presets` - Preset feed data
10. `create_ipcc_emission_factors` - IPCC defaults

---

## Data Seeding

### Required Seed Data

1. **IPCC Emission Factors**
   - Ym values by species and feed type
   - MCF values by management system and climate
   - Bo values by species
   - EF3, EF4, EF5 for N₂O calculations

2. **Feed Presets**
   - Common feeds by country
   - Nutritional composition data

3. **Admin User** (if applicable)
   - Initial admin account for Backpex

---

## Indexes Summary

| Table | Index | Purpose |
|-------|-------|---------|
| users | email (unique) | Login lookup |
| farms | user_id | User's farms |
| farms | country | Filtering |
| livestock_groups | farm_id | Farm's livestock |
| feed_items | livestock_group_id | Group's feed |
| housing_periods | (group_id, month) unique | Monthly data |
| barn_info | livestock_group_id (unique) | 1:1 relationship |
| manure_systems | livestock_group_id | Group's systems |
| emission_reports | (farm_id, year) unique | Annual reports |

---

## Notes for ERD Review

When reviewing the client-provided ERD:

1. **Compare table count** - PRD mentions 22 tables
2. **Verify relationships** - Ensure all FKs align
3. **Check field names** - Align with client naming conventions
4. **Identify gaps** - Tables not covered in this plan
5. **Clarify requirements** - Any ambiguous relationships

---

## Change Log

| Date | Change | Author |
|------|--------|--------|
| 2511290341 | Initial schema plan | Claude |

