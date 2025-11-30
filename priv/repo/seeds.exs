# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Mce.Repo.insert!(%Mce.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

import Ecto.Query

# Load seed data files
seeds_path = Path.join(__DIR__, "seeds")

# IPCC Emission Factors (required for calculations)
Code.require_file("ipcc_emission_factors.exs", seeds_path)

# Feed Presets (reference data for each country)
Code.require_file("feed_presets.exs", seeds_path)

# Aliases (used by SeedHelpers module internally)

# =============================================================================
# Helper Functions
# =============================================================================

defmodule SeedHelpers do
  def create_or_get_user(email, attrs) do
    case Mce.Accounts.get_user_by_email(email) do
      nil ->
        {:ok, user} = Mce.Accounts.register_user(attrs)

        user
        |> Ecto.Changeset.change(%{
          is_admin: Map.get(attrs, :is_admin, false),
          confirmed_at: DateTime.utc_now(:second)
        })
        |> Mce.Repo.update!()

      existing_user ->
        existing_user
    end
  end

  def create_farm_if_not_exists(user, farm_attrs) do
    existing =
      Mce.Repo.one(
        from f in Mce.Farms.Farm,
          where: f.user_id == ^user.id and f.name == ^farm_attrs.name,
          limit: 1
      )

    case existing do
      nil ->
        {:ok, farm} = Mce.Farms.create_farm(Map.put(farm_attrs, :user_id, user.id))
        farm

      farm ->
        farm
    end
  end

  def create_livestock_group_if_not_exists(farm, group_attrs) do
    existing =
      Mce.Repo.one(
        from lg in Mce.Livestock.LivestockGroup,
          where: lg.farm_id == ^farm.id and lg.name == ^group_attrs.name,
          limit: 1
      )

    case existing do
      nil ->
        {:ok, group} =
          Mce.Livestock.create_livestock_group(Map.put(group_attrs, :farm_id, farm.id))

        group

      group ->
        group
    end
  end
end

# =============================================================================
# Users
# =============================================================================

IO.puts("\n=== Creating Users ===")

# Admin User
admin =
  SeedHelpers.create_or_get_user("admin@anysite.kr", %{
    email: "admin@anysite.kr",
    password: "AdminPassword123!",
    nickname: "Admin",
    is_admin: true
  })

IO.puts("Admin: #{admin.email}")

# Test User
test_user =
  SeedHelpers.create_or_get_user("jason@anysite.kr", %{
    email: "jason@anysite.kr",
    password: "jason12345678",
    nickname: "Jason"
  })

IO.puts("Test User: #{test_user.email}")

# Demo User - Korea
demo_kr =
  SeedHelpers.create_or_get_user("kimjihoon@nongup.kr", %{
    email: "kimjihoon@nongup.kr",
    password: "DemoPassword123!",
    nickname: "Kim Ji-hoon"
  })

IO.puts("Demo (KR): #{demo_kr.email}")

# Demo User - USA
demo_us =
  SeedHelpers.create_or_get_user("m.johnson@greenpastures.com", %{
    email: "m.johnson@greenpastures.com",
    password: "DemoPassword123!",
    nickname: "Mike Johnson"
  })

IO.puts("Demo (US): #{demo_us.email}")

# Demo User - Brazil
demo_br =
  SeedHelpers.create_or_get_user("carlos.silva@fazendauniao.com.br", %{
    email: "carlos.silva@fazendauniao.com.br",
    password: "DemoPassword123!",
    nickname: "Carlos Silva"
  })

IO.puts("Demo (BR): #{demo_br.email}")

# =============================================================================
# Farms - Korea
# =============================================================================

IO.puts("\n=== Creating Korean Farms ===")

farm_kr_1 =
  SeedHelpers.create_farm_if_not_exists(demo_kr, %{
    name: "Chungcheong Dairy Farm",
    country: "KR",
    road_address: "충청남도 천안시 동남구 목천읍 동리1길 12",
    city: "천안시",
    state_province: "충청남도",
    postal_code: "31059",
    latitude: Decimal.new("36.7913"),
    longitude: Decimal.new("127.1532"),
    fiscal_year_start_month: 1,
    fiscal_year_start_day: 1
  })

