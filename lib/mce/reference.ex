defmodule Mce.Reference do
  @moduledoc """
  The Reference context.
  Manages reference data like feed presets and IPCC emission factors.
  """

  import Ecto.Query, warn: false
  alias Mce.Repo

  alias Mce.Reference.{FeedPreset, IpccEmissionFactor}

  # -------------------------------------------------------------------
  # Feed Presets
  # -------------------------------------------------------------------

  @doc """
  Returns active feed presets for a country.
  """
  def list_feed_presets(country) do
    FeedPreset
    |> where(country: ^country, is_active: true)
    |> order_by(:feed_type)
    |> Repo.all()
  end

  @doc """
  Returns all feed presets for a country (including inactive).
  """
  def list_all_feed_presets(country) do
    FeedPreset
    |> where(country: ^country)
    |> order_by(:feed_type)
    |> Repo.all()
  end

  @doc """
  Gets a single feed preset.
  """
  def get_feed_preset!(id), do: Repo.get!(FeedPreset, id)

  @doc """
  Creates a feed preset.
  """
  def create_feed_preset(attrs \\ %{}) do
    %FeedPreset{}
    |> FeedPreset.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a feed preset.
  """
  def update_feed_preset(%FeedPreset{} = feed_preset, attrs) do
    feed_preset
    |> FeedPreset.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a feed preset.
  """
  def delete_feed_preset(%FeedPreset{} = feed_preset) do
    Repo.delete(feed_preset)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking feed preset changes.
  """
  def change_feed_preset(%FeedPreset{} = feed_preset, attrs \\ %{}) do
    FeedPreset.changeset(feed_preset, attrs)
  end

  # -------------------------------------------------------------------
  # IPCC Emission Factors
  # -------------------------------------------------------------------

  @doc """
  Returns emission factors by type.
  """
  def list_emission_factors_by_type(factor_type) do
    IpccEmissionFactor
    |> where(factor_type: ^factor_type)
    |> Repo.all()
  end

  @doc """
  Gets a specific emission factor based on criteria.
  """
  def get_emission_factor(factor_type, opts \\ []) do
    query = from ef in IpccEmissionFactor, where: ef.factor_type == ^factor_type

    query =
      Enum.reduce(opts, query, fn
        {:species, species}, q -> where(q, species: ^species)
        {:climate_zone, zone}, q -> where(q, climate_zone: ^zone)
        {:management_system, system}, q -> where(q, management_system: ^system)
        {:country, country}, q -> where(q, country: ^country)
        _, q -> q
      end)

    Repo.one(query)
  end

  @doc """
  Gets a single IPCC emission factor.
  """
  def get_ipcc_emission_factor!(id), do: Repo.get!(IpccEmissionFactor, id)

  @doc """
  Creates an IPCC emission factor.
  """
  def create_ipcc_emission_factor(attrs \\ %{}) do
    %IpccEmissionFactor{}
    |> IpccEmissionFactor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates an IPCC emission factor.
  """
  def update_ipcc_emission_factor(%IpccEmissionFactor{} = factor, attrs) do
    factor
    |> IpccEmissionFactor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes an IPCC emission factor.
  """
  def delete_ipcc_emission_factor(%IpccEmissionFactor{} = factor) do
    Repo.delete(factor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking IPCC emission factor changes.
  """
  def change_ipcc_emission_factor(%IpccEmissionFactor{} = factor, attrs \\ %{}) do
    IpccEmissionFactor.changeset(factor, attrs)
  end

  # -------------------------------------------------------------------
  # Helper Functions for IPCC Calculations
  # -------------------------------------------------------------------

  @doc """
  Gets the GWP (Global Warming Potential) value for CH4.
  Default is 28 based on IPCC AR5.
  """
  def get_gwp_ch4 do
    case get_emission_factor("gwp_ch4") do
      %IpccEmissionFactor{value: value} -> Decimal.to_float(value)
      nil -> 28.0
    end
  end

  @doc """
  Gets the GWP (Global Warming Potential) value for N2O.
  Default is 265 based on IPCC AR5.
  """
  def get_gwp_n2o do
    case get_emission_factor("gwp_n2o") do
      %IpccEmissionFactor{value: value} -> Decimal.to_float(value)
      nil -> 265.0
    end
  end
end
