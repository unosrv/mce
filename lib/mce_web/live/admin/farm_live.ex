defmodule MceWeb.Admin.FarmLive do
  use Backpex.LiveResource,
    adapter: Backpex.Adapters.Ecto,
    adapter_config: [
      schema: Mce.Farms.Farm,
      repo: Mce.Repo,
      update_changeset: &Mce.Farms.Farm.update_changeset/3,
      create_changeset: &Mce.Farms.Farm.create_changeset/3
    ],
    layout: {MceWeb.Layouts, :admin}

  @impl Backpex.LiveResource
  def singular_name, do: "Farm"

  @impl Backpex.LiveResource
  def plural_name, do: "Farms"

  @impl Backpex.LiveResource
  def fields do
    [
      id: %{
        module: Backpex.Fields.Number,
        label: "ID",
        only: [:index, :show]
      },
      name: %{
        module: Backpex.Fields.Text,
        label: "Name",
        searchable: true
      },
      country: %{
        module: Backpex.Fields.Text,
        label: "Country"
      },
      user: %{
        module: Backpex.Fields.BelongsTo,
        label: "Owner",
        display_field: :nickname,
        live_resource: MceWeb.Admin.UserLive,
        only: [:index, :show]
      },
      city: %{
        module: Backpex.Fields.Text,
        label: "City"
      },
      state_province: %{
        module: Backpex.Fields.Text,
        label: "State/Province"
      },
      road_address: %{
        module: Backpex.Fields.Text,
        label: "Road Address",
        only: [:show, :edit, :new]
      },
      jibun_address: %{
        module: Backpex.Fields.Text,
        label: "Jibun Address",
        only: [:show, :edit, :new]
      },
      fiscal_year_start_month: %{
        module: Backpex.Fields.Number,
        label: "Fiscal Year Start Month",
        only: [:show, :edit, :new]
      },
      fiscal_year_start_day: %{
        module: Backpex.Fields.Number,
        label: "Fiscal Year Start Day",
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
