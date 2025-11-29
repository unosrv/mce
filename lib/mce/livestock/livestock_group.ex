defmodule Mce.Livestock.LivestockGroup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "livestock_groups" do
    field :name, :string
    field :species, :string
    field :sub_category, :string
    field :head_count, :integer
    # Weight parameters
    field :average_weight, :decimal
    field :mature_weight, :decimal
    field :daily_weight_gain, :decimal
    # Dairy-specific
    field :milk_yield, :decimal
    field :milk_fat_content, :decimal
    # Pregnancy
    field :pregnant_percentage, :decimal
    field :days_pregnant, :integer
    # Grazing
    field :grazing_hours_per_day, :decimal
    # Wizard state
    field :status, :string, default: "draft"
    field :wizard_step, :string, default: "basic_info"

    belongs_to :farm, Mce.Farms.Farm
    has_many :feed_items, Mce.Livestock.FeedItem
    has_many :housing_periods, Mce.Livestock.HousingPeriod
    has_one :barn_info, Mce.Livestock.BarnInfo
    has_many :manure_systems, Mce.Livestock.ManureSystem

    timestamps(type: :utc_datetime)
  end

  @required_fields [:name, :species, :head_count, :farm_id]
  @optional_fields [
    :sub_category,
    :average_weight,
    :mature_weight,
    :daily_weight_gain,
    :milk_yield,
    :milk_fat_content,
    :pregnant_percentage,
    :days_pregnant,
    :grazing_hours_per_day,
    :status,
    :wizard_step
  ]

  @status_types ~w(draft complete)

  @species_types ~w(beef_cattle dairy_cattle swine)

  @doc false
  def changeset(livestock_group, attrs) do
    livestock_group
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_inclusion(:species, @species_types)
    |> validate_inclusion(:status, @status_types)
    |> validate_number(:head_count, greater_than: 0)
    |> validate_number(:average_weight, greater_than: 0)
    |> validate_number(:mature_weight, greater_than: 0)
    |> validate_number(:daily_weight_gain, greater_than_or_equal_to: 0)
    |> validate_number(:milk_yield, greater_than_or_equal_to: 0)
    |> validate_number(:milk_fat_content, greater_than_or_equal_to: 0, less_than_or_equal_to: 100)
    |> validate_number(:pregnant_percentage,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    )
    |> validate_number(:days_pregnant, greater_than_or_equal_to: 0)
    |> validate_number(:grazing_hours_per_day,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 24
    )
    |> foreign_key_constraint(:farm_id)
  end

  @doc """
  Returns true if the livestock group is a draft.
  """
  def draft?(%__MODULE__{status: status}), do: status == "draft"

  @doc """
  Returns true if the livestock group is complete.
  """
  def complete?(%__MODULE__{status: status}), do: status == "complete"

  @doc """
  A changeset for creating livestock groups from admin panel.
  """
  def create_changeset(livestock_group, attrs, _metadata \\ %{}) do
    changeset(livestock_group, attrs)
  end

  @doc """
  A changeset for updating livestock groups from admin panel.
  """
  def update_changeset(livestock_group, attrs, _metadata \\ %{}) do
    changeset(livestock_group, attrs)
  end
end
