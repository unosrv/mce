# Backpex - Phoenix LiveView Admin Panel

Backpex is a highly customizable administration panel framework for Phoenix LiveView applications. It enables developers to quickly create beautiful CRUD (Create, Read, Update, Delete) views for existing database resources through configurable LiveResource modules. The framework seamlessly integrates with existing Phoenix applications and provides extensive customization options for layouts, views, field types, filters, and actions.

Built on Phoenix LiveView and Ecto, Backpex provides a declarative approach to admin panel development. It handles common admin panel requirements like search, filtering, pagination, authorization, and complex data relationships out of the box. The architecture is modular and extensible, allowing developers to create custom field types, filters, and actions while leveraging the built-in components and behaviors. With support for both Ecto and Ash data adapters, Backpex adapts to various data layer requirements.

## Creating a LiveResource

```elixir
defmodule MyAppWeb.UserLive do
  use Backpex.LiveResource,
    adapter: Backpex.Adapters.Ecto,
    adapter_config: [
      schema: MyApp.Accounts.User,
      repo: MyApp.Repo,
      update_changeset: &MyApp.Accounts.User.update_changeset/3,
      create_changeset: &MyApp.Accounts.User.create_changeset/3
    ],
    layout: {MyAppWeb.Layouts, :admin},
    pubsub: [
      server: MyApp.PubSub,
      topic: "users"
    ]

  @impl Backpex.LiveResource
  def singular_name, do: "User"

  @impl Backpex.LiveResource
  def plural_name, do: "Users"

  @impl Backpex.LiveResource
  def panels do
    [
      personal_info: "Personal Information",
      contact_details: "Contact Details"
    ]
  end

  @impl Backpex.LiveResource
  def fields do
    [
      id: %{
        module: Backpex.Fields.Number,
        label: "ID"
      },
      name: %{
        module: Backpex.Fields.Text,
        label: "Name",
        searchable: true,
        panel: :personal_info
      },
      email: %{
        module: Backpex.Fields.Email,
        label: "Email",
        searchable: true,
        panel: :contact_details
      },
      role: %{
        module: Backpex.Fields.Select,
        label: "Role",
        options: [
          %{label: "Admin", value: :admin},
          %{label: "User", value: :user}
        ]
      },
      inserted_at: %{
        module: Backpex.Fields.DateTime,
        label: "Created At",
        only: [:index, :show]
      }
    ]
  end
end
```

## Configuring Router

```elixir
defmodule MyAppWeb.Router do
  use Phoenix.Router
  import Backpex.Router

  scope "/admin", MyAppWeb do
    pipe_through :browser

    # Required: Add Backpex routes for cookie management
    backpex_routes()

    live_session :default, on_mount: Backpex.InitAssigns do
      # Generate all CRUD routes (index, new, edit, show)
      live_resources "/users", UserLive

      # Generate only specific routes
      live_resources "/posts", PostLive, only: [:index, :show]

      # Exclude specific routes
      live_resources "/comments", CommentLive, except: [:delete]

      # Add metadata to routes
      live_resources "/orders", OrderLive, metadata: %{admin_only: true}
    end
  end
end
```

## Organizing Fields with Panels

Panels allow you to group fields into sections on the form view:

```elixir
@impl Backpex.LiveResource
def panels do
  [
    basic: "Basic Information",
    advanced: "Advanced Settings",
    metadata: "Metadata"
  ]
end

@impl Backpex.LiveResource
def fields do
  [
    name: %{
      module: Backpex.Fields.Text,
      label: "Name",
      panel: :basic
    },
    description: %{
      module: Backpex.Fields.Textarea,
      label: "Description",
      panel: :basic
    },
    settings: %{
      module: Backpex.Fields.Text,
      label: "Settings",
      panel: :advanced
    }
  ]
end
```

## Defining Fields

