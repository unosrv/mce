defmodule MceWeb.Admin.LivestockGroupLive do
  use Backpex.LiveResource,
    adapter: Backpex.Adapters.Ecto,
    adapter_config: [
      schema: Mce.Livestock.LivestockGroup,
      repo: Mce.Repo,
      update_changeset: &Mce.Livestock.LivestockGroup.update_changeset/3,
      create_changeset: &Mce.Livestock.LivestockGroup.create_changeset/3
    ],
    layout: {MceWeb.Layouts, :admin}

  @impl Backpex.LiveResource
  def singular_name, do: "Livestock Group"

  @impl Backpex.LiveResource
  def plural_name, do: "Livestock Groups"

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
      species: %{
        module: Backpex.Fields.Select,
        label: "Species",
        options: ["Beef Cattle": "beef_cattle", "Dairy Cattle": "dairy_cattle", Swine: "swine"]
      },
      sub_category: %{
        module: Backpex.Fields.Text,
        label: "Sub Category"
      },
      head_count: %{
        module: Backpex.Fields.Number,
        label: "Head Count"
      },
      farm: %{
        module: Backpex.Fields.BelongsTo,
        label: "Farm",
        display_field: :name,
        live_resource: MceWeb.Admin.FarmLive,
        only: [:index, :show]
      },
      average_weight: %{
        module: Backpex.Fields.Number,
        label: "Average Weight (kg)",
        only: [:show, :edit, :new]
      },
      mature_weight: %{
        module: Backpex.Fields.Number,
        label: "Mature Weight (kg)",
        only: [:show, :edit, :new]
      },
      daily_weight_gain: %{
        module: Backpex.Fields.Number,
        label: "Daily Weight Gain (kg)",
        only: [:show, :edit, :new]
      },
      milk_yield: %{
        module: Backpex.Fields.Number,
        label: "Milk Yield (L/day)",
        only: [:show, :edit, :new]
      },
      milk_fat_content: %{
        module: Backpex.Fields.Number,
        label: "Milk Fat Content (%)",
        only: [:show, :edit, :new]
      },
      pregnant_percentage: %{
        module: Backpex.Fields.Number,
        label: "Pregnant (%)",
        only: [:show, :edit, :new]
      },
      grazing_hours_per_day: %{
        module: Backpex.Fields.Number,
        label: "Grazing Hours/Day",
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
