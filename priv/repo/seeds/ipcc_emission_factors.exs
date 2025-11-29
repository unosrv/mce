# IPCC Emission Factors Seed Data
# Based on IPCC 2019 Refinement to 2006 Guidelines (Tier 2)

alias Mce.Repo
alias Mce.Reference.IpccEmissionFactor

import Ecto.Query

# Helper to insert or update based on factor_type + species + climate_zone + country
defmodule IpccSeeder do
  def upsert(attrs) do
    query =
      from ef in IpccEmissionFactor,
        where: ef.factor_type == ^attrs.factor_type

    query =
      if attrs[:species] do
        from ef in query, where: ef.species == ^attrs.species
      else
        from ef in query, where: is_nil(ef.species)
      end

    query =
      if attrs[:climate_zone] do
        from ef in query, where: ef.climate_zone == ^attrs.climate_zone
      else
        from ef in query, where: is_nil(ef.climate_zone)
      end

    query =
      if attrs[:country] do
        from ef in query, where: ef.country == ^attrs.country
      else
        from ef in query, where: is_nil(ef.country)
      end

    case Repo.one(query) do
      nil ->
        %IpccEmissionFactor{}
        |> IpccEmissionFactor.changeset(attrs)
        |> Repo.insert!()

      existing ->
        existing
        |> IpccEmissionFactor.changeset(attrs)
        |> Repo.update!()
    end
  end
end

# Global Warming Potentials (AR5 values)
IpccSeeder.upsert(%{
  factor_type: "gwp_ch4",
  value: Decimal.new("28"),
  unit: "kg CO2e/kg CH4",
  source: "IPCC AR5",
  notes: "100-year GWP for methane (CH4)"
})

IpccSeeder.upsert(%{
  factor_type: "gwp_n2o",
  value: Decimal.new("265"),
  unit: "kg CO2e/kg N2O",
  source: "IPCC AR5",
  notes: "100-year GWP for nitrous oxide (N2O)"
})

# Enteric Fermentation Emission Factors (kg CH4/head/year)
# Dairy Cattle by Region
IpccSeeder.upsert(%{
  factor_type: "enteric_fermentation_ef",
  species: "dairy_cattle",
  climate_zone: "temperate",
  country: "KR",
  value: Decimal.new("128"),
  unit: "kg CH4/head/year",
  source: "IPCC 2019 Table 10.11",
  notes: "Korea-specific for high-producing dairy cattle"
})

IpccSeeder.upsert(%{
  factor_type: "enteric_fermentation_ef",
  species: "dairy_cattle",
  climate_zone: "temperate",
  value: Decimal.new("130"),
  unit: "kg CH4/head/year",
  source: "IPCC 2019 Table 10.11",
  notes: "Default for developed countries, temperate climate"
})

IpccSeeder.upsert(%{
  factor_type: "enteric_fermentation_ef",
  species: "dairy_cattle",
  climate_zone: "tropical",
  value: Decimal.new("80"),
  unit: "kg CH4/head/year",
  source: "IPCC 2019 Table 10.11",
  notes: "Default for tropical regions"
})

IpccSeeder.upsert(%{
  factor_type: "enteric_fermentation_ef",
  species: "dairy_cattle",
  climate_zone: "tropical",
  country: "BR",
  value: Decimal.new("72"),
  unit: "kg CH4/head/year",
  source: "IPCC 2019 Table 10.11",
  notes: "Brazil-specific for dairy cattle"
})

# Beef Cattle
IpccSeeder.upsert(%{
  factor_type: "enteric_fermentation_ef",
  species: "beef_cattle",
  climate_zone: "temperate",
  country: "KR",
  value: Decimal.new("64"),
  unit: "kg CH4/head/year",
  source: "IPCC 2019 Table 10.10",
  notes: "Korea Hanwoo cattle"
})

IpccSeeder.upsert(%{
  factor_type: "enteric_fermentation_ef",
  species: "beef_cattle",
  climate_zone: "temperate",
  value: Decimal.new("60"),
  unit: "kg CH4/head/year",
  source: "IPCC 2019 Table 10.10",
  notes: "Default temperate climate beef"
})

IpccSeeder.upsert(%{
  factor_type: "enteric_fermentation_ef",
  species: "beef_cattle",
  climate_zone: "tropical",
  country: "BR",
  value: Decimal.new("56"),
  unit: "kg CH4/head/year",
  source: "IPCC 2019 Table 10.10",
  notes: "Brazil beef cattle (Bos indicus)"
})

