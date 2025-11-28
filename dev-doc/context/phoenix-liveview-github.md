# Phoenix LiveView

Phoenix LiveView enables rich, real-time user experiences with server-rendered HTML over WebSockets. It provides a unified development model where both state and rendering logic live on the server, eliminating the traditional client-server divide. LiveView processes begin as regular HTTP requests with static HTML, then upgrade to stateful WebSocket connections that push minimal DOM diffs to the browser, achieving 5-10x faster updates compared to full HTML fragment replacements.

LiveView leverages Elixir's concurrent processing model built on the BEAM VM, enabling applications to handle thousands of simultaneous connections with real-time reactivity. The framework includes declarative templating with HEEx, live form validation with recovery mechanisms, file uploads with progress tracking, optimistic updates via JavaScript commands, and a comprehensive testing suite. State is maintained server-side in socket assigns, providing security and simplicity while the client-side JavaScript layer handles efficient DOM patching and event routing.

## LiveView Lifecycle

```elixir
# Basic LiveView module with mount, render, and event handling
defmodule MyAppWeb.ThermostatLive do
  use Phoenix.LiveView

  # Called twice: once for initial HTTP render, once for WebSocket connection
  def mount(%{"house" => house_id}, %{"user_id" => user_id}, socket) do
    if connected?(socket) do
      :timer.send_interval(1000, self(), :tick)
    end

    temperature = Thermostat.get_reading(house_id)
    {:ok, assign(socket,
      house_id: house_id,
      temperature: temperature,
      user: get_user(user_id),
      last_update: DateTime.utc_now()
    )}
  end

  # Handles URL changes and live navigation
  def handle_params(params, _uri, socket) do
    {:noreply,
     socket
     |> assign(:page, params["page"] || 1)
     |> apply_action(socket.assigns.live_action, params)}
  end

  # Renders the template
  def render(assigns) do
    ~H"""
    <div id="thermostat" phx-window-keyup="update_temp">
      <h1>House {@house_id} - {@temperature}°F</h1>
      <p>Last updated: {Calendar.strftime(@last_update, "%H:%M:%S")}</p>

      <button phx-click="inc" phx-throttle="1000">+</button>
      <button phx-click="dec" phx-throttle="1000">-</button>
    </div>
    """
  end

  # Handles client events
  def handle_event("inc", _params, socket) do
    new_temp = Thermostat.increase(socket.assigns.house_id)
    {:noreply, assign(socket, temperature: new_temp, last_update: DateTime.utc_now())}
  end

  def handle_event("update_temp", %{"key" => "ArrowUp"}, socket) do
    new_temp = Thermostat.increase(socket.assigns.house_id)
    {:noreply, assign(socket, temperature: new_temp)}
  end

  # Handles process messages
  def handle_info(:tick, socket) do
    temperature = Thermostat.get_reading(socket.assigns.house_id)
    {:noreply, assign(socket, temperature: temperature, last_update: DateTime.utc_now())}
  end
end
```

## Router Configuration

```elixir
# Basic live route setup
defmodule MyAppWeb.Router do
  use Phoenix.Router
  import Phoenix.LiveView.Router

  # Simple live route
  live "/thermostat", ThermostatLive

  # Live route with action
  live "/articles/:id", ArticleLive, :show

  # Live route with custom container
  live "/dashboard", DashboardLive, container: {:main, class: "dashboard-container"}

  # Live sessions for authentication and shared setup
  live_session :default, on_mount: MyAppWeb.InitAssigns do
    scope "/", MyAppWeb do
      pipe_through :browser
      live "/", HomeLive, :index
      live "/feed", FeedLive, :index
    end
  end

  live_session :authenticated,
    on_mount: {MyAppWeb.UserAuth, :ensure_authenticated},
    layout: {MyAppWeb.Layouts, :app} do
    scope "/", MyAppWeb do
      pipe_through [:browser, :require_user]
      live "/profile", UserLive.Profile, :index
      live "/settings", UserLive.Settings, :edit
    end
  end
end
```

## Socket Assigns and State Management

```elixir
# Comprehensive assign operations
defmodule MyAppWeb.DashboardLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok,
     socket
     # Single assignment
     |> assign(:count, 0)
     # Multiple assignments
     |> assign(name: "Dashboard", loading: false, errors: [])
     # Lazy assignment - only runs if :current_user not already set
     |> assign_new(:current_user, fn -> fetch_current_user() end)
     # Update existing value
     |> update(:count, &(&1 + 1))
     # Update with access to other assigns
     |> update(:max_users, fn current_max, %{users: users} ->
       max(current_max, length(users))
     end)
    }
  end

  # Using dynamic assigns in templates
  def render(assigns) do
    ~H"""
    <div class="dashboard">
      <h1>{@name}</h1>
      <div :if={@loading}>Loading...</div>
      <div :if={not @loading}>
        <p>Count: {@count}</p>
        <p>Current user: {@current_user.email}</p>
        <p>Max users: {@max_users}</p>
        <ul :for={error <- @errors}>
          <li class="error">{error}</li>
        </ul>
      </div>
    </div>
    """
  end
end
```

