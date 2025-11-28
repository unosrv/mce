# Phoenix Framework

Phoenix is a web development framework written in Elixir that implements the server-side Model View Controller (MVC) pattern. It provides high developer productivity and high application performance, leveraging the Erlang VM's capabilities for building scalable, fault-tolerant applications. Phoenix is particularly well-suited for building modern web applications with real-time features. The current version (1.8.x) introduces streamlined generators, enhanced security defaults, scopes for secure data access, and improved authentication features including magic links and sudo mode.

The framework includes a robust router with pattern-matched routes, a powerful controller layer for handling HTTP requests with the new `assign/2` function for bulk assigns, channels for bidirectional real-time communication over WebSockets, presence tracking for monitoring connected users, and comprehensive testing utilities. Phoenix applications are built on top of Plug, the composable web middleware specification for Elixir, and integrate seamlessly with Ecto for database interactions. The framework emphasizes convention over configuration while remaining highly customizable. Phoenix 1.8 requires the `:formats` option when using controllers and has updated `put_secure_browser_headers` with modern content security policies.

## Creating a New Phoenix Application

```bash
# Install Phoenix generator
mix archive.install hex phx_new

# Create a new application with database
mix phx.new my_app --database postgres

# Create an API-only application
mix phx.new my_api --no-html --no-assets

# Create application without Ecto
mix phx.new my_app --no-ecto

# Start the server
cd my_app
mix deps.get
mix ecto.create
mix phx.server

# Access at http://localhost:4000
```

## Defining Routes with Phoenix.Router

```elixir
defmodule MyAppWeb.Router do
  use Phoenix.Router

  # Define pipelines for common plug stacks
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {MyAppWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Browser routes
  scope "/", MyAppWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/users/:id", UserController, :show
    resources "/posts", PostController
  end

  # API routes
  scope "/api", MyAppWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    post "/auth/login", AuthController, :login
  end

  # Nested resources
  scope "/", MyAppWeb do
    pipe_through :browser

    resources "/posts", PostController do
      resources "/comments", CommentController
    end
  end
end

# The resources macro generates standard RESTful routes:
# GET     /posts           - index
# GET     /posts/new       - new
# POST    /posts           - create
# GET     /posts/:id       - show
# GET     /posts/:id/edit  - edit
# PATCH   /posts/:id       - update
# PUT     /posts/:id       - update
# DELETE  /posts/:id       - delete
```

## Implementing Controllers with Phoenix.Controller

```elixir
defmodule MyAppWeb.UserController do
  use MyAppWeb, :controller

  alias MyApp.Accounts
  alias MyApp.Accounts.User

  # Render HTML
  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, :show, user: user)
  end

  # Return JSON
  def index(conn, _params) do
    users = Accounts.list_users()
    json(conn, %{users: users})
  end

  # Create with validation
  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", ~p"/users/#{user}")
        |> json(%{user: user})

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{errors: translate_errors(changeset)})
    end
  end

  # Redirect
  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    {:ok, _user} = Accounts.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully")
    |> redirect(to: ~p"/users")
  end

  # Return plain text
  def health(conn, _params) do
    text(conn, "OK")
  end

  # Custom status
  def not_found(conn, _params) do
    conn
    |> put_status(:not_found)
    |> render(:error, message: "Page not found")
  end

  # Assign multiple values at once (Phoenix 1.8+)
  def dashboard(conn, _params) do
    conn
    |> assign(user: get_current_user(conn), notifications: get_notifications(conn))
    |> render(:dashboard)
  end

  defp translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end

  defp get_current_user(_conn), do: %{id: 1, name: "User"}
  defp get_notifications(_conn), do: []
end
```

## Configuring Endpoints with Phoenix.Endpoint

```elixir
defmodule MyAppWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :my_app

  # Session configuration
  @session_options [
    store: :cookie,
    key: "_my_app_key",
    signing_salt: "random_signing_salt",
    same_site: "Lax"
  ]

  # WebSocket configuration
  socket "/socket", MyAppWeb.UserSocket,
    websocket: [timeout: 45_000],
    longpoll: false

  # LiveView socket
  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]]

  # Static file serving
  plug Plug.Static,
    at: "/",
    from: :my_app,
    gzip: false,
    only: MyAppWeb.static_paths()

  # Code reloading in development
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  # Request handling pipeline
  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug MyAppWeb.Router
end

# Start in application.ex
defmodule MyApp.Application do
  use Application

  def start(_type, _args) do
    children = [
      MyApp.Repo,
      {Phoenix.PubSub, name: MyApp.PubSub},
      MyAppWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: MyApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    MyAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
```

