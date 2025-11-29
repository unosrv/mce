defmodule Mce.Repo.Migrations.CreateHousingPeriods do
  use Ecto.Migration

  def change do
    create table(:housing_periods) do
      add :livestock_group_id, references(:livestock_groups, on_delete: :delete_all), null: false

      add :month, :integer, null: false
      add :barn_percentage, :decimal, precision: 5, scale: 2
      add :exercise_yard_percentage, :decimal, precision: 5, scale: 2
      add :grazing_percentage, :decimal, precision: 5, scale: 2

      timestamps(type: :utc_datetime)
    end

    create index(:housing_periods, [:livestock_group_id])
    create unique_index(:housing_periods, [:livestock_group_id, :month])

    create constraint(:housing_periods, :housing_percentage_sum,
             check: "barn_percentage + exercise_yard_percentage + grazing_percentage = 100"
           )
  end
end