IO.puts("Farm: #{farm_kr_1.name}")

farm_kr_2 =
  SeedHelpers.create_farm_if_not_exists(demo_kr, %{
    name: "Gyeonggi Hanwoo Ranch",
    country: "KR",
    road_address: "경기도 이천시 마장면 덕이로 256",
    city: "이천시",
    state_province: "경기도",
    postal_code: "17364",
    latitude: Decimal.new("37.2341"),
    longitude: Decimal.new("127.4219"),
    fiscal_year_start_month: 1,
    fiscal_year_start_day: 1
  })

IO.puts("Farm: #{farm_kr_2.name}")

farm_kr_3 =
  SeedHelpers.create_farm_if_not_exists(admin, %{
    name: "Jeju Livestock Center",
    country: "KR",
    road_address: "제주특별자치도 제주시 애월읍 광령리 산 128",
    city: "제주시",
    state_province: "제주특별자치도",
    postal_code: "63058",
    latitude: Decimal.new("33.4457"),
    longitude: Decimal.new("126.3315"),
    fiscal_year_start_month: 4,
    fiscal_year_start_day: 1
  })

IO.puts("Farm: #{farm_kr_3.name}")

# =============================================================================
# Farms - USA
# =============================================================================

IO.puts("\n=== Creating US Farms ===")

farm_us_1 =
  SeedHelpers.create_farm_if_not_exists(demo_us, %{
    name: "Green Valley Dairy",
    country: "US",
    address_line1: "4521 County Road 118",
    city: "Lancaster",
    state_province: "Wisconsin",
    postal_code: "53813",
    latitude: Decimal.new("42.8474"),
    longitude: Decimal.new("-90.7107"),
    fiscal_year_start_month: 1,
    fiscal_year_start_day: 1
  })

IO.puts("Farm: #{farm_us_1.name}")

farm_us_2 =
  SeedHelpers.create_farm_if_not_exists(demo_us, %{
    name: "Sunrise Cattle Ranch",
    country: "US",
    address_line1: "8901 Ranch Road 2222",
    city: "Dripping Springs",
    state_province: "Texas",
    postal_code: "78620",
    latitude: Decimal.new("30.1902"),
    longitude: Decimal.new("-98.0867"),
    fiscal_year_start_month: 10,
    fiscal_year_start_day: 1
  })

IO.puts("Farm: #{farm_us_2.name}")

# =============================================================================
# Farms - Brazil
# =============================================================================

IO.puts("\n=== Creating Brazilian Farms ===")

farm_br_1 =
  SeedHelpers.create_farm_if_not_exists(demo_br, %{
    name: "Fazenda Boa Esperanca",
    country: "BR",
    address_line1: "Rodovia BR-060, Km 312",
    city: "Rio Verde",
    state_province: "Goias",
    postal_code: "75901-970",
    latitude: Decimal.new("-17.7983"),
    longitude: Decimal.new("-50.9194"),
    fiscal_year_start_month: 1,
    fiscal_year_start_day: 1
  })

IO.puts("Farm: #{farm_br_1.name}")

farm_br_2 =
  SeedHelpers.create_farm_if_not_exists(demo_br, %{
    name: "Estancia Santa Maria",
    country: "BR",
    address_line1: "Estrada Municipal SMT-040, Km 15",
    city: "Sao Gabriel do Oeste",
    state_province: "Mato Grosso do Sul",
    postal_code: "79490-000",
    latitude: Decimal.new("-19.3981"),
    longitude: Decimal.new("-54.5653"),
    fiscal_year_start_month: 7,
    fiscal_year_start_day: 1
  })

IO.puts("Farm: #{farm_br_2.name}")

# =============================================================================
# Livestock Groups - Korean Farms
# =============================================================================

IO.puts("\n=== Creating Livestock Groups ===")

