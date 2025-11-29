# IPCC Calculation Engine Implementation Plan

## Overview

Implement the IPCC Tier 2 methodology for calculating greenhouse gas emissions from livestock. The calculation engine will compute enteric fermentation (CH₄), manure management (CH₄), and manure management (N₂O) emissions.

## Existing Infrastructure

### Schemas Available
- **LivestockGroup**: species, head_count, average_weight, mature_weight, daily_weight_gain, milk_yield, milk_fat_content, pregnant_percentage, days_pregnant, grazing_hours_per_day
- **FeedItem**: feed_type, daily_amount, gross_energy, digestibility, crude_protein, dry_matter_percentage
- **HousingPeriod**: month, barn_percentage, exercise_yard_percentage, grazing_percentage
- **BarnInfo**: barn_type, temperature_controlled, bedding_type
- **ManureSystem**: system_type, percentage, has_anaerobic_digester, storage_duration_days
- **IpccEmissionFactor**: factor_type, species, climate_zone, management_system, country, value
- **EmissionReport**: total_emissions, enteric_emissions, manure_ch4_emissions, manure_n2o_emissions, breakdown_by_group, breakdown_by_source

## Implementation Steps

### Step 1: Create Calculation Module Structure

Create `lib/mce/emissions/calculator.ex` with the following structure:

```elixir
defmodule Mce.Emissions.Calculator do
  # Main entry point
  def calculate_farm_emissions(farm, year)
  def calculate_group_emissions(livestock_group)

  # Enteric fermentation
  defp calculate_enteric_ch4(group, feed_items)
  defp calculate_gross_energy_intake(group, feed_items)
  defp get_methane_conversion_factor(species, feed_type)

  # Manure management
  defp calculate_manure_ch4(group, manure_systems)
  defp calculate_volatile_solids(group, feed_items)
  defp get_mcf_value(system_type, climate_zone)

  defp calculate_manure_n2o(group, manure_systems)
  defp calculate_nitrogen_excretion(group, feed_items)
end
```

### Step 2: Seed IPCC Default Values

Create migration and seeds for `ipcc_emission_factors`:

**Methane Conversion Factors (Ym)**:
| Species | Value | Notes |
|---------|-------|-------|
| dairy_cattle | 6.0 | High yield |
| beef_cattle | 5.5 | Grazing/feedlot mix |
| swine | 1.0 | Non-ruminant |

**MCF by Management System** (Temperate climate):
| System | MCF (%) |
|--------|---------|
| pasture | 1.5 |
| daily_spread | 0.5 |
| solid_storage | 4.0 |
| liquid_slurry | 27.0 |
| lagoon | 73.0 |
| deep_pit | 35.0 |
| compost | 0.5 |

**Bo (Maximum CH₄ Producing Capacity)**:
| Species | Value (m³ CH₄/kg VS) |
|---------|----------------------|
| dairy_cattle | 0.24 |
| beef_cattle | 0.19 |
| swine | 0.48 |

**GWP Values** (100-year horizon):
- CH₄: 28
- N₂O: 265

### Step 3: Implement Core Calculations

#### 3.1 Enteric Fermentation CH₄

Formula: `EF = (GE × Ym × 365) / 55.65`

```elixir
def calculate_enteric_ch4(group, feed_items) do
  ge = calculate_gross_energy_intake(group, feed_items)
  ym = get_methane_conversion_factor(group.species, feed_items)

  # kg CH₄ per head per year
  ef = (ge * ym * 365) / 55.65

  # Total for herd (tonnes CO2e)
  ef * group.head_count * @gwp_ch4 / 1000
end
```

#### 3.2 Gross Energy Intake

When feed data available:
```elixir
def calculate_gross_energy_intake(group, feed_items) do
  # Sum of (daily_amount × gross_energy × dry_matter_percentage)
  feed_items
  |> Enum.map(fn item ->
    amount = Decimal.to_float(item.daily_amount)
    ge = item.gross_energy || default_ge(item.feed_type)
    dm = (item.dry_matter_percentage || 85) / 100
    amount * ge * dm
  end)
  |> Enum.sum()
end
```

When feed data not available (simplified approach):
- Use IPCC default based on species and weight

#### 3.3 Manure CH₄

Formula: `EF = (VS × 365) × [Bo × 0.67 × Σ(MCF × AWMS)]`

