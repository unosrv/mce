defmodule MceWeb.Admin.IpccEmissionFactorLive do
  use Backpex.LiveResource,
    adapter: Backpex.Adapters.Ecto,
    adapter_config: [
      schema: Mce.Reference.IpccEmissionFactor,
      repo: Mce.Repo,
      update_changeset: &Mce.Reference.IpccEmissionFactor.update_changeset/3,
      create_changeset: &Mce.Reference.IpccEmissionFactor.create_changeset/3
    ],
    layout: {MceWeb.Layouts, :admin}

  @impl Backpex.LiveResource
  def singular_name, do: "IPCC Emission Factor"

  @impl Backpex.LiveResource
  def plural_name, do: "IPCC Emission Factors"

  @impl Backpex.LiveResource
  def fields do
    [
      id: %{
        module: Backpex.Fields.Number,
        label: "ID",
        only: [:index, :show]
      },
      factor_type: %{
        module: Backpex.Fields.Select,
        label: "Factor Type",
        searchable: true,
        options: [
          {"Enteric Fermentation EF", "enteric_fermentation_ef"},
          {"Manure MCF", "manure_mcf"},
          {"Manure Bo", "manure_bo"},
          {"Manure N Excretion", "manure_n_excretion"},
          {"Manure EF3", "manure_ef3"},
          {"Feed Digestibility", "feed_digestibility"},
          {"Feed Gross Energy", "feed_gross_energy"},
          {"GWP CH4", "gwp_ch4"},
          {"GWP N2O", "gwp_n2o"}
        ]
      },
      species: %{
        module: Backpex.Fields.Text,
        label: "Species",
        searchable: true
      },
      climate_zone: %{
        module: Backpex.Fields.Text,
        label: "Climate Zone"
      },
      management_system: %{
        module: Backpex.Fields.Text,
        label: "Management System"
      },
      country: %{
        module: Backpex.Fields.Text,
        label: "Country"
      },
      value: %{
        module: Backpex.Fields.Number,
        label: "Value"
      },
      unit: %{
        module: Backpex.Fields.Text,
        label: "Unit"
      },
      source: %{
        module: Backpex.Fields.Text,
        label: "Source",
        only: [:show, :edit, :new]
      },
      notes: %{
        module: Backpex.Fields.Textarea,
        label: "Notes",
        only: [:show, :edit, :new]
      },
      inserted_at: %{
        module: Backpex.Fields.DateTime,
        label: "Created At",
        only: [:index, :show]
      },
      updated_at: %{
        module: Backpex.Fields.DateTime,
        label: "Updated At",
        only: [:index, :show]
      }
    ]
  end

  @impl Backpex.LiveResource
  def can?(_assigns, _action, _item), do: true
end
