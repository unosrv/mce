defmodule Mce.Livestock.ManureSystem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "manure_systems" do
    field :system_type, :string
    field :percentage, :decimal
    # Anaerobic digester options
    field :has_anaerobic_digester, :boolean, default: false
    field :digester_type, :string
    field :biogas_captured, :boolean, default: false
    field :biogas_use, :string
    # Solid-liquid separation
    field :has_separator, :boolean, default: false
    field :separator_efficiency, :decimal
    # Additional treatment
    field :treatment_type, :string
    # Storage duration (affects MCF)
    field :storage_duration_days, :integer

    belongs_to :livestock_group, Mce.Livestock.LivestockGroup

    timestamps(type: :utc_datetime)
  end

  @required_fields [:system_type, :percentage, :livestock_group_id]
  @optional_fields [
    :has_anaerobic_digester,
    :digester_type,
    :biogas_captured,
    :biogas_use,
    :has_separator,
    :separator_efficiency,
    :treatment_type,
    :storage_duration_days
  ]

  @system_types ~w(lagoon liquid_slurry solid_storage daily_spread pasture deep_pit compost other)
  @digester_types ~w(covered_lagoon complete_mix plug_flow fixed_film)
  @biogas_uses ~w(flaring electricity heat cogeneration vehicle_fuel)

  @doc false
  def changeset(manure_system, attrs) do
    manure_system
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_inclusion(:system_type, @system_types)
    |> validate_inclusion(:digester_type, @digester_types, message: "invalid digester type")
    |> validate_inclusion(:biogas_use, @biogas_uses, message: "invalid biogas use")
    |> validate_number(:percentage, greater_than: 0, less_than_or_equal_to: 100)
    |> validate_number(:separator_efficiency,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    )
    |> validate_number(:storage_duration_days, greater_than_or_equal_to: 0)
    |> foreign_key_constraint(:livestock_group_id)
  end
end