# Chungcheong Dairy Farm - Dairy cattle
SeedHelpers.create_livestock_group_if_not_exists(farm_kr_1, %{
  name: "Holstein Milking Herd",
  species: "dairy_cattle",
  sub_category: "lactating",
  head_count: 85,
  average_weight: Decimal.new("650"),
  mature_weight: Decimal.new("680"),
  milk_yield: Decimal.new("28.5"),
  milk_fat_content: Decimal.new("3.8"),
  pregnant_percentage: Decimal.new("45"),
  days_pregnant: 150,
  grazing_hours_per_day: Decimal.new("0"),
  status: "complete"
})

IO.puts("  - Holstein Milking Herd (85 head)")

SeedHelpers.create_livestock_group_if_not_exists(farm_kr_1, %{
  name: "Dry Cows",
  species: "dairy_cattle",
  sub_category: "dry",
  head_count: 25,
  average_weight: Decimal.new("700"),
  mature_weight: Decimal.new("680"),
  pregnant_percentage: Decimal.new("100"),
  days_pregnant: 240,
  grazing_hours_per_day: Decimal.new("0"),
  status: "complete"
})

IO.puts("  - Dry Cows (25 head)")

SeedHelpers.create_livestock_group_if_not_exists(farm_kr_1, %{
  name: "Dairy Heifers",
  species: "dairy_cattle",
  sub_category: "heifer",
  head_count: 40,
  average_weight: Decimal.new("350"),
  mature_weight: Decimal.new("680"),
  daily_weight_gain: Decimal.new("0.75"),
  pregnant_percentage: Decimal.new("30"),
  days_pregnant: 90,
  grazing_hours_per_day: Decimal.new("0"),
  status: "complete"
})

IO.puts("  - Dairy Heifers (40 head)")

# Gyeonggi Hanwoo Ranch - Beef cattle
SeedHelpers.create_livestock_group_if_not_exists(farm_kr_2, %{
  name: "Hanwoo Bulls",
  species: "beef_cattle",
  sub_category: "bulls",
  head_count: 120,
  average_weight: Decimal.new("580"),
  mature_weight: Decimal.new("750"),
  daily_weight_gain: Decimal.new("0.85"),
  grazing_hours_per_day: Decimal.new("2"),
  status: "complete"
})

IO.puts("  - Hanwoo Bulls (120 head)")

SeedHelpers.create_livestock_group_if_not_exists(farm_kr_2, %{
  name: "Hanwoo Cows",
  species: "beef_cattle",
  sub_category: "cows",
  head_count: 80,
  average_weight: Decimal.new("480"),
  mature_weight: Decimal.new("500"),
  pregnant_percentage: Decimal.new("85"),
  days_pregnant: 140,
  grazing_hours_per_day: Decimal.new("3"),
  status: "complete"
})

IO.puts("  - Hanwoo Cows (80 head)")

# Jeju Livestock Center - Mixed
SeedHelpers.create_livestock_group_if_not_exists(farm_kr_3, %{
  name: "Jeju Black Pigs",
  species: "swine",
  sub_category: "finishing",
  head_count: 500,
  average_weight: Decimal.new("95"),
  mature_weight: Decimal.new("110"),
  daily_weight_gain: Decimal.new("0.65"),
  grazing_hours_per_day: Decimal.new("0"),
  status: "complete"
})

IO.puts("  - Jeju Black Pigs (500 head)")

# =============================================================================
# Livestock Groups - US Farms
# =============================================================================

# Green Valley Dairy
SeedHelpers.create_livestock_group_if_not_exists(farm_us_1, %{
  name: "Main Milking Herd",
  species: "dairy_cattle",
  sub_category: "lactating",
  head_count: 450,
  average_weight: Decimal.new("680"),
  mature_weight: Decimal.new("700"),
  milk_yield: Decimal.new("32.5"),
  milk_fat_content: Decimal.new("3.6"),
  pregnant_percentage: Decimal.new("42"),
  days_pregnant: 145,
  grazing_hours_per_day: Decimal.new("4"),
  status: "complete"
})

IO.puts("  - Main Milking Herd (450 head)")