## Event Bindings

```elixir
# Complete event handling patterns
defmodule MyAppWeb.FormLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <!-- Click events with value attributes -->
    <button phx-click="delete" phx-value-id={@user.id} phx-value-confirm={true}>
      Delete User
    </button>

    <!-- Click away for dropdowns and modals -->
    <div class="dropdown" phx-click-away="hide_dropdown">
      <button phx-click="toggle_dropdown">Menu</button>
      <ul :if={@dropdown_open} class="menu">
        <li>Item 1</li>
        <li>Item 2</li>
      </ul>
    </div>

    <!-- Form events with rate limiting -->
    <.form for={@form} phx-change="validate" phx-submit="save">
      <!-- Debounce on blur -->
      <input type="email" field={@form[:email]} phx-debounce="blur" />

      <!-- Debounce with delay -->
      <input type="text" field={@form[:search]} phx-debounce="300" />

      <!-- Throttle prevents spam -->
      <button type="button" phx-click="increment" phx-throttle="1000">+</button>

      <button type="submit">Save</button>
    </.form>

    <!-- Keyboard events -->
    <div id="game"
         phx-window-keydown="keydown"
         phx-window-keyup="keyup"
         phx-throttle="100">
      <!-- Window-level events -->
    </div>

    <input
      type="text"
      phx-keyup="search"
      phx-key="Enter"
      phx-debounce="300"
      placeholder="Press Enter to search"
    />

    <!-- Focus and blur events -->
    <input
      type="text"
      name="email"
      phx-focus="field_focused"
      phx-blur="field_blurred"
      phx-value-field="email"
    />

    <!-- Hook events for JavaScript integration -->
    <div id="custom-element" phx-hook="CustomHook" data-info={@info}></div>
    """
  end

  def handle_event("delete", %{"id" => id, "confirm" => _confirm}, socket) do
    user = get_user!(id)
    delete_user(user)
    {:noreply, put_flash(socket, :info, "User deleted successfully")}
  end

  def handle_event("validate", %{"user" => params}, socket) do
    changeset = User.changeset(%User{}, params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("keydown", %{"key" => key}, socket) when key in ["ArrowUp", "ArrowDown", "ArrowLeft", "ArrowRight"] do
    {:noreply, update(socket, :game_state, &move_player(&1, key))}
  end
end
```

## Form Validation and Submission

```elixir
# Complete form handling with validation and error recovery
defmodule MyAppWeb.UserRegistrationLive do
  use Phoenix.LiveView
  alias MyApp.Accounts
  alias MyApp.Accounts.User

  def mount(_params, _session, socket) do
    changeset = Accounts.change_user_registration(%User{})

    {:ok,
     socket
     |> assign(:trigger_submit, false)
     |> assign_form(changeset)}
  end

  def render(assigns) do
    ~H"""
    <div class="registration-form">
      <.header>
        Register for an account
        <:subtitle>
          Already registered?
          <.link navigate={~p"/users/log_in"}>Sign in</.link>
        </:subtitle>
      </.header>

      <!-- Auto-recovery maintains form state through disconnects -->
      <.form
        for={@form}
        id="registration_form"
        phx-submit="save"
        phx-change="validate"
        phx-trigger-action={@trigger_submit}
        phx-auto-recover="recover_registration"
      >
        <.input field={@form[:email]} type="email" label="Email" required />
        <.input field={@form[:password]} type="password" label="Password" required />
        <.input
          field={@form[:password_confirmation]}
          type="password"
          label="Confirm Password"
          required
        />

        <.input
          field={@form[:terms]}
          type="checkbox"
          label="I agree to the terms and conditions"
        />

        <:actions>
          <.button phx-disable-with="Creating account..." class="w-full">
            Create an account
          </.button>
        </:actions>
      </.form>
    </div>
    """
  end

  # Real-time validation as user types
  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset =
      %User{}
      |> Accounts.change_user_registration(user_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  # Final submission with error handling
  def handle_event("save", %{"user" => user_params}, socket) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} = Accounts.deliver_user_confirmation_instructions(
          user,
          &url(~p"/users/confirm/#{&1}")
        )

        changeset = Accounts.change_user_registration(user)
        {:noreply,
         socket
         |> assign(trigger_submit: true)
         |> assign_form(changeset)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  # Recovery after crashes or disconnects
  def handle_event("recover_registration", params, socket) do
    changeset = Accounts.change_user_registration(%User{}, params)
    {:noreply, assign_form(socket, changeset)}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset, as: "user"))
  end
end
```

