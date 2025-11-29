defmodule MceWeb.Admin.UserLive do
  use Backpex.LiveResource,
    adapter: Backpex.Adapters.Ecto,
    adapter_config: [
      schema: Mce.Accounts.User,
      repo: Mce.Repo,
      update_changeset: &Mce.Accounts.User.update_changeset/3,
      create_changeset: &Mce.Accounts.User.create_changeset/3
    ],
    layout: {MceWeb.Layouts, :admin}

  @impl Backpex.LiveResource
  def singular_name, do: "User"

  @impl Backpex.LiveResource
  def plural_name, do: "Users"

  @impl Backpex.LiveResource
  def fields do
    [
      id: %{
        module: Backpex.Fields.Number,
        label: "ID",
        only: [:index, :show]
      },
      nickname: %{
        module: Backpex.Fields.Text,
        label: "Nickname",
        searchable: true
      },
      email: %{
        module: Backpex.Fields.Text,
        label: "Email",
        searchable: true
      },
      locale: %{
        module: Backpex.Fields.Select,
        label: "Locale",
        options: [Korean: "ko", English: "en", "Portuguese (Brazil)": "pt_BR"]
      },
      is_admin: %{
        module: Backpex.Fields.Boolean,
        label: "Admin"
      },
      confirmed_at: %{
        module: Backpex.Fields.DateTime,
        label: "Confirmed At",
        only: [:index, :show, :edit]
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
  def can?(_assigns, :new, _item), do: false

  @impl Backpex.LiveResource
  def can?(_assigns, :delete, _item), do: false

  @impl Backpex.LiveResource
  def can?(_assigns, _action, _item), do: true
end