```elixir
@impl Backpex.LiveResource
def fields do
  [
    # Text field with search
    username: %{
      module: Backpex.Fields.Text,
      label: "Username",
      searchable: true,
      orderable: true
    },

    # Field with visibility control
    password_hash: %{
      module: Backpex.Fields.Text,
      label: "Password Hash",
      only: [:show],
      can?: fn assigns -> assigns.current_user.role == :admin end
    },

    # Select field with options
    status: %{
      module: Backpex.Fields.Select,
      label: "Status",
      options: [
        %{label: "Active", value: "active"},
        %{label: "Inactive", value: "inactive"},
        %{label: "Pending", value: "pending"}
      ]
    },

    # Currency field with formatting
    balance: %{
      module: Backpex.Fields.Currency,
      label: "Balance",
      currency: :USD
    },

    # URL field with scheme validation
    website: %{
      module: Backpex.Fields.URL,
      label: "Website",
      allowed_schemes: ~w(https http)
    },

    # Time field
    start_time: %{
      module: Backpex.Fields.Time,
      label: "Start Time",
      format: "%I:%M %p"
    },

    # Textarea field
    description: %{
      module: Backpex.Fields.Textarea,
      label: "Description",
      placeholder: "Enter description..."
    },

    # Index editable field (edit directly in table)
    priority: %{
      module: Backpex.Fields.Number,
      label: "Priority",
      index_editable: true
    },

    # BelongsTo association
    organization_id: %{
      module: Backpex.Fields.BelongsTo,
      label: "Organization",
      display_field: :name,
      options_query: fn assigns ->
        from o in MyApp.Organization,
          where: o.active == true,
          order_by: o.name
      end
    },

    # HasMany relationship
    posts: %{
      module: Backpex.Fields.HasMany,
      label: "Posts",
      display_field: :title,
      live_resource: MyAppWeb.PostLive,
      only: [:show, :edit]
    },

    # Upload field
    avatar: %{
      module: Backpex.Fields.Upload,
      label: "Avatar",
      accept: ~w(.jpg .jpeg .png),
      max_entries: 1,
      put_upload_change: &MyApp.Accounts.put_avatar/3,
      consume_upload: &MyApp.Accounts.consume_avatar/4,
      remove_uploads: &MyApp.Accounts.remove_avatar/2
    },

    # Computed field with custom rendering
    full_name: %{
      module: Backpex.Fields.Text,
      label: "Full Name",
      select: dynamic([user: u], fragment("concat(?, ' ', ?)", u.first_name, u.last_name)),
      render: fn assigns ->
        ~H"""
        <span class="font-semibold">{@item.full_name}</span>
        """
      end,
      except: [:new, :edit]
    },

    # Inline CRUD field for embeds_many or has_many
    contact_methods: %{
      module: Backpex.Fields.InlineCRUD,
      label: "Contact Methods",
      type: :embed,
      child_fields: [
        type: %{label: "Type"},
        value: %{label: "Value"}
      ]
    }
  ]
end
```

## Inline Editing

Enable inline editing to allow users to edit field values directly in the index table without navigating to the edit form:

```elixir
@impl Backpex.LiveResource
def fields do
  [
    # Inline editable text field
    title: %{
      module: Backpex.Fields.Text,
      label: "Title",
      index_editable: true
    },

    # Inline editable number field
    quantity: %{
      module: Backpex.Fields.Number,
      label: "Quantity",
      index_editable: true
    },

    # Inline editable select field
    status: %{
      module: Backpex.Fields.Select,
      label: "Status",
      index_editable: true,
      options: [
        %{label: "Active", value: "active"},
        %{label: "Inactive", value: "inactive"}
      ]
    }
  ]
end
```

## Implementing Filters

```elixir
@impl Backpex.LiveResource
def filters do
  [
    status: %{
      module: Backpex.Filters.Select,
      label: "Status",
      prompt: "All Statuses",
      options: [
        %{label: "Active", value: "active"},
        %{label: "Inactive", value: "inactive"}
      ]
    },

    role: %{
      module: Backpex.Filters.MultiSelect,
      label: "Role",
      options: [
        %{label: "Admin", value: :admin},
        %{label: "User", value: :user},
        %{label: "Guest", value: :guest}
      ]
    },

    created_date: %{
      module: Backpex.Filters.Range,
      label: "Created Date",
      type: :date
    },

    active: %{
      module: Backpex.Filters.Boolean,
      label: "Active Only"
    }
  ]
end

# Custom filter implementation
defmodule MyApp.Filters.CustomFilter do
  use Backpex.Filter

  @impl Backpex.Filter
  def label, do: "Custom Filter"

  @impl Backpex.Filter
  def render(assigns) do
    ~H"""
    <span>{@filter_value}</span>
    """
  end

  @impl Backpex.Filter
  def render_form(assigns) do
    ~H"""
    <input type="text" name="custom_filter" value={@filter_value} />
    """
  end

  @impl Backpex.Filter
  def query(query, value, _name, _assigns) do
    from item in query,
      where: fragment("custom_condition(?) = ?", item.field, ^value)
  end
end
```

## Creating Resource Actions