## Building Real-Time Features with Phoenix.Channel

```elixir
defmodule MyAppWeb.RoomChannel do
  use Phoenix.Channel

  # Authorization
  def join("room:lobby", _payload, socket) do
    {:ok, socket}
  end

  def join("room:" <> room_id, %{"token" => token}, socket) do
    case verify_user(token) do
      {:ok, user_id} ->
        socket = assign(socket, :user_id, user_id)
        send(self(), :after_join)
        {:ok, %{message: "Welcome!"}, socket}

      {:error, _reason} ->
        {:error, %{reason: "unauthorized"}}
    end
  end

  # Handle incoming messages
  def handle_in("new_msg", %{"body" => body}, socket) do
    broadcast!(socket, "new_msg", %{
      user_id: socket.assigns.user_id,
      body: body,
      timestamp: DateTime.utc_now()
    })
    {:noreply, socket}
  end

  # Reply to sender
  def handle_in("get_history", _params, socket) do
    messages = get_room_messages(socket.topic)
    {:reply, {:ok, %{messages: messages}}, socket}
  end

  # Handle errors
  def handle_in("risky_action", _params, socket) do
    case perform_action() do
      {:ok, result} ->
        {:reply, {:ok, result}, socket}

      {:error, reason} ->
        {:reply, {:error, %{reason: reason}}, socket}
    end
  end

  # Handle process messages
  def handle_info(:after_join, socket) do
    push(socket, "presence_state", %{online: get_online_users()})
    {:noreply, socket}
  end

  # Intercept broadcasts
  intercept ["new_msg"]

  def handle_out("new_msg", payload, socket) do
    if authorized_to_see?(socket, payload) do
      push(socket, "new_msg", payload)
    end
    {:noreply, socket}
  end

  defp verify_user(token), do: {:ok, 123}
  defp get_room_messages(_topic), do: []
  defp get_online_users(), do: []
  defp authorized_to_see?(_socket, _payload), do: true
  defp perform_action(), do: {:ok, %{}}
end

# Socket definition
defmodule MyAppWeb.UserSocket do
  use Phoenix.Socket

  channel "room:*", MyAppWeb.RoomChannel
  channel "user:*", MyAppWeb.UserChannel

  def connect(%{"token" => token}, socket, _connect_info) do
    case Phoenix.Token.verify(socket, "user auth", token, max_age: 86400) do
      {:ok, user_id} ->
        {:ok, assign(socket, :user_id, user_id)}

      {:error, _reason} ->
        :error
    end
  end

  def connect(_params, _socket, _connect_info), do: :error

  def id(socket), do: "user_socket:#{socket.assigns.user_id}"
end
```

## JavaScript Client for Channels

```javascript
import {Socket} from "phoenix"

// Connect to socket
let socket = new Socket("/socket", {
  params: {token: userToken},
  logger: (kind, msg, data) => { console.log(`${kind}: ${msg}`, data) }
})

socket.connect()

// Join channel
let channel = socket.channel("room:lobby", {})

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })
  .receive("timeout", () => { console.log("Connection timeout") })

// Listen for messages
channel.on("new_msg", payload => {
  console.log("New message:", payload)
  renderMessage(payload)
})

// Send messages
document.querySelector("#msg-input").addEventListener("keypress", event => {
  if(event.key === "Enter") {
    channel.push("new_msg", {body: event.target.value})
      .receive("ok", () => { event.target.value = "" })
      .receive("error", e => { console.log("Error:", e) })
      .receive("timeout", () => { console.log("Timeout") })
  }
})

// Request/response pattern
channel.push("get_history", {})
  .receive("ok", resp => {
    console.log("History:", resp.messages)
  })

// Handle connection events
socket.onOpen(() => console.log("Connected"))
socket.onError(() => console.log("Connection error"))
socket.onClose(() => console.log("Connection closed"))

// Leave channel
channel.leave()
  .receive("ok", () => { console.log("Left channel") })
```

## Tracking Presence with Phoenix.Presence