## File Uploads

```elixir
# Comprehensive file upload implementation
defmodule MyAppWeb.ProfileLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:uploaded_files, [])
     |> assign(:uploading, false)
     |> allow_upload(:avatar,
       accept: ~w(.jpg .jpeg .png .webp),
       max_entries: 1,
       max_file_size: 5_000_000,
       auto_upload: true,
       progress: &handle_progress/3,
       chunk_size: 64_000
     )
     |> allow_upload(:documents,
       accept: ~w(.pdf .doc .docx),
       max_entries: 5,
       max_file_size: 10_000_000
     )}
  end

  def render(assigns) do
    ~H"""
    <div class="upload-container">
      <form id="upload-form" phx-submit="save" phx-change="validate">
        <!-- Avatar upload with drag and drop -->
        <section class="avatar-upload" phx-drop-target={@uploads.avatar.ref}>
          <h3>Profile Picture</h3>

          <.live_file_input upload={@uploads.avatar} class="file-input" />

          <!-- Preview area -->
          <article :for={entry <- @uploads.avatar.entries} class="upload-entry">
            <figure>
              <.live_img_preview entry={entry} width={200} />
              <figcaption>{entry.client_name}</figcaption>
            </figure>

            <!-- Progress bar -->
            <div class="progress-container">
              <progress value={entry.progress} max="100">{entry.progress}%</progress>
              <span>{entry.progress}%</span>
            </div>

            <!-- Cancel button -->
            <button
              type="button"
              phx-click="cancel-upload"
              phx-value-ref={entry.ref}
              aria-label="cancel"
            >
              Cancel
            </button>

            <!-- Entry-specific errors -->
            <div :for={err <- upload_errors(@uploads.avatar, entry)} class="error">
              {error_to_string(err)}
            </div>
          </article>

          <!-- Upload-level errors -->
          <div :for={err <- upload_errors(@uploads.avatar)} class="error">
            {error_to_string(err)}
          </div>
        </section>

        <!-- Multiple document uploads -->
        <section class="documents-upload">
          <h3>Documents (up to 5 files)</h3>
          <.live_file_input upload={@uploads.documents} />

          <ul>
            <li :for={entry <- @uploads.documents.entries}>
              {entry.client_name} - {format_bytes(entry.client_size)}
              <button
                type="button"
                phx-click="cancel-upload"
                phx-value-ref={entry.ref}
              >
                Remove
              </button>
            </li>
          </ul>
        </section>

        <button type="submit" disabled={@uploading}>Upload All</button>
      </form>

      <!-- Previously uploaded files -->
      <section :if={@uploaded_files != []} class="uploaded-files">
        <h3>Uploaded Files</h3>
        <ul>
          <li :for={url <- @uploaded_files}>
            <img src={url} width="100" />
          </li>
        </ul>
      </section>
    </div>
    """
  end

  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :avatar, ref)}
  end

  def handle_event("save", _params, socket) do
    uploaded_files =
      consume_uploaded_entries(socket, :avatar, fn %{path: path}, entry ->
        # Generate unique filename
        ext = Path.extname(entry.client_name)
        filename = "#{Ecto.UUID.generate()}#{ext}"
        dest = Path.join([:code.priv_dir(:my_app), "static", "uploads", filename])

        # Ensure directory exists
        File.mkdir_p!(Path.dirname(dest))

        # Copy file
        File.cp!(path, dest)

        # Return public URL
        {:ok, ~p"/uploads/#{filename}"}
      end)

    document_paths =
      consume_uploaded_entries(socket, :documents, fn %{path: path}, entry ->
        # Store in S3 or other service
        {:ok, url} = MyApp.S3.upload(path, entry.client_name)
        {:ok, url}
      end)

    {:noreply,
     socket
     |> update(:uploaded_files, &(&1 ++ uploaded_files))
     |> put_flash(:info, "Files uploaded successfully!")}
  end

  # Track upload progress
  defp handle_progress(:avatar, entry, socket) do
    if entry.done? do
      {:noreply, assign(socket, :uploading, false)}
    else
      {:noreply, assign(socket, :uploading, true)}
    end
  end

  defp error_to_string(:too_large), do: "File is too large (max 5MB)"
  defp error_to_string(:not_accepted), do: "File type not accepted"
  defp error_to_string(:too_many_files), do: "Too many files selected"
  defp error_to_string(:external_client_failure), do: "Upload failed"

  defp format_bytes(bytes) do
    cond do
      bytes < 1024 -> "#{bytes} B"
      bytes < 1024 * 1024 -> "#{Float.round(bytes / 1024, 2)} KB"
      true -> "#{Float.round(bytes / 1024 / 1024, 2)} MB"
    end
  end
end
```

