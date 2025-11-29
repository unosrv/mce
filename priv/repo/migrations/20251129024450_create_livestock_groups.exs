defmodule Mce.Repo.Migrations.CreateLivestockGroups do
  use Ecto.Migration

  def change do
    create table(:livestock_groups) do
      add :farm_id, references(:farms, on_delete: :delete_all), null: false

      # Basic Info (Step 1)
      add :name, :string, null: false
      add :species, :string, size: 50, null: false
      add :sub_category, :string, size: 50
      add :head_count, :integer, null: false
      add :average_weight, :decimal, precision: 10, scale: 2
      add :mature_weight, :decimal, precision: 10, scale: 2
      add :daily_weight_gain, :decimal, precision: 6, scale: 3

      # Dairy-specific
      add :milk_yield, :decimal, precision: 10, scale: 2
      add :milk_fat_content, :decimal, precision: 5, scale: 2

      # Pregnancy info
      add :pregnant_percentage, :decimal, precision: 5, scale: 2
      add :days_pregnant, :integer

      # Activity
      add :grazing_hours_per_day, :decimal, precision: 4, scale: 1

      timestamps(type: :utc_datetime)
    end

    create index(:livestock_groups, [:farm_id])
    create index(:livestock_groups, [:species])
  end
end
