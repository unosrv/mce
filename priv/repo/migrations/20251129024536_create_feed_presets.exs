defmodule Mce.Repo.Migrations.CreateFeedPresets do
  use Ecto.Migration

  def change do
    create table(:feed_presets) do
      add :country, :string, size: 2, null: false
      add :name_ko, :string
      add :name_en, :string
      add :name_pt_br, :string
      add :feed_type, :string, size: 50, null: false
      add :dry_matter_percentage, :decimal, precision: 5, scale: 2
      add :gross_energy, :decimal, precision: 10, scale: 4
      add :digestibility, :decimal, precision: 5, scale: 2
      add :crude_protein, :decimal, precision: 5, scale: 2
      add :is_active, :boolean, default: true

      timestamps(type: :utc_datetime)
    end

    create index(:feed_presets, [:country])
    create index(:feed_presets, [:feed_type])
  end
end