```elixir
# Define presence module
defmodule MyAppWeb.Presence do
  use Phoenix.Presence,
    otp_app: :my_app,
    pubsub_server: MyApp.PubSub
end

# Add to supervision tree in application.ex
children = [
  MyApp.Repo,
  {Phoenix.PubSub, name: MyApp.PubSub},
  MyAppWeb.Presence,
  MyAppWeb.Endpoint
]

# Track users in channel
defmodule MyAppWeb.RoomChannel do
  use Phoenix.Channel
  alias MyAppWeb.Presence

  def join("room:" <> room_id, _params, socket) do
    send(self(), :after_join)
    {:ok, socket}
  end

  def handle_info(:after_join, socket) do
    {:ok, _} = Presence.track(socket, socket.assigns.user_id, %{
      online_at: inspect(System.system_time(:second)),
      username: socket.assigns.username,
      status: "online"
    })

    push(socket, "presence_state", Presence.list(socket))
    {:noreply, socket}
  end

  def handle_in("update_status", %{"status" => status}, socket) do
    {:ok, _} = Presence.update(socket, socket.assigns.user_id, %{
      status: status,
      updated_at: inspect(System.system_time(:second))
    })
    {:noreply, socket}
  end
end

# JavaScript client handling
channel.on("presence_state", state => {
  presences = Presence.syncState(presences, state)
  renderPresences(presences)
})

channel.on("presence_diff", diff => {
  presences = Presence.syncDiff(presences, diff)
  renderPresences(presences)
})

function renderPresences(presences) {
  let users = Presence.list(presences, (id, {metas}) => {
    return {
      id: id,
      username: metas[0].username,
      status: metas[0].status,
      count: metas.length
    }
  })
  console.log("Online users:", users)
}
```

## Signing and Verifying Tokens with Phoenix.Token

```elixir
defmodule MyAppWeb.AuthController do
  use MyAppWeb, :controller

  # Generate token on login
  def login(conn, %{"email" => email, "password" => password}) do
    case authenticate_user(email, password) do
      {:ok, user} ->
        token = Phoenix.Token.sign(conn, "user auth", user.id)
        json(conn, %{token: token, user: user})

      {:error, _reason} ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Invalid credentials"})
    end
  end

  defp authenticate_user(_email, _password), do: {:ok, %{id: 1}}
end

# Verify token in socket connection
defmodule MyAppWeb.UserSocket do
  use Phoenix.Socket

  def connect(%{"token" => token}, socket, _connect_info) do
    case Phoenix.Token.verify(socket, "user auth", token, max_age: 86400) do
      {:ok, user_id} ->
        {:ok, assign(socket, :user_id, user_id)}

      {:error, _reason} ->
        :error
    end
  end

  def id(socket), do: "user_socket:#{socket.assigns.user_id}"
end

# Verify token in plug
defmodule MyAppWeb.AuthPlug do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, user_id} <- Phoenix.Token.verify(conn, "user auth", token, max_age: 86400) do
      assign(conn, :current_user_id, user_id)
    else
      _ ->
        conn
        |> put_status(:unauthorized)
        |> Phoenix.Controller.json(%{error: "Unauthorized"})
        |> halt()
    end
  end
end

# Generate email verification token
def send_verification_email(user) do
  token = Phoenix.Token.sign(MyAppWeb.Endpoint, "email verification", user.email)
  url = "https://example.com/verify?token=#{token}"
  Email.send_verification(user.email, url)
end

# Verify email token
def verify_email(conn, %{"token" => token}) do
  case Phoenix.Token.verify(conn, "email verification", token, max_age: 3600) do
    {:ok, email} ->
      update_user_verified(email)
      redirect(conn, to: "/verified")

    {:error, :expired} ->
      text(conn, "Token expired")

    {:error, _reason} ->
      text(conn, "Invalid token")
  end
end
```

## Testing with Phoenix.ConnTest

```elixir
defmodule MyAppWeb.UserControllerTest do
  use MyAppWeb.ConnCase

  alias MyApp.Accounts

  @create_attrs %{name: "John Doe", email: "john@example.com"}
  @invalid_attrs %{name: nil, email: nil}

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, ~p"/users")
      assert html_response(conn, 200) =~ "Users"
    end
  end

  describe "create user" do
    test "creates user when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/users", user: @create_attrs)
      assert redirected_to(conn) =~ ~p"/users/"

      conn = get(conn, redirected_to(conn))
      assert html_response(conn, 200) =~ "John Doe"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/users", user: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "API authentication" do
    setup do
      user = Accounts.create_user!(@create_attrs)
      token = Phoenix.Token.sign(MyAppWeb.Endpoint, "user auth", user.id)
      {:ok, user: user, token: token}
    end

    test "accepts valid token", %{conn: conn, token: token} do
      conn =
        conn
        |> put_req_header("authorization", "Bearer #{token}")
        |> get(~p"/api/users")

      assert json_response(conn, 200)
    end

    test "rejects invalid token", %{conn: conn} do
      conn =
        conn
        |> put_req_header("authorization", "Bearer invalid")
        |> get(~p"/api/users")

      assert json_response(conn, 401)
    end
  end

  describe "JSON API" do
    test "returns users as JSON", %{conn: conn} do
      Accounts.create_user!(@create_attrs)

      conn =
        conn
        |> put_req_header("accept", "application/json")
        |> get(~p"/api/users")

      assert %{"users" => [%{"name" => "John Doe"}]} = json_response(conn, 200)
    end
  end
end
```