```elixir
@impl Backpex.LiveResource
def resource_actions do
  [
    export_users: %{
      module: MyApp.ResourceActions.ExportUsers
    },
    send_invites: %{
      module: MyApp.ResourceActions.SendInvites
    }
  ]
end

# Resource action implementation
defmodule MyApp.ResourceActions.ExportUsers do
  use Backpex.ResourceAction

  @impl Backpex.ResourceAction
  def title, do: "Export Users"

  @impl Backpex.ResourceAction
  def label, do: "Export"

  @impl Backpex.ResourceAction
  def fields do
    [
      format: %{
        module: Backpex.Fields.Select,
        label: "Format",
        type: :string,
        options: [
          %{label: "CSV", value: "csv"},
          %{label: "JSON", value: "json"}
        ]
      },
      include_inactive: %{
        module: Backpex.Fields.Boolean,
        label: "Include Inactive Users",
        type: :boolean
      }
    ]
  end

  @impl Backpex.ResourceAction
  def changeset(change, attrs, _metadata) do
    change
    |> Ecto.Changeset.cast(attrs, [:format, :include_inactive])
    |> Ecto.Changeset.validate_required([:format])
  end

  @impl Backpex.ResourceAction
  def handle(socket, data) do
    case MyApp.Exports.export_users(data.format, data.include_inactive) do
      {:ok, file_path} ->
        socket = put_flash(socket, :info, "Users exported successfully")
        {:ok, socket}

      {:error, reason} ->
        socket = put_flash(socket, :error, "Export failed: #{reason}")
        {:ok, socket}
    end
  end
end
```

## Implementing Item Actions

```elixir
@impl Backpex.LiveResource
def item_actions(default_actions) do
  default_actions ++
    [
      archive: %{
        module: MyApp.ItemActions.Archive,
        only: [:row, :index]
      },
      duplicate: %{
        module: MyApp.ItemActions.Duplicate,
        only: [:row, :show]
      }
    ]
end

# Item action implementation
defmodule MyApp.ItemActions.Archive do
  use Backpex.ItemAction

  @impl Backpex.ItemAction
  def icon(assigns, _item) do
    ~H"""
    <Backpex.HTML.CoreComponents.icon name="hero-archive-box" class="h-5 w-5" />
    """
  end

  @impl Backpex.ItemAction
  def label(_assigns, _item), do: "Archive"

  @impl Backpex.ItemAction
  def confirm(assigns) do
    count = length(assigns.selected_items)
    "Are you sure you want to archive #{count} item(s)?"
  end

  @impl Backpex.ItemAction
  def handle(socket, items, _params) do
    repo = socket.assigns.live_resource.adapter_config(:repo)

    Enum.each(items, fn item ->
      item
      |> Ecto.Changeset.change(%{archived_at: DateTime.utc_now()})
      |> repo.update!()
    end)

    socket = put_flash(socket, :info, "#{length(items)} item(s) archived")
    {:ok, socket}
  end
end
```

## Authorization and Access Control

```elixir
@impl Backpex.LiveResource
def can?(assigns, :index, _item) do
  # Anyone can view the index
  true
end

@impl Backpex.LiveResource
def can?(assigns, :new, _item) do
  # Only admins can create new items
  assigns.current_user.role == :admin
end

@impl Backpex.LiveResource
def can?(assigns, :edit, item) do
  # Users can edit their own items or admins can edit any
  assigns.current_user.id == item.user_id or
    assigns.current_user.role == :admin
end

@impl Backpex.LiveResource
def can?(assigns, :delete, item) do
  # Only admins can delete
  assigns.current_user.role == :admin
end

@impl Backpex.LiveResource
def can?(assigns, :show, _item) do
  # Anyone authenticated can view details
  not is_nil(assigns.current_user)
end

# Field-level authorization
def fields do
  [
    salary: %{
      module: Backpex.Fields.Currency,
      label: "Salary",
      can?: fn assigns ->
        assigns.current_user.role in [:admin, :hr]
      end
    }
  ]
end
```

## Adding Metrics

```elixir
@impl Backpex.LiveResource
def metrics do
  [
    total_revenue: %{
      module: Backpex.Metrics.Value,
      label: "Total Revenue",
      query: from(o in Order, select: sum(o.total)),
      format: :currency,
      currency: :USD
    },

    active_users: %{
      module: Backpex.Metrics.Value,
      label: "Active Users",
      query: from(u in User, where: u.active == true, select: count(u.id)),
      format: :number
    },

    avg_order_value: %{
      module: Backpex.Metrics.Value,
      label: "Avg Order Value",
      query: from(o in Order, select: avg(o.total)),
      format: :currency,
      currency: :USD
    }
  ]
end
```

