defmodule Mce.Repo.Migrations.CreateBarnInfo do
  use Ecto.Migration

  def change do
    create table(:barn_info) do
      add :livestock_group_id, references(:livestock_groups, on_delete: :delete_all), null: false

      add :barn_type, :string, size: 50, null: false
      add :total_area, :decimal, precision: 10, scale: 2
      add :area_per_animal, :decimal, precision: 10, scale: 2

      # Temperature control
      add :temperature_controlled, :boolean, default: false
      add :average_temperature, :decimal, precision: 5, scale: 2
      add :heating_type, :string, size: 50
      add :cooling_type, :string, size: 50

      # Bedding
      add :bedding_type, :string, size: 50
      add :bedding_change_frequency, :string, size: 50

      timestamps(type: :utc_datetime)
    end

    create unique_index(:barn_info, [:livestock_group_id])
  end
end
