defmodule Mce.Repo.Migrations.FixFeedItemsColumns do
  use Ecto.Migration

  def change do
    alter table(:feed_items) do
      # Rename columns to match schema
      remove :name
      add :feed_name, :string

      remove :preset_id
      add :feed_preset_id, references(:feed_presets, on_delete: :nilify_all)

      # Add missing column
      add :is_main_diet, :boolean, default: false

      # Remove unused columns
      remove :additive_type
      remove :additive_amount
      remove :sort_order
    end

    # Relax the not null constraint since we renamed name to feed_name
    # and feed_name is optional in the schema
  end
end
