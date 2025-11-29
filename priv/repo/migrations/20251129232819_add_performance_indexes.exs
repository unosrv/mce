defmodule Mce.Repo.Migrations.AddPerformanceIndexes do
  @moduledoc """
  Adds indexes to improve query performance for common access patterns.

  Based on analysis of context modules, the following query patterns were identified:
  - Farms filtered by user_id, ordered by name (list_farms_for_user)
  - Farms filtered by user_id, ordered by updated_at DESC (list_recent_farms_with_stats)
  - Feed presets filtered by country AND is_active (list_feed_presets)
  - IPCC factors filtered by factor_type, species, climate_zone (get_emission_factor)
  """
  use Ecto.Migration

  def change do
    # Farms: optimize ORDER BY name (user_id index already exists)
    create index(:farms, [:name])

    # Farms: optimize ORDER BY updated_at DESC for dashboard queries
    create index(:farms, [:updated_at])

    # Feed presets: composite index for the most common query pattern
    # where(country: ^country, is_active: true)
    create index(:feed_presets, [:country, :is_active])

    # IPCC emission factors: composite index for multi-criteria lookups
    # Covers queries filtering by factor_type + species + climate_zone
    create index(:ipcc_emission_factors, [:factor_type, :species, :climate_zone])

    # IPCC emission factors: composite index including country
    # Covers queries filtering by factor_type + country
    create index(:ipcc_emission_factors, [:factor_type, :country])
  end
end
