defmodule Mce.Livestock.FeedItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "feed_items" do
    field :feed_type, :string
    field :feed_name, :string
    field :daily_amount, :decimal
    # Nutritional parameters for IPCC calculations
    field :dry_matter_percentage, :decimal
    field :gross_energy, :decimal
    field :digestibility, :decimal
    field :crude_protein, :decimal
    field :is_main_diet, :boolean, default: false

    belongs_to :livestock_group, Mce.Livestock.LivestockGroup
    belongs_to :feed_preset, Mce.Reference.FeedPreset

    timestamps(type: :utc_datetime)
  end

  @required_fields [:feed_type, :daily_amount, :livestock_group_id]
  @optional_fields [
    :feed_name,
    :dry_matter_percentage,
    :gross_energy,
    :digestibility,
    :crude_protein,
    :is_main_diet,
    :feed_preset_id
  ]

  @feed_types ~w(forage concentrate byproduct supplement)

  @doc false
  def changeset(feed_item, attrs) do
    feed_item
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_inclusion(:feed_type, @feed_types)
    |> validate_number(:daily_amount, greater_than: 0)
    |> validate_number(:dry_matter_percentage, greater_than: 0, less_than_or_equal_to: 100)
    |> validate_number(:gross_energy, greater_than: 0)
    |> validate_number(:digestibility, greater_than_or_equal_to: 0, less_than_or_equal_to: 100)
    |> validate_number(:crude_protein, greater_than_or_equal_to: 0, less_than_or_equal_to: 100)
    |> foreign_key_constraint(:livestock_group_id)
    |> foreign_key_constraint(:feed_preset_id)
  end
end
