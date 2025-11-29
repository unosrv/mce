defmodule Mce.Livestock.HousingPeriod do
  use Ecto.Schema
  import Ecto.Changeset

  schema "housing_periods" do
    field :month, :integer
    field :barn_percentage, :decimal
    field :exercise_yard_percentage, :decimal
    field :grazing_percentage, :decimal

    belongs_to :livestock_group, Mce.Livestock.LivestockGroup

    timestamps(type: :utc_datetime)
  end

  @required_fields [
    :month,
    :barn_percentage,
    :exercise_yard_percentage,
    :grazing_percentage,
    :livestock_group_id
  ]
  @optional_fields []

  @doc false
  def changeset(housing_period, attrs) do
    housing_period
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_number(:month, greater_than_or_equal_to: 1, less_than_or_equal_to: 12)
    |> validate_number(:barn_percentage, greater_than_or_equal_to: 0, less_than_or_equal_to: 100)
    |> validate_number(:exercise_yard_percentage,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    )
    |> validate_number(:grazing_percentage,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    )
    |> validate_percentages_sum()
    |> unique_constraint([:livestock_group_id, :month])
    |> foreign_key_constraint(:livestock_group_id)
  end

  defp validate_percentages_sum(changeset) do
    barn = get_field(changeset, :barn_percentage) || Decimal.new(0)
    yard = get_field(changeset, :exercise_yard_percentage) || Decimal.new(0)
    grazing = get_field(changeset, :grazing_percentage) || Decimal.new(0)

    total =
      Decimal.add(barn, yard)
      |> Decimal.add(grazing)

    if Decimal.equal?(total, Decimal.new(100)) do
      changeset
    else
      add_error(changeset, :barn_percentage, "percentages must sum to 100")
    end
  end
end