# Swine
IpccSeeder.upsert(%{
  factor_type: "enteric_fermentation_ef",
  species: "swine",
  value: Decimal.new("1.5"),
  unit: "kg CH4/head/year",
  source: "IPCC 2019 Table 10.10",
  notes: "Default for market swine"
})

# Manure Management - Maximum CH4 Producing Capacity (Bo)
# kg CH4/kg VS
IpccSeeder.upsert(%{
  factor_type: "manure_bo",
  species: "dairy_cattle",
  value: Decimal.new("0.24"),
  unit: "m3 CH4/kg VS",
  source: "IPCC 2019 Table 10.16",
  notes: "Maximum methane producing capacity for dairy manure"
})

IpccSeeder.upsert(%{
  factor_type: "manure_bo",
  species: "beef_cattle",
  value: Decimal.new("0.18"),
  unit: "m3 CH4/kg VS",
  source: "IPCC 2019 Table 10.16",
  notes: "Maximum methane producing capacity for beef manure"
})

IpccSeeder.upsert(%{
  factor_type: "manure_bo",
  species: "swine",
  value: Decimal.new("0.45"),
  unit: "m3 CH4/kg VS",
  source: "IPCC 2019 Table 10.16",
  notes: "Maximum methane producing capacity for swine manure"
})

# Methane Conversion Factors (MCF) by Management System and Climate
# Lagoon systems
IpccSeeder.upsert(%{
  factor_type: "manure_mcf",
  management_system: "lagoon",
  climate_zone: "temperate",
  value: Decimal.new("66"),
  unit: "%",
  source: "IPCC 2019 Table 10.17",
  notes: "Anaerobic lagoon, temperate"
})

IpccSeeder.upsert(%{
  factor_type: "manure_mcf",
  management_system: "lagoon",
  climate_zone: "tropical",
  value: Decimal.new("79"),
  unit: "%",
  source: "IPCC 2019 Table 10.17",
  notes: "Anaerobic lagoon, tropical"
})

# Liquid/Slurry systems
IpccSeeder.upsert(%{
  factor_type: "manure_mcf",
  management_system: "liquid_slurry",
  climate_zone: "temperate",
  value: Decimal.new("17"),
  unit: "%",
  source: "IPCC 2019 Table 10.17",
  notes: "Liquid/slurry storage, temperate"
})

IpccSeeder.upsert(%{
  factor_type: "manure_mcf",
  management_system: "liquid_slurry",
  climate_zone: "tropical",
  value: Decimal.new("38"),
  unit: "%",
  source: "IPCC 2019 Table 10.17",
  notes: "Liquid/slurry storage, tropical"
})

# Solid storage
IpccSeeder.upsert(%{
  factor_type: "manure_mcf",
  management_system: "solid_storage",
  climate_zone: "temperate",
  value: Decimal.new("4"),
  unit: "%",
  source: "IPCC 2019 Table 10.17",
  notes: "Solid storage, temperate"
})

IpccSeeder.upsert(%{
  factor_type: "manure_mcf",
  management_system: "solid_storage",
  climate_zone: "tropical",
  value: Decimal.new("5"),
  unit: "%",
  source: "IPCC 2019 Table 10.17",
  notes: "Solid storage, tropical"
})

# Pasture/paddock
IpccSeeder.upsert(%{
  factor_type: "manure_mcf",
  management_system: "pasture",
  value: Decimal.new("1.5"),
  unit: "%",
  source: "IPCC 2019 Table 10.17",
  notes: "Pasture/range/paddock - all climates"
})

# Daily spread
IpccSeeder.upsert(%{
  factor_type: "manure_mcf",
  management_system: "daily_spread",
  value: Decimal.new("0.5"),
  unit: "%",
  source: "IPCC 2019 Table 10.17",
  notes: "Daily spread - all climates"
})

# Composting
IpccSeeder.upsert(%{
  factor_type: "manure_mcf",
  management_system: "compost",
  value: Decimal.new("1.5"),
  unit: "%",
  source: "IPCC 2019 Table 10.17",
  notes: "Composting - in-vessel or intensive windrow"
})

# Nitrogen Excretion Rates (kg N/head/year)
IpccSeeder.upsert(%{
  factor_type: "manure_n_excretion",
  species: "dairy_cattle",
  country: "KR",
  value: Decimal.new("100"),
  unit: "kg N/head/year",
  source: "IPCC 2019 Table 10.19",
  notes: "Korea dairy cattle nitrogen excretion"
})

IpccSeeder.upsert(%{
  factor_type: "manure_n_excretion",
  species: "dairy_cattle",
  value: Decimal.new("100"),
  unit: "kg N/head/year",
  source: "IPCC 2019 Table 10.19",
  notes: "Default dairy cattle nitrogen excretion"
})