## Streams and Infinite Scrolling

```elixir
# Advanced stream operations with infinite scrolling
defmodule MyAppWeb.FeedLive do
  use Phoenix.LiveView
  alias MyApp.Posts

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page, 1)
     |> assign(:per_page, 20)
     |> assign(:end_of_timeline?, false)
     |> stream(:posts, [])}
  end

  def handle_params(params, _uri, socket) do
    {:noreply,
     socket
     |> apply_action(socket.assigns.live_action, params)
     |> paginate_posts(1)}
  end

  def render(assigns) do
    ~H"""
    <div class="feed">
      <h1>Live Feed</h1>

      <!-- Stream-based list with viewport detection -->
      <ul
        id="posts"
        phx-update="stream"
        phx-viewport-top={@page > 1 && "prev-page"}
        phx-viewport-bottom={!@end_of_timeline? && "next-page"}
        class={[
          if(@end_of_timeline?, do: "pb-10", else: "pb-[calc(200vh)]"),
          if(@page == 1, do: "pt-10", else: "pt-[calc(200vh)]")
        ]}
      >
        <!-- Empty state (hidden when items present) -->
        <li id="posts-empty" class="only:block hidden">
          <p>No posts yet. Be the first to post!</p>
        </li>

        <!-- Stream items -->
        <li :for={{dom_id, post} <- @streams.posts} id={dom_id}>
          <article class="post">
            <header>
              <img src={post.author.avatar} alt={post.author.name} />
              <h3>{post.author.name}</h3>
              <time datetime={post.inserted_at}>{format_time(post.inserted_at)}</time>
            </header>

            <div class="content">{post.body}</div>

            <footer>
              <button phx-click="like" phx-value-id={post.id}>
                ❤️ {post.likes_count}
              </button>
              <button phx-click="share" phx-value-id={post.id}>
                🔗 Share
              </button>
              <button
                :if={can_delete?(@current_user, post)}
                phx-click="delete"
                phx-value-id={post.id}
                data-confirm="Are you sure?"
              >
                🗑️ Delete
              </button>
            </footer>
          </article>
        </li>
      </ul>
    </div>
    """
  end

  # Load next page
  def handle_event("next-page", _, socket) do
    {:noreply, paginate_posts(socket, socket.assigns.page + 1)}
  end

  # Load previous page
  def handle_event("prev-page", %{"_overran" => true}, socket) do
    {:noreply, paginate_posts(socket, 1)}
  end

  def handle_event("prev-page", _, socket) do
    if socket.assigns.page > 1 do
      {:noreply, paginate_posts(socket, socket.assigns.page - 1)}
    else
      {:noreply, socket}
    end
  end

  # Delete post from stream
  def handle_event("delete", %{"id" => id}, socket) do
    post = Posts.get_post!(id)

    case Posts.delete_post(post) do
      {:ok, _} ->
        {:noreply,
         socket
         |> stream_delete(:posts, post)
         |> put_flash(:info, "Post deleted")}

      {:error, _} ->
        {:noreply, put_flash(socket, :error, "Could not delete post")}
    end
  end

  # Insert new post at top
  def handle_info({:new_post, post}, socket) do
    {:noreply, stream_insert(socket, :posts, post, at: 0)}
  end

  # Update existing post
  def handle_info({:post_updated, post}, socket) do
    {:noreply, stream_insert(socket, :posts, post, at: -1)}
  end

  # Efficient bidirectional pagination
  defp paginate_posts(socket, new_page) when new_page >= 1 do
    %{per_page: per_page, page: cur_page} = socket.assigns

    posts = Posts.list_posts(
      offset: (new_page - 1) * per_page,
      limit: per_page
    )

    # Determine insertion direction and limit
    {posts, at, limit} =
      if new_page >= cur_page do
        # Going forward: append and limit from bottom
        {posts, -1, per_page * 3 * -1}
      else
        # Going backward: prepend and limit from top
        {Enum.reverse(posts), 0, per_page * 3}
      end

    case posts do
      [] ->
        assign(socket, end_of_timeline?: at == -1)

      [_ | _] = posts ->
        socket
        |> assign(end_of_timeline?: false)
        |> assign(:page, new_page)
        |> stream(:posts, posts, at: at, limit: limit)
    end
  end

  # Real-time updates via PubSub
  def handle_info({:post_liked, post_id, new_count}, socket) do
    # Update specific post in stream without refetching
    post = get_cached_post(post_id)
    updated_post = %{post | likes_count: new_count}
    {:noreply, stream_insert(socket, :posts, updated_post)}
  end
end
```

