defmodule Mce.Farms.Farm do
  use Ecto.Schema
  import Ecto.Changeset

  schema "farms" do
    field :name, :string
    field :country, :string
    field :address_line1, :string
    field :address_line2, :string
    field :city, :string
    field :state_province, :string
    field :postal_code, :string
    # Korean-specific address fields
    field :road_address, :string
    field :jibun_address, :string
    field :building_name, :string
    # Coordinates
    field :latitude, :decimal
    field :longitude, :decimal
    # Fiscal year settings
    field :fiscal_year_start_month, :integer, default: 1
    field :fiscal_year_start_day, :integer, default: 1
    field :logo_path, :string

    belongs_to :user, Mce.Accounts.User
    has_many :livestock_groups, Mce.Livestock.LivestockGroup
    has_many :emission_reports, Mce.Emissions.EmissionReport

    timestamps(type: :utc_datetime)
  end

  @required_fields [:name, :country, :user_id]
  @optional_fields [
    :address_line1,
    :address_line2,
    :city,
    :state_province,
    :postal_code,
    :road_address,
    :jibun_address,
    :building_name,
    :latitude,
    :longitude,
    :fiscal_year_start_month,
    :fiscal_year_start_day,
    :logo_path
  ]

  @doc false
  def changeset(farm, attrs) do
    farm
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_length(:country, is: 2)
    |> validate_length(:name, min: 1, max: 255)
    |> validate_number(:fiscal_year_start_month,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 12
    )
    |> validate_number(:fiscal_year_start_day,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 31
    )
    |> foreign_key_constraint(:user_id)
  end

  @doc """
  A changeset for creating farms from admin panel.
  """
  def create_changeset(farm, attrs, _metadata \\ %{}) do
    changeset(farm, attrs)
  end

  @doc """
  A changeset for updating farms from admin panel.
  """
  def update_changeset(farm, attrs, _metadata \\ %{}) do
    changeset(farm, attrs)
  end
end
