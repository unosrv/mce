defmodule Mce.Repo.Migrations.CreateEmissionReports do
  use Ecto.Migration

  def change do
    create table(:emission_reports) do
      add :farm_id, references(:farms, on_delete: :delete_all), null: false

      # Report period
      add :report_year, :integer, null: false
      add :fiscal_year_label, :string, size: 50

      # Totals (all in tonnes CO2e)
      add :total_emissions, :decimal, precision: 15, scale: 4
      add :enteric_emissions, :decimal, precision: 15, scale: 4
      add :manure_ch4_emissions, :decimal, precision: 15, scale: 4
      add :manure_n2o_emissions, :decimal, precision: 15, scale: 4

      # Metadata
      add :calculation_version, :string, size: 20
      add :calculated_at, :utc_datetime, null: false

      # Detailed breakdown (JSON for flexibility)
      add :breakdown_by_group, :map
      add :breakdown_by_source, :map

      timestamps(type: :utc_datetime)
    end

    create index(:emission_reports, [:farm_id])
    create unique_index(:emission_reports, [:farm_id, :report_year])
  end
end