## JavaScript Commands

```elixir
# Client-side operations without server roundtrip
defmodule MyAppWeb.ModalLive do
  use Phoenix.LiveView
  alias Phoenix.LiveView.JS

  def render(assigns) do
    ~H"""
    <div>
      <!-- Show/hide with transitions -->
      <button phx-click={show_modal()}>
        Open Modal
      </button>

      <div
        id="modal"
        class="modal hidden"
        phx-click-away={hide_modal()}
        phx-window-keydown={hide_modal()}
        phx-key="escape"
      >
        <div id="modal-content" class="modal-content">
          <button phx-click={hide_modal()}>✕</button>
          <h2>Modal Title</h2>
          <p>Modal content here</p>
        </div>
      </div>

      <!-- Add/remove classes with transitions -->
      <button phx-click={
        JS.add_class("active", to: "#sidebar",
          transition: {"ease-out duration-300", "opacity-0", "opacity-100"})
      }>
        Show Sidebar
      </button>

      <!-- Toggle with different in/out transitions -->
      <button phx-click={
        JS.toggle(to: "#dropdown",
          in: {"ease-out duration-200", "opacity-0 scale-95", "opacity-100 scale-100"},
          out: {"ease-in duration-150", "opacity-100 scale-100", "opacity-0 scale-95"})
      }>
        Toggle Dropdown
      </button>

      <!-- Set/remove attributes -->
      <button phx-click={
        JS.set_attribute({"aria-expanded", "true"}, to: "#menu")
        |> JS.remove_attribute("disabled", to: "#submit-btn")
      }>
        Enable Form
      </button>

      <!-- Dispatch custom events -->
      <button phx-click={JS.dispatch("my_app:copy", to: "#content")}>
        Copy to Clipboard
      </button>

      <!-- Compose multiple commands -->
      <button phx-click={
        JS.push("save")
        |> JS.add_class("saving", to: ".form")
        |> JS.set_attribute({"disabled", "true"}, to: "button")
        |> JS.transition("fade-out", to: "#modal")
      }>
        Save and Close
      </button>

      <!-- Push with loading states and targets -->
      <button phx-click={
        JS.push("update",
          value: %{key: "value"},
          target: @myself,
          loading: ".spinner",
          page_loading: true
        )
      }>
        Update Component
      </button>
    </div>
    """
  end

  # Modal helper functions
  defp show_modal(js \\ %JS{}) do
    js
    |> JS.show(to: "#modal",
      transition: {"ease-out duration-300", "opacity-0", "opacity-100"})
    |> JS.show(to: "#modal-content",
      transition: {"ease-out duration-300", "opacity-0 scale-95", "opacity-100 scale-100"})
  end

  defp hide_modal(js \\ %JS{}) do
    js
    |> JS.hide(to: "#modal",
      transition: {"ease-in duration-200", "opacity-100", "opacity-0"})
    |> JS.hide(to: "#modal-content",
      transition: {"ease-in duration-200", "opacity-100 scale-100", "opacity-0 scale-95"})
  end
end
```

## LiveComponents

```elixir
# Stateful component with isolated lifecycle
defmodule MyAppWeb.UserCardComponent do
  use Phoenix.LiveComponent

  # Called once when component first added
  def mount(socket) do
    {:ok, assign(socket, :expanded, false)}
  end

  # Called on first render and every update
  def update(%{user: user, id: id} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign(:id, id)
     |> assign_new(:show_email, fn -> false end)}
  end

  def render(assigns) do
    ~H"""
    <div id={"user-#{@id}"} class="user-card">
      <img src={@user.avatar} alt={@user.name} />
      <h3>{@user.name}</h3>

      <button phx-click="toggle_expand" phx-target={@myself}>
        {if @expanded, do: "Less", else: "More"}
      </button>

      <div :if={@expanded} class="details">
        <p>Bio: {@user.bio}</p>
        <p :if={@show_email}>Email: {@user.email}</p>

        <button phx-click="send_message" phx-value-user-id={@user.id} phx-target={@myself}>
          Send Message
        </button>
      </div>
    </div>
    """
  end

  # Component handles its own events
  def handle_event("toggle_expand", _, socket) do
    {:noreply, update(socket, :expanded, &(!&1))}
  end

  def handle_event("send_message", %{"user-id" => user_id}, socket) do
    # Notify parent LiveView
    send(self(), {:open_chat, user_id})
    {:noreply, socket}
  end
end

# Using the component in a LiveView
defmodule MyAppWeb.UsersLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <div class="users-grid">
      <.live_component
        :for={user <- @users}
        module={MyAppWeb.UserCardComponent}
        id={"user-#{user.id}"}
        user={user}
        show_email={@current_user.admin?}
      />
    </div>
    """
  end

  # Receive messages from component
  def handle_info({:open_chat, user_id}, socket) do
    {:noreply, push_navigate(socket, to: ~p"/chat/#{user_id}")}
  end
end

# Updating components from parent
def handle_info({:user_updated, user}, socket) do
  # Send update to specific component instance
  send_update(MyAppWeb.UserCardComponent,
    id: "user-#{user.id}",
    user: user
  )
  {:noreply, socket}
end

# Delayed update
def handle_event("auto_collapse", %{"id" => id}, socket) do
  send_update_after(MyAppWeb.UserCardComponent,
    [id: id, expanded: false],
    5000
  )
  {:noreply, socket}
end
```