## Customizing Item Query

```elixir
# In adapter_config
adapter_config: [
  schema: MyApp.Post,
  repo: MyApp.Repo,
  update_changeset: &MyApp.Post.update_changeset/3,
  create_changeset: &MyApp.Post.create_changeset/3,
  item_query: &__MODULE__.item_query/3
]

# Filter items based on current user and action
def item_query(query, :index, assigns) do
  if assigns.current_user.role == :admin do
    query
  else
    from q in query,
      where: q.user_id == ^assigns.current_user.id
  end
end

def item_query(query, :edit, assigns) do
  from q in query,
    join: c in assoc(q, :category),
    preload: [category: c]
end

def item_query(query, _live_action, _assigns), do: query
```

## Lifecycle Hooks

```elixir
@impl Backpex.LiveResource
def on_item_created(socket, item) do
  # Send notification
  MyApp.Notifications.send_notification(
    socket.assigns.current_user,
    "Item #{item.id} created"
  )

  # Broadcast to PubSub
  Phoenix.PubSub.broadcast(
    MyApp.PubSub,
    "items",
    {:item_created, item}
  )

  socket
end

@impl Backpex.LiveResource
def on_item_updated(socket, item) do
  MyApp.Notifications.send_notification(
    socket.assigns.current_user,
    "Item #{item.id} updated"
  )

  socket
end

@impl Backpex.LiveResource
def on_item_deleted(socket, item) do
  MyApp.Audit.log_deletion(socket.assigns.current_user, item)

  socket
end

@impl Backpex.LiveResource
def return_to(socket, assigns, _live_action, :create, item) do
  # After creating, redirect to the show page
  Backpex.Router.get_path(socket, __MODULE__, assigns.params, :show, item)
end

def return_to(socket, assigns, _live_action, :update, item) do
  # After updating, stay on edit page
  Backpex.Router.get_path(socket, __MODULE__, assigns.params, :edit, item)
end

def return_to(socket, assigns, _live_action, _form_action, _item) do
  # Default: return to index
  Backpex.Router.get_path(socket, __MODULE__, assigns.params, :index)
end
```

## Translation and Localization

```elixir
# In config.exs
config :backpex,
  translator_function: {MyAppWeb.CoreComponents, :translate_backpex},
  error_translator_function: {MyAppWeb.CoreComponents, :translate_error}

# Translation implementation
defmodule MyAppWeb.CoreComponents do
  use Phoenix.Component
  import MyAppWeb.Gettext

  def translate_backpex({msg, opts}) do
    Gettext.dgettext(MyAppWeb.Gettext, "backpex", msg, opts)
  end

  def translate_error({msg, opts}) do
    Gettext.dgettext(MyAppWeb.Gettext, "errors", msg, opts)
  end
end

# Custom translations in LiveResource
@impl Backpex.LiveResource
def translate({"Save", _opts}), do: gettext("Speichern")
def translate({"Cancel", _opts}), do: gettext("Abbrechen")
def translate({"New %{resource}", opts}), do: gettext("Neue %{resource}", opts)
def translate({msg, opts}), do: Backpex.translate({msg, opts})
```

---

## Use Cases and Integration

Backpex excels in building admin interfaces for content management systems, internal tools, and back-office applications. It's particularly well-suited for projects requiring rapid development of CRUD interfaces with complex relationships, custom validation rules, and role-based access control. Common use cases include customer relationship management dashboards, e-commerce admin panels, inventory management systems, and content moderation interfaces. The framework handles standard admin panel requirements while providing escape hatches for custom logic. Advanced features like inline editing, field panels for form organization, and inline CRUD for nested data make Backpex suitable for sophisticated admin interfaces with complex data entry requirements.

Integration with existing Phoenix applications is straightforward through the router configuration and layout system. Backpex LiveResources can coexist with standard Phoenix controllers and LiveViews, allowing incremental adoption. The framework integrates with Phoenix authentication systems through the `on_mount` hook and assigns, making it compatible with libraries like `pow` or custom authentication implementations. For data persistence, Backpex works seamlessly with Ecto schemas and repositories, supporting PostgreSQL, MySQL, and other Ecto-compatible databases. The PubSub integration enables real-time updates across multiple admin users, while the flexible field and action system allows developers to extend functionality without modifying core framework code. The comprehensive field type library includes specialized fields for URLs, time values, textareas, currency, uploads, and complex associations, covering most common data modeling needs out of the box.
