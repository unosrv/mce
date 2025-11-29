defmodule Mce.Livestock.BarnInfo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "barn_info" do
    field :barn_type, :string
    field :total_area, :decimal
    field :area_per_animal, :decimal
    # Temperature control
    field :temperature_controlled, :boolean, default: false
    field :average_temperature, :decimal
    field :heating_type, :string
    field :cooling_type, :string
    # Bedding
    field :bedding_type, :string
    field :bedding_change_frequency, :string

    belongs_to :livestock_group, Mce.Livestock.LivestockGroup

    timestamps(type: :utc_datetime)
  end

  @required_fields [:barn_type, :livestock_group_id]
  @optional_fields [
    :total_area,
    :area_per_animal,
    :temperature_controlled,
    :average_temperature,
    :heating_type,
    :cooling_type,
    :bedding_type,
    :bedding_change_frequency
  ]

  @barn_types ~w(tie_stall free_stall open_lot deep_bedding other)
  @bedding_types ~w(straw sawdust sand rubber_mats none other)
  @bedding_change_frequencies ~w(daily weekly bi_weekly monthly as_needed)

  @doc false
  def changeset(barn_info, attrs) do
    barn_info
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_inclusion(:barn_type, @barn_types)
    |> validate_inclusion(:bedding_type, @bedding_types, message: "invalid bedding type")
    |> validate_inclusion(:bedding_change_frequency, @bedding_change_frequencies,
      message: "invalid frequency"
    )
    |> validate_number(:total_area, greater_than: 0)
    |> validate_number(:area_per_animal, greater_than: 0)
    |> unique_constraint(:livestock_group_id)
    |> foreign_key_constraint(:livestock_group_id)
  end
end