## Navigation

```elixir
# Complete navigation patterns
defmodule MyAppWeb.ArticlesLive do
  use Phoenix.LiveView

  # URL structure with actions
  def handle_params(params, _uri, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  # Handle different actions
  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Articles")
    |> assign(:article, nil)
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Article")
    |> assign(:article, %Article{})
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    article = Articles.get_article!(id)

    socket
    |> assign(:page_title, "Edit Article")
    |> assign(:article, article)
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>{@page_title}</h1>

      <!-- Live patch - stays in same LiveView, no remount -->
      <.link patch={~p"/articles/new"}>New Article</.link>

      <div :if={@live_action in [:new, :edit]}>
        <.modal id="article-modal" on_cancel={JS.patch(~p"/articles")}>
          <.live_component
            module={MyAppWeb.ArticleFormComponent}
            id={@article.id || :new}
            article={@article}
            action={@live_action}
          />
        </.modal>
      </div>

      <table>
        <tr :for={article <- @articles}>
          <td>{article.title}</td>
          <td>
            <!-- Navigate to different LiveView -->
            <.link navigate={~p"/articles/#{article}/show"}>Show</.link>

            <!-- Patch within same LiveView -->
            <.link patch={~p"/articles/#{article}/edit"}>Edit</.link>

            <!-- External redirect -->
            <.link href={~p"/articles/#{article}/pdf"} download>PDF</.link>
          </td>
        </tr>
      </table>
    </div>
    """
  end

  # Server-side navigation
  def handle_event("create", %{"article" => params}, socket) do
    case Articles.create_article(params) do
      {:ok, article} ->
        {:noreply,
         socket
         |> put_flash(:info, "Article created!")
         # Push patch - update URL without reload
         |> push_patch(to: ~p"/articles/#{article}")}

      {:error, changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  def handle_event("delete", %{"id" => id}, socket) do
    article = Articles.get_article!(id)
    {:ok, _} = Articles.delete_article(article)

    # Push navigate - go to different LiveView
    {:noreply,
     socket
     |> put_flash(:info, "Article deleted")
     |> push_navigate(to: ~p"/articles")}
  end

  # Full page redirect (for external URLs or after logout)
  def handle_event("export", _, socket) do
    {:noreply, redirect(socket, external: "https://api.example.com/export")}
  end
end
```

## Testing LiveViews

