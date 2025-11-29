defmodule Mce.Emissions.Calculator do
  @moduledoc """
  IPCC Tier 2 greenhouse gas emission calculator for livestock operations.

  This module implements the calculation methodology from the 2019 Refinement
  to the 2006 IPCC Guidelines for National Greenhouse Gas Inventories.

  Emissions calculated:
  - Enteric fermentation (CH₄)
  - Manure management (CH₄)
  - Manure management (N₂O - direct)

  All results are returned in tonnes CO₂-equivalent (CO₂e).
  """

  alias Mce.Emissions.Defaults

  @doc """
  Calculate total emissions for a farm.

  Expects a farm struct with preloaded livestock_groups and their associations:
  - feed_items
  - manure_systems

  Returns a map with:
  - :total - Total emissions (tonnes CO₂e)
  - :enteric - Enteric fermentation emissions (tonnes CO₂e)
  - :manure_ch4 - Manure CH₄ emissions (tonnes CO₂e)
  - :manure_n2o - Manure N₂O emissions (tonnes CO₂e)
  - :by_group - Breakdown by livestock group
  - :by_source - Breakdown by emission source
  """
  def calculate_farm_emissions(farm) do
    climate_zone = Defaults.detect_climate_zone(farm.country, farm.state_province)

    groups = farm.livestock_groups || []

    group_results =
      Enum.map(groups, fn group ->
        result = calculate_group_emissions(group, climate_zone)
        {group.id, result}
      end)
      |> Enum.into(%{})

    # Aggregate by emission source
    totals =
      Enum.reduce(group_results, %{enteric: 0, manure_ch4: 0, manure_n2o: 0}, fn {_id, result},
                                                                                 acc ->
        %{
          enteric: acc.enteric + result.enteric,
          manure_ch4: acc.manure_ch4 + result.manure_ch4,
          manure_n2o: acc.manure_n2o + result.manure_n2o
        }
      end)

    total = totals.enteric + totals.manure_ch4 + totals.manure_n2o

    # Build detailed breakdown by group
    by_group =
      Enum.map(group_results, fn {group_id, result} ->
        group = Enum.find(groups, &(&1.id == group_id))

        %{
          "group_id" => group_id,
          "group_name" => group.name,
          "species" => group.species,
          "head_count" => group.head_count,
          "enteric_co2e" => result.enteric,
          "manure_ch4_co2e" => result.manure_ch4,
          "manure_n2o_co2e" => result.manure_n2o,
          "total_co2e" => result.enteric + result.manure_ch4 + result.manure_n2o
        }
      end)

    %{
      total: total,
      enteric: totals.enteric,
      manure_ch4: totals.manure_ch4,
      manure_n2o: totals.manure_n2o,
      by_group: by_group,
      by_source: %{
        "enteric_fermentation" => totals.enteric,
        "manure_ch4" => totals.manure_ch4,
        "manure_n2o_direct" => totals.manure_n2o
      }
    }
  end

  @doc """
  Calculate emissions for a single livestock group.

  Returns a map with enteric, manure_ch4, and manure_n2o emissions in tonnes CO₂e.
  """
  def calculate_group_emissions(group, climate_zone \\ :temperate) do
    feed_items = group.feed_items || []
    manure_systems = group.manure_systems || []
    head_count = group.head_count || 0

    enteric = calculate_enteric_ch4(group, feed_items)
    manure_ch4 = calculate_manure_ch4(group, manure_systems, climate_zone)
    manure_n2o = calculate_manure_n2o(group, manure_systems)

    %{
      enteric: enteric,
      manure_ch4: manure_ch4,
      manure_n2o: manure_n2o,
      head_count: head_count
    }
  end

  # ============================================================================
  # Enteric Fermentation CH₄
  # ============================================================================

  @doc """
  Calculate enteric fermentation CH₄ emissions.

  Formula: EF = (GE × Ym/100 × 365) / 55.65
  Where:
  - GE = Gross energy intake (MJ/head/day)
  - Ym = Methane conversion factor (% of GE)
  - 55.65 = Energy content of methane (MJ/kg)

  Returns tonnes CO₂e.
  """
  def calculate_enteric_ch4(group, feed_items) do
    species = group.species
    head_count = group.head_count || 0

    # Get gross energy intake
    ge = calculate_gross_energy_intake(group, feed_items)

    # Get Ym for this species
    ym = Defaults.get_ym(species)

    # Calculate emission factor (kg CH₄/head/year)
    ef = ge * (ym / 100) * 365 / Defaults.ch4_energy()

    # Total emissions (tonnes CO₂e)
    ef * head_count * Defaults.gwp_ch4() / 1000
  end

  @doc """
  Calculate gross energy intake from feed items.

  When feed data is available, sums (daily_amount × gross_energy × dry_matter_percentage).
  When no feed data, uses IPCC defaults based on species.

  Returns MJ/head/day.
  """
  def calculate_gross_energy_intake(group, feed_items) when is_list(feed_items) do
    if Enum.empty?(feed_items) do
      # Use defaults when no feed data available
      Defaults.get_default_ge(group.species)
    else
      Enum.reduce(feed_items, 0, fn item, acc ->
        amount = decimal_to_float(item.daily_amount, 0)
        ge = get_feed_gross_energy(item)
        dm = get_feed_dry_matter(item) / 100

        acc + amount * ge * dm
      end)
    end
  end

  def calculate_gross_energy_intake(group, _), do: Defaults.get_default_ge(group.species)

  # ============================================================================
  # Manure Management CH₄
  # ============================================================================

  @doc """
  Calculate manure management CH₄ emissions.

  Formula: EF = (VS × 365) × [Bo × 0.67 × Σ(MCF/100 × %MMS/100)]
  Where:
  - VS = Daily volatile solids excretion (kg/head/day)
  - Bo = Maximum CH₄ producing capacity (m³ CH₄/kg VS)
  - 0.67 = Density of CH₄ (kg/m³)
  - MCF = Methane conversion factor for each MMS (%)
  - %MMS = Percentage of manure handled by each system (%)

  Returns tonnes CO₂e.
  """
  def calculate_manure_ch4(group, manure_systems, climate_zone) do
    species = group.species
    head_count = group.head_count || 0

    # Get volatile solids excretion rate
    vs = calculate_volatile_solids(group)

    # Get Bo for species
    bo = Defaults.get_bo(species)

    # Sum MCF × percentage for each management system
    mcf_weighted =
      if Enum.empty?(manure_systems) do
        # Default to pasture if no manure systems defined
        Defaults.get_mcf("pasture", climate_zone) / 100
      else
        manure_systems
        |> Enum.map(fn sys ->
          mcf = Defaults.get_mcf(sys.system_type, climate_zone) / 100
          percentage = decimal_to_float(sys.percentage, 0) / 100
          mcf * percentage
        end)
        |> Enum.sum()
      end

    # Calculate emission factor (kg CH₄/head/year)
    ef = vs * 365 * bo * Defaults.ch4_density() * mcf_weighted

    # Total emissions (tonnes CO₂e)
    ef * head_count * Defaults.gwp_ch4() / 1000
  end

  @doc """
  Calculate volatile solids excretion rate.

  When feed data is available, uses digestibility to calculate VS.
  Otherwise uses species defaults.

  Returns kg VS/head/day.
  """
  def calculate_volatile_solids(group) do
    # For now, use species defaults
    # TODO: Can enhance to calculate from feed digestibility
    Defaults.get_vs_rate(group.species)
  end

  # ============================================================================
  # Manure Management N₂O (Direct)
  # ============================================================================

  @doc """
  Calculate direct N₂O emissions from manure management.

  Formula: N₂O = N_ex × Σ(EF3 × %MMS) × 44/28
  Where:
  - N_ex = Annual N excretion (kg N/head/year)
  - EF3 = Emission factor for each MMS (kg N₂O-N/kg N)
  - %MMS = Percentage of manure handled by each system
  - 44/28 = Conversion factor from N to N₂O

  Returns tonnes CO₂e.
  """
  def calculate_manure_n2o(group, manure_systems) do
    head_count = group.head_count || 0

    # Get nitrogen excretion rate
    n_ex = calculate_nitrogen_excretion(group)

    # Sum EF3 × percentage for each management system
    ef3_weighted =
      if Enum.empty?(manure_systems) do
        # Default to pasture if no manure systems defined
        Defaults.get_ef3("pasture")
      else
        manure_systems
        |> Enum.map(fn sys ->
          ef3 = Defaults.get_ef3(sys.system_type)
          percentage = decimal_to_float(sys.percentage, 0) / 100
          ef3 * percentage
        end)
        |> Enum.sum()
      end

    # Calculate N₂O emissions (kg N₂O/head/year)
    n2o = n_ex * ef3_weighted * Defaults.n_to_n2o_factor()

    # Total emissions (tonnes CO₂e)
    n2o * head_count * Defaults.gwp_n2o() / 1000
  end

  @doc """
  Calculate nitrogen excretion rate.

  Uses species defaults for now.
  TODO: Can enhance to calculate from crude protein intake.

  Returns kg N/head/year.
  """
  def calculate_nitrogen_excretion(group) do
    Defaults.get_n_excretion(group.species)
  end

  # ============================================================================
  # Helper Functions
  # ============================================================================

  defp get_feed_gross_energy(feed_item) do
    case feed_item.gross_energy do
      nil ->
        defaults = Defaults.get_feed_defaults(feed_item.feed_type)
        defaults.gross_energy

      value ->
        decimal_to_float(value, 17.5)
    end
  end

  defp get_feed_dry_matter(feed_item) do
    case feed_item.dry_matter_percentage do
      nil ->
        defaults = Defaults.get_feed_defaults(feed_item.feed_type)
        defaults.dry_matter

      value ->
        decimal_to_float(value, 85)
    end
  end

  defp decimal_to_float(nil, default), do: default
  defp decimal_to_float(%Decimal{} = d, _default), do: Decimal.to_float(d)
  defp decimal_to_float(value, _default) when is_float(value), do: value
  defp decimal_to_float(value, _default) when is_integer(value), do: value / 1
  defp decimal_to_float(_, default), do: default
end
