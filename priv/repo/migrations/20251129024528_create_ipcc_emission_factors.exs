defmodule Mce.Repo.Migrations.CreateIpccEmissionFactors do
  use Ecto.Migration

  def change do
    create table(:ipcc_emission_factors) do
      add :factor_type, :string, size: 50, null: false
      add :species, :string, size: 50
      add :climate_zone, :string, size: 50
      add :management_system, :string, size: 50
      add :country, :string, size: 2
      add :value, :decimal, precision: 15, scale: 8, null: false
      add :unit, :string, size: 50
      add :source, :string
      add :notes, :text

      timestamps(type: :utc_datetime)
    end

    create index(:ipcc_emission_factors, [:factor_type])
    create index(:ipcc_emission_factors, [:species])
  end
end