```elixir
def calculate_manure_ch4(group, manure_systems, climate_zone) do
  vs = calculate_volatile_solids(group, feed_items)
  bo = get_bo_value(group.species)

  # Sum MCF × percentage for each system
  mcf_weighted = manure_systems
    |> Enum.map(fn sys ->
      mcf = get_mcf_value(sys.system_type, climate_zone)
      percentage = Decimal.to_float(sys.percentage) / 100
      mcf * percentage
    end)
    |> Enum.sum()

  # kg CH₄ per head per year
  ef = (vs * 365) * (bo * 0.67 * mcf_weighted / 100)

  # Total for herd (tonnes CO2e)
  ef * group.head_count * @gwp_ch4 / 1000
end
```

#### 3.4 Manure N₂O (Simplified Tier 2)

```elixir
def calculate_manure_n2o(group, manure_systems) do
  n_ex = calculate_nitrogen_excretion(group)

  # Direct emissions
  direct = manure_systems
    |> Enum.map(fn sys ->
      ef3 = get_ef3_value(sys.system_type)
      percentage = Decimal.to_float(sys.percentage) / 100
      n_ex * percentage * ef3
    end)
    |> Enum.sum()

  # Convert to N₂O and then to CO2e
  n2o = direct * (44/28) * group.head_count
  n2o * @gwp_n2o / 1000
end
```

### Step 4: Climate Zone Detection

Determine climate zone based on farm location:

```elixir
def get_climate_zone(farm) do
  case farm.country do
    "KR" -> :temperate
    "US" -> detect_us_climate(farm.state_province)
    "BR" -> detect_br_climate(farm.state_province)
    _ -> :temperate  # default
  end
end
```

### Step 5: Create Emissions Context Functions

Add to `lib/mce/emissions.ex`:

```elixir
def calculate_and_save_report(farm_id, year) do
  farm = Farms.get_farm_with_livestock!(farm_id)

  results = Calculator.calculate_farm_emissions(farm)

  upsert_emission_report(farm_id, year, %{
    calculated_at: DateTime.utc_now(),
    calculation_version: "1.0.0",
    total_emissions: results.total,
    enteric_emissions: results.enteric,
    manure_ch4_emissions: results.manure_ch4,
    manure_n2o_emissions: results.manure_n2o,
    breakdown_by_group: results.by_group,
    breakdown_by_source: results.by_source
  })
end
```

### Step 6: Unit Tests

Create `test/mce/emissions/calculator_test.exs`:

1. Test enteric CH₄ calculation with known inputs
2. Test manure CH₄ calculation with different management systems
3. Test N₂O calculation
4. Test GWP conversions
5. Test farm-level aggregation

## File Changes

### New Files
1. `lib/mce/emissions/calculator.ex` - Core calculation logic
2. `lib/mce/emissions/defaults.ex` - IPCC default values (hardcoded for reliability)
3. `priv/repo/seeds/ipcc_emission_factors.exs` - Seed IPCC factors
4. `test/mce/emissions/calculator_test.exs` - Unit tests

### Modified Files
1. `lib/mce/emissions.ex` - Add `calculate_and_save_report/2`
2. `lib/mce/farms.ex` - Add `get_farm_with_livestock!/1` (preload all associations)

## Data Flow

```
Farm
  └── LivestockGroup (per group)
        ├── FeedItems → Gross Energy Intake → Enteric CH₄
        │                 └── Volatile Solids → Manure CH₄
        ├── ManureSystems → MCF lookup → Manure CH₄
        │                    └── EF3 lookup → Manure N₂O
        └── Species/Weight → IPCC defaults when data missing

Outputs (all in tonnes CO2e):
  ├── enteric_emissions
  ├── manure_ch4_emissions
  ├── manure_n2o_emissions
  └── total_emissions (sum)
```

## Constants (Hardcoded for Reliability)

```elixir
@gwp_ch4 28      # 100-year GWP for CH₄
@gwp_n2o 265     # 100-year GWP for N₂O
@ch4_energy 55.65  # MJ/kg CH₄
@ch4_density 0.67  # kg/m³ CH₄
```

## Implementation Order

1. Create `defaults.ex` with all IPCC constants
2. Create `calculator.ex` with calculation functions
3. Add `calculate_and_save_report/2` to emissions context
4. Write unit tests with known test cases
5. Seed database with IPCC factors (optional, as defaults are hardcoded)
6. Manual testing with existing livestock data
