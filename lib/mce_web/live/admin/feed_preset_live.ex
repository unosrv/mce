defmodule MceWeb.Admin.FeedPresetLive do
  use Backpex.LiveResource,
    adapter: Backpex.Adapters.Ecto,
    adapter_config: [
      schema: Mce.Reference.FeedPreset,
      repo: Mce.Repo,
      update_changeset: &Mce.Reference.FeedPreset.update_changeset/3,
      create_changeset: &Mce.Reference.FeedPreset.create_changeset/3
    ],
    layout: {MceWeb.Layouts, :admin}

  @impl Backpex.LiveResource
  def singular_name, do: "Feed Preset"

  @impl Backpex.LiveResource
  def plural_name, do: "Feed Presets"

  @impl Backpex.LiveResource
  def fields do
    [
      id: %{
        module: Backpex.Fields.Number,
        label: "ID",
        only: [:index, :show]
      },
      country: %{
        module: Backpex.Fields.Text,
        label: "Country",
        searchable: true
      },
      feed_type: %{
        module: Backpex.Fields.Select,
        label: "Feed Type",
        options: [
          {"Forage", "forage"},
          {"Concentrate", "concentrate"},
          {"Byproduct", "byproduct"},
          {"Supplement", "supplement"}
        ]
      },
      name_ko: %{
        module: Backpex.Fields.Text,
        label: "Name (Korean)",
        searchable: true
      },
      name_en: %{
        module: Backpex.Fields.Text,
        label: "Name (English)",
        searchable: true
      },
      name_pt_br: %{
        module: Backpex.Fields.Text,
        label: "Name (Portuguese)",
        searchable: true
      },
      dry_matter_percentage: %{
        module: Backpex.Fields.Number,
        label: "Dry Matter (%)",
        only: [:show, :edit, :new]
      },
      gross_energy: %{
        module: Backpex.Fields.Number,
        label: "Gross Energy (MJ/kg DM)",
        only: [:show, :edit, :new]
      },
      digestibility: %{
        module: Backpex.Fields.Number,
        label: "Digestibility (%)",
        only: [:show, :edit, :new]
      },
      crude_protein: %{
        module: Backpex.Fields.Number,
        label: "Crude Protein (%)",
        only: [:show, :edit, :new]
      },
      is_active: %{
        module: Backpex.Fields.Boolean,
        label: "Active"
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
