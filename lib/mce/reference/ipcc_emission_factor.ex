defmodule Mce.Reference.IpccEmissionFactor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ipcc_emission_factors" do
    field :factor_type, :string
    field :species, :string
    field :climate_zone, :string
    field :management_system, :string
    field :country, :string
    field :value, :decimal
    field :unit, :string
    field :source, :string
    field :notes, :string

    timestamps(type: :utc_datetime)
  end

  @required_fields [:factor_type, :value]
  @optional_fields [
    :species,
    :climate_zone,
    :management_system,
    :country,
    :unit,
    :source,
    :notes
  ]

  @factor_types ~w(
    enteric_fermentation_ef
    manure_mcf
    manure_bo
    manure_n_excretion
    manure_ef3
    feed_digestibility
    feed_gross_energy
    gwp_ch4
    gwp_n2o
  )

  @doc false
  def changeset(ipcc_emission_factor, attrs) do
    ipcc_emission_factor
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_inclusion(:factor_type, @factor_types)
    |> validate_number(:value, greater_than_or_equal_to: 0)
    |> validate_length(:country, is: 2)
  end

  @doc """
  A changeset for creating IPCC emission factors from admin panel.
  """
  def create_changeset(ipcc_emission_factor, attrs, _metadata \\ %{}) do
    changeset(ipcc_emission_factor, attrs)
  end

  @doc """
  A changeset for updating IPCC emission factors from admin panel.
  """
  def update_changeset(ipcc_emission_factor, attrs, _metadata \\ %{}) do
    changeset(ipcc_emission_factor, attrs)
  end
end
