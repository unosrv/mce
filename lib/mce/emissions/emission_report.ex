defmodule Mce.Emissions.EmissionReport do
  use Ecto.Schema
  import Ecto.Changeset

  schema "emission_reports" do
    field :report_year, :integer
    field :fiscal_year_label, :string
    # Emission totals (tonnes CO2e)
    field :total_emissions, :decimal
    field :enteric_emissions, :decimal
    field :manure_ch4_emissions, :decimal
    field :manure_n2o_emissions, :decimal
    # Metadata
    field :calculation_version, :string
    field :calculated_at, :utc_datetime
    # Detailed breakdown (JSONB)
    field :breakdown_by_group, :map
    field :breakdown_by_source, :map

    belongs_to :farm, Mce.Farms.Farm

    timestamps(type: :utc_datetime)
  end

  @required_fields [:report_year, :calculated_at, :farm_id]
  @optional_fields [
    :fiscal_year_label,
    :total_emissions,
    :enteric_emissions,
    :manure_ch4_emissions,
    :manure_n2o_emissions,
    :calculation_version,
    :breakdown_by_group,
    :breakdown_by_source
  ]

  @doc false
  def changeset(emission_report, attrs) do
    emission_report
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_number(:report_year, greater_than: 1990, less_than: 2100)
    |> validate_number(:total_emissions, greater_than_or_equal_to: 0)
    |> validate_number(:enteric_emissions, greater_than_or_equal_to: 0)
    |> validate_number(:manure_ch4_emissions, greater_than_or_equal_to: 0)
    |> validate_number(:manure_n2o_emissions, greater_than_or_equal_to: 0)
    |> unique_constraint([:farm_id, :report_year])
    |> foreign_key_constraint(:farm_id)
  end
end
