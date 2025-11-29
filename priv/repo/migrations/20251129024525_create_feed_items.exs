defmodule Mce.Repo.Migrations.CreateFeedItems do
  use Ecto.Migration

  def change do
    create table(:feed_items) do
      add :livestock_group_id, references(:livestock_groups, on_delete: :delete_all), null: false

      add :name, :string, null: false
      add :feed_type, :string, size: 50, null: false
      add :preset_id, :integer

      # Composition
      add :daily_amount, :decimal, precision: 10, scale: 2
      add :dry_matter_percentage, :decimal, precision: 5, scale: 2
      add :gross_energy, :decimal, precision: 10, scale: 4
      add :digestibility, :decimal, precision: 5, scale: 2
      add :crude_protein, :decimal, precision: 5, scale: 2

      # Additives
      add :additive_type, :string, size: 50
      add :additive_amount, :decimal, precision: 10, scale: 4

      add :sort_order, :integer, default: 0

      timestamps(type: :utc_datetime)
    end

    create index(:feed_items, [:livestock_group_id])
  end
end