```elixir
# Comprehensive LiveView testing
defmodule MyAppWeb.ThermostatLiveTest do
  use MyAppWeb.ConnCase
  import Phoenix.LiveViewTest

  # Test disconnected and connected mount
  test "thermostat lifecycle", %{conn: conn} do
    # Disconnected mount (regular HTTP)
    conn = get(conn, ~p"/thermostat")
    assert html_response(conn, 200) =~ "Temperature"

    # Connected mount (WebSocket)
    {:ok, view, html} = live(conn)
    assert html =~ "70°F"
  end

  # Single-step connected mount
  test "connected mount shortcut", %{conn: conn} do
    {:ok, view, html} = live(conn, ~p"/thermostat")
    assert html =~ "Temperature: 70°F"
  end

  # Test events
  test "increment temperature", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/thermostat")

    # Using element selector (preferred)
    html = view
           |> element("button", "+")
           |> render_click()

    assert html =~ "71°F"

    # Direct event call
    html = render_click(view, "inc", %{})
    assert html =~ "72°F"
  end

  # Test form submission
  test "form validation and submission", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/users/new")

    # Test validation
    html = view
           |> form("#user-form", user: %{email: "invalid"})
           |> render_change()

    assert html =~ "must have the @ sign"

    # Test submission
    html = view
           |> form("#user-form", user: %{email: "test@example.com", name: "Test"})
           |> render_submit()

    assert html =~ "User created successfully"
  end

  # Test navigation
  test "live navigation", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/articles")

    # Click link and follow navigation
    {:ok, view, html} = view
                        |> element("a", "New Article")
                        |> render_click()
                        |> follow_redirect(conn, ~p"/articles/new")

    assert html =~ "New Article"
  end

  # Test regular messages
  test "handle_info messages", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/thermostat")

    # Send message to view process
    send(view.pid, {:temperature_update, 75})

    # Render to see effects
    html = render(view)
    assert html =~ "75°F"
  end

  # Test component updates
  test "live component interaction", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/users")

    # Target specific component
    html = view
           |> element("#user-123 button", "Edit")
           |> render_click()

    assert html =~ "Edit User"
  end

  # Test async operations
  test "async data loading", %{conn: conn} do
    {:ok, view, html} = live(conn, ~p"/dashboard")

    # Initially shows loading
    assert html =~ "Loading..."

    # Wait for async to complete
    assert render_async(view) =~ "Dashboard Data"
  end

  # Test hooks
  test "client hooks", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/interactive")

    # Trigger hook event
    html = render_hook(view, "custom_event", %{data: "value"})
    assert html =~ "Event received"
  end

  # Test uploads
  test "file upload", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/profile")

    image = %{
      last_modified: 1_594_171_879_000,
      name: "myfile.jpeg",
      content: File.read!("test/fixtures/myfile.jpeg"),
      size: 1_396,
      type: "image/jpeg"
    }

    # Upload file
    html = view
           |> file_input("#upload-form", :avatar, [image])
           |> render_upload(image.name)

    assert html =~ "myfile.jpeg uploaded"
  end
end
```

## Async Operations

```elixir
# Comprehensive async patterns
defmodule MyAppWeb.DashboardLive do
  use Phoenix.LiveView
  alias Phoenix.LiveView.AsyncResult

  def mount(%{"org_slug" => slug}, _session, socket) do
    {:ok,
     socket
     |> assign(:slug, slug)
     # Simple async assign
     |> assign_async(:org, fn ->
       {:ok, %{org: fetch_org!(slug)}}
     end)
     # Multiple assigns in one task
     |> assign_async([:profile, :rank], fn ->
       {:ok, %{
         profile: fetch_profile!(slug),
         rank: fetch_rank!(slug)
       }}
     end)
     # Manual async with start_async
     |> assign(:metrics, AsyncResult.loading())
     |> start_async(:metrics_task, fn -> fetch_metrics(slug) end)}
  end

  def render(assigns) do
    ~H"""
    <div class="dashboard">
      <!-- Declarative async rendering -->
      <.async_result :let={org} assign={@org}>
        <:loading>
          <div class="loading">Loading organization...</div>
        </:loading>

        <:failed :let={reason}>
          <div class="error">
            Failed to load organization: {inspect(reason)}
            <button phx-click="retry_org">Retry</button>
          </div>
        </:failed>

        <h1>{org.name}</h1>
        <p>{org.description}</p>
      </.async_result>

      <!-- Conditional rendering based on state -->
      <div :if={@profile.loading}>Loading profile...</div>
      <div :if={@profile.ok?}>
        <p>Profile: {@profile.result.name}</p>
      </div>
      <div :if={@profile.failed}>
        Error loading profile
      </div>

      <!-- Manual async result -->
      <div :if={@metrics.loading}>Calculating metrics...</div>
      <div :if={@metrics.ok?}>
        <ul>
          <li>Users: {@metrics.result.users}</li>
          <li>Revenue: {@metrics.result.revenue}</li>
        </ul>
      </div>
    </div>
    """
  end

  # Handle async completion
  def handle_async(:metrics_task, {:ok, metrics}, socket) do
    {:noreply,
     socket
     |> assign(:metrics, AsyncResult.ok(socket.assigns.metrics, metrics))}
  end

  def handle_async(:metrics_task, {:exit, reason}, socket) do
    {:noreply,
     socket
     |> assign(:metrics, AsyncResult.failed(socket.assigns.metrics, {:exit, reason}))
     |> put_flash(:error, "Failed to load metrics")}
  end

  # Retry failed async
  def handle_event("retry_org", _, socket) do
    {:noreply,
     assign_async(socket, :org, fn ->
       {:ok, %{org: fetch_org!(socket.assigns.slug)}}
     end)}
  end

  # Cancel running async
  def handle_event("cancel", _, socket) do
    {:noreply, cancel_async(socket, :metrics_task)}
  end
end
```

## Hooks and Middleware