SeedHelpers.create_livestock_group_if_not_exists(farm_us_1, %{
  name: "Replacement Heifers",
  species: "dairy_cattle",
  sub_category: "heifer",
  head_count: 180,
  average_weight: Decimal.new("320"),
  mature_weight: Decimal.new("700"),
  daily_weight_gain: Decimal.new("0.8"),
  pregnant_percentage: Decimal.new("25"),
  days_pregnant: 75,
  grazing_hours_per_day: Decimal.new("6"),
  status: "complete"
})

IO.puts("  - Replacement Heifers (180 head)")

# Sunrise Cattle Ranch - Beef
SeedHelpers.create_livestock_group_if_not_exists(farm_us_2, %{
  name: "Angus Cow-Calf Pairs",
  species: "beef_cattle",
  sub_category: "cows",
  head_count: 350,
  average_weight: Decimal.new("545"),
  mature_weight: Decimal.new("580"),
  pregnant_percentage: Decimal.new("92"),
  days_pregnant: 160,
  grazing_hours_per_day: Decimal.new("10"),
  status: "complete"
})

IO.puts("  - Angus Cow-Calf Pairs (350 head)")

SeedHelpers.create_livestock_group_if_not_exists(farm_us_2, %{
  name: "Feeder Steers",
  species: "beef_cattle",
  sub_category: "steers",
  head_count: 200,
  average_weight: Decimal.new("380"),
  mature_weight: Decimal.new("600"),
  daily_weight_gain: Decimal.new("1.2"),
  grazing_hours_per_day: Decimal.new("8"),
  status: "complete"
})

IO.puts("  - Feeder Steers (200 head)")

# =============================================================================
# Livestock Groups - Brazilian Farms
# =============================================================================

# Fazenda Boa Esperanca - Large scale beef
SeedHelpers.create_livestock_group_if_not_exists(farm_br_1, %{
  name: "Nelore Breeding Herd",
  species: "beef_cattle",
  sub_category: "cows",
  head_count: 2500,
  average_weight: Decimal.new("450"),
  mature_weight: Decimal.new("480"),
  pregnant_percentage: Decimal.new("88"),
  days_pregnant: 155,
  grazing_hours_per_day: Decimal.new("12"),
  status: "complete"
})

IO.puts("  - Nelore Breeding Herd (2500 head)")

SeedHelpers.create_livestock_group_if_not_exists(farm_br_1, %{
  name: "Nelore Fattening",
  species: "beef_cattle",
  sub_category: "steers",
  head_count: 1800,
  average_weight: Decimal.new("420"),
  mature_weight: Decimal.new("520"),
  daily_weight_gain: Decimal.new("0.95"),
  grazing_hours_per_day: Decimal.new("14"),
  status: "complete"
})

IO.puts("  - Nelore Fattening (1800 head)")

# Estancia Santa Maria - Mixed
SeedHelpers.create_livestock_group_if_not_exists(farm_br_2, %{
  name: "Brangus Cows",
  species: "beef_cattle",
  sub_category: "cows",
  head_count: 800,
  average_weight: Decimal.new("520"),
  mature_weight: Decimal.new("550"),
  pregnant_percentage: Decimal.new("90"),
  days_pregnant: 145,
  grazing_hours_per_day: Decimal.new("11"),
  status: "complete"
})

IO.puts("  - Brangus Cows (800 head)")

SeedHelpers.create_livestock_group_if_not_exists(farm_br_2, %{
  name: "Commercial Swine",
  species: "swine",
  sub_category: "finishing",
  head_count: 3000,
  average_weight: Decimal.new("85"),
  mature_weight: Decimal.new("115"),
  daily_weight_gain: Decimal.new("0.75"),
  grazing_hours_per_day: Decimal.new("0"),
  status: "complete"
})

IO.puts("  - Commercial Swine (3000 head)")

# =============================================================================
# Summary
# =============================================================================

IO.puts("\n=== Seed Data Summary ===")
IO.puts("Users: #{Mce.Repo.aggregate(Mce.Accounts.User, :count)}")
IO.puts("Farms: #{Mce.Repo.aggregate(Mce.Farms.Farm, :count)}")
IO.puts("Livestock Groups: #{Mce.Repo.aggregate(Mce.Livestock.LivestockGroup, :count)}")
IO.puts("\nAll seeds loaded successfully!")
