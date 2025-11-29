# Feed Presets Seed Data
# Common feed ingredients with nutritional parameters for each target country

alias Mce.Repo
alias Mce.Reference.FeedPreset

import Ecto.Query

# Helper to insert or update based on country + feed_type + name_en
defmodule FeedPresetSeeder do
  def upsert(attrs) do
    query =
      from fp in FeedPreset,
        where:
          fp.country == ^attrs.country and
            fp.feed_type == ^attrs.feed_type and
            fp.name_en == ^attrs.name_en

    case Repo.one(query) do
      nil ->
        %FeedPreset{}
        |> FeedPreset.changeset(attrs)
        |> Repo.insert!()

      existing ->
        existing
        |> FeedPreset.changeset(attrs)
        |> Repo.update!()
    end
  end
end

# =============================================================================
# Korea (KR) Feed Presets
# =============================================================================

# Forages - Korea
FeedPresetSeeder.upsert(%{
  country: "KR",
  feed_type: "forage",
  name_ko: "티모시 건초",
  name_en: "Timothy Hay",
  name_pt_br: "Feno de Timóteo",
  dry_matter_percentage: Decimal.new("88"),
  gross_energy: Decimal.new("18.4"),
  digestibility: Decimal.new("58"),
  crude_protein: Decimal.new("8.5"),
  is_active: true
})

FeedPresetSeeder.upsert(%{
  country: "KR",
  feed_type: "forage",
  name_ko: "알팔파 건초",
  name_en: "Alfalfa Hay",
  name_pt_br: "Feno de Alfafa",
  dry_matter_percentage: Decimal.new("90"),
  gross_energy: Decimal.new("18.0"),
  digestibility: Decimal.new("62"),
  crude_protein: Decimal.new("18.0"),
  is_active: true
})

FeedPresetSeeder.upsert(%{
  country: "KR",
  feed_type: "forage",
  name_ko: "볏짚",
  name_en: "Rice Straw",
  name_pt_br: "Palha de Arroz",
  dry_matter_percentage: Decimal.new("89"),
  gross_energy: Decimal.new("16.5"),
  digestibility: Decimal.new("40"),
  crude_protein: Decimal.new("4.5"),
  is_active: true
})

FeedPresetSeeder.upsert(%{
  country: "KR",
  feed_type: "forage",
  name_ko: "옥수수 사일리지",
  name_en: "Corn Silage",
  name_pt_br: "Silagem de Milho",
  dry_matter_percentage: Decimal.new("33"),
  gross_energy: Decimal.new("18.5"),
  digestibility: Decimal.new("70"),
  crude_protein: Decimal.new("8.0"),
  is_active: true
})

# Concentrates - Korea
FeedPresetSeeder.upsert(%{
  country: "KR",
  feed_type: "concentrate",
  name_ko: "배합사료 (한우용)",
  name_en: "Compound Feed (Hanwoo)",
  name_pt_br: "Ração Composta (Hanwoo)",
  dry_matter_percentage: Decimal.new("88"),
  gross_energy: Decimal.new("17.8"),
  digestibility: Decimal.new("78"),
  crude_protein: Decimal.new("14.0"),
  is_active: true
})

FeedPresetSeeder.upsert(%{
  country: "KR",
  feed_type: "concentrate",
  name_ko: "배합사료 (젖소용)",
  name_en: "Compound Feed (Dairy)",
  name_pt_br: "Ração Composta (Leite)",
  dry_matter_percentage: Decimal.new("88"),
  gross_energy: Decimal.new("18.0"),
  digestibility: Decimal.new("80"),
  crude_protein: Decimal.new("16.0"),
  is_active: true
})

FeedPresetSeeder.upsert(%{
  country: "KR",
  feed_type: "concentrate",
  name_ko: "옥수수",
  name_en: "Corn Grain",
  name_pt_br: "Grão de Milho",
  dry_matter_percentage: Decimal.new("88"),
  gross_energy: Decimal.new("18.9"),
  digestibility: Decimal.new("90"),
  crude_protein: Decimal.new("9.0"),
  is_active: true
})

# Byproducts - Korea
FeedPresetSeeder.upsert(%{
  country: "KR",
  feed_type: "byproduct",
  name_ko: "맥주박",
  name_en: "Brewers Grain",
  name_pt_br: "Resíduo de Cervejaria",
  dry_matter_percentage: Decimal.new("25"),
  gross_energy: Decimal.new("20.5"),
  digestibility: Decimal.new("70"),
  crude_protein: Decimal.new("27.0"),
  is_active: true
})

FeedPresetSeeder.upsert(%{
  country: "KR",
  feed_type: "byproduct",
  name_ko: "대두박",
  name_en: "Soybean Meal",
  name_pt_br: "Farelo de Soja",
  dry_matter_percentage: Decimal.new("89"),
  gross_energy: Decimal.new("19.5"),
  digestibility: Decimal.new("88"),
  crude_protein: Decimal.new("46.0"),
  is_active: true
})

# =============================================================================
# United States (US) Feed Presets
# =============================================================================

# Forages - US
FeedPresetSeeder.upsert(%{
  country: "US",
  feed_type: "forage",
  name_ko: "티모시 건초",
  name_en: "Timothy Hay",
  name_pt_br: "Feno de Timóteo",
  dry_matter_percentage: Decimal.new("88"),
  gross_energy: Decimal.new("18.4"),
  digestibility: Decimal.new("58"),
  crude_protein: Decimal.new("8.5"),
  is_active: true
})

FeedPresetSeeder.upsert(%{
  country: "US",
  feed_type: "forage",
  name_ko: "알팔파 건초",
  name_en: "Alfalfa Hay",
  name_pt_br: "Feno de Alfafa",
  dry_matter_percentage: Decimal.new("90"),
  gross_energy: Decimal.new("18.0"),
  digestibility: Decimal.new("62"),
  crude_protein: Decimal.new("18.0"),
  is_active: true
})

