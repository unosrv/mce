defmodule Mce.Reference.FeedPreset do
  use Ecto.Schema
  import Ecto.Changeset

  schema "feed_presets" do
    field :country, :string
    field :name_ko, :string
    field :name_en, :string
    field :name_pt_br, :string
    field :feed_type, :string
    # Nutritional parameters
    field :dry_matter_percentage, :decimal
    field :gross_energy, :decimal
    field :digestibility, :decimal
    field :crude_protein, :decimal
    field :is_active, :boolean, default: true

    has_many :feed_items, Mce.Livestock.FeedItem

    timestamps(type: :utc_datetime)
  end

  @required_fields [:country, :feed_type]
  @optional_fields [
    :name_ko,
    :name_en,
    :name_pt_br,
    :dry_matter_percentage,
    :gross_energy,
    :digestibility,
    :crude_protein,
    :is_active
  ]

  @feed_types ~w(forage concentrate byproduct supplement)

  @doc false
  def changeset(feed_preset, attrs) do
    feed_preset
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_length(:country, is: 2)
    |> validate_inclusion(:feed_type, @feed_types)
    |> validate_number(:dry_matter_percentage, greater_than: 0, less_than_or_equal_to: 100)
    |> validate_number(:gross_energy, greater_than: 0)
    |> validate_number(:digestibility, greater_than_or_equal_to: 0, less_than_or_equal_to: 100)
    |> validate_number(:crude_protein, greater_than_or_equal_to: 0, less_than_or_equal_to: 100)
  end

  @doc """
  Returns the localized name for a given locale.
  Falls back to English, then Korean if the requested locale is not available.
  """
  def localized_name(%__MODULE__{} = preset, locale) do
    case locale do
      "ko" -> preset.name_ko || preset.name_en
      "pt_BR" -> preset.name_pt_br || preset.name_en || preset.name_ko
      _ -> preset.name_en || preset.name_ko
    end
  end

  @doc """
  A changeset for creating feed presets from admin panel.
  """
  def create_changeset(feed_preset, attrs, _metadata \\ %{}) do
    changeset(feed_preset, attrs)
  end

  @doc """
  A changeset for updating feed presets from admin panel.
  """
  def update_changeset(feed_preset, attrs, _metadata \\ %{}) do
    changeset(feed_preset, attrs)
  end
end
