# IPCC Tier 2 Methodology for Livestock GHG Emissions

## Overview

The IPCC Tier 2 methodology provides a more refined approach to calculating greenhouse gas emissions from livestock compared to Tier 1. It considers country-specific or regional data rather than global defaults, typically achieving ±20% uncertainty vs ±30-50% for Tier 1.

## Emission Sources

### 1. Enteric Fermentation (CH₄)
Methane produced during digestion in ruminant animals (cattle, sheep, goats).

### 2. Manure Management
- **CH₄**: From anaerobic decomposition of manure
- **N₂O**: From nitrification/denitrification of nitrogen in manure

---

## Enteric Fermentation Equations

### Primary Tier 2 Equation

```
EF = (GE × Ym × 365) / 55.65
```

Where:
- **EF** = Emission Factor (kg CH₄ head⁻¹ yr⁻¹)
- **GE** = Gross Energy Intake (MJ head⁻¹ day⁻¹)
- **Ym** = Methane Conversion Factor (% of GE converted to CH₄)
- **55.65** = Energy content of methane (MJ/kg CH₄)
- **365** = Days per year

### Alternative Using Dry Matter Intake

```
EF = (DMI × Ym × 365) / 1000
```

Where:
- **DMI** = Dry Matter Intake (kg day⁻¹)

### Gross Energy Intake Calculation

```
GE = [(NE_m + NE_a + NE_l + NE_work + NE_p) / (DE% / 100)] × [(REM × DE% / 100) + (REG × DE% / 100)]
```

### Net Energy Requirements

| Component | Description | Formula Basis |
|-----------|-------------|---------------|
| NE_m | Maintenance | Body weight, activity |
| NE_a | Activity | Grazing conditions |
| NE_l | Lactation | Milk yield, fat % |
| NE_work | Draft work | Hours worked |
| NE_p | Pregnancy | Gestation stage |
| NE_g | Growth | Weight gain, mature weight |

---

## Methane Conversion Factors (Ym)

### 2019 IPCC Refinement Values

| Animal Category | Ym (%) | Feed Type/Condition |
|-----------------|--------|---------------------|
| Dairy Cattle (high yield >8500kg) | 6.0 | High digestibility |
| Dairy Cattle (typical) | 5.7 | Mixed diet |
| Beef Cattle (feedlot) | 3.0 | High concentrate |
| Beef Cattle (grazing) | 6.5 | Forage-based |
| Sheep | 4.5 | Typical |
| Swine | 1.0 | Non-ruminant |

---

## Manure Management Equations

### CH₄ Emissions (Tier 2)

```
EF(T) = (VS(T) × 365) × [Bo(T) × 0.67 × Σ(MCF_s,k × AWMS_T,s,k)]
```

Where:
- **VS(T)** = Volatile Solids excreted (kg DM animal⁻¹ day⁻¹)
- **Bo(T)** = Maximum CH₄ producing capacity (m³ CH₄ kg⁻¹ VS)
- **MCF_s,k** = Methane Conversion Factor for system s, climate k (%)
- **AWMS_T,s,k** = Fraction of manure in system s for climate k
- **0.67** = Conversion m³ CH₄ to kg CH₄

### Volatile Solids Calculation

```
VS = [GE × (1 - DE/100) + (UE × GE)] × [(1 - ASH) / 18.45]
```

Where:
- **DE** = Digestible Energy (%)
- **UE** = Urinary Energy fraction (typically 0.04)
- **ASH** = Ash content of manure (typically 0.08)
- **18.45** = Energy density conversion (MJ/kg DM)

### MCF by Management System

| System | Cool Climate (%) | Temperate (%) | Warm Climate (%) |
|--------|------------------|---------------|------------------|
| Pasture/Paddock | 1.0 | 1.5 | 2.0 |
| Daily spread | 0.1 | 0.5 | 1.0 |
| Solid storage | 2.0 | 4.0 | 5.0 |
| Dry lot | 1.0 | 1.5 | 2.0 |
| Liquid/slurry (pit <1m) | 17.0 | 17.0 | 17.0 |
| Liquid/slurry (pit >1m) | 27.0 | 35.0 | 45.0 |
| Anaerobic lagoon | 66.0 | 73.0 | 78.0 |
| Composting (in-vessel) | 0.5 | 0.5 | 0.5 |
| Composting (static pile) | 0.5 | 0.5 | 0.5 |
| Composting (intensive) | 1.0 | 1.0 | 1.0 |

### N₂O Emissions (Tier 2)

#### Direct Emissions
```
N₂O_direct = Σ[N_ex(T) × AWMS_T,s × EF3_s] × 44/28
```

#### Indirect from Volatilisation
```
N₂O_vol = Σ[N_ex(T) × AWMS_T,s × Frac_gasMS × EF4] × 44/28
```

#### Indirect from Leaching
```
N₂O_leach = Σ[N_ex(T) × AWMS_T,s × Frac_leachMS × EF5] × 44/28
```

Where:
- **N_ex(T)** = Nitrogen excretion (kg N animal⁻¹ yr⁻¹)
- **EF3_s** = Direct emission factor for system s
- **EF4** = 0.01 (volatilisation)
- **EF5** = 0.0075 (leaching)
- **44/28** = N₂O to N conversion

---

## Required Input Data by Category

### Animal Performance Data
- Live body weight (kg)
- Mature body weight (kg)
- Average daily weight gain (kg/day)
- Milk production (kg/day) - dairy only
- Milk fat content (%)
- Hours worked per day - draft animals
- Days pregnant

### Feed Data
- Dry matter intake (kg/day)
- Gross energy content (MJ/kg DM)
- Digestibility (DE%)
- Crude protein content (%)

### Management Data
- Manure management system type
- Time in each system (%)
- Climate region classification

---

## Country-Specific Considerations

### Korea
- Primary livestock: Cattle (Hanwoo beef, Holstein dairy), pigs
- Climate: Temperate with cold winters
- Typical systems: Confinement with liquid/slurry storage

### USA
- Diverse systems across climate zones
- Large feedlot operations (high concentrate diets)
- Anaerobic lagoons common in warm regions

### Brazil
- Extensive grazing systems predominant
- Tropical climate considerations
- High Ym values for cattle (6.5%+)

---

## Implementation Notes for Software

1. **Data Input Flow**: 5-step form aligns with IPCC data requirements
2. **Calculation Engine**: Must support iterative GE calculations
3. **Regional Defaults**: Store IPCC default values by country/climate
4. **Override Capability**: Allow farm-specific values where available
5. **Audit Trail**: Log calculation steps for report generation

---

## References

- [IPCC 2019 Refinement - Chapter 10: Livestock](https://www.ipcc-nggip.iges.or.jp/public/2019rf/pdf/4_Volume4/19R_V4_Ch10_Livestock.pdf)
- [IPCC 2006 Guidelines - Chapter 10](https://www.ipcc-nggip.iges.or.jp/public/2006gl/pdf/4_Volume4/V4_10_Ch10_Livestock.pdf)
- [AgLEDx - Enteric Fermentation](https://agledx.ccafs.cgiar.org/estimating-emissions/unfccc-guidance/enteric-fermentation/)
- [AgLEDx - Manure Management](https://agledx.ccafs.cgiar.org/estimating-emissions/unfccc-guidance/manure-management/)
- [Global Research Alliance - Tier 2 Approaches](https://globalresearchalliance.org/library/tier-2-inventory-approaches-in-the-livestock-sector/)
- [US EPA GHG Inventory 2024](https://www.epa.gov/system/files/documents/2024-04/us-ghg-inventory-2024-chapter-5-agriculture.pdf)
