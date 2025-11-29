defmodule Mce.FarmsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mce.Farms` context.
  """

  alias Mce.Farms

  def unique_farm_name, do: "Farm #{System.unique_integer([:positive])}"

  def valid_farm_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      name: unique_farm_name(),
      country: "KR",
      city: "Seoul",
      fiscal_year_start_month: 1,
      fiscal_year_start_day: 1
    })
  end

  @doc """
  Creates a farm for the given user.
  """
  def farm_fixture(user, attrs \\ %{}) do
    attrs =
      attrs
      |> valid_farm_attributes()
      |> Map.put(:user_id, user.id)

    {:ok, farm} = Farms.create_farm(attrs)
    farm
  end

  @doc """
  Creates a farm with associated user.
  Returns both user and farm.
  """
  def farm_with_user_fixture(attrs \\ %{}) do
    user = Mce.AccountsFixtures.user_fixture()
    farm = farm_fixture(user, attrs)
    {user, farm}
  end
end
