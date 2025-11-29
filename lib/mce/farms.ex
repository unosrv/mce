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
  Gets a farm with all livestock data preloaded for emission calculations.

  Preloads:
  - livestock_groups
    - feed_items
    - manure_systems

  Raises `Ecto.NoResultsError` if the Farm does not exist.
  """
  def get_farm_with_livestock!(id) do
    Farm
    |> Repo.get!(id)
    |> Repo.preload(livestock_groups: [:feed_items, :manure_systems])
  end

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

  # Dashboard statistics functions

  @doc """
  Returns dashboard statistics for a user.

  Returns a map with:
  - `farm_count` - number of farms
  - `livestock_group_count` - number of livestock groups
  - `total_emissions` - sum of total emissions from all emission reports (in tonnes CO₂e)
  """
  def get_dashboard_stats(user_id) do
    alias Mce.Livestock.LivestockGroup
    alias Mce.Emissions.EmissionReport

    farm_count =
      Farm
      |> where(user_id: ^user_id)
      |> Repo.aggregate(:count, :id)

    livestock_group_count =
      LivestockGroup
      |> join(:inner, [lg], f in Farm, on: lg.farm_id == f.id)
      |> where([lg, f], f.user_id == ^user_id)
      |> Repo.aggregate(:count, :id)

    total_emissions =
      EmissionReport
      |> join(:inner, [er], f in Farm, on: er.farm_id == f.id)
      |> where([er, f], f.user_id == ^user_id)
      |> Repo.aggregate(:sum, :total_emissions) || Decimal.new(0)

    %{
      farm_count: farm_count,
      livestock_group_count: livestock_group_count,
      total_emissions: total_emissions
    }
  end

  @doc """
  Returns recent farms with preloaded livestock groups and latest emission report.
  Limited to the most recent `limit` farms by updated_at.
  """
  def list_recent_farms_with_stats(user_id, limit \\ 5) do
    Farm
    |> where(user_id: ^user_id)
    |> order_by(desc: :updated_at)
    |> limit(^limit)
    |> preload([:livestock_groups, :emission_reports])
    |> Repo.all()
  end

  @doc """
  Returns all farms for a user with their latest emission reports for comparison.

  Each farm will have its `emission_reports` preloaded (sorted by year desc).
  """
  def list_farms_with_emissions(user_id) do
    Farm
    |> where(user_id: ^user_id)
    |> order_by(:name)
    |> preload(:emission_reports)
    |> Repo.all()
  end

  @doc """
  Gets multiple farms by IDs for a specific user with emission reports.

  Returns only farms that belong to the user.
  """
  def get_farms_by_ids(ids, user_id) when is_list(ids) do
    Farm
    |> where([f], f.id in ^ids and f.user_id == ^user_id)
    |> preload(:emission_reports)
    |> Repo.all()
  end
end
