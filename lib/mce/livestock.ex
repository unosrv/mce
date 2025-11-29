defmodule Mce.Livestock do
  @moduledoc """
  The Livestock context.
  Manages livestock groups, feed items, housing periods, barn info, and manure systems.
  """

  import Ecto.Query, warn: false
  alias Mce.Repo

  alias Mce.Livestock.{LivestockGroup, FeedItem, HousingPeriod, BarnInfo, ManureSystem}

  # -------------------------------------------------------------------
  # Livestock Groups
  # -------------------------------------------------------------------

  @doc """
  Returns the list of livestock groups for a farm.
  """
  def list_livestock_groups(farm_id) do
    LivestockGroup
    |> where(farm_id: ^farm_id)
    |> order_by(:name)
    |> Repo.all()
  end

  @doc """
  Gets a single livestock group.
  """
  def get_livestock_group!(id), do: Repo.get!(LivestockGroup, id)

  @doc """
  Creates a livestock group.
  """
  def create_livestock_group(attrs \\ %{}) do
    %LivestockGroup{}
    |> LivestockGroup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a livestock group.
  """
  def update_livestock_group(%LivestockGroup{} = livestock_group, attrs) do
    livestock_group
    |> LivestockGroup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a livestock group.
  """
  def delete_livestock_group(%LivestockGroup{} = livestock_group) do
    Repo.delete(livestock_group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking livestock group changes.
  """
  def change_livestock_group(%LivestockGroup{} = livestock_group, attrs \\ %{}) do
    LivestockGroup.changeset(livestock_group, attrs)
  end

  # -------------------------------------------------------------------
  # Feed Items
  # -------------------------------------------------------------------

  @doc """
  Returns the list of feed items for a livestock group.
  """
  def list_feed_items(livestock_group_id) do
    FeedItem
    |> where(livestock_group_id: ^livestock_group_id)
    |> order_by(desc: :is_main_diet)
    |> order_by(:feed_type)
    |> Repo.all()
  end

  @doc """
  Gets a single feed item.
  """
  def get_feed_item!(id), do: Repo.get!(FeedItem, id)

  @doc """
  Creates a feed item.
  """
  def create_feed_item(attrs \\ %{}) do
    %FeedItem{}
    |> FeedItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a feed item.
  """
  def update_feed_item(%FeedItem{} = feed_item, attrs) do
    feed_item
    |> FeedItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a feed item.
  """
  def delete_feed_item(%FeedItem{} = feed_item) do
    Repo.delete(feed_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking feed item changes.
  """
  def change_feed_item(%FeedItem{} = feed_item, attrs \\ %{}) do
    FeedItem.changeset(feed_item, attrs)
  end

  # -------------------------------------------------------------------
  # Housing Periods
  # -------------------------------------------------------------------

  @doc """
  Returns all housing periods for a livestock group.
  """
  def list_housing_periods(livestock_group_id) do
    HousingPeriod
    |> where(livestock_group_id: ^livestock_group_id)
    |> order_by(:month)
    |> Repo.all()
  end

  @doc """
  Gets a single housing period.
  """
  def get_housing_period!(id), do: Repo.get!(HousingPeriod, id)

  @doc """
  Creates or updates housing periods for a livestock group.
  Expects a list of maps with month and percentage data.
  """
  def upsert_housing_periods(livestock_group_id, periods_data) do
    Repo.transaction(fn ->
      Enum.map(periods_data, fn period_data ->
        attrs = Map.put(period_data, :livestock_group_id, livestock_group_id)
        month = Map.get(period_data, :month) || Map.get(period_data, "month")

        case Repo.get_by(HousingPeriod, livestock_group_id: livestock_group_id, month: month) do
          nil ->
            %HousingPeriod{}
            |> HousingPeriod.changeset(attrs)
            |> Repo.insert!()

          existing ->
            existing
            |> HousingPeriod.changeset(attrs)
            |> Repo.update!()
        end
      end)
    end)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking housing period changes.
  """
  def change_housing_period(%HousingPeriod{} = housing_period, attrs \\ %{}) do
    HousingPeriod.changeset(housing_period, attrs)
  end

  # -------------------------------------------------------------------
  # Barn Info
  # -------------------------------------------------------------------

  @doc """
  Gets the barn info for a livestock group.
  """
  def get_barn_info(livestock_group_id) do
    Repo.get_by(BarnInfo, livestock_group_id: livestock_group_id)
  end

  @doc """
  Creates or updates barn info for a livestock group.
  """
  def upsert_barn_info(livestock_group_id, attrs) do
    # Use string key to avoid mixed atom/string key map errors with Ecto.cast
    attrs = Map.put(attrs, "livestock_group_id", livestock_group_id)

    case get_barn_info(livestock_group_id) do
      nil ->
        %BarnInfo{}
        |> BarnInfo.changeset(attrs)
        |> Repo.insert()

      existing ->
        existing
        |> BarnInfo.changeset(attrs)
        |> Repo.update()
    end
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking barn info changes.
  """
  def change_barn_info(%BarnInfo{} = barn_info, attrs \\ %{}) do
    BarnInfo.changeset(barn_info, attrs)
  end

  # -------------------------------------------------------------------
  # Manure Systems
  # -------------------------------------------------------------------

  @doc """
  Returns all manure systems for a livestock group.
  """
  def list_manure_systems(livestock_group_id) do
    ManureSystem
    |> where(livestock_group_id: ^livestock_group_id)
    |> order_by(desc: :percentage)
    |> Repo.all()
  end

  @doc """
  Gets a single manure system.
  """
  def get_manure_system!(id), do: Repo.get!(ManureSystem, id)

  @doc """
  Creates a manure system.
  """
  def create_manure_system(attrs \\ %{}) do
    %ManureSystem{}
    |> ManureSystem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a manure system.
  """
  def update_manure_system(%ManureSystem{} = manure_system, attrs) do
    manure_system
    |> ManureSystem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a manure system.
  """
  def delete_manure_system(%ManureSystem{} = manure_system) do
    Repo.delete(manure_system)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking manure system changes.
  """
  def change_manure_system(%ManureSystem{} = manure_system, attrs \\ %{}) do
    ManureSystem.changeset(manure_system, attrs)
  end
end