IpccSeeder.upsert(%{
  factor_type: "manure_n_excretion",
  species: "beef_cattle",
  country: "KR",
  value: Decimal.new("50"),
  unit: "kg N/head/year",
  source: "IPCC 2019 Table 10.19",
  notes: "Korea beef cattle nitrogen excretion"
})

IpccSeeder.upsert(%{
  factor_type: "manure_n_excretion",
  species: "beef_cattle",
  value: Decimal.new("50"),
  unit: "kg N/head/year",
  source: "IPCC 2019 Table 10.19",
  notes: "Default beef cattle nitrogen excretion"
})

IpccSeeder.upsert(%{
  factor_type: "manure_n_excretion",
  species: "swine",
  value: Decimal.new("20"),
  unit: "kg N/head/year",
  source: "IPCC 2019 Table 10.19",
  notes: "Market swine nitrogen excretion"
})

# N2O Emission Factor (EF3) for Manure Management
IpccSeeder.upsert(%{
  factor_type: "manure_ef3",
  management_system: "lagoon",
  value: Decimal.new("0.001"),
  unit: "kg N2O-N/kg N",
  source: "IPCC 2019 Table 10.21",
  notes: "N2O direct emission factor for anaerobic lagoon"
})

IpccSeeder.upsert(%{
  factor_type: "manure_ef3",
  management_system: "liquid_slurry",
  value: Decimal.new("0.005"),
  unit: "kg N2O-N/kg N",
  source: "IPCC 2019 Table 10.21",
  notes: "N2O direct emission factor for liquid/slurry"
})

IpccSeeder.upsert(%{
  factor_type: "manure_ef3",
  management_system: "solid_storage",
  value: Decimal.new("0.005"),
  unit: "kg N2O-N/kg N",
  source: "IPCC 2019 Table 10.21",
  notes: "N2O direct emission factor for solid storage"
})

IpccSeeder.upsert(%{
  factor_type: "manure_ef3",
  management_system: "compost",
  value: Decimal.new("0.01"),
  unit: "kg N2O-N/kg N",
  source: "IPCC 2019 Table 10.21",
  notes: "N2O direct emission factor for composting"
})

IpccSeeder.upsert(%{
  factor_type: "manure_ef3",
  management_system: "pasture",
  value: Decimal.new("0.01"),
  unit: "kg N2O-N/kg N",
  source: "IPCC 2019 Table 10.21",
  notes: "N2O direct emission factor for pasture/range"
})

# Feed digestibility defaults (%)
IpccSeeder.upsert(%{
  factor_type: "feed_digestibility",
  species: "dairy_cattle",
  value: Decimal.new("65"),
  unit: "%",
  source: "IPCC 2019 Table 10.2",
  notes: "Default digestibility for dairy cattle diets"
})

IpccSeeder.upsert(%{
  factor_type: "feed_digestibility",
  species: "beef_cattle",
  climate_zone: "temperate",
  value: Decimal.new("60"),
  unit: "%",
  source: "IPCC 2019 Table 10.2",
  notes: "Default digestibility for beef cattle, temperate"
})

IpccSeeder.upsert(%{
  factor_type: "feed_digestibility",
  species: "beef_cattle",
  climate_zone: "tropical",
  value: Decimal.new("55"),
  unit: "%",
  source: "IPCC 2019 Table 10.2",
  notes: "Default digestibility for beef cattle, tropical"
})

IpccSeeder.upsert(%{
  factor_type: "feed_digestibility",
  species: "swine",
  value: Decimal.new("80"),
  unit: "%",
  source: "IPCC 2019 Table 10.2",
  notes: "Default digestibility for swine diets"
})

# Gross Energy defaults (MJ/kg DM)
IpccSeeder.upsert(%{
  factor_type: "feed_gross_energy",
  species: "dairy_cattle",
  value: Decimal.new("18.45"),
  unit: "MJ/kg DM",
  source: "IPCC 2019 Table 10.2",
  notes: "Default gross energy content for cattle feeds"
})

IpccSeeder.upsert(%{
  factor_type: "feed_gross_energy",
  species: "beef_cattle",
  value: Decimal.new("18.45"),
  unit: "MJ/kg DM",
  source: "IPCC 2019 Table 10.2",
  notes: "Default gross energy content for cattle feeds"
})

IpccSeeder.upsert(%{
  factor_type: "feed_gross_energy",
  species: "swine",
  value: Decimal.new("17.5"),
  unit: "MJ/kg DM",
  source: "IPCC 2019 Table 10.2",
  notes: "Default gross energy content for swine feeds"
})

IO.puts("IPCC emission factors seeded successfully!")