FeedPresetSeeder.upsert(%{
  country: "US",
  feed_type: "forage",
  name_ko: "옥수수 사일리지",
  name_en: "Corn Silage",
  name_pt_br: "Silagem de Milho",
  dry_matter_percentage: Decimal.new("35"),
  gross_energy: Decimal.new("18.5"),
  digestibility: Decimal.new("72"),
  crude_protein: Decimal.new("8.5"),
  is_active: true
})

# Concentrates - US
FeedPresetSeeder.upsert(%{
  country: "US",
  feed_type: "concentrate",
  name_ko: "옥수수",
  name_en: "Corn Grain",
  name_pt_br: "Grão de Milho",
  dry_matter_percentage: Decimal.new("88"),
  gross_energy: Decimal.new("18.9"),
  digestibility: Decimal.new("90"),
  crude_protein: Decimal.new("9.0"),
  is_active: true
})

FeedPresetSeeder.upsert(%{
  country: "US",
  feed_type: "concentrate",
  name_ko: "대두박",
  name_en: "Soybean Meal",
  name_pt_br: "Farelo de Soja",
  dry_matter_percentage: Decimal.new("89"),
  gross_energy: Decimal.new("19.5"),
  digestibility: Decimal.new("88"),
  crude_protein: Decimal.new("46.0"),
  is_active: true
})

# =============================================================================
# Brazil (BR) Feed Presets
# =============================================================================

# Forages - Brazil
FeedPresetSeeder.upsert(%{
  country: "BR",
  feed_type: "forage",
  name_ko: "브라키아리아 목초",
  name_en: "Brachiaria Pasture",
  name_pt_br: "Pastagem de Brachiária",
  dry_matter_percentage: Decimal.new("30"),
  gross_energy: Decimal.new("18.2"),
  digestibility: Decimal.new("55"),
  crude_protein: Decimal.new("7.0"),
  is_active: true
})

FeedPresetSeeder.upsert(%{
  country: "BR",
  feed_type: "forage",
  name_ko: "파니쿰 목초",
  name_en: "Panicum Pasture",
  name_pt_br: "Pastagem de Panicum",
  dry_matter_percentage: Decimal.new("28"),
  gross_energy: Decimal.new("18.0"),
  digestibility: Decimal.new("52"),
  crude_protein: Decimal.new("9.0"),
  is_active: true
})

FeedPresetSeeder.upsert(%{
  country: "BR",
  feed_type: "forage",
  name_ko: "옥수수 사일리지",
  name_en: "Corn Silage",
  name_pt_br: "Silagem de Milho",
  dry_matter_percentage: Decimal.new("32"),
  gross_energy: Decimal.new("18.3"),
  digestibility: Decimal.new("68"),
  crude_protein: Decimal.new("7.5"),
  is_active: true
})

FeedPresetSeeder.upsert(%{
  country: "BR",
  feed_type: "forage",
  name_ko: "사탕수수 사일리지",
  name_en: "Sugarcane Silage",
  name_pt_br: "Silagem de Cana",
  dry_matter_percentage: Decimal.new("30"),
  gross_energy: Decimal.new("17.5"),
  digestibility: Decimal.new("58"),
  crude_protein: Decimal.new("3.0"),
  is_active: true
})

# Concentrates - Brazil
FeedPresetSeeder.upsert(%{
  country: "BR",
  feed_type: "concentrate",
  name_ko: "옥수수",
  name_en: "Corn Grain",
  name_pt_br: "Grão de Milho",
  dry_matter_percentage: Decimal.new("88"),
  gross_energy: Decimal.new("18.9"),
  digestibility: Decimal.new("90"),
  crude_protein: Decimal.new("9.0"),
  is_active: true
})

FeedPresetSeeder.upsert(%{
  country: "BR",
  feed_type: "concentrate",
  name_ko: "대두박",
  name_en: "Soybean Meal",
  name_pt_br: "Farelo de Soja",
  dry_matter_percentage: Decimal.new("89"),
  gross_energy: Decimal.new("19.5"),
  digestibility: Decimal.new("88"),
  crude_protein: Decimal.new("46.0"),
  is_active: true
})

# Byproducts - Brazil
FeedPresetSeeder.upsert(%{
  country: "BR",
  feed_type: "byproduct",
  name_ko: "사탕수수 버개스",
  name_en: "Sugarcane Bagasse",
  name_pt_br: "Bagaço de Cana",
  dry_matter_percentage: Decimal.new("50"),
  gross_energy: Decimal.new("17.0"),
  digestibility: Decimal.new("40"),
  crude_protein: Decimal.new("2.5"),
  is_active: true
})

FeedPresetSeeder.upsert(%{
  country: "BR",
  feed_type: "byproduct",
  name_ko: "면실박",
  name_en: "Cottonseed Meal",
  name_pt_br: "Farelo de Algodão",
  dry_matter_percentage: Decimal.new("91"),
  gross_energy: Decimal.new("20.0"),
  digestibility: Decimal.new("70"),
  crude_protein: Decimal.new("41.0"),
  is_active: true
})

FeedPresetSeeder.upsert(%{
  country: "BR",
  feed_type: "byproduct",
  name_ko: "감귤박",
  name_en: "Citrus Pulp",
  name_pt_br: "Polpa Cítrica",
  dry_matter_percentage: Decimal.new("88"),
  gross_energy: Decimal.new("17.5"),
  digestibility: Decimal.new("82"),
  crude_protein: Decimal.new("6.5"),
  is_active: true
})

IO.puts("Feed presets seeded successfully!")