## Testing Channels with Phoenix.ChannelTest

```elixir
defmodule MyAppWeb.RoomChannelTest do
  use MyAppWeb.ChannelCase

  alias MyAppWeb.RoomChannel

  setup do
    {:ok, _, socket} =
      MyAppWeb.UserSocket
      |> socket("user_id", %{user_id: 123})
      |> subscribe_and_join(RoomChannel, "room:lobby")

    %{socket: socket}
  end

  test "join replies with status ok", %{socket: socket} do
    assert socket.topic == "room:lobby"
  end

  test "broadcasts new message to channel", %{socket: socket} do
    push(socket, "new_msg", %{"body" => "hello"})
    assert_broadcast "new_msg", %{body: "hello", user_id: 123}
  end

  test "replies with message history", %{socket: socket} do
    ref = push(socket, "get_history", %{})
    assert_reply ref, :ok, %{messages: _messages}
  end

  test "handles errors gracefully", %{socket: socket} do
    ref = push(socket, "risky_action", %{})
    assert_reply ref, :error, %{reason: _reason}
  end

  test "pushes presence state after join" do
    {:ok, _, socket} =
      MyAppWeb.UserSocket
      |> socket("user_id", %{user_id: 456})
      |> subscribe_and_join(RoomChannel, "room:lobby")

    assert_push "presence_state", %{online: _users}
  end

  test "intercepts messages based on authorization", %{socket: socket} do
    broadcast_from!(socket, "new_msg", %{body: "secret"})
    refute_push "new_msg", %{body: "secret"}
  end
end
```

## Mix Tasks for Development

```bash
# Generate new resources
mix phx.gen.html Accounts User users name:string email:string:unique
mix phx.gen.json Accounts User users name:string email:string
mix phx.gen.context Accounts User users name:string email:string
mix phx.gen.schema Accounts.User users name:string email:string

# Phoenix 1.8: Context argument is now optional (defaults to plural name)
mix phx.gen.html User users name:string email:string
mix phx.gen.live User users name:string email:string

# Generate authentication system with magic links and sudo mode (Phoenix 1.8)
mix phx.gen.auth Accounts User users

# Generate channels and sockets
mix phx.gen.channel Room
mix phx.gen.socket User

# Generate presence tracker
mix phx.gen.presence

# View all routes
mix phx.routes

# Start server
mix phx.server

# Digest static assets for production
mix phx.digest

# Clean old digested assets
mix phx.digest.clean

# Generate self-signed certificate for HTTPS
mix phx.gen.cert

# Generate secret for signing
mix phx.gen.secret
```

## Summary and Integration Patterns

Phoenix Framework excels at building modern web applications that require both traditional request-response patterns and real-time features. The router provides efficient pattern-matching for request routing, controllers handle HTTP requests with a clean functional API including the new `assign/2` for bulk assignments, and channels enable bidirectional communication for features like chat, notifications, and live updates. The framework's testing utilities make it straightforward to test both HTTP and WebSocket interactions. Phoenix 1.8 introduces streamlined generators where the context argument is now optional, improved security headers with content-security-policy defaults, and enhanced authentication with magic links and sudo mode support.

Common integration patterns include using Phoenix for API backends (with JSON rendering and token authentication), building full-stack applications with server-rendered HTML and real-time updates via channels, creating microservices with Phoenix's lightweight API-only mode, and implementing authentication systems using Phoenix.Token for stateless auth. The framework integrates seamlessly with Ecto for database operations, Phoenix LiveView for real-time server-rendered UI without JavaScript, and external services through HTTP clients or message queues. Phoenix applications typically follow the context pattern for business logic organization, use pipelines for composing plugs, and leverage OTP supervision trees for fault-tolerant architecture. The 1.8 release emphasizes security-by-default with scopes in generators and modernized security headers, making secure data access patterns the default rather than an afterthought.
