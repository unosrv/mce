defmodule Mce.Farms do
  @moduledoc """
  The Farms context.
  """

  import Ecto.Query, warn: false
  alias Mce.Repo

  alias Mce.Farms.Farm

  @doc """
  Returns the list of farms for a user.
  """
  def list_farms_for_user(user_id) do
    Farm
    |> where(user_id: ^user_id)
    |> order_by(:name)
    |> Repo.all()
  end

  @doc """
  Gets a single farm.

  Raises `Ecto.NoResultsError` if the Farm does not exist.
  """
  def get_farm!(id), do: Repo.get!(Farm, id)

  @doc """
  Gets a single farm for a specific user.

  Returns nil if the farm doesn't exist or doesn't belong to the user.
  """
  def get_farm_for_user(id, user_id) do
    Farm
    |> where(id: ^id, user_id: ^user_id)
    |> Repo.one()
  end

  @doc """
  Creates a farm.
  """
  def create_farm(attrs \\ %{}) do
    %Farm{}
    |> Farm.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a farm.
  """
  def update_farm(%Farm{} = farm, attrs) do
    farm
    |> Farm.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a farm.
  """
  def delete_farm(%Farm{} = farm) do
    Repo.delete(farm)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking farm changes.
  """
  def change_farm(%Farm{} = farm, attrs \\ %{}) do
    Farm.changeset(farm, attrs)
  end
end
