defmodule Mce.Repo.Migrations.CreateManureSystems do
  use Ecto.Migration

  def change do
    create table(:manure_systems) do
      add :livestock_group_id, references(:livestock_groups, on_delete: :delete_all), null: false

      add :system_type, :string, size: 50, null: false
      add :percentage, :decimal, precision: 5, scale: 2, null: false

      # Anaerobic digester options
      add :has_anaerobic_digester, :boolean, default: false
      add :digester_type, :string, size: 50
      add :biogas_captured, :boolean, default: false
      add :biogas_use, :string, size: 50

      # Solid-liquid separation
      add :has_separator, :boolean, default: false
      add :separator_efficiency, :decimal, precision: 5, scale: 2

      # Additional treatment
      add :treatment_type, :string, size: 50

      # Storage duration (affects MCF)
      add :storage_duration_days, :integer

      timestamps(type: :utc_datetime)
    end

    create index(:manure_systems, [:livestock_group_id])
  end
end
