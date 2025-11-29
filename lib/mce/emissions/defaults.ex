defmodule Mce.Emissions.Defaults do
  @moduledoc """
  IPCC Tier 2 default values for greenhouse gas emission calculations.

  These values are based on the 2019 Refinement to the 2006 IPCC Guidelines
  for National Greenhouse Gas Inventories, Volume 4: Agriculture, Forestry
  and Other Land Use.

  All emission factors are hardcoded for reliability and auditability.
  """

  # ============================================================================
  # Global Warming Potentials (100-year horizon, AR5)
  # ============================================================================

  @doc "Global Warming Potential for CH₄ (100-year, IPCC AR5)"
  def gwp_ch4, do: 28

  @doc "Global Warming Potential for N₂O (100-year, IPCC AR5)"
  def gwp_n2o, do: 265

  # ============================================================================
  # Physical Constants
  # ============================================================================

  @doc "Energy content of methane (MJ/kg CH₄)"
  def ch4_energy, do: 55.65

  @doc "Density of methane at STP (kg/m³)"
  def ch4_density, do: 0.67

  @doc "Conversion factor for N to N₂O (44/28)"
  def n_to_n2o_factor, do: 44 / 28

  # ============================================================================
  # Methane Conversion Factor (Ym) for Enteric Fermentation
  # Expressed as percentage of gross energy converted to CH₄
  # ============================================================================

  @ym_values %{
    # High-producing dairy
    "dairy_cattle" => 6.0,
    # Grazing/feedlot mix
    "beef_cattle" => 5.5,
    # Non-ruminant (very low)
    "swine" => 1.0
  }

  @doc """
  Get methane conversion factor (Ym) for a species.
  Returns percentage of gross energy intake converted to CH₄.
  """
  def get_ym(species) when is_binary(species) do
    Map.get(@ym_values, species, 5.0)
  end

  def get_ym(_), do: 5.0

  # ============================================================================
  # Maximum CH₄ Producing Capacity (Bo)
  # m³ CH₄ per kg of volatile solids (VS) excreted
  # ============================================================================

  @bo_values %{
    "dairy_cattle" => 0.24,
    "beef_cattle" => 0.19,
    "swine" => 0.48
  }

  @doc """
  Get maximum CH₄ producing capacity (Bo) for a species.
  Returns m³ CH₄ per kg VS.
  """
  def get_bo(species) when is_binary(species) do
    Map.get(@bo_values, species, 0.20)
  end

  def get_bo(_), do: 0.20

  # ============================================================================
  # Methane Conversion Factor (MCF) by Management System
  # Expressed as percentage of Bo realized
  # Values for temperate climate (15-25°C annual average)
  # ============================================================================

  @mcf_temperate %{
    "pasture" => 1.5,
    "daily_spread" => 0.5,
    "solid_storage" => 4.0,
    "liquid_slurry" => 27.0,
    "lagoon" => 73.0,
    "deep_pit" => 35.0,
    "compost" => 0.5,
    "other" => 10.0
  }

  @mcf_tropical %{
    "pasture" => 2.0,
    "daily_spread" => 0.5,
    "solid_storage" => 5.0,
    "liquid_slurry" => 55.0,
    "lagoon" => 78.0,
    "deep_pit" => 47.0,
    "compost" => 1.0,
    "other" => 15.0
  }

  @mcf_cold %{
    "pasture" => 1.0,
    "daily_spread" => 0.1,
    "solid_storage" => 2.0,
    "liquid_slurry" => 17.0,
    "lagoon" => 66.0,
    "deep_pit" => 23.0,
    "compost" => 0.5,
    "other" => 5.0
  }

  @doc """
  Get MCF value for a management system in a given climate zone.
  Returns percentage of Bo that is realized as CH₄.

  Climate zones:
  - :cold - annual average < 15°C
  - :temperate - annual average 15-25°C
  - :tropical - annual average > 25°C
  """
  def get_mcf(system_type, climate_zone \\ :temperate)

  def get_mcf(system_type, :cold) when is_binary(system_type) do
    Map.get(@mcf_cold, system_type, 5.0)
  end

  def get_mcf(system_type, :temperate) when is_binary(system_type) do
    Map.get(@mcf_temperate, system_type, 10.0)
  end

  def get_mcf(system_type, :tropical) when is_binary(system_type) do
    Map.get(@mcf_tropical, system_type, 15.0)
  end

  def get_mcf(_, _), do: 10.0

  # ============================================================================
  # N₂O Emission Factors (EF3) for Direct Emissions from MMS
  # kg N₂O-N per kg N excreted
  # ============================================================================

  @ef3_values %{
    "pasture" => 0.02,
    "daily_spread" => 0.001,
    "solid_storage" => 0.005,
    "liquid_slurry" => 0.005,
    "lagoon" => 0.0,
    "deep_pit" => 0.002,
    "compost" => 0.006,
    "other" => 0.005
  }

  @doc """
  Get EF3 value for direct N₂O emissions from a management system.
  Returns kg N₂O-N per kg N excreted.
  """
  def get_ef3(system_type) when is_binary(system_type) do
    Map.get(@ef3_values, system_type, 0.005)
  end

  def get_ef3(_), do: 0.005

  # ============================================================================
  # Nitrogen Excretion Rates
  # kg N per head per year
  # ============================================================================

  @n_excretion_defaults %{
    # High-producing dairy
    "dairy_cattle" => 120.0,
    # Growing cattle
    "beef_cattle" => 50.0,
    # Finishing pig
    "swine" => 16.0
  }

  @doc """
  Get default nitrogen excretion rate for a species.
  Returns kg N per head per year.
  """
  def get_n_excretion(species) when is_binary(species) do
    Map.get(@n_excretion_defaults, species, 50.0)
  end

  def get_n_excretion(_), do: 50.0

  # ============================================================================
  # Volatile Solids (VS) Excretion Rates
  # kg VS per head per day
  # ============================================================================

  @vs_rates %{
    # Based on 600kg dairy cow
    "dairy_cattle" => 5.1,
    # Based on 400kg cattle
    "beef_cattle" => 4.0,
    # Based on 100kg finishing pig
    "swine" => 0.27
  }

  @doc """
  Get default volatile solids excretion rate for a species.
  Returns kg VS per head per day.
  """
  def get_vs_rate(species) when is_binary(species) do
    Map.get(@vs_rates, species, 4.0)
  end

  def get_vs_rate(_), do: 4.0

  # ============================================================================
  # Default Gross Energy Intake (when feed data not available)
  # MJ per head per day
  # ============================================================================

  @default_ge %{
    # High-producing dairy
    "dairy_cattle" => 250.0,
    # Growing cattle
    "beef_cattle" => 150.0,
    # Finishing pig
    "swine" => 35.0
  }

  @doc """
  Get default gross energy intake for a species.
  Returns MJ per head per day.
  """
  def get_default_ge(species) when is_binary(species) do
    Map.get(@default_ge, species, 150.0)
  end

  def get_default_ge(_), do: 150.0

  # ============================================================================
  # Default Feed Properties
  # Used when feed items don't have these values specified
  # ============================================================================

  @default_feed_properties %{
    "forage" => %{gross_energy: 17.5, digestibility: 55, dry_matter: 35},
    "concentrate" => %{gross_energy: 18.5, digestibility: 80, dry_matter: 88},
    "byproduct" => %{gross_energy: 17.0, digestibility: 65, dry_matter: 90},
    "supplement" => %{gross_energy: 18.0, digestibility: 85, dry_matter: 95}
  }

  @doc """
  Get default properties for a feed type.
  Returns map with :gross_energy (MJ/kg DM), :digestibility (%), :dry_matter (%).
  """
  def get_feed_defaults(feed_type) when is_binary(feed_type) do
    Map.get(@default_feed_properties, feed_type, %{
      gross_energy: 17.5,
      digestibility: 70,
      dry_matter: 85
    })
  end

  def get_feed_defaults(_) do
    %{gross_energy: 17.5, digestibility: 70, dry_matter: 85}
  end

  # ============================================================================
  # Climate Zone Detection
  # ============================================================================

  @korea_climate :temperate

  @us_climate_by_state %{
    # Cold climate states
    "AK" => :cold,
    "MN" => :cold,
    "WI" => :cold,
    "MI" => :cold,
    "ME" => :cold,
    "VT" => :cold,
    "NH" => :cold,
    "ND" => :cold,
    "SD" => :cold,
    "MT" => :cold,
    "WY" => :cold,
    "ID" => :cold,
    # Tropical/subtropical states
    "FL" => :tropical,
    "HI" => :tropical,
    "PR" => :tropical
    # All others default to :temperate
  }

  @brazil_climate_by_state %{
    # Southern Brazil (temperate)
    "RS" => :temperate,
    "SC" => :temperate,
    "PR" => :temperate,
    # Northern Brazil (tropical)
    "AM" => :tropical,
    "PA" => :tropical,
    "AC" => :tropical,
    "RO" => :tropical,
    "RR" => :tropical,
    "AP" => :tropical,
    "TO" => :tropical,
    "MA" => :tropical
    # Most of Brazil defaults to :tropical
  }

  @doc """
  Detect climate zone based on country and state/province.
  """
  def detect_climate_zone(country, state_province \\ nil)

  def detect_climate_zone("KR", _), do: @korea_climate
  def detect_climate_zone("Korea", _), do: @korea_climate

  def detect_climate_zone("US", state) when is_binary(state) do
    Map.get(@us_climate_by_state, String.upcase(state), :temperate)
  end

  def detect_climate_zone("BR", state) when is_binary(state) do
    Map.get(@brazil_climate_by_state, String.upcase(state), :tropical)
  end

  def detect_climate_zone("Brazil", state), do: detect_climate_zone("BR", state)

  def detect_climate_zone(_, _), do: :temperate
end
