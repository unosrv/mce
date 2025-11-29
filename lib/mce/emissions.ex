defmodule Mce.Emissions do
  @moduledoc """
  The Emissions context.
  Manages emission reports and calculations.
  """

  import Ecto.Query, warn: false
  alias Mce.Repo

  alias Mce.Emissions.{EmissionReport, Calculator}
  alias Mce.Farms

  @doc """
  Returns all emission reports for a farm.
  """
  def list_emission_reports(farm_id) do
    EmissionReport
    |> where(farm_id: ^farm_id)
    |> order_by(desc: :report_year)
    |> Repo.all()
  end

  @doc """
  Gets a single emission report.
  """
  def get_emission_report!(id), do: Repo.get!(EmissionReport, id)

  @doc """
  Gets an emission report for a specific farm and year.
  """
  def get_emission_report_for_year(farm_id, year) do
    EmissionReport
    |> where(farm_id: ^farm_id, report_year: ^year)
    |> Repo.one()
  end

  @doc """
  Creates an emission report.
  """
  def create_emission_report(attrs \\ %{}) do
    %EmissionReport{}
    |> EmissionReport.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates an emission report.
  """
  def update_emission_report(%EmissionReport{} = emission_report, attrs) do
    emission_report
    |> EmissionReport.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes an emission report.
  """
  def delete_emission_report(%EmissionReport{} = emission_report) do
    Repo.delete(emission_report)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking emission report changes.
  """
  def change_emission_report(%EmissionReport{} = emission_report, attrs \\ %{}) do
    EmissionReport.changeset(emission_report, attrs)
  end

  @doc """
  Creates or updates an emission report for a farm/year.
  """
  def upsert_emission_report(farm_id, year, attrs) do
    attrs =
      attrs
      |> Map.put(:farm_id, farm_id)
      |> Map.put(:report_year, year)

    case get_emission_report_for_year(farm_id, year) do
      nil -> create_emission_report(attrs)
      existing -> update_emission_report(existing, attrs)
    end
  end

  @calculation_version "1.0.0"

  @doc """
  Calculate emissions for a farm and save the report.

  Loads all livestock data, runs the IPCC Tier 2 calculations,
  and upserts the emission report for the given year.

  Returns {:ok, emission_report} or {:error, changeset}.
  """
  def calculate_and_save_report(farm_id, year) do
    farm = Farms.get_farm_with_livestock!(farm_id)

    results = Calculator.calculate_farm_emissions(farm)

    upsert_emission_report(farm_id, year, %{
      calculated_at: DateTime.utc_now(),
      calculation_version: @calculation_version,
      total_emissions: Decimal.from_float(results.total),
      enteric_emissions: Decimal.from_float(results.enteric),
      manure_ch4_emissions: Decimal.from_float(results.manure_ch4),
      manure_n2o_emissions: Decimal.from_float(results.manure_n2o),
      breakdown_by_group: results.by_group,
      breakdown_by_source: results.by_source
    })
  end
end
