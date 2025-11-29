defmodule Mce.Emissions.CalculatorTest do
  use Mce.DataCase

  alias Mce.Emissions.{Calculator, Defaults}

  describe "calculate_enteric_ch4/2" do
    test "calculates enteric CH4 for dairy cattle with default GE" do
      group = %{
        species: "dairy_cattle",
        head_count: 100,
        feed_items: []
      }

      result = Calculator.calculate_enteric_ch4(group, [])

      # Expected calculation:
      # GE = 250 MJ/day (default for dairy)
      # Ym = 6.0% (dairy cattle)
      # EF = (250 * 0.06 * 365) / 55.65 = 98.38 kg CH4/head/year
      # Total = 98.38 * 100 * 28 / 1000 = 275.5 tonnes CO2e

      assert_in_delta result, 275.5, 1.0
    end

    test "calculates enteric CH4 for beef cattle with default GE" do
      group = %{
        species: "beef_cattle",
        head_count: 200,
        feed_items: []
      }

      result = Calculator.calculate_enteric_ch4(group, [])

      # Expected calculation:
      # GE = 150 MJ/day (default for beef)
      # Ym = 5.5% (beef cattle)
      # EF = (150 * 0.055 * 365) / 55.65 = 54.14 kg CH4/head/year
      # Total = 54.14 * 200 * 28 / 1000 = 303.2 tonnes CO2e

      assert_in_delta result, 303.2, 1.0
    end

    test "calculates enteric CH4 for swine (very low emissions)" do
      group = %{
        species: "swine",
        head_count: 1000,
        feed_items: []
      }

      result = Calculator.calculate_enteric_ch4(group, [])

      # Expected calculation:
      # GE = 35 MJ/day (default for swine)
      # Ym = 1.0% (swine - non-ruminant)
      # EF = (35 * 0.01 * 365) / 55.65 = 2.30 kg CH4/head/year
      # Total = 2.30 * 1000 * 28 / 1000 = 64.3 tonnes CO2e

      assert_in_delta result, 64.3, 1.0
    end

    test "uses feed data when available" do
      group = %{
        species: "dairy_cattle",
        head_count: 100,
        feed_items: []
      }

      # Simulate feed items with known GE values
      feed_items = [
        %{
          feed_type: "forage",
          daily_amount: Decimal.new("15"),
          gross_energy: Decimal.new("18.0"),
          dry_matter_percentage: Decimal.new("35")
        },
        %{
          feed_type: "concentrate",
          daily_amount: Decimal.new("8"),
          gross_energy: Decimal.new("18.5"),
          dry_matter_percentage: Decimal.new("88")
        }
      ]

      result = Calculator.calculate_enteric_ch4(group, feed_items)

      # Expected:
      # GE from forage = 15 * 18.0 * 0.35 = 94.5 MJ
      # GE from concentrate = 8 * 18.5 * 0.88 = 130.24 MJ
      # Total GE = 224.74 MJ/day
      # EF = (224.74 * 0.06 * 365) / 55.65 = 88.46 kg CH4/head/year
      # Total = 88.46 * 100 * 28 / 1000 = 247.7 tonnes CO2e

      assert_in_delta result, 247.7, 2.0
    end
  end

  describe "calculate_gross_energy_intake/2" do
    test "returns default GE when no feed items" do
      group = %{species: "dairy_cattle"}
      result = Calculator.calculate_gross_energy_intake(group, [])
      assert result == 250.0
    end

    test "calculates GE from feed items" do
      group = %{species: "dairy_cattle"}

      feed_items = [
        %{
          feed_type: "forage",
          daily_amount: Decimal.new("10"),
          gross_energy: Decimal.new("17.5"),
          dry_matter_percentage: Decimal.new("40")
        }
      ]

      result = Calculator.calculate_gross_energy_intake(group, feed_items)

      # 10 * 17.5 * 0.40 = 70 MJ/day
      assert_in_delta result, 70.0, 0.1
    end

    test "uses default GE values when feed item GE is nil" do
      group = %{species: "dairy_cattle"}

      feed_items = [
        %{
          feed_type: "forage",
          daily_amount: Decimal.new("10"),
          gross_energy: nil,
          dry_matter_percentage: nil
        }
      ]

      result = Calculator.calculate_gross_energy_intake(group, feed_items)

      # Default forage: GE=17.5, DM=35%
      # 10 * 17.5 * 0.35 = 61.25 MJ/day
      assert_in_delta result, 61.25, 0.1
    end
  end

  describe "calculate_manure_ch4/3" do
    test "calculates manure CH4 with pasture system" do
      group = %{
        species: "dairy_cattle",
        head_count: 100
      }

      manure_systems = [
        %{system_type: "pasture", percentage: Decimal.new("100")}
      ]

      result = Calculator.calculate_manure_ch4(group, manure_systems, :temperate)

      # VS = 5.1 kg/day (dairy default)
      # Bo = 0.24 m3/kg VS
      # MCF pasture temperate = 1.5%
      # EF = 5.1 * 365 * 0.24 * 0.67 * 0.015 = 4.49 kg CH4/head/year
      # Total = 4.49 * 100 * 28 / 1000 = 12.6 tonnes CO2e

      assert_in_delta result, 12.6, 0.5
    end

    test "calculates manure CH4 with lagoon system (high MCF)" do
      group = %{
        species: "dairy_cattle",
        head_count: 100
      }

      manure_systems = [
        %{system_type: "lagoon", percentage: Decimal.new("100")}
      ]

      result = Calculator.calculate_manure_ch4(group, manure_systems, :temperate)

      # MCF lagoon temperate = 73%
      # EF = 5.1 * 365 * 0.24 * 0.67 * 0.73 = 218.3 kg CH4/head/year
      # Total = 218.3 * 100 * 28 / 1000 = 611.2 tonnes CO2e

      assert_in_delta result, 611.2, 5.0
    end

    test "calculates manure CH4 with mixed systems" do
      group = %{
        species: "beef_cattle",
        head_count: 200
      }

      manure_systems = [
        %{system_type: "pasture", percentage: Decimal.new("60")},
        %{system_type: "solid_storage", percentage: Decimal.new("40")}
      ]

      result = Calculator.calculate_manure_ch4(group, manure_systems, :temperate)

      # VS = 4.0 kg/day (beef default)
      # Bo = 0.19 m3/kg VS
      # Weighted MCF = 0.60 * 0.015 + 0.40 * 0.04 = 0.009 + 0.016 = 0.025
      # EF = 4.0 * 365 * 0.19 * 0.67 * 0.025 = 4.65 kg CH4/head/year
      # Total = 4.65 * 200 * 28 / 1000 = 26.0 tonnes CO2e

      assert_in_delta result, 26.0, 1.0
    end

    test "uses pasture default when no manure systems defined" do
      group = %{
        species: "dairy_cattle",
        head_count: 100
      }

      result = Calculator.calculate_manure_ch4(group, [], :temperate)

      # Should use pasture MCF as default
      assert result > 0
    end

    test "calculates higher emissions in tropical climate" do
      group = %{
        species: "dairy_cattle",
        head_count: 100
      }

      manure_systems = [
        %{system_type: "liquid_slurry", percentage: Decimal.new("100")}
      ]

      temperate = Calculator.calculate_manure_ch4(group, manure_systems, :temperate)
      tropical = Calculator.calculate_manure_ch4(group, manure_systems, :tropical)

      # Tropical MCF is higher (55% vs 27%)
      assert tropical > temperate
    end
  end

  describe "calculate_manure_n2o/2" do
    test "calculates N2O emissions with pasture system" do
      group = %{
        species: "dairy_cattle",
        head_count: 100
      }

      manure_systems = [
        %{system_type: "pasture", percentage: Decimal.new("100")}
      ]

      result = Calculator.calculate_manure_n2o(group, manure_systems)

      # N_ex = 120 kg N/head/year (dairy default)
      # EF3 pasture = 0.02
      # N2O = 120 * 0.02 * (44/28) = 3.77 kg N2O/head/year
      # Total = 3.77 * 100 * 265 / 1000 = 100.0 tonnes CO2e

      assert_in_delta result, 100.0, 2.0
    end

    test "calculates N2O emissions with lagoon system (zero direct)" do
      group = %{
        species: "dairy_cattle",
        head_count: 100
      }

      manure_systems = [
        %{system_type: "lagoon", percentage: Decimal.new("100")}
      ]

      result = Calculator.calculate_manure_n2o(group, manure_systems)

      # EF3 lagoon = 0 (anaerobic - no direct N2O)
      assert_in_delta result, 0.0, 0.01
    end

    test "calculates N2O with mixed systems" do
      group = %{
        species: "beef_cattle",
        head_count: 200
      }

      manure_systems = [
        %{system_type: "pasture", percentage: Decimal.new("50")},
        %{system_type: "solid_storage", percentage: Decimal.new("50")}
      ]

      result = Calculator.calculate_manure_n2o(group, manure_systems)

      # N_ex = 50 kg N/head/year (beef default)
      # Weighted EF3 = 0.5 * 0.02 + 0.5 * 0.005 = 0.0125
      # N2O = 50 * 0.0125 * (44/28) = 0.98 kg N2O/head/year
      # Total = 0.98 * 200 * 265 / 1000 = 52.0 tonnes CO2e

      assert_in_delta result, 52.0, 2.0
    end
  end

  describe "calculate_group_emissions/2" do
    test "calculates all emissions for a group" do
      group = %{
        species: "dairy_cattle",
        head_count: 100,
        feed_items: [],
        manure_systems: [
          %{system_type: "pasture", percentage: Decimal.new("100")}
        ]
      }

      result = Calculator.calculate_group_emissions(group, :temperate)

      assert Map.has_key?(result, :enteric)
      assert Map.has_key?(result, :manure_ch4)
      assert Map.has_key?(result, :manure_n2o)
      assert Map.has_key?(result, :head_count)

      assert result.enteric > 0
      assert result.manure_ch4 > 0
      assert result.manure_n2o > 0
      assert result.head_count == 100
    end
  end

  describe "calculate_farm_emissions/1" do
    test "aggregates emissions across multiple groups" do
      farm = %{
        country: "KR",
        state_province: nil,
        livestock_groups: [
          %{
            id: 1,
            name: "Dairy Herd",
            species: "dairy_cattle",
            head_count: 50,
            feed_items: [],
            manure_systems: [
              %{system_type: "solid_storage", percentage: Decimal.new("100")}
            ]
          },
          %{
            id: 2,
            name: "Beef Cattle",
            species: "beef_cattle",
            head_count: 100,
            feed_items: [],
            manure_systems: [
              %{system_type: "pasture", percentage: Decimal.new("100")}
            ]
          }
        ]
      }

      result = Calculator.calculate_farm_emissions(farm)

      assert Map.has_key?(result, :total)
      assert Map.has_key?(result, :enteric)
      assert Map.has_key?(result, :manure_ch4)
      assert Map.has_key?(result, :manure_n2o)
      assert Map.has_key?(result, :by_group)
      assert Map.has_key?(result, :by_source)

      # Total should be sum of all sources
      assert_in_delta result.total, result.enteric + result.manure_ch4 + result.manure_n2o, 0.01

      # Should have breakdown for both groups
      assert length(result.by_group) == 2

      # by_source should have the same values as individual sources
      assert result.by_source["enteric_fermentation"] == result.enteric
      assert result.by_source["manure_ch4"] == result.manure_ch4
    end

    test "handles farm with no livestock groups" do
      farm = %{
        country: "KR",
        state_province: nil,
        livestock_groups: []
      }

      result = Calculator.calculate_farm_emissions(farm)

      assert result.total == 0
      assert result.enteric == 0
      assert result.manure_ch4 == 0
      assert result.manure_n2o == 0
      assert result.by_group == []
    end

    test "detects climate zone from country" do
      korea_farm = %{
        country: "KR",
        state_province: nil,
        livestock_groups: [
          %{
            id: 1,
            name: "Test",
            species: "dairy_cattle",
            head_count: 100,
            feed_items: [],
            manure_systems: [
              %{system_type: "liquid_slurry", percentage: Decimal.new("100")}
            ]
          }
        ]
      }

      brazil_farm = %{
        country: "BR",
        state_province: "AM",
        livestock_groups: [
          %{
            id: 1,
            name: "Test",
            species: "dairy_cattle",
            head_count: 100,
            feed_items: [],
            manure_systems: [
              %{system_type: "liquid_slurry", percentage: Decimal.new("100")}
            ]
          }
        ]
      }

      korea_result = Calculator.calculate_farm_emissions(korea_farm)
      brazil_result = Calculator.calculate_farm_emissions(brazil_farm)

      # Brazil (tropical) should have higher manure CH4 emissions due to higher MCF
      assert brazil_result.manure_ch4 > korea_result.manure_ch4
    end
  end

  describe "Defaults module" do
    test "GWP values are correct" do
      assert Defaults.gwp_ch4() == 28
      assert Defaults.gwp_n2o() == 265
    end

    test "Ym values by species" do
      assert Defaults.get_ym("dairy_cattle") == 6.0
      assert Defaults.get_ym("beef_cattle") == 5.5
      assert Defaults.get_ym("swine") == 1.0
      assert Defaults.get_ym("unknown") == 5.0
    end

    test "Bo values by species" do
      assert Defaults.get_bo("dairy_cattle") == 0.24
      assert Defaults.get_bo("beef_cattle") == 0.19
      assert Defaults.get_bo("swine") == 0.48
    end

    test "MCF values by system and climate" do
      assert Defaults.get_mcf("pasture", :temperate) == 1.5
      assert Defaults.get_mcf("lagoon", :temperate) == 73.0
      assert Defaults.get_mcf("lagoon", :tropical) == 78.0
      assert Defaults.get_mcf("lagoon", :cold) == 66.0
    end

    test "EF3 values by system" do
      assert Defaults.get_ef3("pasture") == 0.02
      assert Defaults.get_ef3("lagoon") == 0.0
      assert Defaults.get_ef3("solid_storage") == 0.005
    end

    test "climate zone detection" do
      assert Defaults.detect_climate_zone("KR") == :temperate
      assert Defaults.detect_climate_zone("Korea") == :temperate
      assert Defaults.detect_climate_zone("US", "FL") == :tropical
      assert Defaults.detect_climate_zone("US", "MN") == :cold
      assert Defaults.detect_climate_zone("US", "TX") == :temperate
      assert Defaults.detect_climate_zone("BR", "AM") == :tropical
      assert Defaults.detect_climate_zone("BR", "RS") == :temperate
    end
  end
end