```elixir
# Mount hooks for shared setup
defmodule MyAppWeb.LiveAuth do
  import Phoenix.LiveView
  import Phoenix.Component

  # Default hook
  def on_mount(:default, _params, session, socket) do
    socket =
      socket
      |> assign(:current_user, get_user(session))
      |> assign(:timezone, get_timezone(session))

    {:cont, socket}
  end

  # Require authentication
  def on_mount(:require_user, _params, session, socket) do
    case get_user(session) do
      nil ->
        {:halt, redirect(socket, to: ~p"/login")}

      user ->
        {:cont, assign(socket, :current_user, user)}
    end
  end

  # Admin only
  def on_mount(:require_admin, _params, session, socket) do
    user = get_user(session)

    if user && user.admin? do
      {:cont, assign(socket, :current_user, user)}
    else
      {:halt, redirect(socket, to: ~p"/")}
    end
  end

  # Custom layout
  def on_mount(:admin_layout, _params, _session, socket) do
    {:cont, socket, layout: {MyAppWeb.Layouts, :admin}}
  end
end

# Runtime attach_hook for shared event handling
defmodule MyAppWeb.SortableList do
  import Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:items, fetch_items())
     |> attach_hook(:sortable, :handle_event, &handle_sort/3)
     |> attach_hook(:logger, :handle_event, &log_events/3)}
  end

  # Hook function
  defp handle_sort("sort", %{"from" => from, "to" => to}, socket) do
    items = reorder(socket.assigns.items, from, to)
    {:halt, assign(socket, :items, items)}
  end

  defp handle_sort(_event, _params, socket), do: {:cont, socket}

  # Logging hook
  defp log_events(event, params, socket) do
    Logger.info("Event: #{event}, Params: #{inspect(params)}")
    {:cont, socket}
  end

  # Detach hook when no longer needed
  def handle_event("disable_sort", _, socket) do
    {:noreply, detach_hook(socket, :sortable, :handle_event)}
  end
end
```

## Push Events to Client

```elixir
# Server pushing events to client JavaScript
defmodule MyAppWeb.GameLive do
  use Phoenix.LiveView

  def handle_event("player_move", %{"x" => x, "y" => y}, socket) do
    # Broadcast to all players
    MyApp.PubSub.broadcast(
      "game:#{socket.assigns.game_id}",
      {:player_moved, socket.assigns.player_id, x, y}
    )

    {:noreply, socket}
  end

  def handle_info({:player_moved, player_id, x, y}, socket) do
    {:noreply,
     push_event(socket, "player-moved", %{
       player_id: player_id,
       x: x,
       y: y,
       timestamp: System.system_time(:millisecond)
     })}
  end

  def handle_info({:game_over, winner}, socket) do
    {:noreply,
     socket
     |> push_event("game-over", %{winner: winner, score: socket.assigns.score})
     |> put_flash(:info, "Game Over! Winner: #{winner}")}
  end
end
```

```javascript
// Client-side JavaScript handling push events

// In a Hook
export const GameHook = {
  mounted() {
    this.handleEvent("player-moved", ({player_id, x, y}) => {
      this.movePlayer(player_id, x, y)
    })

    this.handleEvent("game-over", ({winner, score}) => {
      this.showGameOverScreen(winner, score)
    })
  },

  movePlayer(playerId, x, y) {
    const player = document.getElementById(`player-${playerId}`)
    player.style.transform = `translate(${x}px, ${y}px)`
  }
}

// Global window listener
window.addEventListener("phx:player-moved", (e) => {
  const {player_id, x, y} = e.detail
  console.log(`Player ${player_id} moved to ${x}, ${y}`)
})
```

Phoenix LiveView provides a complete framework for building interactive, real-time web applications with server-rendered HTML and minimal JavaScript. The core pattern revolves around the mount/handle_event/render lifecycle where state lives on the server in socket assigns, events flow from client bindings (phx-click, phx-submit, etc.) to handle_event callbacks, and efficient DOM diffs are automatically pushed to the browser. This architecture enables developers to build complex UIs using only Elixir, while the client-side LiveSocket manages WebSocket connections, DOM patching, and event routing transparently.

Common integration patterns include using LiveComponents for reusable stateful widgets with isolated lifecycles, streams for efficient rendering of large lists with infinite scrolling, async operations with assign_async for non-blocking data loading, file uploads with progress tracking and validation, and JavaScript commands (JS module) for optimistic UI updates without server round-trips. Testing is streamlined through render_click, render_submit, and other helpers that simulate browser interactions. For authentication and shared setup, mount hooks (on_mount) provide middleware-like capabilities across LiveView sessions, while attach_hook enables runtime event interception for cross-cutting concerns.
