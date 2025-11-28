### Phoenix.PubSub - Getting Started

Source: https://hexdocs.pm/phoenix/_pubsub/index

Instructions on how to start Phoenix.PubSub in your supervision tree and basic usage examples for subscribing and broadcasting messages.

```APIDOC
## Getting Started with Phoenix.PubSub

### Description
This section explains how to integrate Phoenix.PubSub into your application's supervision tree and provides examples of subscribing to and broadcasting messages.

### Setup
Start Phoenix.PubSub directly in your supervision tree:

```elixir
{Phoenix.PubSub, name: :my_pubsub}
```

### Usage Examples

Subscribe to a topic:

```elixir
iex> alias Phoenix.PubSub
iex> PubSub.subscribe(:my_pubsub, "user:123")
:ok
iex> Process.info(self(), :messages)
{:messages, []}
```

Broadcast a message:

```elixir
iex> PubSub.broadcast(:my_pubsub, "user:123", {:user_update, %{id: 123, name: "Shane"}})
:ok
iex> Process.info(self(), :messages)
{:messages, [{:user_update, %{id: 123, name: "Shane"}}]}
```
```

--------------------------------

### Quick Phoenix Project Setup (OSX/Linux)

Source: https://hexdocs.pm/phoenix/1.7.17/up_and_running

This command automates the process of downloading and setting up a new Phoenix project for OSX and Linux systems. It's a fast way to get a basic Phoenix application initialized.

```shell
curl https://new.phoenixframework.org/myapp | sh
```

--------------------------------

### Install Dependencies and Setup Assets

Source: https://hexdocs.pm/phoenix/1.7.17/up_and_running

After generating a Phoenix project, these commands are used to fetch and compile Elixir dependencies and set up project assets. This is typically prompted after project creation.

```shell
mix deps.get
mix assets.setup
mix deps.compile
```

--------------------------------

### Install Dependencies for Phoenix Application

Source: https://hexdocs.pm/phoenix/1.7.14/up_and_running

After creating a new Phoenix project, you will be prompted to fetch and install dependencies. This can be done automatically by answering 'Y' to the prompt or manually by running `mix deps.get`.

```mix
Fetch and install dependencies? [Yn] Y
* running mix deps.get
* running mix assets.setup
* running mix deps.compile
```

```mix
Fetch and install dependencies? [Yn] n

We are almost there! The following steps are missing:

    $ cd hello
    $ mix deps.get
```

--------------------------------

### Phoenix.PubSub - Getting Started

Source: https://hexdocs.pm/phoenix/_pubsub/2.1.3/Phoenix

Demonstrates how to start Phoenix.PubSub in your supervision tree and perform basic subscribe and broadcast operations.

```APIDOC
## Getting Started with Phoenix.PubSub

### Description
This section shows how to integrate Phoenix.PubSub into your Elixir application's supervision tree and demonstrates basic usage for subscribing to topics and broadcasting messages.

### Starting PubSub

To start Phoenix.PubSub, include it in your supervision tree:

```elixir
{Phoenix.PubSub, name: :my_pubsub}
```

### Basic Usage

After starting, you can use the module functions. Here's an example of subscribing and broadcasting:

```elixir
alias Phoenix.PubSub

# Subscribe to a topic
PubSub.subscribe(:my_pubsub, "user:123")

# Check for messages (optional, for demonstration)
Process.info(self(), :messages)

# Broadcast a message on a topic
PubSub.broadcast(:my_pubsub, "user:123", {:user_update, %{id: 123, name: "Shane"}})

# Check for messages again (optional, for demonstration)
Process.info(self(), :messages)
```

### Adapters

Phoenix.PubSub supports different adapters for backend implementations:

*   **`Phoenix.PubSub.PG2`**: The default adapter using Distributed Elixir.
*   **`Phoenix.PubSub.Redis`**: Uses Redis for inter-server communication (requires `:phoenix_pubsub_redis` dependency).

Custom adapters can be implemented by following the `Phoenix.PubSub.Adapter` behaviour.
```

--------------------------------

### Change Directory to Project

Source: https://hexdocs.pm/phoenix/1.7.17/up_and_running

Navigates the terminal into the newly created Phoenix project directory, which is required before running subsequent Mix tasks like database creation or starting the server.

```shell
cd hello
```

--------------------------------

### Start Phoenix.PubSub in Supervision Tree

Source: https://hexdocs.pm/phoenix/_pubsub

Demonstrates how to start Phoenix.PubSub as part of your application's supervision tree. This is the initial setup required to use the PubSub service.

```elixir
{Phoenix.PubSub, name: :my_pubsub}
```

--------------------------------

### Quick Phoenix Project Setup (Windows PowerShell)

Source: https://hexdocs.pm/phoenix/1.7.17/up_and_running

This command automates the process of downloading and setting up a new Phoenix project for Windows systems using PowerShell. It downloads a batch script and executes it.

```powershell
curl.exe -fsSO https://new.phoenixframework.org/app.bat; .\app.bat
```

--------------------------------

### Install Dependencies

Source: https://hexdocs.pm/phoenix/up_and_running

Installs project dependencies after the initial project generation. This step is crucial for fetching all necessary libraries and compiling them.

```bash
Fetch and install dependencies? [Yn] Y
* running mix deps.get
* running mix assets.setup
* running mix deps.compile

```

```bash
$ mix deps.get

```

--------------------------------

### Start Phoenix Server

Source: https://hexdocs.pm/phoenix/up_and_running

Starts the Phoenix development server, making the application accessible via a web browser. By default, it runs on http://localhost:4000.

```bash
$ mix phx.server
[info] Running HelloWeb.Endpoint with Bandit 1.5.7 at 127.0.0.1:4000 (http)
[info] Access HelloWeb.Endpoint at http://localhost:4000
[watch] build finished, watching for changes...
...

```

```bash
$ iex -S mix phx.server

```

--------------------------------

### Install NPM Dependencies

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Installs the NPM dependencies defined in `assets/package.json` using `npm install`. The `--prefix assets` flag is used, with an alternative `cd assets && npm install` for Windows users.

```bash
npm install --prefix assets

# or `cd assets && npm install` for Windows users if --prefix doesn't work
```

--------------------------------

### Add Phoenix LiveView GitHub Dependency

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Adds the latest features of Phoenix LiveView by installing directly from its GitHub repository. Also includes `floki` for testing.

```elixir
def deps do
  [
    {:phoenix_live_view, github: "phoenixframework/phoenix_live_view"},
    {:floki, ">= 0.0.0", only: :test}
  ]
end
```

--------------------------------

### Phoenix Express Installation (macOS/Ubuntu)

Source: https://hexdocs.pm/phoenix/up_and_running

This command installs Erlang, Elixir, and Phoenix, and generates a new Phoenix application. It automatically selects a database (PostgreSQL, MySQL, or SQLite) and opens the application. Assumes macOS or Ubuntu environment.

```shell
curl https://new.phoenixframework.org/myapp | sh

```

--------------------------------

### Phoenix Express Install (Windows PowerShell)

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/up_and_running

Installs Erlang, Elixir, and Phoenix, and generates a new Phoenix application for Windows using PowerShell. It automatically configures a database (PostgreSQL, MySQL, or SQLite) and sets up the project.

```powershell
curl.exe -fsSO https://new.phoenixframework.org/myapp.bat; .\myapp.bat

```

--------------------------------

### Navigate to Project Directory

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/up_and_running

After generating a new Phoenix project, you need to navigate into the project's root directory to run subsequent commands like dependency installation and database creation.

```bash
$ cd hello
```

--------------------------------

### Start Phoenix Server

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/up_and_running

This command starts the Phoenix application server. By default, it listens on port 4000. You can access your application via `http://localhost:4000` or `http://127.0.0.1:4000`. To stop the server, press `ctrl-c` twice.

```bash
$ mix phx.server
[info] Running HelloWeb.Endpoint with Bandit 1.5.7 at 127.0.0.1:4000 (http)
[info] Access HelloWeb.Endpoint at http://localhost:4000
[watch] build finished, watching for changes...
```

--------------------------------

### Create and Configure Database for Phoenix

Source: https://hexdocs.pm/phoenix/1.7.14/up_and_running

To set up your application's database, navigate to your project directory and run the `mix ecto.create` command. Ensure your database user and password are configured correctly in `config/dev.exs`.

```mix
$ cd hello
$ mix ecto.create
```

--------------------------------

### Phoenix Express Install (macOS/Ubuntu)

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/up_and_running

Installs Erlang, Elixir, and Phoenix, and generates a new Phoenix application for macOS and Ubuntu using curl. It automatically configures a database (PostgreSQL, MySQL, or SQLite) and sets up the project.

```shell
$ curl https://new.phoenixframework.org/myapp | sh

```

--------------------------------

### Import LiveView Helper Functions

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Imports `Phoenix.LiveView.Helpers` into the view block of `lib/my_app_web.ex`, providing LiveView-specific helper functions.

```elixir
# lib/my_app_web.ex

def view do
  quote do
    ...
    import Phoenix.LiveView.Helpers
  end
end
```

--------------------------------

### Install Phoenix Application Generator

Source: https://hexdocs.pm/phoenix/1.7.14/installation

Installs the `phx_new` archive, which provides the Phoenix application generator. This command allows you to create new Phoenix projects with various configuration options.

```bash
$ mix archive.install hex phx_new
```

--------------------------------

### Create New Phoenix Project (macOS/Ubuntu)

Source: https://hexdocs.pm/phoenix/contexts

This command downloads and executes the Phoenix installer script for macOS and Ubuntu, creating a new Phoenix project named 'hello'. It's a convenient way to start a new application from scratch.

```bash
curl https://new.phoenixframework.org/hello | sh
```

--------------------------------

### Install Phoenix Application Generator

Source: https://hexdocs.pm/phoenix/installation

This command installs the 'phx_new' archive using the Hex package manager. This archive provides the 'mix phx.new' task to generate new Phoenix applications.

```bash
$ mix archive.install hex phx_new

```

--------------------------------

### Install NProgress Dependency

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Add the nprogress library as a dependency in your project's package.json file to enable progress bar functionality.

```json
"nprogress": "^0.2.0"
```

--------------------------------

### Create a New Phoenix Application

Source: https://hexdocs.pm/phoenix/1.7.14/up_and_running

Use the `mix phx.new` command to generate a new Phoenix project. You can specify a directory name for your application. This command also allows for skipping various optional dependencies like Ecto, HTML, assets, and LiveView using flags.

```mix
$ mix phx.new hello
```

--------------------------------

### Check Elixir and Erlang Versions

Source: https://hexdocs.pm/phoenix/installation

This command verifies that you have Elixir and Erlang installed and meet the minimum version requirements for Phoenix. It outputs the installed versions of both.

```bash
elixir -v
Erlang/OTP 24 [erts-12.0] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Elixir 1.15.0

```

--------------------------------

### Phoenix Deployment Script (Shell)

Source: https://hexdocs.pm/phoenix/1.7.14/deployment

A shell script to set up and deploy a Phoenix application in production. It includes steps for getting production dependencies, compiling the application, deploying assets, running database migrations, and starting the Phoenix server. Ensure environment variables like PORT and MIX_ENV are set appropriately.

```shell
# Initial setup
$ mix deps.get --only prod
$ MIX_ENV=prod mix compile

# Compile assets
$ MIX_ENV=prod mix assets.deploy

# Custom tasks (like DB migrations)
$ MIX_ENV=prod mix ecto.migrate

# Finally run the server
$ PORT=4001 MIX_ENV=prod mix phx.server
```

--------------------------------

### Defining a GET Route

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Example of defining a GET route for the root path, mapping it to the `:home` action of the `PageController`. Phoenix provides macros for various HTTP verbs.

```elixir
get "/", PageController, :home
```

--------------------------------

### Fetch New Dependencies

Source: https://hexdocs.pm/phoenix/1.7.17/ecto

Instructs Mix to download and install the newly added dependencies, including the MyXQL adapter, after modifying the `mix.exs` file. This command ensures all project dependencies are up-to-date.

```bash
$ mix deps.get
copy
```

--------------------------------

### Import LiveView Controller Functionality

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Imports `Phoenix.LiveView.Controller` into the controller block of `lib/my_app_web.ex`, enabling LiveView controller features.

```elixir
# lib/my_app_web.ex

def controller do
  quote do
    ...
    import Phoenix.LiveView.Controller
  end
end
```

--------------------------------

### Create Phoenix Application Database

Source: https://hexdocs.pm/phoenix/1.7.17/up_and_running

This command creates the necessary database for the Phoenix application, typically PostgreSQL. It requires database configuration in `config/dev.exs` and assumes default PostgreSQL user credentials unless otherwise specified.

```shell
mix ecto.create
```

--------------------------------

### Phoenix.PubSub Subscribe and Broadcast Example

Source: https://hexdocs.pm/phoenix/_pubsub

Shows a basic usage example of Phoenix.PubSub, including subscribing to a topic and broadcasting a message. It demonstrates receiving messages by inspecting process info.

```iex
alias Phoenix.PubSub
PubSub.subscribe(:my_pubsub, "user:123")
Process.info(self(), :messages)
PubSub.broadcast(:my_pubsub, "user:123", {:user_update, %{id: 123, name: "Shane"}})
Process.info(self(), :messages)
```

--------------------------------

### Start Phoenix Server in Production

Source: https://hexdocs.pm/phoenix/1.7.14/deployment

Starts the Phoenix server in a production environment. Requires setting the `PORT` and `MIX_ENV` environment variables. This command runs the application on the specified port.

```bash
$ PORT=4001 MIX_ENV=prod mix phx.server
10:50:18.732 [info] Running MyAppWeb.Endpoint with Cowboy on http://example.com
```

--------------------------------

### Run Phoenix App within IEx

Source: https://hexdocs.pm/phoenix/1.7.17/up_and_running

Starts the Phoenix application within an Interactive Elixir (IEx) session. This is useful for debugging and interacting with the application directly.

```shell
iex -S mix phx.server
```

--------------------------------

### Install Production Dependencies and Compile

Source: https://hexdocs.pm/phoenix/1.7.14/deployment

Installs only production dependencies and compiles the Elixir code for your Phoenix application. This is a necessary step before deploying or running in a production environment.

```bash
$ mix deps.get --only prod
$ MIX_ENV=prod mix compile
```

--------------------------------

### Check Elixir and Erlang Versions

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/installation

Verifies the installed versions of Elixir and Erlang. This is crucial as Phoenix requires specific minimum versions of both.

```shell
elixir -v
Erlang/OTP 24 [erts-12.0] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Elixir 1.15.0
```

--------------------------------

### Start Phoenix Server after Authentication Setup

Source: https://hexdocs.pm/phoenix/1.7.14/mix_phx_gen_auth

Once the authentication system is generated, dependencies are fetched, the database is set up, and tests pass, you can start your Phoenix server. This command launches the development server, allowing you to test the authentication features in your browser.

```bash
$ mix phx.server
```

--------------------------------

### Import LiveView Router Functionality

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Imports `Phoenix.LiveView.Router` into the router block of `lib/my_app_web.ex`, enabling LiveView routing capabilities.

```elixir
# lib/my_app_web.ex

def router do
  quote do
    ...
    import Phoenix.LiveView.Router
  end
end
```

--------------------------------

### Generate New Phoenix Project with Mix

Source: https://hexdocs.pm/phoenix/1.7.17/up_and_running

Generates a new Phoenix project with the specified name. It allows for customization via flags to include or exclude default dependencies like Ecto, HTML/assets, or LiveView.

```elixir
mix phx.new hello
```

--------------------------------

### Replace Fetch Flash with Fetch Live Flash

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Replaces the `:fetch_flash` plug with `:fetch_live_flash` in the `:browser` pipeline within `lib/my_app_web/router.ex` to enable LiveView flash message handling.

```elixir
# lib/my_app_web/router.ex

pipeline :browser do
  ...
  plug :fetch_session
- plug :fetch_flash
+ plug :fetch_live_flash
end
```

--------------------------------

### Expose LiveView Socket

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Defines a socket endpoint for LiveView updates at `/live` in `lib/my_app_web/endpoint.ex`, configuring it to use `Phoenix.LiveView.Socket` and session options.

```elixir
# lib/my_app_web/endpoint.ex

defmodule MyAppWeb.Endpoint do
  use Phoenix.Endpoint

  # ...

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]]

  # ...
end
```

--------------------------------

### Run Phoenix Application within IEx

Source: https://hexdocs.pm/phoenix/1.7.14/up_and_running

You can also start your Phoenix application within an Interactive Elixir (IEx) session. This is useful for debugging and interacting with your application directly.

```iex
$ iex -S mix phx.server
```

--------------------------------

### Phoenix Router Configuration: Action Mapping

Source: https://hexdocs.pm/phoenix/1.7.17/controllers

Shows how to map a GET request for the root path ('/') to a specific controller action. This example illustrates changing the default action from 'home' to 'index'.

```elixir
get "/", PageController, :home
```

```elixir
get "/", PageController, :index
```

--------------------------------

### Start Phoenix Server and Test

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/mix_phx_gen_auth

Starts the Phoenix development server to test the newly generated authentication system. New links for registration and login should appear on the default page.

```bash
$ mix test

$ mix phx.server
```

--------------------------------

### Create New Phoenix Project

Source: https://hexdocs.pm/phoenix/up_and_running

Generates a new Phoenix application with specified name. Supports various flags to include or exclude optional dependencies like Ecto, HTML/Assets, and LiveView. Run `mix help phx.new` for all options.

```bash
$ mix phx.new hello

```

--------------------------------

### Check Elixir and Erlang Versions (Phoenix)

Source: https://hexdocs.pm/phoenix/1.7.14/installation

Verifies that your installed Elixir and Erlang versions meet the minimum requirements for Phoenix development. This check is crucial before proceeding with Phoenix installation and application generation.

```bash
elixir -v
Erlang/OTP 24 [erts-12.0] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Elixir 1.14.0
```

--------------------------------

### Phoenix Controller Test Example

Source: https://hexdocs.pm/phoenix/1.7.17/testing

Demonstrates a basic test for a Phoenix controller. It uses `HelloWeb.ConnCase` for context and asserts that a GET request to the root path returns a 200 HTML response containing specific text.

```elixir
defmodule HelloWeb.PageControllerTest do
  use HelloWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Peace of mind from prototype to production"
  end
end

```

--------------------------------

### Starting Application with Minimal Dependencies in Elixir Releases

Source: https://hexdocs.pm/phoenix/1.7.14/releases

This Elixir code snippet shows how to start an application with minimal dependencies within a release. It loads the app, sets a minimal environment variable, and then starts all necessary processes. This is useful for preventing unintended side effects like starting the Phoenix endpoint.

```elixir
defp start_app do
  load_app()
  Application.put_env(@app, :minimal, true)
  Application.ensure_all_started(@app)
end
```

--------------------------------

### Running and Managing Phoenix Release Instances

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/releases

Provides commands to start, stop, and interact with a deployed Phoenix application release. It includes options for starting the application, running the Phoenix server, executing migrations, and connecting remotely.

```shell
# To start your system
_build/dev/rel/my_app/bin/my_app start

# To start your system with the Phoenix server running
_build/dev/rel/my_app/bin/server

# To run migrations
_build/dev/rel/my_app/bin/migrate

# To connect to it remotely
_build/dev/rel/my_app/bin/my_app remote

# To stop it gracefully (you may also send SIGINT/SIGTERM)
_build/dev/rel/my_app/bin/my_app stop

# To list all commands:
_build/dev/rel/my_app/bin/my_app
```

--------------------------------

### Install Dependencies and Run Migrations

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/mix_phx_gen_auth

Fetches new dependencies added to the `mix.exs` file after generating the authentication system and then runs pending database migrations.

```bash
$ mix deps.get

$ mix ecto.migrate
```

--------------------------------

### Import NProgress CSS

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Import the nprogress CSS file into your main CSS file (e.g., app.css) to apply the default styling for the progress bar.

```css
@import "../node_modules/nprogress/nprogress.css";
```

--------------------------------

### Create Database

Source: https://hexdocs.pm/phoenix/up_and_running

Creates the application's database, typically PostgreSQL, using Ecto. Assumes a default 'postgres' user and password. Configuration is usually done in `config/dev.exs`.

```bash
$ mix ecto.create
Compiling 13 files (.ex)
Generated hello app
The database for Hello.Repo has been created

```

--------------------------------

### Add Phoenix LiveView Hex Dependency

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Adds the latest stable version of Phoenix LiveView from Hex.io to your project's dependencies in `mix.exs`. Also includes `floki` for testing.

```elixir
def deps do
  [
    {:phoenix_live_view, "~> 0.11.0"},
    {:floki, ">= 0.0.0", only: :test}
  ]
end
```

--------------------------------

### Install Hex Package Manager (Elixir)

Source: https://hexdocs.pm/phoenix/1.7.14/installation

Installs or upgrades the Hex package manager, which is essential for managing Elixir dependencies and installing Phoenix. This command ensures you have the latest version of Hex for your Phoenix project.

```bash
$ mix local.hex
```

--------------------------------

### Start Phoenix Server in Interactive Production Shell

Source: https://hexdocs.pm/phoenix/deployment

Starts the Phoenix application server within an interactive Elixir shell (IEx) in production mode. This allows for real-time interaction with your running application, useful for debugging or administrative tasks.

```shell
$ PORT=4001 MIX_ENV=prod iex -S mix phx.server
10:59:19.136 [info] Running MyAppWeb.Endpoint with Cowboy on http://example.com

```

--------------------------------

### Phoenix LiveView JavaScript Client Setup

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/live_view

Initializes the Phoenix LiveView JavaScript client in `app.js`. It connects to the server using WebSockets, passing a CSRF token for security. Requires `phoenix_html` and `phoenix_live_view`.

```javascript
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}})
liveSocket.connect()
```

--------------------------------

### Phoenix ChannelCase Setup

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/testing_channels

Defines `HelloWeb.ChannelCase`, a custom test case template for Phoenix Channels. It imports conveniences from `Phoenix.ChannelTest` and `HelloWeb.ChannelCase`, sets the default endpoint, and starts the SQL Sandbox for testing.

```elixir
defmodule HelloWeb.ChannelCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with channels
      import Phoenix.ChannelTest
      import HelloWeb.ChannelCase

      # The default endpoint for testing
      @endpoint HelloWeb.Endpoint
    end
  end

  setup _tags do
    Hello.DataCase.setup_sandbox(tags)
    :ok
  end
end

```

--------------------------------

### Enable LiveView Socket Connection

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Configures the `app.js` file to establish a connection to the LiveView socket, passing the CSRF token for authentication.

```javascript
// assets/js/app.js
import {Socket} from "phoenix"
import LiveSocket from "phoenix_live_view"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}});

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)
window.liveSocket = liveSocket
```

--------------------------------

### Start Phoenix Server

Source: https://hexdocs.pm/phoenix/1.7.14/json_and_apis

Starts the Phoenix development server, making the application accessible for testing and development. This command is typically run before interacting with the application's endpoints.

```bash
mix phx.server
```

--------------------------------

### Extract Session Options

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Extracts `Plug.Session` options into a module attribute `@session_options` in `lib/my_app_web/endpoint.ex` for cleaner configuration.

```elixir
  @session_options [
    store: :cookie,
    key: "_my_app_key",
    signing_salt: "somesigningsalt"
  ]

  plug Plug.Session, @session_options
```

--------------------------------

### Create Database with Mix Ecto

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/up_and_running

This command creates the database for your Phoenix application. Ensure your database is configured correctly in `config/dev.exs` before running this command. Refer to the Ecto section for troubleshooting.

```bash
$ mix ecto.create
Compiling 13 files (.ex)
Generated hello app
The database for Hello.Repo has been created
```

--------------------------------

### Add LiveView NPM Dependencies (Regular Project)

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Specifies the necessary Phoenix LiveView NPM dependencies for a regular project in `assets/package.json`.

```json
{
  "dependencies": {
    "phoenix": "file:../deps/phoenix",
    "phoenix_html": "file:../deps/phoenix_html",
    "phoenix_live_view": "file:../deps/phoenix_live_view"
  }
}
```

--------------------------------

### Phoenix Controller Example - Home Action

Source: https://hexdocs.pm/phoenix/1.7.14/controllers

Defines a basic Phoenix controller with a 'home' action that renders a template. It uses the `HelloWeb, :controller` macro to import necessary modules.

```elixir
defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end
end
```

--------------------------------

### Phoenix LiveView handle_event example

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/deployments

Demonstrates how to handle events in Phoenix LiveView using `handle_event/3`. This is a basic example showing event submission and server-side processing. Note that for managing tab state, using `<.link patch={...}>` is recommended to reduce server state.

```elixir
defmodule MyAppWeb.MyLive do
  use MyAppWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :tab, "home")}
  end

  def handle_event("change_tab", %{"tab" => new_tab}, socket) do
    {:noreply, assign(socket, :tab, new_tab)}
  end
end
```

--------------------------------

### Generating Authentication Resources with mix phx.gen.auth

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/welcome

Demonstrates how to use the `mix phx.gen.auth` generator to quickly set up authentication for a Phoenix application, including user management and session handling.

```bash
mix phx.gen.auth Account User users
```

--------------------------------

### Update Mix Aliases for Asset Building

Source: https://hexdocs.pm/phoenix/1.7.14/asset_management

Updates the `mix.exs` file to include `npm install` in the `setup` task and to use the custom `node build.js --deploy` for the `assets.deploy` task. This automates dependency installation and production asset building.

```elixir
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup", "cmd --cd assets npm install"],
      ...,
      "assets.deploy": ["cmd --cd assets node build.js --deploy", "phx.digest"]
    ]
  end
```

--------------------------------

### LiveView Layouts: live.html.leex Example

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/Phoenix

An example of a `live.html.leex` layout file used to wrap LiveView content. It demonstrates how to display flash messages and where the main content is rendered using `@inner_content`.

```html
<p><%= live_flash(@flash, :notice) %></p>
<p><%= live_flash(@flash, :error) %></p>
<%= @inner_content %>
```

--------------------------------

### Start Phoenix Server without Compiling

Source: https://hexdocs.pm/phoenix/1.4.16/Mix.Tasks.Phx

This command starts the Phoenix application's server without recompiling the project. It's useful for quick restarts when no code changes have been made. It assumes a standard Phoenix project setup.

```bash
mix phx.server --no-compile
```

--------------------------------

### Run Ecto Migrations

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/swapping_databases

Once the database is created and configured for MySQL, you can run your Ecto migrations to set up the database schema. This example shows a successful migration output.

```bash
$ mix ecto.migrate
[info] == Running HelloPhoenix.Repo.Migrations.CreateUser.change/0 forward
[info] create table users
[info] == Migrated in 0.2s

```

--------------------------------

### Phoenix LiveView Thermostat Component

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/live_view

A basic Elixir LiveView component demonstrating state initialization with `mount/3`, rendering with HEEx templates in `render/1`, and event handling for incrementing temperature in `handle_event/3`. Assumes `MyAppWeb` is defined.

```elixir
defmodule MyAppWeb.ThermostatLive do
  use MyAppWeb, :live_view

  def render(assigns) do
    ~H"""
Current temperature: {@temperature}°F
<button phx-click="inc_temperature">+</button>
"""
  end

  def mount(_params, _session, socket) do
    temperature = 70 # Let's assume a fixed temperature for now
    {:ok, assign(socket, :temperature, temperature)}
  end

  def handle_event("inc_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end
end
```

--------------------------------

### Force Reinstall NPM Dependency

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Forces a reinstallation of the `phoenix_live_view` NPM dependency within the `assets` directory to ensure the latest JavaScript version is used.

```bash
(cd assets && npm install --force phoenix_live_view)
```

--------------------------------

### Add LiveView NPM Dependencies (Umbrella Project)

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Specifies the necessary Phoenix LiveView NPM dependencies for an umbrella project in `assets/package.json`, adjusting dependency paths.

```json
{
  "dependencies": {
    "phoenix": "file:../../../deps/phoenix",
    "phoenix_html": "file:../../../deps/phoenix_html",
    "phoenix_live_view": "file:../../../deps/phoenix_live_view"
  }
}
```

--------------------------------

### Define Web Server Startup with Procfile

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/heroku

Create a `Procfile` in your project's root directory to tell Heroku how to start your web server. The `web: mix phx.server` command ensures that your Phoenix application is served when deployed.

```procfile
web: mix phx.server

```

--------------------------------

### Add CSRF Meta Tag to Layout

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Ensures a CSRF meta tag is included in the `<head>` section of the main layout file (`app.html.eex`) before the `app.js` script.

```html
<%= csrf_meta_tag() %>
<script type="text/javascript" src="<%= Routes.static_path(@conn, "/js/app.js") %>"></script>
```

--------------------------------

### Install New Dependencies with Mix

Source: https://hexdocs.pm/phoenix/1.7.14/ecto

Fetches and installs all the project dependencies, including the newly added MyXQL adapter, into the Phoenix project. This command ensures that all necessary libraries are available for the project to run with MySQL.

```bash
$ mix deps.getcopy
```

--------------------------------

### Phoenix Route Definition Example

Source: https://hexdocs.pm/phoenix/1.7.17/routing

Illustrates typical route definitions in a Phoenix application, mapping HTTP methods and paths to controller actions. This includes standard CRUD operations for reviews and users.

```elixir
PUT     /admin/reviews/:id       HelloWeb.Admin.ReviewController :update
DELETE  /admin/reviews/:id       HelloWeb.Admin.ReviewController :delete
GET     /admin/users             HelloWeb.Admin.UserController :index
GET     /admin/users/:id/edit    HelloWeb.Admin.UserController :edit
GET     /admin/users/new         HelloWeb.Admin.UserController :new
GET     /admin/users/:id         HelloWeb.Admin.UserController :show
POST    /admin/users             HelloWeb.Admin.UserController :create
PATCH   /admin/users/:id         HelloWeb.Admin.UserController :update
PUT     /admin/users/:id         HelloWeb.Admin.UserController :update
DELETE  /admin/users/:id         HelloWeb.Admin.UserController :delete
```

--------------------------------

### Phoenix.PubSub.Redis Supervisor Integration (Elixir)

Source: https://hexdocs.pm/phoenix/_pubsub_redis

Specifies how to start Phoenix.PubSub.Redis within your application's supervision tree. This requires listing the adapter in your supervisor configuration and ensuring the `:phoenix_pubsub_redis` dependency is added to your project.

```elixir
{
  Phoenix.PubSub,
  adapter: Phoenix.PubSub.Redis,
  host: "192.168.1.100",
  node_name: System.get_env("NODE")
}
```

```elixir
defp deps do
  [{:phoenix_pubsub_redis, "~> 2.1.0"}]
end
```

```elixir
def child_spec(init_arg) do
  Supervisor.child_spec({
    :poolboy,
    worker_module: Phoenix.PubSub.Redis.Worker,
    size: Keyword.get(init_arg, :redis_pool_size, 5),
    max_overflow: 0
  })
end
```

--------------------------------

### Docker Image Build for Phoenix Release

Source: https://hexdocs.pm/phoenix/releases

A Dockerfile for building a Phoenix release, utilizing multi-stage builds. It starts with a builder image containing Elixir and OTP, installs dependencies, compiles the release, and then copies the release artifacts to a lean runner image.

```dockerfile
# Find eligible builder and runner images on Docker Hub. We use Ubuntu/Debian
# instead of Alpine to avoid DNS resolution issues in production.
#
# https://hub.docker.com/r/hexpm/elixir/tags?page=1&name=ubuntu
# https://hub.docker.com/_/ubuntu?tab=tags
#
# This file is based on these images:
#
#   - https://hub.docker.com/r/hexpm/elixir/tags - for the build image
#   - https://hub.docker.com/_/debian?tab=tags&page=1&name=bullseye-20230612-slim - for the release image
#   - https://pkgs.org/ - resource for finding needed packages
#   - Ex: hexpm/elixir:1.18.4-erlang-27.3.4.2-debian-bookworm-20250811-slim
#
ARG ELIXIR_VERSION=1.18.4
ARG OTP_VERSION=27.3.4.2
ARG DEBIAN_VERSION=bookworm-20250811-slim

ARG BUILDER_IMAGE="hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"
ARG RUNNER_IMAGE="debian:${DEBIAN_VERSION}"

FROM ${BUILDER_IMAGE} AS builder

# install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends build-essential git \
    && rm -rf /var/lib/apt/lists/*

# prepare build dir
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ENV MIX_ENV="prod"

# install mix dependencies
COPY mix.exs mix.lock ./
RUN mix deps.get --only $MIX_ENV
RUN mkdir config

# copy compile-time config files before we compile dependencies
# to ensure any relevant config change will trigger the dependencies
# to be re-compiled.
COPY config/config.exs config/${MIX_ENV}.exs config/
RUN mix deps.compile

COPY priv priv

COPY lib lib

COPY assets assets

# compile assets
RUN mix assets.deploy

# Compile the release
RUN mix compile

# Changes to config/runtime.exs don't require recompiling the code
COPY config/runtime.exs config/

COPY rel rel
RUN mix release

# start a new build stage so that the final image will only contain
# the compiled release and other runtime necessities
FROM ${RUNNER_IMAGE}

RUN apt-get update && \
  apt-get install -y --no-install-recommends libstdc++6 openssl libncurses5 locales ca-certificates \
  && rm -rf /var/lib/apt/lists/*

```

--------------------------------

### Phoenix Channel Test Setup with Subscribe and Join

Source: https://hexdocs.pm/phoenix/1.7.14/testing_channels

Sets up a Phoenix test by establishing a `Phoenix.Socket` using `HelloWeb.UserSocket`, and then subscribing and joining a specific channel (`HelloWeb.RoomChannel` on topic `"room:lobby"`). The resulting socket is returned as metadata for use in subsequent tests. This emulates a client joining a channel before sending or receiving events.

```elixir
setup do
  {:ok, _, socket} =
    HelloWeb.UserSocket
    |> socket("user_id", %{some: :assign})
    |> subscribe_and_join(HelloWeb.RoomChannel, "room:lobby")

  %{socket: socket}
end
```

--------------------------------

### Define Webserver Start Command for Phoenix

Source: https://hexdocs.pm/phoenix/1.7.14/heroku

This Procfile defines the command Heroku will use to start the webserver for the Phoenix application. It typically uses `mix phx.server` to launch the application.

```text
web: mix phx.server
```

--------------------------------

### Phoenix Tracker Examples

Source: https://hexdocs.pm/phoenix/_pubsub/1.1.2/Phoenix

Examples demonstrating how to use the `Phoenix.Tracker.update/4` function to update tracker statistics.

```APIDOC
## Phoenix.Tracker.update/4 Examples

### Description
Examples demonstrating how to update tracker statistics using the `Phoenix.Tracker.update/4` function.

### Method
(N/A - Elixir function examples)

### Endpoint
(N/A - Elixir function examples)

### Request Example
```elixir
# Using a map
Phoenix.Tracker.update(MyTracker, self(), "lobby", u.id, %{stat: "zzz"})

# Using a function
Phoenix.Tracker.update(MyTracker, self(), "lobby", u.id, fn meta -> Map.put(meta, :away, true) end)
```

### Response Example
```elixir
{:ok, "1WpAofWYIAA="}
```
```

--------------------------------

### Start Phoenix Server

Source: https://hexdocs.pm/phoenix/1.7.17/mix_phx_gen_auth

Starts the Phoenix development server. This allows you to access and test your application, including the newly implemented authentication features, in a web browser.

```bash
$ mix phx.server

```

--------------------------------

### Configure `esbuild` for Colocated Hooks

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Example configuration for `esbuild` in `config/config.exs` to support colocated hooks. This involves updating the `args` and `env` for the `esbuild` dependency.

```elixir
 your_app_name: [
   args:
     ~w(js/app.js --bundle --target=es2022 --outdir=../priv/static/assets/js --external:/fonts/* --external:/images/* --alias:@=.),
   env: %{"NODE_PATH" => [Path.expand("../deps", __DIR__), Mix.Project.build_path()]},

```

--------------------------------

### Phoenix Project Creation with MySQL Database

Source: https://hexdocs.pm/phoenix/1.7.14/ecto

Creates a new Phoenix project named 'hello_phoenix' and configures it to use MySQL as the database. This command simplifies the setup process by automatically handling dependencies and basic configuration for the specified database.

```bash
$ mix phx.new hello_phoenix --database mysqlcopy
```

--------------------------------

### Phoenix LiveView Code Generation

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/live_view

A command-line instruction using the Phoenix framework's mix tasks to generate a complete LiveView CRUD (Create, Read, Update, Delete) implementation for a 'Post' resource within a 'Blog' context. This includes generators for controller, views, templates, and tests.

```bash
$ mix phx.gen.live Blog Post posts title:string body:text

```

--------------------------------

### Phoenix.Tracker.start_link

Source: https://hexdocs.pm/phoenix/_pubsub/Phoenix

Starts a tracker pool with specified options. It requires `:name` and `:pubsub_server` in `pool_opts`, and accepts several optional parameters to configure broadcast intervals, timeouts, and logging.

```APIDOC
## POST /_/_/start_link

### Description
Starts a tracker pool.

### Method
POST

### Endpoint
/_/_/start_link(tracker, tracker_arg, pool_opts)

### Parameters
#### Request Body
- **tracker** (module()) - Required - The tracker module implementing the `Phoenix.Tracker` behaviour
- **tracker_arg** (any()) - Required - The argument to pass to the tracker handler `init/1`
- **pool_opts** (list()) - Required - The list of options used to construct the shard pool
  - **name** (atom()) - Required - The name of the server, such as: `MyApp.Tracker`
  - **pubsub_server** (atom()) - Required - The name of the PubSub server, such as: `MyApp.PubSub`
  - **broadcast_period** (integer()) - Optional - The interval in milliseconds to send delta broadcasts across the cluster. Default `1500`
  - **max_silent_periods** (integer()) - Optional - The max integer of broadcast periods for which no delta broadcasts have been sent. Default `10`
  - **down_period** (integer()) - Optional - The interval in milliseconds to flag a replica as temporarily down. Default `broadcast_period * max_silent_periods * 2`
  - **permdown_period** (integer()) - Optional - The interval in milliseconds to flag a replica as permanently down. Default `1_200_000`
  - **clock_sample_periods** (integer()) - Optional - The numbers of heartbeat windows to sample remote clocks. Default `2`
  - **max_delta_sizes** (list(integer())) - Optional - The list of delta generation sizes to keep. Defaults `[100, 1000, 10_000]`
  - **log_level** (atom() | false) - Optional - The log level. Defaults `:debug`
  - **pool_size** (integer()) - Optional - The number of tracker shards to launch. Default `1`

### Response
#### Success Response (200)
- **status** (:ok) - Indicates successful startup.

#### Response Example
```json
{
  "status": ":ok"
}
```
```

--------------------------------

### Load Dependencies and Start Phoenix Server

Source: https://hexdocs.pm/phoenix/1.4.16/Mix.Tasks.Phx

This command sequence first loads project dependencies without performing a dependency check, and then starts the Phoenix application's server. This is a way to run `phx.server` when you need to bypass the dependency check for specific reasons. It requires the `mix do` command syntax.

```bash
mix do deps.loadpaths --no-deps-check, phx.server
```

--------------------------------

### GET /api/articles/:id

Source: https://hexdocs.pm/phoenix/testing_controllers

Retrieves a specific article by its ID. This endpoint is used after article creation to verify the data.

```APIDOC
## GET /api/articles/:id

### Description
Retrieves a specific article by its ID. This endpoint is used after article creation to verify the data.

### Method
GET

### Endpoint
/api/articles/:id

### Parameters
#### Path Parameters
- **id** (string) - Required - The ID of the article to retrieve.

### Response
#### Success Response (200)
- **data** (object) - The requested article object.
  - **id** (string) - The unique identifier of the article.
  - **title** (string) - The title of the article.
  - **body** (string) - The body content of the article.

#### Response Example (200)
```json
{
  "data": {
    "id": "some-article-id",
    "title": "some title",
    "body": "some body"
  }
}
```
```

--------------------------------

### Navigate to Project Directory

Source: https://hexdocs.pm/phoenix/up_and_running

Changes the current directory to the root of the newly created Phoenix project. This is a prerequisite for running subsequent Mix tasks.

```bash
$ cd hello

```

--------------------------------

### Update Mix Aliases for Asset Deployment

Source: https://hexdocs.pm/phoenix/asset_management

Updates the `mix.exs` file to include `npm install` in the `setup` alias and to use the custom esbuild script for `assets.deploy`.

```elixir
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup", "cmd --cd assets npm install"],
      ...,
      "assets.deploy": ["cmd --cd assets node build.js --deploy", "phx.digest"]
    ]
  end

```

--------------------------------

### Launch and Deploy Phoenix App to Fly.io

Source: https://hexdocs.pm/phoenix/1.7.14/fly

The `fly launch` command scans the current directory for a Phoenix project, generates a Dockerfile, and prompts for configuration details before deploying. It automates much of the setup process.

```bash
$ fly launch
copy
```

--------------------------------

### Create New Phoenix App

Source: https://hexdocs.pm/phoenix/fly

Generates a new Phoenix application. This is the initial step before deploying to Fly.io.

```bash
mix phx.new my_app
```

--------------------------------

### Configure NProgress with Phoenix LiveView JavaScript

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Customize your application's JavaScript (e.g., app.js) to integrate NProgress with Phoenix LiveView's page loading events. This ensures the progress bar appears during navigation and form submissions.

```javascript
import NProgress from "nprogress"

// Show progress bar on live navigation and form submits
window.addEventListener("phx:page-loading-start", info => NProgress.start())
window.addEventListener("phx:page-loading-stop", info => NProgress.done())
```

--------------------------------

### Configure LiveView Signing Salt

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/installation

Sets a signing salt for LiveView within the application's configuration file (`config/config.exs`). A secret can be generated using `mix phx.gen.secret 32`.

```elixir
# config/config.exs

config :my_app, MyAppWeb.Endpoint,
   live_view: [
     signing_salt: "SECRET_SALT"
   ]
```

--------------------------------

### Forwarding Requests with Phoenix.Router.forward/4

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Illustrates how to use the `forward/4` macro to direct requests starting with a specific path to a designated plug. This is useful for handling sub-sections of an application, potentially managed by separate modules.

```elixir
defmodule HelloWeb.Router do
  use HelloWeb, :router

  ...

  scope "/", HelloWeb do
    ...
  end

  forward "/jobs", BackgroundJob.Plug
end
```

--------------------------------

### Application Startup with Phoenix.PubSub.Supervisor

Source: https://hexdocs.pm/phoenix/_pubsub/1.1.2/Phoenix.PubSub

The `start/2` function is called when an OTP application is started. It handles different startup scenarios, including normal startups and distributed failovers. The function should return `{:ok, pid}` or `{:ok, pid, state}`, where `pid` is the PID of the application's top supervisor.

```Elixir
def start(type, args) do
  # Implementation details for starting the application supervisor
end
```

--------------------------------

### Generating LiveView and Authentication Code with Mix

Source: https://hexdocs.pm/phoenix/_live_view

Provides the `mix` commands to generate LiveView scaffolding and authentication modules. `mix phx.gen.live` creates the necessary files for a resource with LiveView support, while `mix phx.gen.auth` sets up user authentication. These generators accelerate application development by providing boilerplate code.

```bash
$ mix phx.gen.live Blog Post posts title:string body:text
```

```bash
mix phx.gen.auth Account User users
```

--------------------------------

### Add LiveDashboard Dependency (mix.exs)

Source: https://hexdocs.pm/phoenix/_live_dashboard/Phoenix

Adds the `phoenix_live_dashboard` dependency to your project. This is the first step in installing LiveDashboard. After adding this, run `mix deps.get`.

```elixir
def deps do
  [
    {:phoenix_live_dashboard, "~> 0.7"}
  ]
end
```

--------------------------------

### Initialize Phoenix Application in IEx

Source: https://hexdocs.pm/phoenix/1.7.17/ecto

This command starts the Phoenix application within an IEx (Interactive Elixir) shell. It allows for real-time testing and debugging of application code, including changeset functionalities. Aliasing is used to shorten commonly used module names for convenience.

```bash
$ iex -S mix

iex> alias Hello.User
Hello.User
```

--------------------------------

### Get Unsigned LiveView Parameters - Elixir

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/Phoenix.LiveView

The 'unsigned_params' function returns the raw, unsigned parameters from a LiveView request. These are typically used for initial setup before being processed or sanitized.

```elixir
unsigned_params() :: map()
```

--------------------------------

### Ecto Repository Configuration Example (Elixir)

Source: https://hexdocs.pm/phoenix/1.7.17/mix_tasks

This code snippet shows an example configuration block for a new Ecto repository within a Phoenix project's configuration file (e.g., `config/config.exs`). It includes common settings like username, password, hostname, and database name, which need to be adjusted for different environments.

```elixir
config :hello, OurCustom.Repo,
  username: "user",
  password: "pass",
  hostname: "localhost",
  database: "hello_repo",

```

--------------------------------

### Phoenix Catalog Context for Product Creation

Source: https://hexdocs.pm/phoenix/your_first_context

This snippet from the `Catalog` context demonstrates the function for creating a new product. It accepts attributes, attempts to create a product using the Ecto repository, and returns either a success tuple with the product or an error tuple with a changeset. Dependencies include `Hello.Repo` and `Hello.Catalog.Product`.

```elixir
  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs) do
    %Product{}

```

--------------------------------

### Install Node.js Packages with Yarn

Source: https://hexdocs.pm/phoenix/asset_management

Installs esbuild and Phoenix dependencies using Yarn. Ensure Node.js is installed in your development environment.

```bash
$ yarn add --dev esbuild
$ yarn add ../deps/phoenix ../deps/phoenix_html ../deps/phoenix_live_view

```

--------------------------------

### Import Colocated Hooks in `app.js`

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Example of importing and integrating colocated hooks into the LiveSocket instance in `app.js`. This makes the colocated hooks available to your LiveView application.

```javascript
import {LiveSocket} from "phoenix_live_view"
+import {hooks as colocatedHooks} from "phoenix-colocated/my_app"
import topbar from "../vendor/topbar"

const liveSocket = new LiveSocket("/live", Socket, {
  longPollFallbackMs: 2500,
  params: {_csrf_token: csrfToken},
+  hooks: {...colocatedHooks}
})
```

--------------------------------

### Start Phoenix.Tracker Shard Pool

Source: https://hexdocs.pm/phoenix/_pubsub/1.1.2/Phoenix

This code demonstrates how to start a Phoenix.Tracker shard pool by adding it as a worker to the supervision tree. It requires specifying the tracker module name and the PubSub server name.

```Elixir
worker(MyTracker, [[name: MyTracker, pubsub_server: MyPubSub]])
```

--------------------------------

### Run Phoenix Server in Interactive Elixir Shell

Source: https://hexdocs.pm/phoenix/1.7.14/deployment

Starts the Phoenix server within an interactive Elixir shell (`iex`). This is useful for debugging and interactive development in a production-like environment.

```bash
$ PORT=4001 MIX_ENV=prod iex -S mix phx.server
10:59:19.136 [info] Running MyAppWeb.Endpoint with Cowboy on http://example.com
```

--------------------------------

### LiveView Hooks Remount After Reconnect

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes hooks not getting remounted after a LiveView reconnect. This ensures that hook functionality is restored after a connection is re-established.

```elixir
Fix hooks not getting remounted after LiveView reconnect
```

--------------------------------

### Phoenix Application Deployment Script

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/deployment

A bash script to set up a Phoenix application for production. It includes dependency fetching, compilation, asset deployment, database migrations, and server startup. This script assumes a production environment and utilizes environment variables for configuration.

```bash
# Initial setup
$ mix deps.get --only prod
$ MIX_ENV=prod mix compile

# Compile assets
$ MIX_ENV=prod mix assets.deploy

# Custom tasks (like DB migrations)
$ MIX_ENV=prod mix ecto.migrate

# Finally run the server
$ PORT=4001 MIX_ENV=prod mix phx.server

```

--------------------------------

### JavaScript Example: Integrating with Client-side Libraries using onBeforeElUpdated

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/js-interop

This JavaScript configuration demonstrates how to use the `onBeforeElUpdated` callback within the `LiveSocket` constructor to integrate with client-side libraries. The provided example ensures that attributes starting with 'data-js-' are preserved on DOM elements when LiveView performs its patch operations, preventing external library configurations from being overwritten.

```javascript
let liveSocket = new LiveSocket("/live", Socket, {
  params: {_csrf_token: csrfToken},
  hooks: Hooks,
  dom: {
    onBeforeElUpdated(from, to) {
      for (const attr of from.attributes) {
        if (attr.name.startsWith("data-js-")) {
          to.setAttribute(attr.name, attr.value);
        }
      }
    }
  }
})
```

--------------------------------

### CSRF Token Meta Tag and App.js Setup (HTML/JavaScript)

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Sets up the CSRF token meta tag within the HTML layout and configures the LiveSocket in app.js to include this token for secure connections. This ensures that LiveView connections are properly authenticated.

```html
<meta name="csrf-token" content={Plug.CSRFProtection.get_csrf_token()} />
<script type="text/javascript" src="<%= Routes.static_path(@conn, "/js/app.js") %>"></script>
```

```javascript
let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}});
```

--------------------------------

### Update Mix Aliases for Asset Building

Source: https://hexdocs.pm/phoenix/1.7.17/asset_management

Updates the `mix.exs` file to include tasks for installing npm packages during `mix setup` and for deploying assets using the custom esbuild script.

```elixir
defp aliases do
  [
    setup: ["deps.get", "ecto.setup", "cmd --cd assets npm install"],
    ...,
    "assets.deploy": ["cmd --cd assets node build.js --deploy", "phx.digest"]
  ]
end
```

--------------------------------

### Install Node.js Packages with npm

Source: https://hexdocs.pm/phoenix/asset_management

Installs esbuild and Phoenix dependencies using npm. Ensure Node.js is installed in your development environment.

```bash
$ npm install esbuild --save-dev
$ npm install ../deps/phoenix ../deps/phoenix_html ../deps/phoenix_live_view --save

```

--------------------------------

### Phoenix Channels Standard Join Event Example

Source: https://hexdocs.pm/phoenix/1.7.17/writing_a_channels_client

An example of a client message to join a channel. It uses the standard 'phx_join' event with a join reference, message reference, topic name, and an example payload.

```plaintext
["0", "0", "miami:weather", "phx_join", {"some": "param"}]
```

--------------------------------

### Create Ecto Database

Source: https://hexdocs.pm/phoenix/1.7.17/ecto

Creates the database for the Phoenix application using Ecto. This command reads the configuration from `config/dev.exs` (and other environment-specific files) to set up the database. It's typically run after configuring the Ecto adapter and dependencies.

```bash
$ mix ecto.create
The database for HelloPhoenix.Repo has been created.
copy
```

--------------------------------

### Phoenix Pipeline Usage Example

Source: https://hexdocs.pm/phoenix/routing

Shows the basic syntax for defining a pipeline in a Phoenix router using `pipe_through`. This example applies the `:browser` pipeline to a scope, indicating that all routes within this scope will pass through the plugs defined in the `:browser` pipeline.

```elixir
scope "/", HelloWeb do
  pipe_through :browser

  resources "/users", UserController
end
```

--------------------------------

### Elixir Application Definition in Phoenix

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/directory_structure

Defines the `Hello.Application` module in Elixir, which specifies the services to be started when the Phoenix application launches. These services include telemetry, the database repository, a PubSub system, and the web endpoint. The order of definition dictates startup and shutdown sequencing.

```elixir
children = [
  HelloWeb.Telemetry,
  Hello.Repo,
  {Phoenix.PubSub, name: Hello.PubSub},
  HelloWeb.Endpoint
]
```

--------------------------------

### Start Phoenix Server in Detached Mode

Source: https://hexdocs.pm/phoenix/1.7.14/deployment

Launches the Phoenix server in detached mode, allowing it to run in the background and persist even after the terminal is closed. This is essential for production deployments.

```bash
$ PORT=4001 MIX_ENV=prod elixir --erl "-detached" -S mix phx.server
```

--------------------------------

### Create Phoenix Project (macOS/Ubuntu)

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/contexts

Command to create a new Phoenix project named 'hello' on macOS and Ubuntu systems using curl.

```bash
$ curl https://new.phoenixframework.org/hello | sh
```

--------------------------------

### LiveView Hooks Remount After Recovery

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes hooks not getting remounted after LiveView recovery. This ensures that hook functionality is restored after LiveView recovers from an error.

```elixir
Fix hooks not getting remounted after LiveView recovery
```

--------------------------------

### Post-Generation Commands for `mix phx.gen.auth`

Source: https://hexdocs.pm/phoenix/1.7.14/mix_tasks

After running `mix phx.gen.auth`, these commands are necessary to complete the setup. `mix deps.get` fetches any new dependencies introduced by the generator, and `mix ecto.migrate` applies the generated Ecto migrations to set up the necessary database tables for authentication.

```bash
mix deps.get
mix ecto.migrate
```

--------------------------------

### Phoenix Router Integration for LiveView

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/live_view

Configures the Phoenix router to map a URL path to a LiveView component. Assumes a `:browser` pipeline and the existence of `MyAppWeb.Router` and `MyAppWeb.ThermostatLive`.

```elixir
defmodule MyAppWeb.Router do
  use MyAppWeb, :router

  pipeline :browser do
    ...
  end

  scope "/", MyAppWeb do
    pipe_through :browser
    ...

    live "/thermostat", ThermostatLive
  end
end
```

--------------------------------

### Troubleshoot `mix ecto.create` Role Permissions

Source: https://hexdocs.pm/phoenix/ecto

These examples show common errors encountered during `mix ecto.create` due to incorrect PostgreSQL role configurations and their corresponding SQL fixes. Issues include the 'postgres' role not existing, not having login privileges, or lacking database creation privileges. Each fix involves executing specific `psql` commands to alter the role's permissions.

```bash
$ mix ecto.create
** (Mix) The database for Hello.Repo couldn't be created, reason given: psql: FATAL:  role "postgres" does not exist

```

```sql
=# CREATE ROLE postgres LOGIN CREATEDB;
CREATE ROLE

```

```bash
$ mix ecto.create
** (Mix) The database for Hello.Repo couldn't be created, reason given: psql: FATAL:  role "postgres" is not permitted to log in

```

```sql
=# ALTER ROLE postgres LOGIN;
ALTER ROLE

```

```bash
$ mix ecto.create
** (Mix) The database for Hello.Repo couldn't be created, reason given: ERROR:  permission denied to create database

```

```sql
=# ALTER ROLE postgres CREATEDB;
ALTER ROLE

```

--------------------------------

### Testing LiveViews with live_isolated (Elixir)

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Illustrates how to use the `live_isolated` test helper in Elixir for testing LiveViews that are not directly routable. This helper simplifies the setup for isolated LiveView testing scenarios.

```elixir
test "renders welcome message", %{conn: conn}
  do
    {:ok, view, _conn} = live_isolated(conn, MyLiveView, [session: %{id: 123}])
    assert html_content_of(view) =~ "Welcome"
  end
```

--------------------------------

### Run Ecto Database Migrations

Source: https://hexdocs.pm/phoenix/ecto

This command applies the generated Ecto migrations to set up the database schema. It compiles Elixir files and then executes the migration functions forward. The environment can be specified using `MIX_ENV`.

```bash
mix ecto.migrate
# For production environment:
# MIX_ENV=prod mix ecto.migrate
```

--------------------------------

### Gigalixir CLI Signup and Login

Source: https://hexdocs.pm/phoenix/gigalixir

Commands to sign up for a Gigalixir account and log in using either the standard method or Google authentication. Verifies the account status afterwards.

```bash
gigalixir signup
gigalixir signup:google

gigalixir login
gigalixir login:google

gigalixir account
```

--------------------------------

### Custom Telemetry GenServer Example

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/telemetry

An example of a GenServer that emits Telemetry events. This demonstrates how to integrate custom metrics and instrumentation directly into your application's processes using the :telemetry package.

```elixir
# lib/my_app/my_server.ex
defmodule MyApp.MyServer do
  use GenServer

  # Client API
  def start_link(opts) do
    GenServer.start_link(__MODULE__, [], opts)
  end

  # GenServer callbacks
  @impl true
  def init(args) do
    # You can start periodic measurements here if needed
    # :telemetry.periodic_native_interval(:my_app, :my_server, :native_interval, 5000)
    {:ok, args}
  end

  @impl true
  def handle_call({:get_status, _pid}, _from, state) do
    # Example of emitting an event on a call
    :telemetry.execute([:my_app, :my_server, :call, :get_status], %{status: :ok}, %{caller: _from})
    {:reply, :running, state}
  end

  @impl true
  def handle_info(:tick, state) do
    # Example of emitting an event on an info message
    :telemetry.execute([:my_app, :my_server, :info, :tick], %{data: System.system_time()}, %{})
    {:noreply, state}
  end

  # Example of handling exceptions and emitting telemetry
  @impl true
  def handle_cast(:crash, _from) do
    raise "Intentional crash"
  rescue
    e in RuntimeError ->
      :telemetry.execute([:my_app, :my_server, :call, :exception],
        %{exception: e},
        %{error_type: :runtime})
      {:noreply, %{}}
  end
end

```

--------------------------------

### Phoenix LiveView DOM Bindings Example

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/live_view

Illustrates common DOM bindings used in LiveView for client-server interaction. These bindings automatically trigger server-side events upon specific browser actions.

```html
<button phx-click="inc_temperature">+</button>
<form phx-submit="save">...</form>
<input phx-blur="validate">
```

--------------------------------

### Controller Plugs Example (Elixir)

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/plug

A basic example of defining plugs directly within a controller. This plug is applied to all actions within the controller unless specific guards are used.

```elixir
defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug HelloWeb.Plugs.Locale, "en"
end
```

--------------------------------

### Phoenix ExUnit Test for Listing Posts

Source: https://hexdocs.pm/phoenix/1.7.17/testing_contexts

An example ExUnit test for the `list_posts/0` function within the Hello.Blog context. It demonstrates creating a post using a fixture and asserting that `list_posts/0` returns an array containing that post.

```elixir
defmodule Hello.BlogTest do
  use Hello.DataCase

  alias Hello.Blog

  describe "posts" do
    alias Hello.Blog.Post

    import Hello.BlogFixtures

    @invalid_attrs %{body: nil, title: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Blog.list_posts() == [post]
    end

```

--------------------------------

### JavaScript Setup for LiveView 1.0 Input Feedback Shim

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This JavaScript code demonstrates how to integrate the `phx_feedback_dom.js` shim for `phx-feedback-for` compatibility in LiveView 1.0. It involves importing the shim and configuring it within the `LiveSocket` constructor. Ensure the shim file is placed in `assets/js/` and imported correctly. It modifies the `dom` option for `LiveSocket`.

```javascript
import {Socket} from "phoenix";
import {LiveSocket} from "phoenix_live_view"
import phxFeedbackDom from "./phx_feedback_dom"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {
  params: {_csrf_token: csrfToken},
  dom: phxFeedbackDom({})
})
```

--------------------------------

### Adjust Mix Alias for Releases

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Example of how to modify a custom mix alias for releases to ensure `mix compile` runs before `assets.deploy`, guaranteeing that colocated hooks are extracted correctly.

```elixir
release: ["compile", "assets.deploy", "release"]
```

--------------------------------

### Setup Ecto Database

Source: https://hexdocs.pm/phoenix/1.7.17/mix_phx_gen_auth

This command sets up the Ecto database for development and test environments. It ensures the database is ready to be used by the application's migrations and tests.

```bash
$ mix ecto.setup

```

--------------------------------

### HEEx Template Example

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/components

An example of a HEEx template that includes a layout component and displays a message. This is a standard way to structure views in Phoenix.

```heex
<Layouts.app flash={@flash}>
  <section>
    <h2>Hello World, from {@messenger}!</h2>
  </section>
</Layouts.app>
```

--------------------------------

### Phoenix ConnCase Setup in Elixir

Source: https://hexdocs.pm/phoenix/1.7.14/testing

Defines a reusable test case template for Phoenix projects using ExUnit. It sets up the endpoint, imports necessary modules for verified routes and connection testing, and prepares a database sandbox with a connection object for each test.

```elixir
defmodule HelloWeb.ConnCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      # The default endpoint for testing
      @endpoint HelloWeb.Endpoint

      use HelloWeb, :verified_routes

      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import HelloWeb.ConnCase
    end
  end
  
  setup tags do
    Hello.DataCase.setup_sandbox(tags)
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
```

--------------------------------

### Phoenix Controller Example - Show Action with Parameter

Source: https://hexdocs.pm/phoenix/1.7.14/controllers

Illustrates a Phoenix controller 'show' action that expects and utilizes a 'messenger' parameter from the HTTP request. It then renders a template, passing the 'messenger' value.

```elixir
defmodule HelloWeb.HelloController do
  ...

  def show(conn, %{"messenger" => messenger}) do
    render(conn, :show, messenger: messenger)
  end
end
```

--------------------------------

### Enabling Client Performance Profiling - LiveSocket API

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This JavaScript snippet shows how to use the `enableProfiling()` and `disableProfiling()` methods on the `LiveSocket` object. These methods are used to start and stop client-side performance profiling, aiding in the development and optimization process.

```javascript
let socket = new LiveSocket("/live", ...)

socket.enableProfiling()
// ... performance intensive operations ...
socket.disableProfiling()
```

--------------------------------

### Phoenix LiveView: mount Callback

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/Phoenix

The `mount/3` callback is the entry point for a LiveView. It's called during the initial page load and when the live socket is established, setting up the initial state of the LiveView.

```APIDOC
## mount(params, session, socket)

### Description
LiveView's entry-point, invoked for initial page load and socket establishment to set up the initial state.

### Method
Not Applicable (Callback function)

### Endpoint
Not Applicable (Callback function)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```elixir
def mount(_params, _session, socket) do
  {:ok, assign(socket, :message, "Welcome!")}
end
```

### Response
#### Success Response (200)
Not Applicable (Callback function)

#### Response Example
```elixir
{:ok, %Phoenix.LiveView.Socket{...}}
```
```

--------------------------------

### Define Read-Only Post Resource Routes with Phoenix

Source: https://hexdocs.pm/phoenix/1.7.14/routing

This example shows how to use the `:only` option with the `resources` macro to define only specific actions for a resource. Here, only `index` and `show` actions are defined for the `/posts` resource, creating read-only routes.

```elixir
resources "/posts", PostController, only: [:index, :show]
```

--------------------------------

### Run Ecto Migrations

Source: https://hexdocs.pm/phoenix/1.7.17/ecto

Applies any pending database migrations to the newly created database. This command executes the migration files defined in the `priv/repo/migrations` directory, ensuring the database schema is up-to-date.

```bash
$ mix ecto.migrate
[info] == Running HelloPhoenix.Repo.Migrations.CreateUser.change/0 forward
[info] create table users
[info] == Migrated in 0.2s
copy
```

--------------------------------

### Phoenix LiveView: mount Callback

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/Phoenix

The `mount/3` callback is the entry point for a LiveView, executed during the initial page load and when establishing the live socket. It receives parameters, session, and socket, and must return either `{:ok, socket}` or `{:ok, socket, options}`. Options can include temporary assigns or a layout specification.

```elixir
mount(
  Phoenix.LiveView.Socket.unsigned_params() | :not_mounted_at_router,
  session :: map(),
  socket :: Phoenix.LiveView.Socket.t()
) ::
  {:ok, Phoenix.LiveView.Socket.t()}
  | {:ok, Phoenix.LiveView.Socket.t(), keyword()}
```

--------------------------------

### Install UpChunk JS Library

Source: https://hexdocs.pm/phoenix/_live_view/external-uploads

Installs the UpChunk JS library, a tool for handling chunked HTTP uploads, into the assets directory of a Phoenix project.

```bash
$ npm install --prefix assets --save @mux/upchunk

```

--------------------------------

### Create Custom Authentication Pipeline in Phoenix Router

Source: https://hexdocs.pm/phoenix/1.7.17/routing

This example shows how to create a custom pipeline named :auth in a Phoenix router. This pipeline includes a plug for authentication, which is then used in a scope for review-related routes.

```elixir
defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {HelloWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :auth do
    plug HelloWeb.Authentication
  end

  scope "/reviews", HelloWeb do
    pipe_through [:browser, :auth]

    resources "/", ReviewController
  end
endcopy
```

--------------------------------

### Start Phoenix Project in IEx

Source: https://hexdocs.pm/phoenix/1.7.14/ecto

Starts a Phoenix project within the IEx (Interactive Elixir) shell, allowing for interactive testing and debugging of application code, including changesets.

```shell
$ iex -S mix
```

--------------------------------

### Generate Phoenix Auth with API Token Support

Source: https://hexdocs.pm/phoenix/1.7.17/api_authentication

This command generates the initial authentication scaffolding for a Phoenix project, including a user token table that will be reused for API tokens.

```bash
mix phx.gen.auth Accounts User users
```

--------------------------------

### Configure LiveView Uploaders

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/external-uploads

Example of configuring Phoenix LiveView's `allow_upload/3` function with an external upload handler. This setup specifies the `:external` option, pointing to a function that will generate upload metadata.

```elixir
def mount(_params, _session, socket) do
  {:ok,
   socket
   |> assign(:uploaded_files, [])
   |> allow_upload(:avatar, accept: :any, max_entries: 3, external: &presign_upload/2)}
end
```

--------------------------------

### Create Custom Authentication Pipeline in Phoenix Router

Source: https://hexdocs.pm/phoenix/1.7.14/routing

This example demonstrates creating a custom pipeline named :auth in a Phoenix router. This pipeline includes a custom plug for authentication (HelloWeb.Authentication) and is then piped through for a specific scope handling review resources.

```elixir
defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {HelloWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :auth do
    plug HelloWeb.Authentication
  end

  scope "/reviews", HelloWeb do
    pipe_through [:browser, :auth]

    resources "/", ReviewController
  end
end
```

--------------------------------

### Phoenix Basic Controller Action

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/controllers

Defines a basic Phoenix controller with a `home` action that renders a template. This is a common starting point for Phoenix applications.

```elixir
defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
```

--------------------------------

### Test JSON API Endpoints with cURL

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/json_and_apis

Demonstrates how to interact with the generated JSON API using `curl`. This includes making GET requests to retrieve data, POST requests to create new entries, PUT requests to update existing entries, and DELETE requests to remove entries.

```bash
curl -i http://localhost:4000/api/urls
```

```bash
curl -iX POST http://localhost:4000/api/urls \
   -H 'Content-Type: application/json' \
   -d '{"url": {"link":"https://phoenixframework.org", "title":"Phoenix Framework"}}'
```

```bash
curl -i http://localhost:4000/api/urls/1
```

```bash
curl -iX PUT http://localhost:4000/api/urls/2 \
   -H 'Content-Type: application/json' \
   -d '{"url": {"title":"Elixir Programming Language"}}'
```

```bash
curl -iX DELETE http://localhost:4000/api/urls/2 \
   -H 'Content-Type: application/json'
```

--------------------------------

### Gigalixir CLI Sign Up and Login

Source: https://hexdocs.pm/phoenix/1.7.14/gigalixir

Commands to sign up for a Gigalixir account and log in using the Gigalixir command-line interface. These steps are essential for interacting with the Gigalixir platform.

```bash
gigalixir signup
gigalixir login
gigalixir account
```

--------------------------------

### Example GenServer Emitting Telemetry Events

Source: https://hexdocs.pm/phoenix/telemetry

This is an example of a simple GenServer in Elixir that emits telemetry events. It demonstrates how to integrate custom metrics and instrumentation within your application using the :telemetry package.

```elixir
defmodule MyApp.MyServer do
  use GenServer

  # Client API
  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  # Server callbacks
  def init(:ok) do
    {:ok, %{}} # Initial state
  end

  # Example handle_call that emits an event
  def handle_call(:get_state, _from, state) do
    # Emit a 'call.stop' event with duration and any exceptions
    :telemetry.span([:my_app, :my_server, :call, :get_state], %{pid: self()}, fn ->
      # Actual work to get state
      {:reply, state, state}
    end)
  end

  # Example handle_cast that emits an event
  def handle_cast({:update, new_state}, state) do
    # Emit a 'cast.stop' event with duration and any exceptions
    :telemetry.span([:my_app, :my_server, :cast, :update], %{pid: self()}, fn ->
      {:noreply, new_state}
    end)
  end

  # Example handle_info that emits an event
  def handle_info(:tick, state) do
    # Emit a 'info.stop' event with duration and any exceptions
    :telemetry.span([:my_app, :my_server, :info, :tick], %{pid: self()}, fn ->
      # Process the tick
      {:noreply, state}
    end)
  end

  # Function to simulate an error for exception tracking
  def trigger_error do
    GenServer.cast(__MODULE__, :trigger_error)
  end

  def handle_cast(:trigger_error, state) do
    raise "Simulated error for telemetry"
    {:noreply, state}
  end
end
```

--------------------------------

### Phoenix LiveView Mount and Render Callbacks

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/Phoenix

Defines the essential `mount/3` and `render/1` callbacks for a Phoenix LiveView. `mount/3` handles initial socket setup and data assignment, while `render/1` is responsible for returning the HTML to be displayed, using the `~L` sigil for inlined templates.

```elixir
defmodule AppWeb.ThermostatLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
Current temperature: <%= @temperature %>
"""
  end

  def mount(_params, %{"current_user_id" => user_id}, socket) do
    temperature = Thermostat.get_user_reading(user_id)
    {:ok, assign(socket, :temperature, temperature)}
  end
end
```

--------------------------------

### Configure Phoenix PubSub Child Specification

Source: https://hexdocs.pm/phoenix/_pubsub

Generates a child specification for starting a pubsub process within a supervisor. The `:name` option is mandatory. Other options include `:adapter` (defaults to Phoenix.PubSub.PG2) and `:pool_size` for partitioning.

```elixir
child_spec(options)
```

```elixir
@spec child_spec(keyword()) :: Supervisor.child_spec()
```

--------------------------------

### Start Phoenix.PubSub.Redis in Supervision Tree (Elixir)

Source: https://hexdocs.pm/phoenix/_pubsub_redis/Phoenix.PubSub

This code snippet demonstrates how to add Phoenix.PubSub.Redis to your application's supervision tree. It requires specifying the adapter, Redis host, and a unique node name. Ensure the `:phoenix_pubsub_redis` dependency is added to your project.

```elixir
{
  Phoenix.PubSub,
  adapter: Phoenix.PubSub.Redis,
  host: "192.168.1.100",
  node_name: System.get_env("NODE")
}
```

--------------------------------

### Generate HTML Resource Scaffold with Mix

Source: https://hexdocs.pm/phoenix/1.7.14/testing

Demonstrates the `mix phx.gen.html` command to generate a full scaffold for a new resource, including Ecto schema, context, controllers, views, and associated tests. This command significantly speeds up development by providing a robust starting point.

```bash
mix phx.gen.html Blog Post posts title body:text
```

--------------------------------

### Phoenix Controller Action Sending a Direct Response (No Body)

Source: https://hexdocs.pm/phoenix/1.7.17/controllers

An example of a Phoenix controller action that bypasses template rendering to send a direct HTTP response with a specific status code (201 Created) and an empty body.

```elixir
def home(conn, _params) do
  send_resp(conn, 201, "")
end
```

--------------------------------

### LiveView Component with phx-target for Testing (HTML)

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

An example of an HTML structure for a LiveView component that includes a `phx-target` attribute. This is necessary when using deprecated `render_*` test functions that require DOM ID selectors to ensure the event is correctly routed to the component.

```html
<div id="component-id" phx-target="component-id">
  ...
</div>
```

--------------------------------

### Implement Minimal Phoenix.Tracker

Source: https://hexdocs.pm/phoenix/_pubsub/1.1.2/Phoenix

An example of a minimal tracker module implementing the Phoenix.Tracker behaviour. It includes the required `start_link/1`, `init/1`, and `handle_diff/2` callbacks. The `handle_diff` callback processes presence joins and leaves, broadcasting them via Phoenix.PubSub.

```Elixir
defmodule MyTracker do
  @behaviour Phoenix.Tracker

  def start_link(opts) do
    opts = Keyword.merge([name: __MODULE__], opts)
    Phoenix.Tracker.start_link(__MODULE__, opts, opts)
  end

  def init(opts) do
    server = Keyword.fetch!(opts, :pubsub_server)
    {:ok, %{pubsub_server: server, node_name: Phoenix.PubSub.node_name(server)}}
  end

  def handle_diff(diff, state) do
    for {topic, {joins, leaves}} <- diff do
      for {key, meta} <- joins do
        IO.puts "presence join: key \"#{key}\" with meta #{inspect meta}"
        msg = {:join, key, meta}
        Phoenix.PubSub.direct_broadcast!(state.node_name, state.pubsub_server, topic, msg)
      end
      for {key, meta} <- leaves do
        IO.puts "presence leave: key \"#{key}\" with meta #{inspect meta}"
        msg = {:leave, key, meta}
        Phoenix.PubSub.direct_broadcast!(state.node_name, state.pubsub_server, topic, msg)
      end
    end
    {:ok, state}
  end
end
```

--------------------------------

### Start IEx Session on Heroku

Source: https://hexdocs.pm/phoenix/1.7.14/heroku

This command starts an interactive Elixir shell (IEx) within the environment of your deployed Phoenix application on Heroku. It's useful for debugging and experimenting with your application's code and state.

```bash
$ heroku run "POOL_SIZE=2 iex -S mix"
```

--------------------------------

### Group Multiple Admin Resources within a Scope

Source: https://hexdocs.pm/phoenix/1.7.14/routing

This example demonstrates how to group multiple administrative resources (images, reviews, users) under a single '/admin' scope. All resources defined within this scope will share the '/admin' prefix and be handled by controllers in the 'HelloWeb.Admin' namespace, promoting code organization and consistency.

```elixir
scope "/admin", HelloWeb.Admin do
  pipe_through :browser

  resources "/images",  ImageController
  resources "/reviews", ReviewController
  resources "/users",   UserController
end
```

--------------------------------

### Elixir IEx Examples for Using Scoped Context Functions

Source: https://hexdocs.pm/phoenix/scopes

These Elixir interactive shell (IEx) examples demonstrate how to use the `Scope` helper module to pass context to other modules. The first example shows calling `MyApp.Blog.list_posts/1` with a scope that includes both a user ID and an organization slug. The second example shows calling `MyApp.Accounts.list_api_tokens/1` with a scope for a user identified by their email address.

```elixir
iex> MyApp.Blog.list_posts(Scope.for(user: 1, org: "foo"))
...
iex> MyApp.Accounts.list_api_tokens(Scope.for(user: "john@doe.com"))
...
```

--------------------------------

### Phoenix Ecto Delete Post Test

Source: https://hexdocs.pm/phoenix/1.7.14/testing_controllers

Illustrates a test for the Phoenix Ecto `delete` action. It uses `setup` to create a post before each test, then asserts that deleting the post redirects to the index page and that a subsequent GET request for the deleted post results in a 404 error. It relies on Phoenix.ConnTest helpers like `delete/2` and `assert_error_sent/2`.

```elixir
describe "delete post" do
  setup [:create_post]

  test "deletes chosen post", %{conn: conn, post: post} do
    conn = delete(conn, ~p"/posts/#{post}")
    assert redirected_to(conn) == ~p"/posts"

    assert_error_sent 404, fn ->
      get(conn, ~p"/posts/#{post}")
    end
  end

  defp create_post(_) do
    post = post_fixture()
    %{post: post}
  end
```

--------------------------------

### Define Comment Resource Routes Excluding Delete with Phoenix

Source: https://hexdocs.pm/phoenix/1.7.14/routing

This example demonstrates using the `:except` option with the `resources` macro to exclude specific actions. Here, the `delete` action is excluded for the `/comments` resource, while other default actions are included.

```elixir
resources "/comments", CommentController, except: [:delete]
```

--------------------------------

### Define Colocated Hook in LiveView Component

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Example of defining a colocated hook within a LiveView component using a `<script :type={ColocatedHook}>` tag. This allows JavaScript logic to be co-located with the HEEX template.

```elixir
alias Phoenix.LiveView.ColocatedHook

def input(%{type: "phone-number"} = assigns) do
  ~H"""
  <input type="text" name={@name} id={@id} value={@value} phx-hook=".PhoneNumber" />
  <script :type={ColocatedHook} name=".PhoneNumber">
    export default {
      mounted() {
        this.el.addEventListener("input", e => {
          let match = this.el.value.replace(/\D/g, "").match(/^(\d{3})(\d{3})(\d{4})$/)
          if(match) {
            this.el.value = `${match[1]}-${match[2]}-${match[3]}`
          }
        })
      }
    }
  </script>
  """
end
```

--------------------------------

### Define Default User Resource Routes (Elixir)

Source: https://hexdocs.pm/phoenix/1.7.17/routing

This Elixir code snippet demonstrates how to define a default set of RESTful routes for a `UserController` using the `resources` macro within a Phoenix router. It maps standard HTTP verbs and paths to controller actions like index, show, create, update, and delete. No external dependencies are required beyond a basic Phoenix project setup.

```elixir
scope "/", HelloWeb do
  pipe_through :browser

  get "/", PageController, :home
  resources "/users", UserController
  ...
end
```

--------------------------------

### Elixir Application Supervisor Configuration

Source: https://hexdocs.pm/phoenix/1.7.17/telemetry

This snippet shows how to add the MyApp.MyServer GenServer to your application's supervisor tree, typically in lib/my_app/application.ex. It demonstrates how to start the server with a function to be invoked.

```elixir
# lib/my_app/application.ex
children = [
  # Start a server that greets the world
  {MyApp.MyServer, fn -> "Hello, world!" end},
]
```

--------------------------------

### Initialize Git Repository

Source: https://hexdocs.pm/phoenix/1.7.14/gigalixir

Initializes a new Git repository and stages all project files for the first commit. This is a standard prerequisite for version control.

```bash
git init
git add .
git commit -m "Initial commit"
```

--------------------------------

### Start Phoenix Server

Source: https://hexdocs.pm/phoenix/1.7.14/mix_tasks

Starts the Phoenix application using the Cowboy web server on port 4000. This task ignores any arguments passed to it. It can also be run within an IEx session to provide an interactive Elixir prompt.

```bash
$ mix phx.server
[info] Running TaskTesterWeb.Endpoint with Cowboy on port 4000 (http)
copy
```

```bash
$ mix phx.server DoesNotExist
[info] Running TaskTesterWeb.Endpoint with Cowboy on port 4000 (http)
copy
```

```bash
$ iex -S mix phx.server
Erlang/OTP 17 [erts-6.4] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

[info] Running TaskTesterWeb.Endpoint with Cowboy on port 4000 (http)
Interactive Elixir (1.0.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
copy
```

--------------------------------

### Targeting Self in Components - LiveView Template

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This example illustrates how to use the `@myself` assign within a LiveView component's template to target the component itself. This is an alternative to using DOM IDs for event targeting, simplifying component interactions.

```html
phx-target="<%= @myself %>"
```

--------------------------------

### Deploy Phoenix Application to Gigalixir

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/gigalixir

Commands to deploy the Phoenix application to Gigalixir, check deployment status, run database migrations, view logs, and open the application in a browser.

```bash
git push gigalixir

gigalixir ps

gigalixir ps:migrate

gigalixir logs

gigalixir open
```

--------------------------------

### Basic Route Definitions

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/routing

This snippet lists example route definitions for a Phoenix application, showing HTTP methods, paths, and their corresponding controller actions. It covers operations like listing, showing, creating, updating, and deleting resources.

```text
DELETE  /admin/reviews/:id       HelloWeb.Admin.ReviewController :delete
GET     /admin/users             HelloWeb.Admin.UserController :index
GET     /admin/users/:id/edit    HelloWeb.Admin.UserController :edit
GET     /admin/users/new         HelloWeb.Admin.UserController :new
GET     /admin/users/:id         HelloWeb.Admin.UserController :show
POST    /admin/users             HelloWeb.Admin.UserController :create
PATCH   /admin/users/:id         HelloWeb.Admin.UserController :update
PUT     /admin/users/:id         HelloWeb.Admin.UserController :update
DELETE  /admin/users/:id         HelloWeb.Admin.UserController :delete
```

--------------------------------

### LiveView Test Utility - Open Browser

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Implements `Phoenix.LiveViewTest.open_browser/2` for opening a browser to test LiveView pages. This utility aids in end-to-end testing of LiveView functionality.

```elixir
Implement `Phoenix.LiveViewTest.open_browser/2` that opens up a browser with the LiveView page
```

--------------------------------

### Subscribe and Join Channel in Test Setup

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/testing_channels

Sets up a `Phoenix.Socket` using `HelloWeb.UserSocket` and then subscribes and joins a specific channel topic. This is crucial for emulating client behavior before sending or receiving channel events.

```elixir
setup do
  {:ok, _, socket} =
    HelloWeb.UserSocket
    |> socket("user_id", %{some: :assign})
    |> subscribe_and_join(HelloWeb.RoomChannel, "room:lobby")

  %{socket: socket}
end

```

--------------------------------

### Compile Phoenix Application Assets

Source: https://hexdocs.pm/phoenix/1.7.14/deployment

Compiles and deploys application assets such as JavaScript and stylesheets using `esbuild`. This task generates digested files in `priv/static` for efficient production serving.

```bash
$ MIX_ENV=prod mix assets.deploy
Check your digested files at "priv/static".
```

--------------------------------

### Start Phoenix Server

Source: https://hexdocs.pm/phoenix/1.7.17/mix_tasks

Starts the Phoenix application using the built-in Cowboy web server on port 4000. Any arguments passed to this task are silently ignored. It can also be run within an IEx session.

```shell
$ mix phx.server
[info] Running TaskTesterWeb.Endpoint with Cowboy on port 4000 (http)
```

```shell
$ mix phx.server DoesNotExist
[info] Running TaskTesterWeb.Endpoint with Cowboy on port 4000 (http)
```

```shell
$ iex -S mix phx.server
Erlang/OTP 17 [erts-6.4] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

[info] Running TaskTesterWeb.Endpoint with Cowboy on port 4000 (http)
Interactive Elixir (1.0.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```

--------------------------------

### Execute Test Partitions in CI Environment

Source: https://hexdocs.pm/phoenix/1.7.14/testing

Provides examples of commands to run test partitions in a CI environment. By setting `MIX_TEST_PARTITION` and using the `--partitions` flag, the test suite can be distributed across multiple parallel jobs.

```bash
MIX_TEST_PARTITION=1 mix test --partitions 4
MIX_TEST_PARTITION=2 mix test --partitions 4
MIX_TEST_PARTITION=3 mix test --partitions 4
MIX_TEST_PARTITION=4 mix test --partitions 4
```

--------------------------------

### Running All Project Tests with Mix

Source: https://hexdocs.pm/phoenix/1.7.14/testing

Demonstrates how to execute all tests within a Phoenix project using the Mix build tool. The output shows a summary of the test run, including the number of tests executed and any failures.

```bash
$ mix test
....

Finished in 0.2 seconds
5 tests, 0 failures

Randomized with seed 540755
```

--------------------------------

### Create Valid Changeset with Extra Parameters

Source: https://hexdocs.pm/phoenix/1.7.17/ecto

This example demonstrates creating a changeset with a map of parameters that includes both required fields and an extra field (`random_key`). The `cast/3` function in the changeset pipeline ignores fields not present in the schema or explicitly listed for casting, resulting in a valid changeset.

```elixir
iex> params = %{name: "Joe Example", email: "joe@example.com", bio: "An example to all", number_of_pets: 5, random_key: "random value"}
%{bio: "An example to all", email: "joe@example.com", name: "Joe Example", number_of_pets: 5, random_key: "random value"}

iex> changeset = User.changeset(%User{}, params)
#Ecto.Changeset<
  action: nil,
  changes: %{
    bio: "An example to all",
    email: "joe@example.com",
    name: "Joe Example",
    number_of_pets: 5
  },
  errors: [],
  data: #Hello.User<>
  valid?: true
>
```

```elixir
iex> changeset.valid?
true
```

```elixir
iex(9)> changeset.changes
%{bio: "An example to all", email: "joe@example.com", name: "Joe Example", number_of_pets: 5}
```

--------------------------------

### Display Online Users Example

Source: https://hexdocs.pm/phoenix/1.7.17/presence

An example of how the rendered online users might appear in the browser based on the `renderOnlineUsers` JavaScript function. It shows a simple format for displaying user IDs and their online counts.

```plaintext
Alice (count: 2)
Bob (count: 1)

```

--------------------------------

### Phoenix.Tracker Behaviour

Source: https://hexdocs.pm/phoenix/_pubsub/Phoenix

Details on implementing the Phoenix.Tracker behaviour, including required callbacks and an example of a minimal tracker.

```APIDOC
## Phoenix.Tracker Behaviour

### Description
Provides distributed presence tracking to processes. Tracker shards use a heartbeat protocol and CRDT to replicate presence information across a cluster in an eventually consistent, conflict-free manner. Each node runs a pool of trackers and node-local changes are replicated across the cluster and handled locally as a diff of changes.

### Implementing a Tracker
To start a tracker, add it to your supervision tree:

```elixir
children = [
  # ...
  {MyTracker, [name: MyTracker, pubsub_server: MyApp.PubSub]}
]
```

Implement `MyTracker` with support for the `Phoenix.Tracker` behaviour callbacks. An example of a minimal tracker:

```elixir
defmodule MyTracker do
  use Phoenix.Tracker

  def start_link(opts) do
    opts = Keyword.merge([name: __MODULE__], opts)
    Phoenix.Tracker.start_link(__MODULE__, opts, opts)
  end

  def init(opts) do
    server = Keyword.fetch!(opts, :pubsub_server)
    {:ok, %{pubsub_server: server, node_name: Phoenix.PubSub.node_name(server)}}
  end

  def handle_diff(diff, state) do
    for {topic, {joins, leaves}} <- diff do
      for {key, meta} <- joins do
        IO.puts "presence join: key \"#{key}\" with meta #{inspect meta}"
        msg = {:join, key, meta}
        Phoenix.PubSub.direct_broadcast!(state.node_name, state.pubsub_server, topic, msg)
      end
      for {key, meta} <- leaves do
        IO.puts "presence leave: key \"#{key}\" with meta #{inspect meta}"
        msg = {:leave, key, meta}
        Phoenix.PubSub.direct_broadcast!(state.node_name, state.pubsub_server, topic, msg)
      end
    end
    {:ok, state}
  end
end
```

### Callbacks
Trackers must implement `start_link/1`, `init/1`, and `handle_diff/2`. The `init/1` callback allows the tracker to manage its own state. The `handle_diff/2` callback is invoked with a diff of presence join and leave events.

An optional `handle_info/2` callback may also be invoked to handle application-specific messages.

### Special Considerations
Operations within `handle_diff/2` happen in the tracker server's context. Avoid blocking operations and offload them to a supervised task when required. A crash in `handle_diff/2` will crash the tracker server, so operations that may crash the server should be offloaded with a `Task.Supervisor`.
```

--------------------------------

### Gigalixir CLI Signup and Login

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/gigalixir

Commands to sign up for a Gigalixir account and log in using the Gigalixir command-line interface. Supports both standard and Google account authentication.

```bash
gigalixir signup
# or with a Google account
gigalixir signup:google

gigalixir login
# or with a Google account
gigalixir login:google
```

--------------------------------

### Install UpChunk JS Library

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/external-uploads

Instructions on how to install the UpChunk JavaScript library, which is used for handling chunked HTTP uploads. This can be done either by saving the contents to a local file or by using npm.

```bash
$ npm install --prefix assets --save @mux/upchunk
copy
```

--------------------------------

### LiveView JS Transition on Mount

Source: https://hexdocs.pm/phoenix/_live_view/bindings

Shows how to apply JavaScript transitions to elements when they are mounted to the DOM using the `phx-mounted` binding. The example uses `JS.transition` to apply an animation class.

```html
<div phx-mounted={JS.transition("animate-ping", time: 500)}>
  <!-- Element with transition on mount -->
</div>
```

--------------------------------

### Phoenix VerifiedRoutes Router Definitions

Source: https://hexdocs.pm/phoenix/1.7.17/Phoenix

Example of Phoenix router definitions against which `~p` paths are verified. Ensure your `~p` usage matches these defined routes to avoid compiler warnings.

```elixir
get "/posts/:post_id", PostController, :show
post "/sessions/new", SessionController, :create
```

--------------------------------

### Modify Changeset to Make Field Optional in Elixir

Source: https://hexdocs.pm/phoenix/ecto

Illustrates how to modify the `changeset/2` function to make a field optional. By removing `number_of_pets` from the `validate_required/3` list, it is no longer a mandatory field. The example shows recompiling and re-checking the changeset in IEx.

```elixir
|> validate_required([:name, :email, :bio])
```

```shell
iex> recompile()
Compiling 1 file (.ex)
:ok
```

```elixir
iex> changeset = User.changeset(%User{}, %{})
#Ecto.Changeset<
  action: nil,
  changes: %{},
  errors: [
    name: {"can't be blank", [validation: :required]},
    email: {"can't be blank", [validation: :required]},
    bio: {"can't be blank", [validation: :required]}
  ],
  data: #Hello.User<>
  valid?: false
>
```

```elixir
changeset.errors
[
  name: {"can't be blank", [validation: :required]},
  email: {"can't be blank", [validation: :required]},
  bio: {"can't be blank", [validation: :required]}
]
```

--------------------------------

### Custom Dispatch Configuration Example

Source: https://hexdocs.pm/phoenix/1.4.16/Phoenix.Endpoint

An example of how to configure custom dispatch options for the Phoenix endpoint using Cowboy. This demonstrates integrating custom handlers and the live-reload websocket.

```elixir
config :myapp, MyAppWeb.Endpoint,
  http: [dispatch: [
          {:_, [
              {"/foo", MyAppWeb.CustomHandler, []},
              {"/bar", MyAppWeb.AnotherHandler, []},
              {"/phoenix/live_reload/socket/websocket", Phoenix.Endpoint.CowboyWebSocket,
                {Phoenix.Transports.WebSocket,
                  {MyAppWeb.Endpoint, Phoenix.LiveReloader.Socket, websocket_config}}},
              {:_, Plug.Adapters.Cowboy.Handler, {MyAppWeb.Endpoint, []}}
            ]}
        ]]
```

--------------------------------

### Phoenix Router with Multiple Scopes for Different Applications

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Illustrates how to define multiple scopes within a Phoenix router, even when they share the same path prefix, as long as routes are not duplicated. This example shows scopes for 'HelloWeb' and 'AnotherAppWeb' handling different resources ('users' and 'posts' respectively). It requires Phoenix.Router and controllers like UserController and PostController.

```elixir
defmodule HelloWeb.Router do
  use Phoenix.Router
  ...
  scope "/", HelloWeb do
    pipe_through :browser

    resources "/users", UserController
  end

  scope "/", AnotherAppWeb do
    pipe_through :browser

    resources "/posts", PostController
  end
  ...
end
```

--------------------------------

### Example Usage of live_layered_graph Layers

Source: https://hexdocs.pm/phoenix/_live_dashboard/Phoenix.LiveDashboard

This example demonstrates the structure of the 'layers' attribute required by the live_layered_graph component. Each layer is a list of nodes, and each node must have an 'id', 'children', and 'data'. The 'data' can be a string or a map with 'detail' and 'label' fields.

```elixir
layers = [
  [
    %{
      id: "a1",
      data: "a1",
      children: ["b1"]
    }
  ],
  [
    %{
      id: "b1"
      data: %{
        detail: 0,
        label: "b1"
      },
      children: []
     }
   ]
]

```

--------------------------------

### Elixir LiveView Thermostat Component

Source: https://hexdocs.pm/phoenix/_live_view/welcome

Defines a LiveView module for a thermostat, handling temperature display, incrementing, and initial mounting. It uses HEEx for templating and LiveView callbacks.

```elixir
defmodule MyAppWeb.ThermostatLive do
  use MyAppWeb, :live_view

  def render(assigns) do
    ~H"""
    Current temperature: {@temperature}°F
    <button phx-click="inc_temperature">+</button>
    """
  end

  def mount(_params, _session, socket) do
    temperature = 70 # Let's assume a fixed temperature for now
    {:ok, assign(socket, :temperature, temperature)}
  end

  def handle_event("inc_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end
end
```

--------------------------------

### Launch Phoenix App on Fly.io

Source: https://hexdocs.pm/phoenix/fly

Initiates the deployment process for a Phoenix application on Fly.io. This command scans the source code, detects the Phoenix project, and generates necessary configuration files like a Dockerfile and `fly.toml`.

```bash
fly launch
```

--------------------------------

### Generate PubSub Child Specification

Source: https://hexdocs.pm/phoenix/_pubsub/2.1.3/Phoenix

Creates a supervisor child specification for starting a Phoenix.PubSub process. Requires at least the `:name` option. Other options include `:adapter` and `:pool_size` for configuration.

```elixir
iex(13)> Phoenix.PubSub.child_spec(name: MyApp.PubSub)
%{id: MyApp.PubSub, start: {Phoenix.PubSub, :start_link, [MyApp.PubSub, [:pg2_server]]}}
```

```elixir
iex(14)> Phoenix.PubSub.child_spec(name: MyApp.PubSub, adapter: Phoenix.PubSub.PG2, pool_size: 4)
%{id: MyApp.PubSub, start: {Phoenix.PubSub, :start_link, [MyApp.PubSub, [:pg2_server, {:pool_size, 4}]]}}
```

--------------------------------

### Generating Phoenix Release Scripts

Source: https://hexdocs.pm/phoenix/releases

Generates the necessary overlay scripts and configuration files for creating a self-contained release of a Phoenix application. This includes scripts for starting the server and running migrations.

```shell
$ mix phx.gen.release
==> my_app
* creating rel/overlays/bin/server
* creating rel/overlays/bin/server.bat
* creating rel/overlays/bin/migrate
* creating rel/overlays/bin/migrate.bat
* creating lib/my_app/release.ex
```

--------------------------------

### LiveView Render Layout with LiveEEx

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Adds support for `render_layout` with LiveEEx. This allows for more flexible layout rendering within LiveView.

```elixir
Support `render_layout` with LiveEEx
```

--------------------------------

### Install esbuild and Phoenix Packages with npm

Source: https://hexdocs.pm/phoenix/1.7.14/asset_management

Installs the esbuild npm package and Phoenix JavaScript packages as development dependencies. This is a prerequisite for using a custom esbuild build script.

```bash
$ npm install esbuild --save-dev
$ npm install ../deps/phoenix ../deps/phoenix_html ../deps/phoenix_live_view --save
```

--------------------------------

### Set Entrypoint for Docker Container

Source: https://hexdocs.pm/phoenix/1.7.14/releases

This commented-out Dockerfile instruction suggests using 'tini' as an entrypoint for the container. 'tini' is an init process that helps in properly reaping zombie processes, which is important in environments that might not handle process management automatically. This is an optional but recommended practice for robust container execution.

```dockerfile
# ENTRYPOINT ["/tini", "--"]
```

--------------------------------

### HTTP Requests with Tesla Middleware in Elixir

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/security

This Elixir example demonstrates using Tesla with BaseUrl middleware for HTTP requests. It shows that the `get` request to a specific URL is executed, implying that the BaseUrl middleware does not inherently prevent SSRF if the target URL is controlled by user input.

```Elixir
plug Tesla.Middleware.BaseUrl, "https://example.com/foo"

MyClient.get("http://example.com/bar") # equals to GET http://example.com/bar
```

--------------------------------

### Install esbuild and Phoenix Packages

Source: https://hexdocs.pm/phoenix/1.7.17/asset_management

Installs the esbuild package for Node.js and Phoenix dependencies. This is a prerequisite for using a custom esbuild build script in your Phoenix project.

```bash
$ npm install esbuild --save-dev
$ npm install ../deps/phoenix ../deps/phoenix_html ../deps/phoenix_live_view --save
```

```bash
$ yarn add --dev esbuild
$ yarn add ../deps/phoenix ../deps/phoenix_html ../deps/phoenix_live_view
```

--------------------------------

### Phoenix.PubSub - Adapters

Source: https://hexdocs.pm/phoenix/_pubsub/index

Overview of the supported adapters for Phoenix.PubSub, including Phoenix.PubSub.PG2 (default) and Phoenix.PubSub.Redis.

```APIDOC
## Adapters

### Description
Phoenix.PubSub is designed for flexibility and supports multiple backends. Two officially supported adapters are available:

1.  **`Phoenix.PubSub.PG2`**: The default adapter. It uses Distributed Elixir for direct server-to-server notification exchange. It supports a `:pool_size` option (defaults to 1), which must be consistent across the cluster.
2.  **`Phoenix.PubSub.Redis`**: Uses Redis for inter-server data exchange. Requires the `:phoenix_pubsub_redis` dependency.

Custom adapters can be implemented by following the `Phoenix.PubSub.Adapter` behavior.
```

--------------------------------

### Phoenix LiveDashboard Custom Page Example (Elixir)

Source: https://hexdocs.pm/phoenix/_live_dashboard/Phoenix.LiveDashboard

An example of a custom LiveDashboard page using the PageBuilder behavior. This page displays ETS table information. It defines menu link text, renders a live table with custom columns, and includes helper functions for fetching and formatting data.

```elixir
defmodule Phoenix.LiveDashboard.EtsPage do
  @moduledoc false
  use Phoenix.LiveDashboard.PageBuilder

  @impl true
  def menu_link(_, _) do
    {:ok, "ETS"}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.live_table
      id="ets-table"
      dom_id="ets-table"
      page={@page}
      title="ETS"
      row_fetcher={&fetch_ets/2}
      row_attrs={&row_attrs/1}
      rows_name="tables"
    >
      <:col field={:name} header="Name or module" />
      <:col field={:protection} />
      <:col field={:type} />
      <:col field={:size} text_align="right" sortable={:desc} />
      <:col field={:memory} text_align="right" sortable={:desc} :let={ets}>
        <%= format_words(ets[:memory]) %>
      </:col>
      <:col field={:owner} :let={ets} >
        <%= encode_pid(ets[:owner]) %>
      </:col>
    </.live_table>
    """
  end

  defp fetch_ets(params, node) do
    %{search: search, sort_by: sort_by, sort_dir: sort_dir, limit: limit} = params

    # Here goes the code that goes through all ETS tables, searches
    # (if not nil), sorts, and limits them.
    #
    # It must return a tuple where the first element is list with
    # the current entries (up to limit) and an integer with the
    # total amount of entries.
    # ...
  end

  defp row_attrs(table) do
    [
      phx_click: "show_info",
      phx_value_info: encode_ets(table[:id]),
      phx_page_loading: true
    ]
  end
end

```

--------------------------------

### Elixir GenServer for Function Execution with Telemetry

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/telemetry

This Elixir GenServer module, MyApp.MyServer, is designed to start a process that can execute an arbitrary function. It emits telemetry events at the start, stop, or exception of the function's execution, providing measurements like duration and metadata about the event. It requires the `:telemetry` library.

```elixir
defmodule MyApp.MyServer do
  @moduledoc """
  An example GenServer that runs arbitrary functions and emits telemetry events when called.
  """
  use GenServer

  # A common prefix for :telemetry events
  @prefix [:my_app, :my_server, :call]

  def start_link(fun) do
    GenServer.start_link(__MODULE__, fun, name: __MODULE__)
  end

  @doc """
  Runs the function contained within this server.

  ## Events

  The following events may be emitted:

    * `[:my_app, :my_server, :call, :start]` - Dispatched
      immediately before invoking the function. This event
      is always emitted.

      * Measurement: `%{system_time: system_time}`

      * Metadata: `%{}`

    * `[:my_app, :my_server, :call, :stop]` - Dispatched
      immediately after successfully invoking the function.

      * Measurement: `%{duration: native_time}`

      * Metadata: `%{}`

    * `[:my_app, :my_server, :call, :exception]` - Dispatched
      immediately after invoking the function, in the event
      the function throws or raises.

      * Measurement: `%{duration: native_time}`

      * Metadata: `%{kind: kind, reason: reason, stacktrace: stacktrace}`
  """
  def call!, do: GenServer.call(__MODULE__, :called)

  @impl true
  def init(fun) when is_function(fun, 0), do: {:ok, fun}

  @impl true
  def handle_call(:called, _from, fun) do
    # Wrap the function invocation in a "span"
    result = telemetry_span(fun)

    {:reply, result, fun}
  end

  # Emits telemetry events related to invoking the function
  defp telemetry_span(fun) do
    start_time = emit_start()

    try do
      fun.()
    catch
      kind, reason ->
        stacktrace = System.stacktrace()
        duration = System.monotonic_time() - start_time
        emit_exception(duration, kind, reason, stacktrace)
        :erlang.raise(kind, reason, stacktrace)
    else
      result ->
        duration = System.monotonic_time() - start_time
        emit_stop(duration)
        result
    end
  end

  defp emit_start do
    start_time_mono = System.monotonic_time()

    :telemetry.execute(
      @prefix ++ [:start],
      %{system_time: System.system_time()},
      %{}
    )

    start_time_mono
  end

  defp emit_stop(duration) do
    :telemetry.execute(
      @prefix ++ [:stop],
      %{duration: duration},
      %{}
    )
  end

  defp emit_exception(duration, kind, reason, stacktrace) do
    :telemetry.execute(
      @prefix ++ [:exception],
      %{duration: duration},
      %{kind: kind,
        reason: reason,
        stacktrace: stacktrace
      }
    )
  end
end
```

--------------------------------

### Fetch New Dependencies and Create Database

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/swapping_databases

After updating dependencies and configuration, fetch the new MySQL dependency using `mix deps.get`. Subsequently, create the database for your application with `mix ecto.create`.

```bash
$ mix deps.get

$ mix ecto.create

```

--------------------------------

### Importing Third-Party JS Package (npm)

Source: https://hexdocs.pm/phoenix/1.7.14/asset_management

Shows how to import a JavaScript dependency installed via npm. esbuild automatically handles dependencies installed in the assets directory.

```javascript
import topbar from "topbar"
```

--------------------------------

### Accessing Parameters and Session in LiveView Mount

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/welcome

Demonstrates how to access URL parameters and session data within the `mount` callback of a Phoenix LiveView. This is crucial for initializing LiveView state based on incoming requests.

```elixir
def mount(%{"house" => house}, _session, socket) do
  temperature = Thermostat.get_house_reading(house)
  {:ok, assign(socket, :temperature, temperature)}
end
```

```elixir
def mount(_params, %{"current_user_id" => user_id}, socket) do
  temperature = Thermostat.get_user_reading(user_id)
  {:ok, assign(socket, :temperature, temperature)}
end
```

```elixir
def mount(%{"house" => house}, %{"current_user_id" => user_id}, socket) do
  temperature = Thermostat.get_house_house_reading(user_id, house)
  {:ok, assign(socket, :temperature, temperature)}
end
```

--------------------------------

### Phoenix Channels Custom Event Handler Example (Elixir)

Source: https://hexdocs.pm/phoenix/1.7.17/writing_a_channels_client

An Elixir server-side example demonstrating how to handle a custom incoming event 'report_emergency' on a channel. It defines the 'handle_in' function which processes the payload and returns a reply.

```elixir
def handle_in("report_emergency", payload, socket) do
  MyApp.Emergencies.report(payload) # or whatever
  {:reply, :ok, socket}
end
```

--------------------------------

### Phoenix.Tracker.update/5 Example Usage (Map)

Source: https://hexdocs.pm/phoenix/_pubsub/Phoenix

Demonstrates updating a presence's metadata by providing a new map of key-value pairs. This example shows how to attach a new stat to the presence associated with a given topic and key.

```elixir
iex> Phoenix.Tracker.update(MyTracker, self(), "lobby", u.id, %{stat: "zzz"})
{:ok, "1WpAofWYIAA="}
```

--------------------------------

### live(conn, path_or_opts)

Source: https://hexdocs.pm/phoenix/_live_view/0.10.0/Phoenix

Spawns a connected LiveView process. It can accept a Plug.Conn and a path, or just options for spawning.

```APIDOC
## POST /live

### Description
Spawns a connected LiveView process. It can accept a previously rendered `%Plug.Conn{}` or an unsent `%Plug.Conn{}` for convenience. Options can also be provided.

### Method
POST

### Endpoint
/live

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
- **conn** (%Plug.Conn{}) - Required - The Plug Connection object.
- **path_or_opts** (string | map) - Required - Either the path string for the LiveView or a map of options.
  - **connect_params** (map) - Optional - A map of params available in the socket-connected mount.

### Request Example
```json
{
  "conn": {}, 
  "path_or_opts": "/path"
}
```

### Response
#### Success Response (200)
- **view** (LiveView) - The spawned LiveView process.
- **html** (string) - The rendered HTML of the LiveView.

#### Response Example
```json
{
  "view": "<LiveViewProcess>",
  "html": "<html>...</html>"
}
```

#### Error Response (e.g., 500)
- **error** (map) - Contains error details, potentially with a redirect map.

#### Error Response Example
```json
{
  "error": {
    "redirect": {
      "to": "/somewhere"
    }
  }
}
```
```

--------------------------------

### Install esbuild and Phoenix Packages with Yarn

Source: https://hexdocs.pm/phoenix/1.7.14/asset_management

Installs the esbuild npm package and Phoenix JavaScript packages as development dependencies using Yarn. This is an alternative to npm for managing Node.js packages.

```bash
$ yarn add --dev esbuild
$ yarn add ../deps/phoenix ../deps/phoenix_html ../deps/phoenix_live_view
```

--------------------------------

### Create Phoenix Project (Windows PowerShell)

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/contexts

Command to create a new Phoenix project named 'hello' on Windows systems using curl in PowerShell.

```powershell
curl.exe -fsSO https://new.phoenixframework.org/hello.bat; .\hello.bat
```

--------------------------------

### Configure PubSub Child Specification (Elixir)

Source: https://hexdocs.pm/phoenix/_pubsub/index

Generates a child specification for starting a PubSub process within a Supervisor. The `child_spec/1` function requires at least a `:name` option and can take an `:adapter` and `:pool_size` to configure the pubsub instance.

```Elixir
alias Phoenix.PubSub

# Basic child spec for a pubsub named :my_pubsub
PubSub.child_spec(name: :my_pubsub)

# Child spec with a custom adapter and pool size
PubSub.child_spec(name: :my_pubsub, adapter: Phoenix.PubSub.PG2, pool_size: 10)
```

--------------------------------

### Compiling Dependencies and Assets for Production

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/releases

Installs production dependencies, compiles the Elixir code, and deploys assets for a Phoenix application. These commands ensure that the application is optimized and ready for a production environment.

```shell
# Initial setup
echo "$ " mix deps.get --only prod
echo "$ " MIX_ENV=prod mix compile

# Compile assets
echo "$ " MIX_ENV=prod mix assets.deploy
```

--------------------------------

### Phoenix Channels Standard Leave Event Example

Source: https://hexdocs.pm/phoenix/1.7.17/writing_a_channels_client

An example of a client message to leave a channel. It uses the standard 'phx_leave' event with null join reference, a message reference, topic name, and an empty payload.

```plaintext
[null, "1", "miami:weather", "phx_leave", {}]
```

--------------------------------

### Combining Parameters and Session in LiveView Mount

Source: https://hexdocs.pm/phoenix/_live_view/index

Illustrates how to simultaneously access both URL parameters (e.g., 'house') and session data (e.g., 'current_user_id') in the `mount` callback for context-aware data fetching. Assumes a `Thermostat` module is available.

```elixir
def mount(%{"house" => house}, %{"current_user_id" => user_id}, socket) do
  temperature = Thermostat.get_house_reading(user_id, house)
  {:ok, assign(socket, :temperature, temperature)}
end
```

--------------------------------

### HEEx Template Example

Source: https://hexdocs.pm/phoenix/1.7.14/components

A basic HEEx template showing how to embed dynamic content using the `<%= ... %>` interpolation syntax. This specific example displays a greeting message using the '@messenger' assigns variable.

```html
<section>
  <h2>Hello World, from <%= @messenger %>!</h2>
</section>
```

--------------------------------

### Phoenix Controller Example - Index Action

Source: https://hexdocs.pm/phoenix/1.7.14/controllers

Demonstrates modifying a Phoenix controller to use an 'index' action instead of 'home'. This action renders a template named 'index'.

```elixir
defmodule HelloWeb.PageController do
  ...

  def index(conn, _params) do
    render(conn, :index)
  end
end
```

--------------------------------

### Phoenix VerifiedRoutes Usage Example

Source: https://hexdocs.pm/phoenix/1.7.17/Phoenix

Demonstrates how to use Phoenix.VerifiedRoutes with router, endpoint, and static directory options. This is typically placed in an application's router or endpoint module to enable route verification.

```elixir
use Phoenix.VerifiedRoutes,
  router: AppWeb.Router,
  endpoint: AppWeb.Endpoint,
  statics: ~w(images)
```

--------------------------------

### Dockerfile for Building Elixir Releases

Source: https://hexdocs.pm/phoenix/1.7.14/releases

This Dockerfile defines the build process for an Elixir release, utilizing multi-stage builds. It first sets up a build environment with necessary dependencies, compiles the Elixir project, and then creates a minimal runtime image containing only the release artifacts. It specifies Elixir, Erlang, and Debian versions.

```dockerfile
# Find eligible builder and runner images on Docker Hub. We use Ubuntu/Debian
# instead of Alpine to avoid DNS resolution issues in production.
#
# https://hub.docker.com/r/hexpm/elixir/tags?page=1&name=ubuntu
# https://hub.docker.com/_/ubuntu?tab=tags
#
# This file is based on these images:
#
#   - https://hub.docker.com/r/hexpm/elixir/tags - for the build image
#   - https://hub.docker.com/_/debian?tab=tags&page=1&name=bullseye-20230612-slim - for the release image
#   - https://pkgs.org/ - resource for finding needed packages
#   - Ex: hexpm/elixir:1.14.5-erlang-25.3.2.4-debian-bullseye-20230612-slim
#
ARG ELIXIR_VERSION=1.14.5
ARG OTP_VERSION=25.3.2.4
ARG DEBIAN_VERSION=bullseye-20230612-slim

ARG BUILDER_IMAGE="hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"
ARG RUNNER_IMAGE="debian:${DEBIAN_VERSION}"

FROM ${BUILDER_IMAGE} as builder

# install build dependencies
RUN apt-get update -y && apt-get install -y build-essential git \
    && apt-get clean && rm -f /var/lib/apt/lists/*_*

# prepare build dir
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ENV MIX_ENV="prod"

# install mix dependencies
COPY mix.exs mix.lock ./
RUN mix deps.get --only $MIX_ENV
RUN mkdir config

# copy compile-time config files before we compile dependencies
# to ensure any relevant config change will trigger the dependencies
# to be re-compiled.
COPY config/config.exs config/${MIX_ENV}.exs config/
RUN mix deps.compile

COPY priv priv

COPY lib lib

COPY assets assets

# compile assets
RUN mix assets.deploy

# Compile the release
RUN mix compile

# Changes to config/runtime.exs don't require recompiling the code
COPY config/runtime.exs config/

COPY rel rel
RUN mix release

# start a new build stage so that the final image will only contain
# the compiled release and other runtime necessities
FROM ${RUNNER_IMAGE}

RUN apt-get update -y && \
  apt-get install -y libstdc++6 openssl libncurses5 locales ca-certificates \
  && apt-get clean && rm -f /var/lib/apt/lists/*_*

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR "/app"
RUN chown nobody /app

# set runner ENV
ENV MIX_ENV="prod"

```

--------------------------------

### Phoenix New App with MySQL Database

Source: https://hexdocs.pm/phoenix/1.7.17/ecto

Creates a new Phoenix application configured to use MySQL instead of the default PostgreSQL. This command automatically sets up the necessary dependencies and configuration files for MySQL integration.

```bash
$ mix phx.new hello_phoenix --database mysql
copy
```

--------------------------------

### Phoenix LiveComponent Handle Event Start Event

Source: https://hexdocs.pm/phoenix/_live_view/telemetry

This event signals the start of a `Phoenix.LiveComponent`'s `handle_event/3` callback. It is dispatched immediately before the callback is invoked. The metadata includes the socket, component identifier, event name, and parameters. The measurement is the system time.

```elixir
[:phoenix, :live_component, :handle_event, :start]

# Metadata:
%{ socket: Phoenix.LiveView.Socket.t,
  component: atom,
  event: String.t(),
  params: unsigned_params}

# Measurement:
%{system_time: System.monotonic_time}
```

--------------------------------

### Heroku Compilation Error Example

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/heroku

This is an example of a compilation error that may occur on Heroku, even if the application compiles locally. It typically indicates issues with dependency compilation and suggests commands to recompile, update, or clean dependencies.

```log
remote: == Compilation error on file lib/postgrex/connection.ex ==
remote: could not compile dependency :postgrex, "mix compile" failed. You can recompile this dependency with "mix deps.compile postgrex", update it with "mix deps.update postgrex" or clean it with "mix deps.clean postgrex"
remote: ** (CompileError) lib/postgrex/connection.ex:207: Postgrex.Connection.__struct__/0 is undefined, cannot expand struct Postgrex.Connection
remote:     (elixir) src/elixir_map.erl:58: :elixir_map.translate_struct/4
remote:     (stdlib) lists.erl:1353: :lists.mapfoldl/3
remote:     (stdlib) lists.erl:1354: :lists.mapfoldl/3
remote:
remote:
remote:  !     Push rejected, failed to compile elixir app
remote:
remote: Verifying deploy...
remote:
remote: !   Push rejected to mysterious-meadow-6277.
remote:
To https://git.heroku.com/mysterious-meadow-6277.git
```

--------------------------------

### Import Third-Party JS Package (npm)

Source: https://hexdocs.pm/phoenix/1.7.17/asset_management

Imports a JavaScript dependency installed via npm. esbuild automatically handles picking up packages installed in the 'assets' directory.

```javascript
import topbar from "topbar"

```

--------------------------------

### Phoenix LiveView Client Hook Integration

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/html-attrs

Illustrates the use of `phx-hook` to integrate custom JavaScript logic with LiveView. The example defines an 'Example' hook with lifecycle callbacks and demonstrates how to append events to a list.

```html
<div id="example" phx-hook="Example">
  <h1>Events</h1>
  <ul id="example-events"></ul>
</div>
```

--------------------------------

### Do Not Submit :get Method in Buttons as Post in Phoenix.HTML

Source: https://hexdocs.pm/phoenix/_html/4.1.1/changelog

A bug fix in Phoenix.HTML prevents buttons with `method: :get` from being submitted as `post`, ensuring correct HTTP method handling for form submissions.

```elixir
  * Do not submit `method: :get` in buttons as "post"
```

--------------------------------

### Phoenix Tracker - init

Source: https://hexdocs.pm/phoenix/_pubsub/1.1.2/Phoenix

Callback invoked during the startup of the supervisor and also during hot code upgrades. This function is part of the supervision tree setup.

```APIDOC
## POST /tracker/init

### Description
Callback invoked to start the supervisor and during hot code upgrades.

### Method
POST

### Endpoint
/tracker/init

### Parameters
#### Request Body
- **init_arg** (list) - Required - The argument passed to the init callback.

### Response
#### Success Response (200)
- **result** (term) - The result of the init callback, typically from `Supervisor.init/2`.

#### Response Example
```json
{
  "result": "supervisor_spec"
}
```
```

--------------------------------

### Phoenix Controller: Action Fallback Controller Example

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/testing_controllers

An example of an Action Fallback controller in Phoenix. It defines how to handle error tuples returned from controller actions. The first clause handles {:error, changeset} by returning a 422 status and rendering an error JSON. The second clause handles {:error, :not_found} by returning a 404 status.

```elixir
defmodule HelloWeb.FallbackController do
  use HelloWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(json: HelloWeb.ChangesetJSON)
    |> render(:error, changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(html: HelloWeb.ErrorHTML, json: HelloWeb.ErrorJSON)
    |> render( :"404")
  end
end
```

--------------------------------

### Phoenix Channel Standard Events Examples

Source: https://hexdocs.pm/phoenix/writing_a_channels_client

Demonstrates how to format messages for standard Phoenix Channel events: 'phx_join' to join a channel, 'phx_leave' to leave a channel, and 'heartbeat' to maintain the connection.

```elixir
["0", "0", "miami:weather", "phx_join", {"some": "param"}]
```

```elixir
[null, "1", "miami:weather", "phx_leave", {}]
```

```elixir
[null, "2", "phoenix", "heartbeat", {}]
```

--------------------------------

### Phoenix Catalog Context: Listing Products

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/your_first_context

This Elixir module defines the Catalog context, serving as the public API for product catalog functionality. The `list_products/0` function demonstrates how to fetch all products from the database using Ecto's `Repo.all/1`. It abstracts the data fetching details from the controllers.

```elixir
defmodule Hello.Catalog do
  @moduledoc """
The Catalog context.
"""

  import Ecto.Query, warn: false
  alias Hello.Repo

  alias Hello.Catalog.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end
  ...
```

--------------------------------

### Update `mix.exs` for LiveView v1.1

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Modifications needed in the `mix.exs` file to include `phoenix_live_view` and `lazy_html` dependencies, and to add `phoenix_live_view` to the list of compilers.

```elixir
 {:phoenix_live_view, "~> 1.1"},
 {:lazy_html, ">= 0.0.0", only: :test},
```

```elixir
compilers: [:phoenix_live_view] ++ Mix.compilers(),
```

--------------------------------

### Create New Phoenix App (Mix)

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/fly

Generates a new Phoenix application using the mix build tool. This is a prerequisite for deploying to Fly.io.

```bash
$ mix phx.new my_app

```

--------------------------------

### Phoenix Channel Communication Example (JavaScript)

Source: https://hexdocs.pm/phoenix/js/index

Demonstrates how to join a Phoenix channel, listen for 'new_msg' events, push messages to the server with acknowledgments for success, failure, and timeouts. It also shows how to handle join success, failure, and timeouts.

```javascript
let channel = socket.channel("room:123", {token: roomToken})
channel.on("new_msg", msg => console.log("Got message", msg) )
$input.onEnter( e => {
  channel.push("new_msg", {body: e.target.val}, 10000)
    .receive("ok", (msg) => console.log("created message", msg) )
    .receive("error", (reasons) => console.log("create failed", reasons) )
    .receive("timeout", () => console.log("Networking issue...") )
})

channel.join()
  .receive("ok", ({messages}) => console.log("catching up", messages) )
  .receive("error", ({reason}) => console.log("failed join", reason) )
  .receive("timeout", () => console.log("Networking issue. Still waiting..."))

```

--------------------------------

### Phoenix.PubSub - Utility Functions

Source: https://hexdocs.pm/phoenix/_pubsub/2.1.3/Phoenix

Documentation for utility functions like getting the node name and creating child specifications.

```APIDOC
## UTILITY FUNCTIONS

### `child_spec/1`

Returns a child specification for pubsub with the given options.

*   **Module**: `Phoenix.PubSub`
*   **Function**: `child_spec/1`
*   **Signature**: `(options) :: Supervisor.child_spec()`
*   **Parameters**:
    *   `options` (keyword()): Configuration options for the PubSub child spec, e.g., `name`, `adapter`, `strategy`.
*   **Returns**: A supervisor child specification map.

### `node_name/1`

Returns the node name of the PubSub server.

*   **Module**: `Phoenix.PubSub`
*   **Function**: `node_name/1`
*   **Signature**: `(pubsub) :: node_name()`
*   **Parameters**:
    *   `pubsub` (t()): The PubSub server name.
*   **Returns**: The atom or binary representing the node name.
```

--------------------------------

### Elixir Application Children Definition

Source: https://hexdocs.pm/phoenix/1.7.14/directory_structure

This snippet from `lib/hello/application.ex` defines the child processes that are part of the Phoenix application. It lists services like telemetry, the database repository, a PubSub system, and the web endpoint, specifying their startup order.

```elixir
children = [
  HelloWeb.Telemetry,
  Hello.Repo,
  {Phoenix.PubSub, name: Hello.PubSub},
  HelloWeb.Endpoint
]

```

--------------------------------

### Create Cart Controller in Elixir

Source: https://hexdocs.pm/phoenix/1.7.14/contexts

Defines the `HelloWeb.CartController` module to handle the GET /cart route. It renders the 'show.html' template and prepares a changeset for the cart using `ShoppingCart.change_cart/1`. This relies on the `fetch_current_cart` plug being defined in the router.

```elixir
defmodule HelloWeb.CartController do
  use HelloWeb, :controller

  alias Hello.ShoppingCart

  def show(conn, _params) do
    render(conn, :show, changeset: ShoppingCart.change_cart(conn.assigns.cart))
  end
end
```

--------------------------------

### Running ExUnit Tests with Tags

Source: https://hexdocs.pm/phoenix/testing

Demonstrates how to use the `mix test` command with the `--only` flag to execute tests that have a specific tag. It shows examples of running tests with a simple atom tag and with a tag that has an assigned value. ExUnit provides output indicating included and excluded tags.

```bash
$ mix test --only error_view_case
Including tags: [:error_view_case]
Excluding tags: [:test]

...

Finished in 0.1 seconds
5 tests, 0 failures, 3 excluded

Randomized with seed 125659
```

```bash
$ mix test --only error_view_case:true
Including tags: [error_view_case: "true"]
Excluding tags: [:test]

...

Finished in 0.1 seconds
5 tests, 0 failures, 3 excluded

Randomized with seed 833356
```

```bash
$ mix test --only error_view_case:false
Including tags: [error_view_case: "false"]
Excluding tags: [:test]



Finished in 0.1 seconds
5 tests, 0 failures, 5 excluded

Randomized with seed 622422
The --only option was given to "mix test" but no test executed
```

--------------------------------

### Generating Phoenix Release Configuration

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/releases

Generates the necessary files and scripts for a Phoenix application release using `mix phx.gen.release`. This includes overlay scripts for starting the server and running migrations, as well as a release configuration file.

```shell
echo "$ " mix phx.gen.release
==> my_app
* creating rel/overlays/bin/server
* creating rel/overlays/bin/server.bat
* creating rel/overlays/bin/migrate
* creating rel/overlays/bin/migrate.bat
* creating lib/my_app/release.ex
```

--------------------------------

### Selective Resource Routes with :only

Source: https://hexdocs.pm/phoenix/routing

Demonstrates how to use the `:only` option with the `resources` macro to specify a subset of actions for a resource, using '/posts' as an example.

```APIDOC
## GET /posts

### Description
Retrieves a list of all posts.

### Method
GET

### Endpoint
/posts

### Parameters

### Request Example
(No request body for GET requests)

### Response
#### Success Response (200)
- **posts** (array) - A list of post objects.

#### Response Example
```json
{
  "posts": [
    {
      "id": 1,
      "title": "First Post"
    }
  ]
}
```

## GET /posts/:id

### Description
Retrieves a specific post by ID.

### Method
GET

### Endpoint
/posts/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the post.

### Request Example
(No request body for GET requests)

### Response
#### Success Response (200)
- **post** (object) - The requested post object.

#### Response Example
```json
{
  "post": {
    "id": 1,
    "title": "First Post"
  }
}
```
```

--------------------------------

### Get controller info for a specific URL

Source: https://hexdocs.pm/phoenix/1.7.14/Mix.Tasks.Phx

This command uses the `--info` option to locate and display the controller module, function, and file path responsible for handling a given URL. It defaults to the GET HTTP method.

```bash
$ mix phx.routes --info http://0.0.0.0:4000/home
```

--------------------------------

### Phoenix Channels Custom Event Message Example

Source: https://hexdocs.pm/phoenix/1.7.17/writing_a_channels_client

An example of a client message to trigger a custom event on a Phoenix Channel. It includes a message reference, topic name, the custom event name 'report_emergency', and a payload.

```plaintext
[null, "3", "miami:weather", "report_emergency", {"category": "sharknado"}]
```

--------------------------------

### Database Repository Interface (Ecto)

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/directory_structure

Defines the `Hello.Repo` module using Ecto, the database wrapper for Elixir. This module acts as the main interface for database interactions, configured to use the specified OTP app name and the PostgreSQL adapter.

```elixir
defmodule Hello.Repo do
  use Ecto.Repo,
    otp_app: :hello,
    adapter: Ecto.Adapters.Postgres
end
```

--------------------------------

### Phoenix.PubSub Overview

Source: https://hexdocs.pm/phoenix/_pubsub

Phoenix.PubSub is a real-time Publisher/Subscriber service. It can be started directly in your supervision tree and used to subscribe to and broadcast messages across a cluster.

```APIDOC
## Phoenix.PubSub Module

### Description

Realtime Publisher/Subscriber service. Allows for subscribing to topics and broadcasting messages across a cluster.

### Getting Started

To start Phoenix.PubSub, include it in your supervision tree:

```elixir
{Phoenix.PubSub, name: :my_pubsub}
```

### Basic Usage Example

```elixir
alias Phoenix.PubSub

# Subscribe to a topic
PubSub.subscribe(:my_pubsub, "user:123")

# Broadcast a message
PubSub.broadcast(:my_pubsub, "user:123", {:user_update, %{id: 123, name: "Shane"}})
```

### Adapters

Phoenix.PubSub supports multiple backends:

*   **`Phoenix.PubSub.PG2`**: The default adapter using Distributed Elixir.
*   **`Phoenix.PubSub.Redis`**: Uses Redis for inter-server communication (requires `:phoenix_pubsub_redis` dependency).

Custom adapters can be implemented by following `Phoenix.PubSub.Adapter`.
```

--------------------------------

### Configure Phoenix Database Repository (Elixir)

Source: https://hexdocs.pm/phoenix/1.7.14/ecto

Defines the `Hello.Repo` module, specifying the application name and database adapter (PostgreSQL in this case). It also includes configuration for database credentials and connection pooling.

```elixir
defmodule Hello.Repo do
  use Ecto.Repo,
    otp_app: :hello,
    adapter: Ecto.Adapters.Postgres
end
```

```elixir
config :hello, Hello.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "hello_dev",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
```

--------------------------------

### User Management API

Source: https://hexdocs.pm/phoenix/1.7.17/routing

Endpoints for managing users, including listing, creating, retrieving, updating, and deleting users.

```APIDOC
## GET /admin/users

### Description
Retrieves a list of all users.

### Method
GET

### Endpoint
/admin/users

### Response
#### Success Response (200)
- **users** (array) - A list of user objects.

#### Response Example
```json
{
  "example": {
    "users": [
      { "id": "1", "name": "John Doe" },
      { "id": "2", "name": "Jane Smith" }
    ]
  }
}
```

## GET /admin/users/:id/edit

### Description
Retrieves the form to edit a specific user identified by its ID.

### Method
GET

### Endpoint
/admin/users/:id/edit

### Parameters
#### Path Parameters
- **id** (string) - Required - The unique identifier of the user to edit.

### Response
#### Success Response (200)
- **user_form** (object) - Contains fields for editing a user.

#### Response Example
```json
{
  "example": {
    "user_form": {
      "name": "John Doe",
      "email": "john.doe@example.com"
    }
  }
}
```

## GET /admin/users/new

### Description
Retrieves the form to create a new user.

### Method
GET

### Endpoint
/admin/users/new

### Response
#### Success Response (200)
- **user_form** (object) - Contains fields for creating a new user.

#### Response Example
```json
{
  "example": {
    "user_form": {
      "name": "",
      "email": ""
    }
  }
}
```

## GET /admin/users/:id

### Description
Retrieves details of a specific user identified by its ID.

### Method
GET

### Endpoint
/admin/users/:id

### Parameters
#### Path Parameters
- **id** (string) - Required - The unique identifier of the user to retrieve.

### Response
#### Success Response (200)
- **user** (object) - Contains details of the user.

#### Response Example
```json
{
  "example": {
    "user": {
      "id": "1",
      "name": "John Doe",
      "email": "john.doe@example.com"
    }
  }
}
```

## POST /admin/users

### Description
Creates a new user.

### Method
POST

### Endpoint
/admin/users

### Parameters
#### Request Body
- **name** (string) - Required - The name of the new user.
- **email** (string) - Required - The email of the new user.

### Request Example
```json
{
  "example": {
    "name": "Jane Doe",
    "email": "jane.doe@example.com"
  }
}
```

### Response
#### Success Response (200)
- **message** (string) - Indicates successful creation.
- **user_id** (string) - The ID of the newly created user.

#### Response Example
```json
{
  "example": {
    "message": "User created successfully.",
    "user_id": "3"
  }
}
```

## PATCH /admin/users/:id

### Description
Partially updates a specific user identified by its ID.

### Method
PATCH

### Endpoint
/admin/users/:id

### Parameters
#### Path Parameters
- **id** (string) - Required - The unique identifier of the user to update.
#### Request Body
- **name** (string) - Optional - The updated name of the user.
- **email** (string) - Optional - The updated email of the user.

### Request Example
```json
{
  "example": {
    "name": "Johnathan Doe"
  }
}
```

### Response
#### Success Response (200)
- **message** (string) - Indicates successful update.

#### Response Example
```json
{
  "example": {
    "message": "User updated successfully."
  }
}
```

## PUT /admin/users/:id

### Description
Updates a specific user identified by its ID.

### Method
PUT

### Endpoint
/admin/users/:id

### Parameters
#### Path Parameters
- **id** (string) - Required - The unique identifier of the user to update.
#### Request Body
- **name** (string) - Required - The updated name of the user.
- **email** (string) - Required - The updated email of the user.

### Request Example
```json
{
  "example": {
    "name": "John Doe",
    "email": "john.doe.updated@example.com"
  }
}
```

### Response
#### Success Response (200)
- **message** (string) - Indicates successful update.

#### Response Example
```json
{
  "example": {
    "message": "User updated successfully."
  }
}
```

## DELETE /admin/users/:id

### Description
Deletes a specific user identified by its ID.

### Method
DELETE

### Endpoint
/admin/users/:id

### Parameters
#### Path Parameters
- **id** (string) - Required - The unique identifier of the user to delete.

### Request Example
```json
{
  "example": "DELETE /admin/users/1"
}
```

### Response
#### Success Response (200)
- **message** (string) - Indicates successful deletion.

#### Response Example
```json
{
  "example": {
    "message": "User deleted successfully."
  }
}
```
```

--------------------------------

### LiveView Render Component Router Option

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Allows the `:router` option to be given to `render_component`. This provides more flexibility in component rendering.

```elixir
Allow `:router` to be given to `render_component`
```

--------------------------------

### Provision Gigalixir Database

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/gigalixir

Commands to provision a PostgreSQL database for the Gigalixir application. Includes options for a free tier database and a production-ready database after upgrading the account.

```bash
# For a free database
gigalixir pg:create --free

# For a production ready database
gigalixir account:upgrade
gigalixir pg:create
```

--------------------------------

### LiveView Compatibility with Plug

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Ensures compatibility with the latest version of Plug. This is important for the underlying web server integration.

```elixir
Fix compatibility with latest Plug
```

--------------------------------

### Deploy Phoenix Application to Gigalixir

Source: https://hexdocs.pm/phoenix/1.7.14/gigalixir

Deploys the Phoenix application to Gigalixir using `git push`. It includes commands to check the deployment status, run database migrations, view logs, and open the application.

```bash
git push gigalixir
gigalixir ps
gigalixir run mix ecto.migrate
gigalixir logs
gigalixir open
```

--------------------------------

### Phoenix Channels Standard Heartbeat Event Example

Source: https://hexdocs.pm/phoenix/1.7.17/writing_a_channels_client

An example of a client message to send a heartbeat to maintain the WebSocket connection. It uses the 'heartbeat' event with null join reference, a message reference, the 'phoenix' topic, and an empty payload.

```plaintext
[null, "2", "phoenix", "heartbeat", {}]
```

--------------------------------

### Implement Phoenix.Tracker Behaviour - Elixir

Source: https://hexdocs.pm/phoenix/_pubsub/Phoenix

Demonstrates the implementation of the Phoenix.Tracker behaviour in Elixir. It includes the required `start_link/1`, `init/1`, and `handle_diff/2` callbacks to manage presence joins and leaves, broadcasting them via Phoenix.PubSub. This example shows how to initialize the tracker state and process presence diffs.

```elixir
defmodule MyTracker do
  use Phoenix.Tracker

  def start_link(opts) do
    opts = Keyword.merge([name: __MODULE__], opts)
    Phoenix.Tracker.start_link(__MODULE__, opts, opts)
  end

  def init(opts) do
    server = Keyword.fetch!(opts, :pubsub_server)
    {:ok, %{pubsub_server: server, node_name: Phoenix.PubSub.node_name(server)}}
  end

  def handle_diff(diff, state) do
    for {topic, {joins, leaves}} <- diff do
      for {key, meta} <- joins do
        IO.puts "presence join: key \"#{key}\" with meta #{inspect meta}"
        msg = {:join, key, meta}
        Phoenix.PubSub.direct_broadcast!(state.node_name, state.pubsub_server, topic, msg)
      end
      for {key, meta} <- leaves do
        IO.puts "presence leave: key \"#{key}\" with meta #{inspect meta}"
        msg = {:leave, key, meta}
        Phoenix.PubSub.direct_broadcast!(state.node_name, state.pubsub_server, topic, msg)
      end
    end
    {:ok, state}
  end
end
```

--------------------------------

### Mix Task Requiring Application Start

Source: https://hexdocs.pm/phoenix/1.7.14/mix_tasks

Modifies a Mix task to ensure the application's infrastructure, such as the database (`Repo`), is started before the task runs. This is achieved using the `@requirements` module attribute, setting it to `["app.start"]`.

```elixir
  @requirements ["app.start"]

  @impl Mix.Task
  def run(_args) do
    Mix.shell().info("Now I have access to Repo and other goodies!")
    Mix.shell().info("Greetings from the Hello Phoenix Application!")
  end
```

--------------------------------

### Forwarding Requests with Pipelines in Phoenix

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Shows how to combine the `forward/4` macro with authentication and authorization pipelines. This ensures that specific routes are protected by predefined plugs before reaching the target plug.

```elixir
defmodule HelloWeb.Router do
  use HelloWeb, :router

  ...

  scope "/" do
    pipe_through [:authenticate_user, :ensure_admin]
    forward "/jobs", BackgroundJob.Plug
  end
end
```

--------------------------------

### Create Heroku Application with Elixir Buildpack

Source: https://hexdocs.pm/phoenix/1.7.17/heroku

This command initializes a new Heroku application and sets the Elixir buildpack. Ensure you have the Heroku CLI installed and are logged in. The output will provide the application URL and Git remote.

```bash
heroku create --buildpack hashnuke/elixir
```

--------------------------------

### User Resources API

Source: https://hexdocs.pm/phoenix/1.7.17/routing

Defines a set of standard RESTful routes for a UserController, supporting index, show, new, create, edit, update, and delete actions.

```APIDOC
## Resources: /users

### Description
This resource provides standard CRUD operations for users. It maps HTTP methods and paths to controller actions.

### Method
- GET
- POST
- PATCH
- PUT
- DELETE

### Endpoint
- `/users`
- `/users/:id`
- `/users/:id/edit`
- `/users/new`

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier for a user.

#### Query Parameters
None

#### Request Body
- **user** (object) - Required - Contains user data for create or update operations.
  - **name** (string) - Optional - The name of the user.
  - **email** (string) - Optional - The email address of the user.

### Request Example
#### POST /users
```json
{
  "user": {
    "name": "John Doe",
    "email": "john.doe@example.com"
  }
}
```

### Response
#### Success Response (200)
- **user** (object) - The user object.
  - **id** (integer) - The unique identifier for the user.
  - **name** (string) - The name of the user.
  - **email** (string) - The email address of the user.

#### Response Example
```json
{
  "user": {
    "id": 1,
    "name": "John Doe",
    "email": "john.doe@example.com"
  }
}
```
```

--------------------------------

### Implement Ecto Migrations for Orders and Line Items

Source: https://hexdocs.pm/phoenix/1.7.14/contexts

These are the output logs from running `mix ecto.migrate`, showing the creation of `orders` and `order_line_items` tables, along with necessary indexes. This confirms the database schema changes have been successfully applied.

```shell
$ mix ecto.migrate

17:14:37.715 [info] == Running 20210209214612 Hello.Repo.Migrations.CreateOrders.change/0 forward

17:14:37.720 [info] create table orders

17:14:37.755 [info] == Migrated 20210209214612 in 0.0s

17:14:37.784 [info] == Running 20210209215050 Hello.Repo.Migrations.CreateOrderLineItems.change/0 forward

17:14:37.785 [info] create table order_line_items

17:14:37.795 [info] create index order_line_items_order_id_index

17:14:37.796 [info] create index order_line_items_product_id_index

17:14:37.798 [info] == Migrated 20210209215050 in 0.0s
```

--------------------------------

### Elixir: S3 CORS Configuration Example

Source: https://hexdocs.pm/phoenix/_live_view/external-uploads

An example Cross-Origin Resource Sharing (CORS) configuration for an S3 bucket. This configuration allows PUT and POST requests from any origin, which is necessary for direct browser uploads. It's recommended to restrict `AllowedOrigins` to your specific domain in production.

```json
[
    {
        "AllowedHeaders": [ "*" ],
        "AllowedMethods": [ "PUT", "POST" ],
        "AllowedOrigins": [ "*" ],
        "ExposeHeaders": []
    }
]
```

--------------------------------

### Phoenix Catalog Context: Creating a Product

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/your_first_context

This Elixir function within the Catalog context is responsible for creating a new product. It takes attributes as input and attempts to create a product using `Repo.insert/1`. It returns `{:ok, %Product{}}` on success or `{:error, %Ecto.Changeset{}}` if validation fails. The `attrs \ %{}` syntax provides a default empty map for attributes.

```elixir
  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \ %{}) do
    %Product{} \
    |> Repo.insert(attrs)
  end
```

--------------------------------

### Compile Application Assets

Source: https://hexdocs.pm/phoenix/deployment

Compiles your application's static assets, such as JavaScript and stylesheets, using `esbuild` by default. This task also generates digests and a cache manifest for efficient asset serving in production.

```shell
$ MIX_ENV=prod mix assets.deploy
Check your digested files at "priv/static".

```

--------------------------------

### Admin Reviews API

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Endpoints for managing reviews within the admin interface.

```APIDOC
## PUT /admin/reviews/:id

### Description
Updates a specific review by its ID.

### Method
PUT

### Endpoint
/admin/reviews/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the review to update.

### Response
#### Success Response (200)
- **message** (string) - Indicates the review was successfully updated.

#### Response Example
{
  "message": "Review updated successfully"
}
```

```APIDOC
## DELETE /admin/reviews/:id

### Description
Deletes a specific review by its ID.

### Method
DELETE

### Endpoint
/admin/reviews/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the review to delete.

### Response
#### Success Response (200)
- **message** (string) - Indicates the review was successfully deleted.

#### Response Example
{
  "message": "Review deleted successfully"
}
```

--------------------------------

### Inspecting Routes with mix phx.routes

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Command-line tool to display all defined routes in a Phoenix application. It shows the HTTP verb, path, controller, and action for each route.

```bash
$ mix phx.routes
GET  /  HelloWeb.PageController :home
...
```

--------------------------------

### Heroku Connection Timeout Error Example

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/heroku

This example shows a connection timeout error encountered when running `heroku run`. It indicates that the internet provider might be blocking port 5000, and suggests using the `detached` option as a workaround.

```log
heroku run "POOL_SIZE=2 mix myapp.task"
Running POOL_SIZE=2 mix myapp.task on mysterious-meadow-6277... !
ETIMEDOUT: connect ETIMEDOUT 50.19.103.36:5000
```

--------------------------------

### Example of Running Mix Tests

Source: https://hexdocs.pm/phoenix/1.7.14/testing_controllers

A command to execute all tests within a Phoenix project. This command runs tests for controllers, models, contexts, and other components. The output shows the number of passing tests and failures, along with randomization details.

```bash
$ mix test
................

Finished in 0.6 seconds
35 tests, 0 failures

Randomized with seed 618478
```

--------------------------------

### Define Controller Plugs in Phoenix

Source: https://hexdocs.pm/phoenix/1.7.14/plug

This example demonstrates how to define plugs directly within a Phoenix controller. It shows a basic plug definition and then illustrates how to conditionally execute a plug only for specific controller actions, such as the `:index` action.

```elixir
defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug HelloWeb.Plugs.Locale, "en"
end
```

```elixir
defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug HelloWeb.Plugs.Locale, "en" when action in [:index]
```

--------------------------------

### Chain Pipelines in Phoenix Router

Source: https://hexdocs.pm/phoenix/1.7.17/routing

This code demonstrates chaining pipelines by defining an :auth pipeline that first pipes through the :browser pipeline, followed by custom authentication and authorization plugs.

```elixir
  pipeline :auth do
    plug :browser
    plug :ensure_authenticated_user
    plug :ensure_user_owns_review
  end

  scope "/reviews", HelloWeb do
    pipe_through :auth

    resources "/", ReviewController
  endcopy
```

--------------------------------

### LiveView Consume Uploaded Entries

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Runs `consume_uploaded_entries` in the LiveView caller process. This optimizes the handling of uploaded files.

```elixir
Run `consume_uploaded_entries` in LiveView caller process
```

--------------------------------

### Admin Users API

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Endpoints for managing users within the admin interface.

```APIDOC
## GET /admin/users

### Description
Retrieves a list of all users.

### Method
GET

### Endpoint
/admin/users

### Response
#### Success Response (200)
- **users** (array) - A list of user objects.
  - **id** (integer) - The user's unique identifier.
  - **username** (string) - The user's username.
  - **email** (string) - The user's email address.

#### Response Example
{
  "users": [
    {
      "id": 1,
      "username": "john_doe",
      "email": "john.doe@example.com"
    }
  ]
}
```

```APIDOC
## GET /admin/users/:id/edit

### Description
Renders a form to edit a specific user.

### Method
GET

### Endpoint
/admin/users/:id/edit

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the user to edit.

### Response
#### Success Response (200)
- **user_form** (object) - Contains data and fields for the user edit form.

#### Response Example
{
  "user_form": {
    "id": 1,
    "username": "john_doe",
    "email": "john.doe@example.com",
    "fields": [...] 
  }
}
```

```APIDOC
## GET /admin/users/new

### Description
Renders a form to create a new user.

### Method
GET

### Endpoint
/admin/users/new

### Response
#### Success Response (200)
- **user_form** (object) - Contains fields for creating a new user.

#### Response Example
{
  "user_form": {
    "fields": [...] 
  }
}
```

```APIDOC
## GET /admin/users/:id

### Description
Retrieves details of a specific user.

### Method
GET

### Endpoint
/admin/users/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the user.

### Response
#### Success Response (200)
- **user** (object) - The user object.
  - **id** (integer) - The user's unique identifier.
  - **username** (string) - The user's username.
  - **email** (string) - The user's email address.

#### Response Example
{
  "user": {
    "id": 1,
    "username": "john_doe",
    "email": "john.doe@example.com"
  }
}
```

```APIDOC
## POST /admin/users

### Description
Creates a new user.

### Method
POST

### Endpoint
/admin/users

### Parameters
#### Request Body
- **username** (string) - Required - The desired username for the new user.
- **email** (string) - Required - The email address for the new user.
- **password** (string) - Required - The password for the new user.

### Request Example
{
  "username": "new_user",
  "email": "new.user@example.com",
  "password": "securepassword123"
}

### Response
#### Success Response (200)
- **message** (string) - Indicates the user was successfully created.
- **user_id** (integer) - The ID of the newly created user.

#### Response Example
{
  "message": "User created successfully",
  "user_id": 2
}
```

```APIDOC
## PATCH /admin/users/:id

### Description
Partially updates a specific user's information.

### Method
PATCH

### Endpoint
/admin/users/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the user to update.
#### Request Body
- **email** (string) - Optional - The new email address for the user.
- **username** (string) - Optional - The new username for the user.

### Request Example
{
  "email": "updated.email@example.com"
}

### Response
#### Success Response (200)
- **message** (string) - Indicates the user was successfully updated.

#### Response Example
{
  "message": "User updated successfully"
}
```

```APIDOC
## PUT /admin/users/:id

### Description
Replaces a specific user's information with new data.

### Method
PUT

### Endpoint
/admin/users/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the user to update.
#### Request Body
- **username** (string) - Required - The new username for the user.
- **email** (string) - Required - The new email address for the user.

### Request Example
{
  "username": "complete_update_user",
  "email": "complete.update@example.com"
}

### Response
#### Success Response (200)
- **message** (string) - Indicates the user was successfully updated.

#### Response Example
{
  "message": "User updated successfully"
}
```

```APIDOC
## DELETE /admin/users/:id

### Description
Deletes a specific user by their ID.

### Method
DELETE

### Endpoint
/admin/users/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the user to delete.

### Response
#### Success Response (200)
- **message** (string) - Indicates the user was successfully deleted.

#### Response Example
{
  "message": "User deleted successfully"
}
```

--------------------------------

### Passing Options to Forwarded Plugs in Phoenix

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Demonstrates how to pass options as a third argument to the `forward/4` macro, allowing configuration of the forwarded plug. This enables dynamic settings, such as naming the application displayed in the forwarded interface.

```elixir
forward "/jobs", BackgroundJob.Plug, name: "Hello Phoenix"
```

--------------------------------

### Phoenix Catalog Context for Product Data Operations

Source: https://hexdocs.pm/phoenix/your_first_context

The `Catalog` context module provides the public API for product catalog functionality, abstracting data persistence details. It includes functions for listing and creating products, interacting with the `Repo` (Ecto repository). Dependencies include `Ecto.Query` and `Hello.Repo`.

```elixir
defmodule Hello.Catalog do
  @moduledoc """
  The Catalog context.
  """

  import Ecto.Query, warn: false
  alias Hello.Repo

  alias Hello.Catalog.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end
  ...
end
```

--------------------------------

### Setup Database for Authentication System

Source: https://hexdocs.pm/phoenix/1.7.14/mix_phx_gen_auth

This command sets up the database for your Phoenix application, including running migrations. It is essential for the authentication system to function correctly as it relies on database tables for user data. Verify database connection details in `config/` before running.

```bash
$ mix ecto.setup
```

--------------------------------

### Get Phoenix Plug Initialization Mode

Source: https://hexdocs.pm/phoenix/1.7.14/Phoenix

Returns the configured `:plug_init_mode` which dictates when Phoenix plugs are initialized. This setting impacts compilation times and runtime behavior.

```elixir
plug_init_mode()
```

--------------------------------

### init

Source: https://hexdocs.pm/phoenix/Phoenix.Socket

Initializes the socket state when the socket process starts.

```APIDOC
## init(state)

### Description
Initializes the socket state. This must be executed from the process that will effectively operate the socket.

### Method
`init/1`

### Parameters
#### Path Parameters
- **state** (any) - The initial state passed to the socket process.

### Request Example
(Not applicable, this is a callback)

### Response
#### Success Response
- **{:ok, state()}** - Returns the initialized state.
```

--------------------------------

### Phoenix Controller Configuration for Supported Formats

Source: https://hexdocs.pm/phoenix/1.7.17/controllers

Demonstrates how to configure a Phoenix application to support multiple response formats, specifically HTML and JSON, within the controller quote.

```elixir
def controller do
  quote do
    use Phoenix.Controller,
      formats: [:html, :json],
      layouts: [html: HelloWeb.Layouts]
    ...
  end
end
```

--------------------------------

### Deprecate preload/1 in LiveComponent for update_many/1 in LiveView

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This deprecation guides developers to migrate from `preload/1` within LiveComponents to the more versatile `update_many/1` function. `update_many/1` offers improved capabilities for updating multiple components efficiently, enhancing performance and simplifying component management.

```elixir
# Old syntax (deprecated)
preload(:my_component)

# New syntax (recommended)
update_many([my_component: %{}])
```

--------------------------------

### Phoenix Controller Test Example

Source: https://hexdocs.pm/phoenix/1.7.14/testing

Demonstrates a basic test for a Phoenix controller, specifically for the root path. It uses `HelloWeb.ConnCase` for controller testing utilities and asserts that an HTML response with a 200 status code contains specific text. Requires a Phoenix project with `HelloWeb.ConnCase` configured.

```elixir
defmodule HelloWeb.PageControllerTest do
  use HelloWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Peace of mind from prototype to production"
  end
end
```

--------------------------------

### Invoke MyApp.MyServer in IEx

Source: https://hexdocs.pm/phoenix/1.7.14/telemetry

Demonstrates how to start an IEx session and call the MyApp.MyServer.call! function to execute the GenServer's logic. This snippet shows the client-side interaction with the previously defined server.

```iex
iex> MyApp.MyServer.call!
```

--------------------------------

### Phoenix ConnCase Setup (Elixir)

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/testing

Defines a custom test case template for Phoenix projects, enabling convenient testing of controllers and integration with verified routes. It sets up the default endpoint, imports necessary Phoenix and Plug modules, and provides a `Plug.Conn` instance for each test.

```elixir
defmodule HelloWeb.ConnCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      @endpoint HelloWeb.Endpoint

      use HelloWeb, :verified_routes

      import Plug.Conn
      import Phoenix.ConnTest
      import HelloWeb.ConnCase
    end
  end
  
  setup tags do
    Hello.DataCase.setup_sandbox(tags)
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
```

--------------------------------

### Generate Phoenix Release Scripts

Source: https://hexdocs.pm/phoenix/1.7.14/releases

This command generates the necessary scripts and files for managing a Phoenix application release. It creates overlay scripts for starting the server and running migrations, along with a `release.ex` file for Ecto migrations.

```shell
$ mix phx.gen.release
==> my_app
* creating rel/overlays/bin/server
* creating rel/overlays/bin/server.bat
* creating rel/overlays/bin/migrate
* creating rel/overlays/bin/migrate.bat
* creating lib/my_app/release.ex

Your application is ready to be deployed in a release!

    # To start your system
    _build/dev/rel/my_app/bin/my_app start

    # To start your system with the Phoenix server running
    _build/dev/rel/my_app/bin/server

    # To run migrations
    _build/dev/rel/my_app/bin/migrate

Once the release is running:

    # To connect to it remotely
    _build/dev/rel/my_app/bin/my_app remote

    # To stop it gracefully (you may also send SIGINT/SIGTERM)
    _build/dev/rel/my_app/bin/my_app stop

To list all commands:

    _build/dev/rel/my_app/bin/my_app
```

--------------------------------

### Raise when using ColocatedHook on unsupported Phoenix version

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Implements error handling to raise an exception when `ColocatedHook` or `ColocatedJS` are used with an unsupported version of Phoenix. This prevents potential runtime errors and guides users to compatible versions.

```elixir
defmodule Phoenix.LiveComponent do
  # ...

  # Check for compatible Phoenix version when defining ColocatedHook/JS
  @live_component {MyComponent, colocated_hooks: [MyHook]}
  # If Phoenix version is unsupported, an error will be raised.
  # ...
end
```

--------------------------------

### Running Phoenix Tests

Source: https://hexdocs.pm/phoenix/1.7.14/testing

Command to execute all tests within a Phoenix project. It shows the output format including the number of tests run and any failures. No external dependencies are required beyond a Phoenix project setup.

```shell
mix test
```

--------------------------------

### Launch Phoenix App on Fly.io (Flyctl)

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/fly

Initializes and configures a Fly.io application from your Phoenix project's source code directory. This command automatically detects the Phoenix project, generates a Dockerfile, and prompts for configuration details.

```bash
$ fly launch

```

--------------------------------

### Phoenix Test File Structure Example

Source: https://hexdocs.pm/phoenix/1.7.14/testing

Illustrates the default directory and file organization for tests in a Phoenix application. This structure helps in organizing controller, view, and support test files. It's automatically generated upon project creation.

```treeview
test
├── hello_web
│   └── controllers
│       ├── error_html_test.exs
│       ├── error_json_test.exs
│       └── page_controller_test.exs
├── support
│   ├── conn_case.ex
│   └── data_case.ex
└── test_helper.exs
```

--------------------------------

### Review Management API

Source: https://hexdocs.pm/phoenix/1.7.17/routing

Endpoints for managing reviews, including updating and deleting specific reviews.

```APIDOC
## PUT /admin/reviews/:id

### Description
Updates a specific review identified by its ID.

### Method
PUT

### Endpoint
/admin/reviews/:id

### Parameters
#### Path Parameters
- **id** (string) - Required - The unique identifier of the review to update.

### Request Example
```json
{
  "example": "PUT /admin/reviews/123"
}
```

### Response
#### Success Response (200)
- **message** (string) - Indicates successful update.

#### Response Example
```json
{
  "example": {
    "message": "Review updated successfully."
  }
}
```

## DELETE /admin/reviews/:id

### Description
Deletes a specific review identified by its ID.

### Method
DELETE

### Endpoint
/admin/reviews/:id

### Parameters
#### Path Parameters
- **id** (string) - Required - The unique identifier of the review to delete.

### Request Example
```json
{
  "example": "DELETE /admin/reviews/123"
}
```

### Response
#### Success Response (200)
- **message** (string) - Indicates successful deletion.

#### Response Example
```json
{
  "example": {
    "message": "Review deleted successfully."
  }
}
```
```

--------------------------------

### Configure libcluster in Elixir Application

Source: https://hexdocs.pm/phoenix/1.7.14/fly

This code snippet shows how to add libcluster to your Elixir application's `MyApp.Application` module. It includes setting up the `Cluster.Supervisor` with the necessary topologies. Ensure `libcluster` is installed as a dependency.

```elixir
defmodule MyApp.Application do
  use Application

  def start(_type, _args) do
    topologies = Application.get_env(:libcluster, :topologies) || []

    children = [
      # ...
      # setup for clustering
      {Cluster.Supervisor, [topologies, [name: MyApp.ClusterSupervisor]]}
    ]

    # ...
  end

  # ...
end
```

--------------------------------

### Socket Initialization and Configuration

Source: https://hexdocs.pm/phoenix/1.4.16/js

Provides details on how to initialize a new Socket instance and configure its various options.

```APIDOC
## Socket Initialization

### Description
Initializes the Socket for real-time communication. IE8 support requires an ES5-shim.

### Method
`new Socket(endPoint: string, opts: Object?)`

### Parameters
#### Path Parameters
- `endPoint` (string) - Required - The string WebSocket endpoint, e.g., `"ws://example.com/socket"`, `"wss://example.com"`, or `"/socket"` (uses inherited host & protocol).

#### Query Parameters
- `opts` (Object?) - Optional - Configuration options for the socket.

  Name | Description | Default
  ---|---|---
  `opts.transport` (string?) | The Websocket Transport, e.g., WebSocket or Phoenix.LongPoll. | WebSocket with automatic LongPoll fallback.
  `opts.encode` (Function?) | The function to encode outgoing messages. | JSON encoder.
  `opts.decode` (Function?) | The function to decode incoming messages. | JSON parser.
  `opts.timeout` (number?) | The default timeout in milliseconds to trigger push timeouts. | `DEFAULT_TIMEOUT`
  `opts.heartbeatIntervalMs` (number?) | The milliseconds interval to send a heartbeat message. | N/A
  `opts.reconnectAfterMs` (Function?) | Optional function returning the milliseconds for socket reconnect interval. | Stepped backoff: `[10, 50, 100, 150, 200, 250, 500, 1000, 2000][tries - 1] || 5000`
  `opts.rejoinAfterMs` (Function?) | Optional function returning the milliseconds for individual channel rejoin interval. | `[1000, 2000, 5000][tries - 1] || 10000`
  `opts.logger` (Function?) | Optional function for specialized logging. | No-op by default.
  `opts.longpollerTimeout` (number?) | Maximum timeout of a long poll AJAX request. | 20s
  `opts.binaryType` (string?) | The binary type to use for binary WebSocket frames. | "arraybuffer"
  `opts.vsn` (vsn?) | The serializer's protocol version to send on connect. | `DEFAULT_VSN`

### Request Example
```javascript
const socket = new Socket("/socket", {
  transport: WebSocket,
  encode: JSON.stringify,
  decode: (payload, callback) => callback(JSON.parse(payload))
});
```

### Response
(This is a constructor, no direct response object.)
```

--------------------------------

### Fetch Dependencies

Source: https://hexdocs.pm/phoenix/1.7.17/mix_phx_gen_auth

After generating the authentication system, new dependencies are added to `mix.exs`. This command fetches those dependencies, ensuring all necessary libraries are available for the project.

```bash
$ mix deps.get

```

--------------------------------

### Router Configuration for User Settings - Elixir

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/security

This snippet shows the router configuration in `router.ex` for handling user settings, specifically the `edit_bio` action. It defines routes for both GET and POST requests to `/users/settings/edit_bio`, mapping them to the `UserSettingsController`'s `edit_bio` action. It's important to note that using GET for state-changing actions can lead to CSRF vulnerabilities.

```elixir
get "/users/settings/edit_bio", UserSettingsController, :edit_bio
post "/users/settings/edit_bio", UserSettingsController, :edit_bio
```

--------------------------------

### Configuring LiveView Layout in mount/3

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/Phoenix

Demonstrates how to dynamically set the layout for a LiveView within the `mount/3` callback by returning a `{ok, socket, layout: ...}` tuple.

```elixir
def mount(_params, _session, socket) do
  socket = assign(socket, new_message_count: 0)
  {:ok, socket, layout: {AppWeb.LayoutView, "live.html"}}
end
```

--------------------------------

### Phoenix VerifiedRoutes Compiler Warning Example

Source: https://hexdocs.pm/phoenix/1.7.17/Phoenix

Illustrates a scenario where an unmatched route generates a compiler warning. This highlights the benefit of compile-time verification provided by Phoenix.VerifiedRoutes.

```elixir
warning: no route path for AppWeb.Router matches "/postz/#{post}"
  lib/app_web/controllers/post_controller.ex:100: AppWeb.PostController.show/2
```

--------------------------------

### Provision Gigalixir Database

Source: https://hexdocs.pm/phoenix/gigalixir

Commands to provision a PostgreSQL database for your Gigalixir application. Includes options for a free tier database and upgrading to a production-ready database.

```bash
gigalixir pg:create --free

gigalixir account:upgrade
gigalixir pg:create

gigalixir pg
gigalixir config
```

--------------------------------

### Phoenix Ecto Exception Handling Test Example

Source: https://hexdocs.pm/phoenix/1.7.14/testing_controllers

Shows an alternative way to test exceptions in Phoenix, specifically for the `show` action when a post is not found. Instead of using `assert_error_sent`, this example uses `assert_raise Ecto.NotFoundError` to directly check if the expected exception is raised when attempting to fetch a non-existent post. This approach focuses on the specific exception type rather than the resulting HTTP response.

```elixir
assert_raise Ecto.NotFoundError, fn ->
  get(conn, ~p"/posts/#{post}")
end
```

--------------------------------

### LiveView Hash Following

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Ensures that location hashes are properly followed on live patch and redirect operations. This improves navigation consistency.

```elixir
Properly follow location hashes on live patch/redirect
```

--------------------------------

### Launch and Deploy Phoenix App on Fly.io

Source: https://hexdocs.pm/phoenix/1.7.17/fly

Initiates the deployment process for a Phoenix application on Fly.io. The `fly launch` command detects the project type, generates necessary configuration (like Dockerfile), and deploys the application. It prompts for app name, organization, and region. The `fly deploy` command is used for subsequent deployments.

```bash
$ fly launch
copy
```

```bash
$ fly deploy
copy
```

```bash
$ fly deploy --remote-only
copy
```

--------------------------------

### Set Ecto Adapter to MyXQL

Source: https://hexdocs.pm/phoenix/1.7.17/ecto

Modifies the `lib/hello_phoenix/repo.ex` file to set the Ecto adapter to `Ecto.Adapters.MyXQL`, ensuring Ecto uses the MySQL adapter. This is a crucial step after changing dependencies and configuration.

```elixir
defmodule HelloPhoenix.Repo do
  use Ecto.Adapters.MyXQL, otp_app: :hello_phoenix
endcopy
```

--------------------------------

### Post Resource API (Read-Only)

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Defines read-only routes for a post resource, including index and show actions.

```APIDOC
## GET /posts

### Description
Retrieves a list of all posts.

### Method
GET

### Endpoint
/posts

### Parameters
None

### Request Example
None

### Response
#### Success Response (200)
- **posts** (array) - A list of post objects.

#### Response Example
```json
{
  "posts": [
    {
      "id": 1,
      "title": "First Post",
      "content": "This is the content of the first post."
    }
  ]
}
```

## GET /posts/:id

### Description
Retrieves a specific post by ID.

### Method
GET

### Endpoint
/posts/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the post.

### Request Example
None

### Response
#### Success Response (200)
- **post** (object) - The post object.

#### Response Example
```json
{
  "post": {
    "id": 1,
    "title": "First Post",
    "content": "This is the content of the first post."
  }
}
```
```

--------------------------------

### Example Ecto.Changeset Usage in Phoenix Contexts

Source: https://hexdocs.pm/phoenix/1.7.14/contexts

Illustrates how Ecto.Changeset structs are used to model data changes between contexts and the web layer in Phoenix. Changesets are useful for tracking field changes, performing validations, and generating error messages, and are not strictly tied to the database. This example highlights their role as a flexible data structure for inter-layer communication.

```elixir
def create_user(attrs \ \ ) do
  %User{} |> User.changeset(attrs) |> Repo.insert()
end
```

--------------------------------

### Define Controller Plugs in Phoenix

Source: https://hexdocs.pm/phoenix/1.7.17/plug

This example demonstrates defining a plug within a Phoenix controller. The `HelloWeb.Plugs.Locale` plug is applied to the entire `HelloWeb.PageController`. This plug will be executed for every action within this controller.

```elixir
defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug HelloWeb.Plugs.Locale, "en"
```

--------------------------------

### Fly.io CLI Commands for Application Management

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/fly

A collection of essential Fly.io command-line interface (CLI) commands for managing deployed applications, including accessing the dashboard, deploying, checking status, viewing logs, and scaling instances.

```bash
$ fly dashboard

$ fly deploy

$ fly status

$ fly logs

$ fly scale count 2
```

--------------------------------

### LiveSocket Initialization with Long-Poll Fallback

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/deployment

JavaScript code snippet demonstrating the initialization of `LiveSocket` in `app.js`. It configures the WebSocket endpoint and sets a timeout for the long-poll fallback mechanism.

```javascript
let liveSocket = new LiveSocket("/live", Socket, {
  longPollFallbackMs: 2500,
  params: {_csrf_token: csrfToken}
})

```

--------------------------------

### LiveView Argument Error Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes an argument error when providing the `:as` option to a `live` route. This ensures correct route configuration.

```elixir
Fix argument error when providing `:as` option to a `live` route
```

--------------------------------

### User Resources API

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Defines standard CRUD routes for a user resource, including index, show, new, create, edit, update, and delete actions.

```APIDOC
## GET /users

### Description
Retrieves a list of all users.

### Method
GET

### Endpoint
/users

### Parameters
None

### Request Example
None

### Response
#### Success Response (200)
- **users** (array) - A list of user objects.

#### Response Example
```json
{
  "users": [
    {
      "id": 1,
      "name": "John Doe",
      "email": "john.doe@example.com"
    }
  ]
}
```

## GET /users/:id/edit

### Description
Retrieves a specific user by ID and presents a form for editing.

### Method
GET

### Endpoint
/users/:id/edit

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the user.

### Request Example
None

### Response
#### Success Response (200)
- **user** (object) - The user object to be edited.

#### Response Example
```json
{
  "user": {
    "id": 1,
    "name": "John Doe",
    "email": "john.doe@example.com"
  }
}
```

## GET /users/new

### Description
Presents a form for creating a new user.

### Method
GET

### Endpoint
/users/new

### Parameters
None

### Request Example
None

### Response
#### Success Response (200)
- **form** (object) - Represents the form for creating a new user.

#### Response Example
```json
{
  "form": {
    "fields": [
      {"name": "name", "type": "text"},
      {"name": "email", "type": "email"}
    ]
  }
}
```

## GET /users/:id

### Description
Retrieves a specific user by ID.

### Method
GET

### Endpoint
/users/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the user.

### Request Example
None

### Response
#### Success Response (200)
- **user** (object) - The user object.

#### Response Example
```json
{
  "user": {
    "id": 1,
    "name": "John Doe",
    "email": "john.doe@example.com"
  }
}
```

## POST /users

### Description
Creates a new user.

### Method
POST

### Endpoint
/users

### Parameters
#### Request Body
- **name** (string) - Required - The name of the user.
- **email** (string) - Required - The email address of the user.

### Request Example
```json
{
  "name": "Jane Doe",
  "email": "jane.doe@example.com"
}
```

### Response
#### Success Response (201)
- **user** (object) - The newly created user object.

#### Response Example
```json
{
  "user": {
    "id": 2,
    "name": "Jane Doe",
    "email": "jane.doe@example.com"
  }
}
```

## PATCH /users/:id

### Description
Updates an existing user.

### Method
PATCH

### Endpoint
/users/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the user.
#### Request Body
- **name** (string) - Optional - The updated name of the user.
- **email** (string) - Optional - The updated email address of the user.

### Request Example
```json
{
  "name": "Jane Smith"
}
```

### Response
#### Success Response (200)
- **user** (object) - The updated user object.

#### Response Example
```json
{
  "user": {
    "id": 2,
    "name": "Jane Smith",
    "email": "jane.doe@example.com"
  }
}
```

## PUT /users/:id

### Description
Updates an existing user.

### Method
PUT

### Endpoint
/users/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the user.
#### Request Body
- **name** (string) - Optional - The updated name of the user.
- **email** (string) - Optional - The updated email address of the user.

### Request Example
```json
{
  "name": "Jane Smith",
  "email": "jane.smith@example.com"
}
```

### Response
#### Success Response (200)
- **user** (object) - The updated user object.

#### Response Example
```json
{
  "user": {
    "id": 2,
    "name": "Jane Smith",
    "email": "jane.smith@example.com"
  }
}
```

## DELETE /users/:id

### Description
Deletes a specific user by ID.

### Method
DELETE

### Endpoint
/users/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the user.

### Request Example
None

### Response
#### Success Response (204)
No Content.

#### Response Example
None
```

--------------------------------

### Provision Gigalixir Database

Source: https://hexdocs.pm/phoenix/1.7.14/gigalixir

Provisions a free PostgreSQL database for the Gigalixir application and verifies its creation. It also checks for the `DATABASE_URL` and `POOL_SIZE` environment variables.

```bash
gigalixir pg:create --free
gigalixir pg
gigalixir config
```

--------------------------------

### Support :supervisor Option for assign_async and start_async in LiveView

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This enhancement extends the `assign_async` and `start_async` functions with a `:supervisor` option. This allows developers to specify a supervisor for managing asynchronous processes initiated by these functions, providing better error handling and process management within LiveView applications.

```elixir
start_async(
  :background_task,
  fn ->
    # perform long running task
  end,
  supervisor: MyApp.MySupervisor
)
```

--------------------------------

### Get File Extensions for Phoenix.Digester.Gzip

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/Phoenix.Digester

Retrieves the file extensions supported by the Gzip compressor. This function is a callback implementation for `Phoenix.Digester.Compressor.file_extensions/0`.

```Elixir
file_extensions()
```

--------------------------------

### Define Hello.DataCase ExUnit.CaseTemplate

Source: https://hexdocs.pm/phoenix/1.7.14/testing_contexts

This snippet defines the Hello.DataCase module, which extends ExUnit.CaseTemplate. It sets up aliases and imports necessary Ecto and Hello modules. It also configures the SQL Sandbox for transactional database testing, ensuring tests do not affect each other and can run concurrently.

```elixir
defmodule Hello.DataCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Hello.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Hello.DataCase
    end
  end

  setup tags do
    Hello.DataCase.setup_sandbox(tags)
    :ok
  end

  def setup_sandbox(tags) do
    pid = Ecto.Adapters.SQL.Sandbox.start_owner!(Hello.Repo, shared: not tags[:async])
    on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)
  end

  def errors_on(changeset) do
    ...
  end
end
```

--------------------------------

### Phoenix Changeset: Example of Failed Bio Length Validation

Source: https://hexdocs.pm/phoenix/1.7.14/ecto

This example shows how to trigger and inspect a failed minimum length validation for the 'bio' field in an Ecto changeset. It demonstrates that providing a bio shorter than the minimum required length (2 characters) results in an error being added to the changeset.

```iex
iex> recompile()

iex> changeset = User.changeset(%User{}, %{bio: "A"})

iex> changeset.errors[:bio]
{"should be at least %{count} character(s)",
 [count: 2, validation: :length, kind: :min, type: :string]}
```

--------------------------------

### Phoenix LiveView v1.1 Upgrade Commands

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Commands to upgrade Phoenix LiveView and apply necessary changes. These commands can be run using `mix igniter`.

```bash
# Prior to / without running `mix deps.update`
mix igniter.upgrade phoenix_live_view

# Or if you have previously run `mix deps.update phoenix_live_view` or are upgrading from a release candidate.
mix igniter.apply_upgrades phoenix_live_view:1.0.0:1.1.0
```

--------------------------------

### Phoenix Plug Init Function

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/Phoenix.Endpoint

Implements the Plug.init/1 callback for the SyncCodeReloadPlug. This function initializes the plug with provided arguments, preparing it for request handling.

```elixir
init(arg)
```

--------------------------------

### Example Telemetry Console Output

Source: https://hexdocs.pm/phoenix/1.7.17/telemetry

This shows the expected output from the Telemetry.Metrics.ConsoleReporter when the MyApp.MyServer GenServer is invoked. It includes details about the 'my_app.my_server.call.stop' event, its measurements, and the returned value.

```plaintext
[Telemetry.Metrics.ConsoleReporter] Got new event!
Event name: my_app.my_server.call.stop
All measurements: %{duration: 4000}
All metadata: %

Metric measurement: #Function<2.111777250/1 in Telemetry.Metrics.maybe_convert_measurement/2> (summary)
With value: 0.004 millisecond
Tag values: %

"Hello, world!"
```

--------------------------------

### Generate HTML Resource Scaffold with Tests

Source: https://hexdocs.pm/phoenix/testing

This command generates a complete HTML resource scaffold including schema, context, controllers, views, and associated tests. It also injects necessary code into router and context files and creates migration files.

```shell
mix phx.gen.html Blog Post posts title body:text
* creating lib/hello_web/controllers/post_controller.ex
* creating lib/hello_web/controllers/post_html/edit.html.heex
* creating lib/hello_web/controllers/post_html/index.html.heex
* creating lib/hello_web/controllers/post_html/new.html.heex
* creating lib/hello_web/controllers/post_html/show.html.heex
* creating lib/hello_web/controllers/post_html/post_form.html.heex
* creating lib/hello_web/controllers/post_html.ex
* creating test/hello_web/controllers/post_controller_test.exs
* creating lib/hello/blog/post.ex
* creating priv/repo/migrations/20211001233016_create_posts.exs
* creating lib/hello/blog.ex
* injecting lib/hello/blog.ex
* creating test/hello/blog_test.exs
* injecting test/hello/blog_test.exs
* creating test/support/fixtures/blog_fixtures.ex
* injecting test/support/fixtures/blog_fixtures.ex
```

--------------------------------

### Phoenix Controller Action for HTML Rendering

Source: https://hexdocs.pm/phoenix/1.7.17/controllers

A standard controller action in Phoenix that renders an HTML template. It uses the `render/3` function to specify the template and optionally a layout.

```elixir
def home(conn, _params) do
  render(conn, :home, layout: false)
end
```

--------------------------------

### Generate HTML Resource for Blog Posts

Source: https://hexdocs.pm/phoenix/1.7.14/testing_contexts

This command generates an HTML resource for blog posts, including a Blog context and a Post schema with associated test files. It requires a running Phoenix application and prior knowledge of introductory guides.

```bash
$ mix phx.gen.html Blog Post posts title body:text
```

--------------------------------

### External Redirection

Source: https://hexdocs.pm/phoenix/1.7.17/controllers

For redirecting to fully-qualified URLs or external websites, use the `external` option within the `redirect/2` function.

```APIDOC
## REDIRECT / (external URL)

### Description
Redirects the client to an external URL.

### Method
GET

### Endpoint
/

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```elixir
def home(conn, _params) do
  redirect(conn, external: "https://elixir-lang.org/")
end
```

### Response
#### Success Response (302)
- **Location** (string) - The external URL to redirect to (e.g., "https://elixir-lang.org/").

#### Response Example
(Client is redirected to the specified external URL)
```

--------------------------------

### Create Gigalixir Application

Source: https://hexdocs.pm/phoenix/1.7.14/gigalixir

Creates a new application on Gigalixir with a specified name. It also includes commands to verify the application creation and check the git remote configuration.

```bash
gigalixir create -n "your_app_name"
gigalixir apps
git remote -v
```

--------------------------------

### LiveView Send Update After Function

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Adds `Phoenix.LiveView.send_update_after/3` for scheduling updates after a specified delay. This provides more control over UI updates.

```elixir
Add `Phoenix.LiveView.send_update_after/3`
```

--------------------------------

### Comment Resource API (Except Delete)

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Defines routes for a comment resource, excluding the delete action.

```APIDOC
## GET /comments

### Description
Retrieves a list of all comments.

### Method
GET

### Endpoint
/comments

### Parameters
None

### Request Example
None

### Response
#### Success Response (200)
- **comments** (array) - A list of comment objects.

#### Response Example
```json
{
  "comments": [
    {
      "id": 1,
      "body": "This is a comment."
    }
  ]
}
```

## GET /comments/:id/edit

### Description
Retrieves a specific comment by ID and presents a form for editing.

### Method
GET

### Endpoint
/comments/:id/edit

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the comment.

### Request Example
None

### Response
#### Success Response (200)
- **comment** (object) - The comment object to be edited.

#### Response Example
```json
{
  "comment": {
    "id": 1,
    "body": "This is a comment."
  }
}
```

## GET /comments/new

### Description
Presents a form for creating a new comment.

### Method
GET

### Endpoint
/comments/new

### Parameters
None

### Request Example
None

### Response
#### Success Response (200)
- **form** (object) - Represents the form for creating a new comment.

#### Response Example
```json
{
  "form": {
    "fields": [
      {"name": "body", "type": "textarea"}
    ]
  }
}
```

## GET /comments/:id

### Description
Retrieves a specific comment by ID.

### Method
GET

### Endpoint
/comments/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the comment.

### Request Example
None

### Response
#### Success Response (200)
- **comment** (object) - The comment object.

#### Response Example
```json
{
  "comment": {
    "id": 1,
    "body": "This is a comment."
  }
}
```

## POST /comments

### Description
Creates a new comment.

### Method
POST

### Endpoint
/comments

### Parameters
#### Request Body
- **body** (string) - Required - The content of the comment.

### Request Example
```json
{
  "body": "This is a new comment."
}
```

### Response
#### Success Response (201)
- **comment** (object) - The newly created comment object.

#### Response Example
```json
{
  "comment": {
    "id": 2,
    "body": "This is a new comment."
  }
}
```

## PATCH /comments/:id

### Description
Updates an existing comment.

### Method
PATCH

### Endpoint
/comments/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the comment.
#### Request Body
- **body** (string) - Optional - The updated content of the comment.

### Request Example
```json
{
  "body": "This is an updated comment."
}
```

### Response
#### Success Response (200)
- **comment** (object) - The updated comment object.

#### Response Example
```json
{
  "comment": {
    "id": 2,
    "body": "This is an updated comment."
  }
}
```

## PUT /comments/:id

### Description
Updates an existing comment.

### Method
PUT

### Endpoint
/comments/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the comment.
#### Request Body
- **body** (string) - Optional - The updated content of the comment.

### Request Example
```json
{
  "body": "This is an updated comment."
}
```

### Response
#### Success Response (200)
- **comment** (object) - The updated comment object.

#### Response Example
```json
{
  "comment": {
    "id": 2,
    "body": "This is an updated comment."
  }
}
```
```

--------------------------------

### Run Phoenix Tests with Mix

Source: https://hexdocs.pm/phoenix/1.7.17/testing

This command executes all tests within a Phoenix project. It shows a summary of test results, including the number of tests and failures.

```bash
mix test

```

--------------------------------

### Read-Only Posts Resource API

Source: https://hexdocs.pm/phoenix/1.7.17/routing

Defines a read-only resource for posts, exposing only the index and show actions.

```APIDOC
## Resources: /posts (Read-Only)

### Description
This resource provides read-only access to posts, allowing retrieval of all posts or a single post by ID.

### Method
- GET

### Endpoint
- `/posts`
- `/posts/:id`

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier for a post.

#### Query Parameters
None

#### Request Body
None

### Request Example
None

### Response
#### Success Response (200)
- **posts** (array) - An array of post objects.
  - **id** (integer) - The unique identifier for the post.
  - **title** (string) - The title of the post.
  - **content** (string) - The content of the post.

#### Response Example
```json
{
  "posts": [
    {
      "id": 1,
      "title": "First Post",
      "content": "This is the content of the first post."
    }
  ]
}
```
```

--------------------------------

### Spawn LiveView Process

Source: https://hexdocs.pm/phoenix/_live_view/Phoenix

Spawns a connected LiveView process. It can perform a GET request to a path and upgrade the page to LiveView, or immediately convert an existing connection to a LiveView. Handles errors with `:raise` or `:warn` options.

```elixir
{:ok, view, html} = live(conn, "/path")
assert view.module == MyLive
assert html =~ "the count is 3"

assert {:error, {:redirect, %{to: "/somewhere"}}} = live(conn, "/path")
```

--------------------------------

### Manage Ecto Database Tasks with mix ecto

Source: https://hexdocs.pm/phoenix/1.7.17/mix_tasks

A collection of Mix tasks for managing Ecto repositories and database operations. These tasks include creating, dropping, dumping, loading, migrating, and rolling back database structures. They can be executed with a `--no-start` flag to avoid starting the application.

```bash
mix help --search "ecto"
```

```bash
mix ecto.create
```

```bash
mix ecto.drop
```

```bash
mix ecto.dump
```

```bash
mix ecto.gen.migration
```

```bash
mix ecto.gen.repo
```

```bash
mix ecto.load
```

```bash
mix ecto.migrate
```

```bash
mix ecto.migrations
```

```bash
mix ecto.reset
```

```bash
mix ecto.rollback
```

```bash
mix ecto.setup
```

--------------------------------

### Define Order Completion Logic in Orders Context

Source: https://hexdocs.pm/phoenix/1.7.14/contexts

This Elixir code outlines the beginning of the `complete_order/1` function within the `Orders` context. It takes a `ShoppingCart.Cart` struct and starts mapping its items to prepare for persistence as line items, including retrieving product information.

```elixir
alias Hello.Orders.LineItem
alias Hello.ShoppingCart

def complete_order(%ShoppingCart.Cart{} = cart) do
  line_items =
    Enum.map(cart.items, fn item ->

```

--------------------------------

### Useful Fly.io CLI Commands

Source: https://hexdocs.pm/phoenix/fly

A collection of essential Fly.io CLI commands for managing your deployed applications. These commands cover accessing the dashboard, deploying new versions, checking status, viewing logs, and scaling instances.

```bash
$ fly dashboard
$ fly deploy
$ fly status
$ fly logs
$ fly scale count 2
```

--------------------------------

### Phoenix Router LiveView Route Configuration

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/Phoenix

Defines a route in the Phoenix router to serve a LiveView. This example maps the `/thermostat` path to the `ThermostatLive` module, making it accessible via a dedicated URL.

```elixir
defmodule AppWeb.Router do
  use Phoenix.Router
  import Phoenix.LiveView.Router

  scope "/", AppWeb do
    live "/thermostat", ThermostatLive
  end
end
```

--------------------------------

### Partition tests across multiple machines in CI

Source: https://hexdocs.pm/phoenix/1.7.17/testing

These commands demonstrate how to partition test execution across multiple machines in a CI environment by setting the MIX_TEST_PARTITION environment variable and using the --partitions flag.

```shell
$ MIX_TEST_PARTITION=1 mix test --partitions 4
$ MIX_TEST_PARTITION=2 mix test --partitions 4
$ MIX_TEST_PARTITION=3 mix test --partitions 4
$ MIX_TEST_PARTITION=4 mix test --partitions 4
```

--------------------------------

### Generate Secret Key and Set Database URL

Source: https://hexdocs.pm/phoenix/deployment

Generates a secret key for application security and demonstrates how to set the database URL environment variables. These are crucial for securely configuring your Phoenix application in a production environment.

```shell
$ mix phx.gen.secret
REALLY_LONG_SECRET
$ export SECRET_KEY_BASE=REALLY_LONG_LONG_SECRET
$ export DATABASE_URL=ecto://USER:PASS@HOST/database
```

--------------------------------

### Insert Product using Ecto Repo and Changeset

Source: https://hexdocs.pm/phoenix/1.7.17/contexts

This code demonstrates how to create and insert a new product into the database using an Ecto changeset and the Ecto repository. It shows the typical flow of preparing attributes, creating a changeset, and then inserting the record.

```elixir
%Product{}
|> Product.changeset(attrs)
|> Repo.insert()
```

--------------------------------

### Dockerfile: Copy Release Artifacts and Run Server

Source: https://hexdocs.pm/phoenix/1.7.17/releases

This Dockerfile snippet demonstrates how to copy the final release artifact from a builder stage and set the command to run the application server. It assumes a build environment where the release is available at `/app/_build/${MIX_ENV}/rel/my_app` and the server is executed via `/app/bin/server`.

```dockerfile
COPY --from=builder --chown=nobody:root /app/_build/${MIX_ENV}/rel/my_app ./

USER nobody

# If using an environment that doesn't automatically reap zombie processes, it is
# advised to add an init process such as tini via `apt-get install`
# above and adding an entrypoint. See https://github.com/krallin/tini for details
# ENTRYPOINT ["/tini", "--"]

CMD ["/app/bin/server"]
```

--------------------------------

### Execute Ecto Repo Initialization Telemetry Event

Source: https://hexdocs.pm/phoenix/1.7.14/telemetry

This example shows how to manually execute the Telemetry event emitted by Ecto.Repo when it initializes. It includes the event name, measurement, and metadata.

```elixir
:telemetry.execute([:ecto, :repo, :init], %{system_time: System.system_time()}, %{repo: repo, opts: opts})
```

--------------------------------

### Accessing URL Parameters in LiveView Mount

Source: https://hexdocs.pm/phoenix/_live_view/index

Demonstrates how to extract URL parameters like 'house' in the `mount` callback of a LiveView to fetch data. It assumes a `Thermostat` module exists for data retrieval. Requires no external dependencies beyond Phoenix LiveView.

```elixir
def mount(%{"house" => house}, _session, socket) do
  temperature = Thermostat.get_house_reading(house)
  {:ok, assign(socket, :temperature, temperature)}
end
```

--------------------------------

### Filtered Resources API (Posts)

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/routing

This section demonstrates how to use the `:only` option with the `resources` macro to define a subset of actions for a resource. Example shows only index and show for posts.

```APIDOC
## GET /posts

### Description
Retrieves a list of all posts.

### Method
GET

### Endpoint
/posts

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
None

### Response
#### Success Response (200)
- **posts** (array) - A list of post objects.

#### Response Example
```json
{
  "posts": [
    {
      "id": 1,
      "title": "First Post"
    }
  ]
}
```

## GET /posts/:id

### Description
Retrieves a specific post by its ID.

### Method
GET

### Endpoint
/posts/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the post.

#### Query Parameters
None

#### Request Body
None

### Request Example
None

### Response
#### Success Response (200)
- **post** (object) - The post object.

#### Response Example
```json
{
  "post": {
    "id": 1,
    "title": "First Post"
  }
}
```
```

--------------------------------

### LiveView Phx-Update DOM Update Optimization

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Optimizes `phx-update` append/prepend based DOM updates for better performance. This leads to faster UI rendering.

```elixir
Optimize `phx-update` append/prepend based DOM updates
```

--------------------------------

### Ecto Context Preload for Orders

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/more_examples

Modifies the `get_order!/2` function in the Orders context to include preloading of associated `line_items` and their nested `product`. This optimizes data retrieval by fetching related data in a single query.

```elixir
def get_order!(%Scope{} = scope, id) do
  Order
  |> Repo.get_by!(id: id, user_id: scope.user.id)
  |> Repo.preload([line_items: [:product]])
end
```

--------------------------------

### Get Connection State

Source: https://hexdocs.pm/phoenix/js/index

Retrieves the current connection state of the WebSocket. The state is returned as a string.

```javascript
connectionState(): string
```

--------------------------------

### Create New Phoenix App with MySQL

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/swapping_databases

This command creates a new Phoenix application and automatically configures it to use MySQL as the database. It sets up the necessary dependencies and configurations for Ecto.

```bash
$ mix phx.new hello_phoenix --database mysql

```

--------------------------------

### Internal Redirection

Source: https://hexdocs.pm/phoenix/1.7.17/controllers

The `redirect/2` function allows you to redirect the client to a different path within your application. It's commonly used after successful resource creation.

```APIDOC
## REDIRECT / (to /redirect_test)

### Description
Redirects the client to a specified internal path within the application.

### Method
GET

### Endpoint
/

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```elixir
def home(conn, _params) do
  redirect(conn, to: ~p"/redirect_test")
end
```

### Response
#### Success Response (302)
- **Location** (string) - The URL to redirect to (e.g., "/redirect_test").

#### Response Example
(Client is redirected to `/redirect_test`)
```

--------------------------------

### Phoenix Channels Client Connection URL Example

Source: https://hexdocs.pm/phoenix/1.7.17/writing_a_channels_client

This snippet shows the format of the initial HTTP request URL to establish a WebSocket connection to a Phoenix Channel. It includes the host, port, and the version parameter 'vsn=2.0.0', which specifies the serializer.

```plaintext
[host]:[port]/mobile/websocket?vsn=2.0.0
```

--------------------------------

### Comments Resource API (Excluding Delete)

Source: https://hexdocs.pm/phoenix/1.7.17/routing

Defines a resource for comments, excluding the delete action to prevent removal of comments.

```APIDOC
## Resources: /comments (Excluding Delete)

### Description
This resource manages comments, supporting creation, retrieval, updating, and editing, but not deletion.

### Method
- GET
- POST
- PATCH
- PUT

### Endpoint
- `/comments`
- `/comments/:id`
- `/comments/:id/edit`
- `/comments/new`

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier for a comment.

#### Query Parameters
None

#### Request Body
- **comment** (object) - Required - Contains comment data for create or update operations.
  - **body** (string) - Required - The content of the comment.

### Request Example
#### POST /comments
```json
{
  "comment": {
    "body": "This is a new comment."
  }
}
```

### Response
#### Success Response (200)
- **comment** (object) - The comment object.
  - **id** (integer) - The unique identifier for the comment.
  - **body** (string) - The content of the comment.

#### Response Example
```json
{
  "comment": {
    "id": 1,
    "body": "This is a new comment."
  }
}
```
```

--------------------------------

### LiveView Hard Redirect on Mount

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Supports hard redirects on mount for LiveView. This allows for initial page loads to redirect to a different URL if necessary.

```elixir
Support hard redirects on mount
```

--------------------------------

### Phoenix VerifiedRoutes Path and URL Generation

Source: https://hexdocs.pm/phoenix/1.7.17/Phoenix

Shows examples of generating verified paths and URLs using the `~p` sigil and the `url` function. These can include dynamic segments and query parameters, with compile-time verification against the defined router.

```elixir
<.link href={~p"/sessions/new"} method="post">Log in</.link>

redirect(to: url(~p"/posts/#{post}"))
```

```elixir
params = %{page: 1, direction: "asc"}
~p"/posts?#{params}"
```

--------------------------------

### Generate User Routes with mix phx.routes

Source: https://hexdocs.pm/phoenix/1.7.14/routing

This output shows the routes generated by running `mix phx.routes` after defining the `/users` resource. It lists the HTTP verb, path, controller, and action for each automatically generated route.

```shell
GET     /users           HelloWeb.UserController :index
GET     /users/:id/edit  HelloWeb.UserController :edit
GET     /users/new       HelloWeb.UserController :new
GET     /users/:id       HelloWeb.UserController :show
POST    /users           HelloWeb.UserController :create
PATCH   /users/:id       HelloWeb.UserController :update
PUT     /users/:id       HelloWeb.UserController :update
DELETE  /users/:id       HelloWeb.UserController :delete
```

--------------------------------

### Live Uploads Enhancements in LiveView

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Introduces support for live uploads, including file progress, interactive file selection, and direct-to-cloud uploads. This enhances the user experience for file uploads within LiveView applications.

```elixir
Add live uploads support for file progress, interactive file selection, and direct to cloud support
```

--------------------------------

### Redirect to Verified Route Path (Elixir)

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Illustrates how to use the ~p sigil within a controller to specify a redirect target. This ensures that redirects point to valid and existing routes.

```elixir
redirect(conn, to: ~p"/comments/#{comment}")
```

--------------------------------

### Get Article API

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/testing_controllers

This endpoint retrieves a specific article by its ID. It returns the article details if found, or a 404 Not Found error if the article does not exist.

```APIDOC
## GET /api/articles/:id

### Description
Retrieves a specific article by its unique identifier.

### Method
GET

### Endpoint
/api/articles/:id

#### Path Parameters
- **id** (string) - Required - The unique identifier of the article to retrieve.

### Response
#### Success Response (200)
- **data** (object) - The requested article object.
  - **id** (string) - The unique identifier of the article.
  - **title** (string) - The title of the article.
  - **body** (string) - The content of the article.

#### Response Example (Success)
```json
{
  "data": {
    "id": "some-article-id",
    "title": "some title",
    "body": "some body"
  }
}
```

#### Error Response (404)
- Indicates that the requested article was not found.

#### Response Example (Error)
```json
{
  "error": "Not Found"
}
```
```

--------------------------------

### Get PubSub Node Name

Source: https://hexdocs.pm/phoenix/_pubsub/2.1.3/Phoenix

Retrieves the node name of the running PubSub server. This function is straightforward and requires only the pubsub system name.

```elixir
iex(10)> Phoenix.PubSub.node_name(MyApp.PubSub)
:"user@example.com"
```

--------------------------------

### LiveView Open Browser Static Path Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes `static_path` in `open_browser` failing to load stylesheets. This ensures that assets are correctly loaded when using the browser testing utility.

```elixir
Fix `static_path` in `open_browser` failing to load stylesheets
```

--------------------------------

### Generate HTML Resources for Product Catalog in Phoenix

Source: https://hexdocs.pm/phoenix/1.7.17/contexts

This command generates a context module, Ecto schema, controllers, templates, and tests for managing products. It creates a `Catalog` context and a `Product` schema with specified attributes: `title`, `description`, `price`, and `views`. The generated files facilitate CRUD operations and web interface for products.

```bash
$ mix phx.gen.html Catalog Product products title:string \
description:string price:decimal views:integer
```

--------------------------------

### LiveView Redirect Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes `push_redirect` from mount hanging on the client and causing a fallback to full page reload when following a `live_redirect`. This ensures smoother navigation.

```elixir
Fix `push_redirect` from mount hanging on the client and causing a fallback to full page reload when following a clicked `live_redirect` on the client
```

--------------------------------

### Define and Use Verified Routes with ~p Sigil (Elixir)

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Demonstrates defining routes using the ~p sigil within a module and triggering compiler warnings for invalid paths. This feature helps catch routing errors at compile time.

```elixir
iex> defmodule RouteExample do
...>   use HelloWeb, :verified_routes
...
...>   def example do
...>     ~p"/comments"
...>     ~p"/unknown/123"
...>   end
...> end
warning: no route path for HelloWeb.Router matches "/unknown/123"
  iex:5: RouteExample.example/0

{:module, RouteExample, ...}
```

--------------------------------

### LiveView DOM Append/Prepend Optimization

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Optimizes DOM prepend and append operations within LiveView for improved performance. This results in faster UI updates.

```elixir
Optimize DOM prepend and append operations
```

--------------------------------

### Phoenix Elixir: Running Mix Tests

Source: https://hexdocs.pm/phoenix/testing_controllers

Command to execute all tests within a Phoenix project. The output shows the number of passing tests and failures, along with a randomized seed for test execution.

```bash
$ mix test
................

Finished in 0.6 seconds
35 tests, 0 failures

Randomized with seed 618478

```

--------------------------------

### Call Custom Elixir JS Command Function from HTML

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/bindings

Provides an example of how to call a custom Elixir function that returns `Phoenix.LiveView.JS` commands from an HTML `phx-click` binding.

```html
<button phx-click={hide_modal("#modal")}>hide modal</button>
```

--------------------------------

### Configuring LiveView Layout using use Phoenix.LiveView

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/Phoenix

Illustrates how to specify a live layout for a LiveView by passing the `:layout` option to `use Phoenix.LiveView` within the LiveView module.

```elixir
use Phoenix.LiveView, layout: {AppWeb.LayoutView, "live.html"}
```

--------------------------------

### LiveView Socket View Update

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Replaces `@live_module` in socket templates with `@socket.view`. This simplifies accessing the current view module within socket templates.

```elixir
Remove `@live_module` in socket templates in favor of `@socket.view`
```

--------------------------------

### Configure LiveView Debugging in `config/dev.exs`

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Optional configuration settings for `phoenix_live_view` in `config/dev.exs` to enable debug heex annotations and attributes, and expensive runtime checks.

```elixir
config :phoenix_live_view,
  debug_heex_annotations: true,
  debug_attributes: true,
  enable_expensive_runtime_checks: true
```

--------------------------------

### GET /api/articles/:id

Source: https://hexdocs.pm/phoenix/1.7.17/testing_controllers

Retrieves a specific article by its ID. Returns the article data if found, otherwise returns a 404 Not Found error.

```APIDOC
## GET /api/articles/:id

### Description
Retrieves a specific article by its unique identifier. On success, it returns the article details. If the article is not found, it returns a 404 Not Found status.

### Method
GET

### Endpoint
/api/articles/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the article to retrieve.

### Response
#### Success Response (200)
- **data** (object) - Contains the article object.
  - **id** (integer) - The unique identifier for the article.
  - **title** (string) - The title of the article.
  - **body** (string) - The body content of the article.

#### Error Response (404)
- The response will indicate that the resource was not found.

#### Response Example (Success)
```json
{
  "data": {
    "id": 1,
    "title": "some title",
    "body": "some body"
  }
}
```
```

--------------------------------

### LiveView State Management with Query Parameters

Source: https://hexdocs.pm/phoenix/_live_view/deployments

Manage state using query parameters by leveraging `<.link patch={...}>` and `handle_params/3`. This reduces server state, makes navigation shareable, and improves SEO.

```elixir
def handle_params(params, socket) do
  # Update socket assigns based on query parameters
  {:noreply, assign(socket, :current_tab, params["tab"])}
end
```

--------------------------------

### Get LiveView Children

Source: https://hexdocs.pm/phoenix/_live_view/Phoenix

Retrieves a list of current LiveView children for a given parent LiveView. Children are ordered as they appear in the rendered HTML.

```elixir
{:ok, view, _html} = live(conn, "/thermo")
assert [clock_view] = live_children(view)
assert render_click(clock_view, :snooze) =~ "snoozing"
```

--------------------------------

### Create a New Phoenix App with Mix

Source: https://hexdocs.pm/phoenix/1.7.14/fly

This command generates a new Phoenix project. It's a prerequisite for deploying to Fly.io and requires the Mix build tool.

```bash
$ mix phx.new my_app
copy
```

--------------------------------

### Generate Post Routes with mix phx.routes

Source: https://hexdocs.pm/phoenix/1.7.14/routing

This output displays the routes generated after defining the `/posts` resource with the `:only` option. It confirms that only the routes for the `index` and `show` actions are present.

```shell
GET     /posts      HelloWeb.PostController :index
GET     /posts/:id  HelloWeb.PostController :show
```

--------------------------------

### Add metadata to phx:page-loading-start event

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Increases the metadata provided to the `phx:page-loading-start` event, especially in error cases. This allows for more detailed debugging and handling of page loading states in LiveView.

```javascript
window.liveSocket.addEventListener('phx:page-loading-start', (event) => {
  // event.detail now includes more metadata, especially for errors
  console.log('Page loading started:', event.detail);
});
```

--------------------------------

### LiveView Rendering Condition

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Prevents LiveView from rendering if only events or replies have been added to the socket. This optimizes rendering by only occurring when necessary.

```elixir
Do not render LiveView if only events/replies have been added to the socket
```

--------------------------------

### Phoenix Router Configuration

Source: https://hexdocs.pm/phoenix/1.7.14/request_lifecycle

Defines routes for handling HTTP requests in a Phoenix application. It maps HTTP verbs and paths to controller actions. This example shows how to add a new route for '/hello'.

```elixir
defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {HelloWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/hello", HelloController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloWeb do
  #   pipe_through :api
  # end

  # ...
end
```

--------------------------------

### Reading Parameters and Session in LiveView Mount

Source: https://hexdocs.pm/phoenix/_live_view

Demonstrates how to access URL parameters and session data within the `mount` callback of a LiveView. It shows how to retrieve house names from parameters and user IDs from the session to fetch data. This is useful for initializing LiveView state based on contextual information.

```elixir
def mount(%{"house" => house}, _session, socket) do
  temperature = Thermostat.get_house_reading(house)
  {:ok, assign(socket, :temperature, temperature)}
end
```

```elixir
def mount(_params, %{"current_user_id" => user_id}, socket) do
  temperature = Thermostat.get_user_reading(user_id)
  {:ok, assign(socket, :temperature, temperature)}
end
```

```elixir
def mount(%{"house" => house}, %{"current_user_id" => user_id}, socket) do
  temperature = Thermostat.get_house_reading(user_id, house)
  {:ok, assign(socket, :temperature, temperature)}
end
```

--------------------------------

### Get Page Title

Source: https://hexdocs.pm/phoenix/_live_view/Phoenix

Retrieves the most recent title set via a `page_title` assign. Typically used after an action that updates the page title.

```elixir
render_click(view, :event_that_triggers_page_title_update)
assert page_title(view) =~ "my title"
```

--------------------------------

### LiveView URL Decoding Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Ensures that URLs are correctly decoded after being split. This prevents potential issues with malformed URLs being processed.

```elixir
Make sure URLs are decoded after they are split
```

--------------------------------

### LiveSocket Configuration for Click Event Metadata

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/bindings

Demonstrates how to configure `LiveSocket` in JavaScript to include custom metadata with click events sent to the server. This example captures mouse coordinates and the state of the Alt key.

```javascript
let liveSocket = new LiveSocket("/live", Socket, {
  params: {_csrf_token: csrfToken},
  metadata: {
    click: (e, el) => {
      return {
        altKey: e.altKey,
        clientX: e.clientX,
        clientY: e.clientY
      }
    }
  }
})
```

--------------------------------

### Set Phoenix Plug Initialization Mode (Elixir)

Source: https://hexdocs.pm/phoenix/Phoenix

Explains how to set the `:plug_init_mode` to control when Phoenix plugs are initialized. It recommends `:runtime` for development and `:compile` for production, passing the option to `Plug.Builder.compile/3`.

```elixir
config :phoenix, :plug_init_mode, :runtime
# or
config :phoenix, :plug_init_mode, :compile
```

--------------------------------

### Build Phoenix Application Dependencies and Assets

Source: https://hexdocs.pm/phoenix/1.7.14/releases

This section shows the commands to fetch production dependencies, compile the Elixir code, and deploy assets for a Phoenix application in a production environment. It utilizes `mix deps.get` and `mix assets.deploy` with the `prod` environment.

```shell
# Initial setup
$ mix deps.get --only prod
$ MIX_ENV=prod mix compile

# Compile assets
$ MIX_ENV=prod mix assets.deploy
```

--------------------------------

### Test LiveView Component Rendering

Source: https://hexdocs.pm/phoenix/_live_view/Phoenix

This example demonstrates how to test the rendering of a Phoenix LiveView component in a test environment. It uses `Phoenix.Component` and `Phoenix.LiveViewTest` to assign values and assert the rendered output.

```elixir
import Phoenix.Component
import Phoenix.LiveViewTest

test "greets" do
  assigns = %{}
  assert rendered_to_string(~H'''
         <MyComponents.greet name="Mary" />
         ''') ==
           "<div>Hello, Mary!</div>"
end
```

--------------------------------

### Subscription and Configuration

Source: https://hexdocs.pm/phoenix/_pubsub/index

Functions for subscribing to topics and configuring the PubSub system.

```APIDOC
## POST /subscribe

### Description
Subscribes the caller to a PubSub adapter's topic.

### Method
POST

### Endpoint
/subscribe

### Parameters
#### Request Body
- **pubsub** (string) - Required - The name of the pubsub system
- **topic** (string) - Required - The topic to subscribe to, for example: "users:123"
- **opts** (keyword) - Optional - A list of options

### Request Example
```json
{
  "pubsub": "my_pubsub",
  "topic": "users:123",
  "opts": {"strategy": "all"}
}
```

### Response
#### Success Response (200)
- **status** (string) - Indicates success, e.g., ":ok"

#### Response Example
```json
{
  "status": ":ok"
}
```

---

## POST /child_spec

### Description
Returns a child specification for pubsub with the given options.

### Method
POST

### Endpoint
/child_spec

### Parameters
#### Request Body
- **options** (keyword) - Required - Options for the pubsub child specification
  - **:name** (atom) - Required - The name of the pubsub to be started
  - **:adapter** (module) - Optional - The adapter to use (defaults to `Phoenix.PubSub.PG2`)
  - **:pool_size** (integer) - Optional - Number of pubsub partitions to launch

### Request Example
```json
{
  "options": {
    "name": :my_pubsub,
    "adapter": Phoenix.PubSub.PG2,
    "pool_size": 4
  }
}
```

### Response
#### Success Response (200)
- **child_spec** (map) - The supervisor child specification for the pubsub

#### Response Example
```json
{
  "child_spec": {
    "id": :my_pubsub,
    "start": {Phoenix.PubSub, :start_link, [[:my_pubsub, [adapter: Phoenix.PubSub.PG2, pool_size: 4]]]}
  }
}
```

---

## GET /node_name

### Description
Returns the node name of the PubSub server.

### Method
GET

### Endpoint
/node_name

### Parameters
#### Query Parameters
- **pubsub** (string) - Required - The name of the pubsub system

### Request Example
```json
{
  "pubsub": "my_pubsub"
}
```

### Response
#### Success Response (200)
- **node_name** (string) - The name of the current node

#### Response Example
```json
{
  "node_name": "my_node@host"
}
```
```

--------------------------------

### LiveView Phx-Capture-Click Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes `phx-capture-click` triggering on mouseup during text selection. This prevents unintended click events during text selection.

```elixir
Fix `phx-capture-click` triggering on mouseup during text selection
```

--------------------------------

### Compiling with All Warnings Enabled

Source: https://hexdocs.pm/phoenix/1.7.17/Phoenix

Command to compile the project while showing all previously issued compiler warnings, including those from `Phoenix.VerifiedRoutes`. Useful for identifying and fixing route verification issues.

```bash
$ mix compile --all-warnings
```

--------------------------------

### Fix Phoenix.LiveView.Debug.live_components/1 error tuple

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Corrects `Phoenix.LiveView.Debug.live_components/1` to return an error tuple instead of raising an exception. This provides more graceful error handling during debugging.

```elixir
iex(1)> Phoenix.LiveView.Debug.live_components(socket)
# Should now return an error tuple {:error, reason} instead of raising.
```

--------------------------------

### Add Resource Route to Router

Source: https://hexdocs.pm/phoenix/1.7.14/testing

Shows how to add a generated resource route to the `lib/hello_web/router.ex` file. This step is necessary for the newly generated controllers and views to be accessible via web requests.

```elixir
resources "/posts", PostController
```

--------------------------------

### LiveView Variable Tainting

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Allows variables inside do-blocks to be tainted. This relates to security and variable scoping within LiveView templates.

```elixir
Allow variables inside do-blocks to be tainted
```

--------------------------------

### Add MetricsStorage to Application Children

Source: https://hexdocs.pm/phoenix/_live_dashboard/metrics_history

Include the 'MyAppWeb.MetricsStorage' module in your Application's children list in 'mix.exs' to ensure it starts when the application boots. Initialize it with the metrics you want to track, such as those defined in 'MyAppWeb.Telemetry.metrics/0'.

```elixir
  # Start genserver to store transient metrics
  {MyAppWeb.MetricsStorage, MyAppWeb.Telemetry.metrics()},

```

--------------------------------

### LiveView Form Recovery Condition

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Prevents form recovery from being attempted when there are no inputs. This avoids unnecessary recovery attempts for empty forms.

```elixir
Do not recover forms without inputs
```

--------------------------------

### connect/1

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/Phoenix.Socket

Connects to the socket, handling authorization and initial state setup. The transport provides metadata, and the socket returns the connection state or an error.

```APIDOC
## connect(transport_info)

### Description
Connects to the socket. The transport passes a map of metadata and the socket returns `{:ok, state}`, `{:error, reason}` or `:error`. The state must be stored by the transport and returned in all future operations. When `{:error, reason}` is returned, some transports - such as WebSockets - allow customizing the response based on `reason` via a custom `:error_handler`.

### Method
`connect/1`

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```elixir
# Example transport_info map:
%{endpoint: MyApp.Endpoint, transport: Phoenix.Transports.WebSocket, params: %{"token" => "abc"}, options: [serializer: Phoenix.Transports.JSON]}} 
```

### Response
#### Success Response (200)
- `{:ok, state}`: Successfully connected, `state` is the socket's state.
- `{:error, reason}`: Connection failed with a given reason.
- `:error`: A generic error indicating connection failure.

#### Response Example
```elixir
# Example success response:
{:ok, %{user_id: 123, session_id: "xyz"}}

# Example error response:
{:error, :unauthorized}
```
```

--------------------------------

### Create Ecto Database

Source: https://hexdocs.pm/phoenix/1.7.14/ecto

Initializes the Ecto database for the Phoenix project using the configured connection settings. This command creates the database if it does not already exist, preparing it for migrations and data storage.

```bash
$ mix ecto.createcopy
```

--------------------------------

### Get online replica elements in Phoenix.Tracker.State

Source: https://hexdocs.pm/phoenix/_pubsub/1.1.2/Phoenix.Tracker

Returns a list of all elements currently associated with online replicas in the set. This function is useful for monitoring active connections or data.

```elixir
online_list(state) :: [value()]
```

--------------------------------

### Selective Resource Routes with :except

Source: https://hexdocs.pm/phoenix/routing

Illustrates how to use the `:except` option with the `resources` macro to exclude specific actions from the generated routes, using '/comments' as an example (excluding delete).

```APIDOC
## GET /comments

### Description
Retrieves a list of all comments.

### Method
GET

### Endpoint
/comments

### Parameters

### Request Example
(No request body for GET requests)

### Response
#### Success Response (200)
- **comments** (array) - A list of comment objects.

#### Response Example
```json
{
  "comments": [
    {
      "id": 1,
      "body": "Great post!"
    }
  ]
}
```

## GET /comments/:id/edit

### Description
Retrieves a specific comment by ID and presents a form for editing.

### Method
GET

### Endpoint
/comments/:id/edit

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the comment.

### Request Example
(No request body for GET requests)

### Response
#### Success Response (200)
- **comment** (object) - The comment object to be edited.

#### Response Example
```json
{
  "comment": {
    "id": 1,
    "body": "Great post!"
  }
}
```

## GET /comments/new

### Description
Presents a form for creating a new comment.

### Method
GET

### Endpoint
/comments/new

### Parameters

### Request Example
(No request body for GET requests)

### Response
#### Success Response (200)
- **form** (object) - Represents the form for creating a new comment.

#### Response Example
```json
{
  "form": {}
}
```

## GET /comments/:id

### Description
Retrieves a specific comment by ID.

### Method
GET

### Endpoint
/comments/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the comment.

### Request Example
(No request body for GET requests)

### Response
#### Success Response (200)
- **comment** (object) - The requested comment object.

#### Response Example
```json
{
  "comment": {
    "id": 1,
    "body": "Great post!"
  }
}
```

## POST /comments

### Description
Creates a new comment.

### Method
POST

### Endpoint
/comments

### Parameters
#### Request Body
- **body** (string) - Required - The content of the comment.

### Request Example
```json
{
  "body": "This is a new comment."
}
```

### Response
#### Success Response (201)
- **comment** (object) - The newly created comment object.

#### Response Example
```json
{
  "comment": {
    "id": 2,
    "body": "This is a new comment."
  }
}
```

## PATCH /comments/:id

### Description
Updates an existing comment.

### Method
PATCH

### Endpoint
/comments/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the comment to update.
#### Request Body
- **body** (string) - Optional - The updated content of the comment.

### Request Example
```json
{
  "body": "Updated comment content."
}
```

### Response
#### Success Response (200)
- **comment** (object) - The updated comment object.

#### Response Example
```json
{
  "comment": {
    "id": 2,
    "body": "Updated comment content."
  }
}
```

## PUT /comments/:id

### Description
Updates an existing comment (identical to PATCH).

### Method
PUT

### Endpoint
/comments/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the comment to update.
#### Request Body
- **body** (string) - Optional - The updated content of the comment.

### Request Example
```json
{
  "body": "Updated comment content."
}
```

### Response
#### Success Response (200)
- **comment** (object) - The updated comment object.

#### Response Example
```json
{
  "comment": {
    "id": 2,
    "body": "Updated comment content."
  }
}
```
```

--------------------------------

### Building a Phoenix Release Package

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/releases

Assembles the production release for a Phoenix application using `mix release`. This command packages the application, its dependencies, and the Erlang VM into a deployable artifact.

```shell
echo "$ " MIX_ENV=prod mix release
Generated my_app app
* assembling my_app-0.1.0 on MIX_ENV=prod
* using config/runtime.exs to configure the release at runtime

Release created at _build/prod/rel/my_app!

    # To start your system
    _build/prod/rel/my_app/bin/my_app start
```

--------------------------------

### Add Repo to Supervision Tree (Elixir)

Source: https://hexdocs.pm/phoenix/1.7.17/mix_tasks

This Elixir code demonstrates how to add a newly generated Ecto repository to the application's supervision tree, typically found in `lib/your_app/application.ex`. This ensures the repository is started when the application launches.

```elixir
children = [
  Hello.Repo,
  # Our custom repo
  OurCustom.Repo,
  # Start the endpoint when the application starts
  HelloWeb.Endpoint,
]

```

--------------------------------

### HTTP POST Request Example

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/security

Demonstrates the raw HTTP POST request generated by the HTML form. This format is what a server receives when the form is submitted.

```http
POST /posts HTTP/1.1
Host: example.com
Content-Type: application/x-www-form-urlencoded
Content-Length: 53

post[title]=My+Title&post[body]=This+is+the+body
```

--------------------------------

### Get LiveView Socket Assigns - Elixir

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/Phoenix.LiveView

Retrieves the assigns associated with a Phoenix.LiveView.Socket. Assigns are key-value pairs used to pass data between the server and the client in LiveView.

```elixir
assigns() :: map() | Phoenix.LiveView.Socket.AssignsNotInSocket.t()
```

--------------------------------

### LiveView Reload Jitter Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes a bug causing reload with jitter on timeout from a previously closed channel. This improves the stability of connections.

```elixir
Fix bug causing reload with jitter on timeout from previously closed channel
```

--------------------------------

### LiveView Phx-Trigger-Action Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes `phx_trigger_action` submitting the form before the DOM updates are complete. This prevents race conditions related to form submissions.

```elixir
Fix `phx_trigger_action` submitting the form before the DOM updates are complete
```

--------------------------------

### Render Template to String (Elixir)

Source: https://hexdocs.pm/phoenix/_template/1.0.4/Phoenix

Renders a template from a given module and returns the result as a string. This function is a convenient way to get the final rendered output as a single string.

```elixir
@spec render_to_string(module, template, format, assign) :: String.t()
```

--------------------------------

### Get LiveView Page Title

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/Phoenix

Retrieves the most recently set page title from a LiveView's assigns. This is typically updated via a `page_title` assign.

```elixir
page_title(view)
```

--------------------------------

### LiveView Test Phx-Update Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes a failure in `Phoenix.LiveViewTest` when `phx-update` has non-HTML nodes as children. This improves the reliability of testing DOM updates.

```elixir
Fix failure in `Phoenix.LiveViewTest` when `phx-update` has non-HTML nodes as children
```

--------------------------------

### Initialize Git Repository

Source: https://hexdocs.pm/phoenix/1.7.17/heroku

Initializes a local Git repository and stages all project files for the initial commit. This is a prerequisite for deploying to Heroku, which utilizes Git for deployments.

```shell
$ git init
$ git add .
$ git commit -m "Initial commit"
```

--------------------------------

### LiveView External Redirect Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes `redirect(socket, external: ...)` when returned from an event. This ensures that external redirects function correctly.

```elixir
Fix `redirect(socket, external: ...)` when returned from an event
```

--------------------------------

### Add Telemetry Module to Application Supervisor

Source: https://hexdocs.pm/phoenix/_live_dashboard/metrics

Instructs on how to integrate the newly defined 'MyAppWeb.Telemetry' module into the main application's supervision tree, typically found in 'lib/my_app/application.ex'. This ensures the telemetry supervisor starts with the application.

```elixir
children = [
  MyApp.Repo,
  MyAppWeb.Telemetry,
  MyAppWeb.Endpoint,
  ...
]
```

--------------------------------

### Compile Application and Verify Task

Source: https://hexdocs.pm/phoenix/1.7.14/mix_tasks

Compiles the Phoenix application, making the newly defined Mix task available. The `mix help --search` command can then be used to find and verify the task's presence and its short documentation.

```bash
$ mix compile
Compiled lib/tasks/hello.greeting.ex
Generated hello.app
```

```bash
$ mix help --search hello
mix hello.greeting # Sends a greeting to us from Hello Phoenix
```

--------------------------------

### Socket Initialization and Options

Source: https://hexdocs.pm/phoenix/1.4.16/js/index

Details on how to initialize a new Socket connection, including available configuration options.

```APIDOC
## Socket

### Description
Initializes the Socket for WebSocket communication. For IE8 support, an ES5-shim is recommended.

### Constructor
`new Socket(endPoint: string, opts: Object?)`

### Parameters
#### Path Parameters
- **endPoint** (string) - The string WebSocket endpoint, e.g., `"ws://example.com/socket"`, `"wss://example.com"`, or `"/socket"` (uses inherited host & protocol).
- **opts** (Object?) - Optional configuration object. Defaults to `{}`.

#### Request Body (opts object)
- **opts.transport** (string?) - The WebSocket transport. Defaults to `WebSocket` with automatic `LongPoll` fallback.
- **opts.encode** (Function?) - The function to encode outgoing messages. Defaults to JSON encoder.
- **opts.decode** (Function?) - The function to decode incoming messages. Defaults to JSON parser.
- **opts.timeout** (number?) - The default timeout in milliseconds to trigger push timeouts. Defaults to `DEFAULT_TIMEOUT`.
- **opts.heartbeatIntervalMs** (number?) - The millisecond interval to send a heartbeat message.
- **opts.reconnectAfterMs** (number?) - An optional function that returns the millisecond socket reconnect interval. Defaults to a stepped backoff function.
- **opts.rejoinAfterMs** (number?) - An optional function that returns the millisecond rejoin interval for individual channels. Defaults to a stepped backoff function.
- **opts.logger** (Function?) - An optional function for specialized logging.
- **opts.longpollerTimeout** (number?) - The maximum timeout of a long poll AJAX request. Defaults to 20 seconds.
- **opts.binaryType** (string?) - The binary type to use for binary WebSocket frames. Defaults to `"arraybuffer"`.
- **opts.vsn** (vsn?) - The serializer's protocol version to send on connect. Defaults to `DEFAULT_VSN`.

### Request Example
```javascript
// Basic initialization
const socket = new Socket("/socket")

// With options
const socketWithOptions = new Socket("/socket", {
  transport: WebSocket,
  heartbeatIntervalMs: 30000
})
```

### Response
N/A (Constructor does not return a value, but initializes an instance).
```

--------------------------------

### Building the Production Release Package

Source: https://hexdocs.pm/phoenix/releases

Assembles the final production release package for the Phoenix application. This command bundles the application code, dependencies, and Erlang VM into a deployable artifact.

```shell
$ MIX_ENV=prod mix release
Generated my_app app
* assembling my_app-0.1.0 on MIX_ENV=prod
* using config/runtime.exs to configure the release at runtime

Release created at _build/prod/rel/my_app!
```

--------------------------------

### Render a LiveComponent in LiveView

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/welcome

LiveComponents, a mechanism for compartmentalizing state, markup, and events, are rendered using the `live_component/1` function. They possess their own callbacks and state, operating within the parent LiveView's process.

```elixir
<.live_component module={UserComponent} id={user.id} user={user} />
```

--------------------------------

### Phoenix Blog Context Test Structure

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/testing_contexts

This Elixir code defines a test suite for the 'posts' functionality within the 'Hello.Blog' context. It utilizes `Hello.DataCase` for database testing and `Hello.BlogFixtures` for creating test data. The `describe` block groups related tests, and specific tests for listing and creating posts are included.

```elixir
defmodule Hello.BlogTest do
  use Hello.DataCase

  alias Hello.Blog

  describe "posts" do
    alias Hello.Blog.Post

    import Hello.BlogFixtures

    @invalid_attrs %{body: nil, title: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Blog.list_posts() == [post]
    end

    ...
  end
```

--------------------------------

### Configure libcluster Runtime Settings

Source: https://hexdocs.pm/phoenix/1.7.17/fly

This configuration snippet sets up libcluster's runtime behavior, specifically the 'fly6pn' topology using the DNSPoll strategy. It dynamically fetches the FLY_APP_NAME and configures polling intervals and query parameters for discovering nodes on the internal Fly.io network.

```elixir
app_name =
  System.get_env("FLY_APP_NAME") ||
    raise "FLY_APP_NAME not available"

config :libcluster,
  topologies: [
    fly6pn: [
      strategy: Cluster.Strategy.DNSPoll,
      config: [
        polling_interval: 5_000,
        query: "#{app_name}.internal",
        node_basename: app_name
      ]
    ]
  ]
```

--------------------------------

### LiveView Test Children Patching Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes `LiveViewTest` failing to patch children properly for append/prepend based `phx-update`'s. This improves testing of DOM manipulation.

```elixir
Fix `LiveViewTest` failing to patch children properly for append/prepend based phx-update's
```

--------------------------------

### Run Ecto Database Migrations

Source: https://hexdocs.pm/phoenix/1.7.14/contexts

Executes pending Ecto database migrations to create or update tables and indexes. This command is essential for setting up the database schema required by the application. It does not take any input arguments and provides output indicating the migration process.

```shell
$ mix ecto.migrate

16:59:51.941 [info] == Running 20210205203342 Hello.Repo.Migrations.CreateCarts.change/0 forward

16:59:51.945 [info] create table carts

16:59:51.949 [info] create index carts_user_uuid_index

16:59:51.952 [info] == Migrated 20210205203342 in 0.0s

16:59:51.988 [info] == Running 20210205213410 Hello.Repo.Migrations.CreateCartItems.change/0 forward

16:59:51.988 [info] create table cart_items

16:59:51.998 [info] create index cart_items_cart_id_index

16:59:52.000 [info] create index cart_items_product_id_index

16:59:52.001 [info] create index cart_items_cart_id_product_id_index

16:59:52.002 [info] == Migrated 20210205213410 in 0.0s
```

--------------------------------

### LiveView Textarea Submit Disable Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes `<textarea>` elements failing to be disabled on form submit. This ensures consistent form behavior.

```elixir
Fix `<textarea>`'s failing to be disabled on form submit
```

--------------------------------

### Integrate Telemetry Supervisor into Application

Source: https://hexdocs.pm/phoenix/1.7.14/telemetry

Adds the Telemetry supervisor to the main application's supervision tree. This ensures that the Telemetry processes are started and managed correctly when the application boots.

```elixir
children = [
  MyAppWeb.Telemetry,
  MyApp.Repo,
  MyAppWeb.Endpoint,
  ...
]
```

--------------------------------

### LiveView Compile Warning File Display

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Displays the file name on compile warnings for `~L` (Live EEx sigil). This helps in locating the source of warnings.

```elixir
Display file on compile warning for `~L`
```

--------------------------------

### LiveView Change Tracking Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes change tracking when passing a do-block to components. This ensures accurate state management for components using do-blocks.

```elixir
Fix change tracking when passing a do-block to components
```

--------------------------------

### Run Phoenix Application Tests

Source: https://hexdocs.pm/phoenix/testing

Command to execute all tests within a Phoenix project. This command uses Mix, the build tool for Elixir, to discover and run tests. It outputs test results, including the number of tests run and any failures.

```bash
$ mix test
....

Finished in 0.09 seconds
5 tests, 0 failures

Randomized with seed 652656
```

--------------------------------

### LiveView Focused Input Patch Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes an issue where focused inputs were being overwritten by latent patches. This ensures that user focus is maintained during updates.

```elixir
Fix focused inputs being overwritten by latent patch
```

--------------------------------

### Get LiveView Children

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/Phoenix

Returns a list of the current LiveView children associated with a given `parent` LiveView. This is useful for inspecting the LiveView's component structure.

```elixir
live_children(parent)
```

--------------------------------

### Phoenix LiveView JavaScript Hook Definition

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/html-attrs

Provides the JavaScript code for defining a custom client hook named 'Example' for Phoenix LiveView. This hook includes lifecycle callbacks like `mounted`, `updated`, and `destroyed`, and a custom helper to append events.

```javascript
let Hooks = {}
Hooks.Example = {
  // Callbacks
  mounted()      { this.appendEvent("Mounted") },
  beforeUpdate() { this.appendEvent("Before Update") },
  updated()      { this.appendEvent("Updated") },
  destroyed()    { this.appendEvent("Destroyed") },
  disconnected() { this.appendEvent("Disconnected") },
  reconnected()  { this.appendEvent("Reconnected") },

  // Custom Helper
  appendEvent(name) {
    console.log(name)
    let li = document.createElement("li")
    li.innerText = name
    this.el.querySelector("#example-events").appendChild(li)
  }
}

let liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks})
```

--------------------------------

### Phoenix Controller Nested Logic (Pre-Plug Refactoring)

Source: https://hexdocs.pm/phoenix/plug

Illustrates a non-Plug approach to handling request logic within a Phoenix controller, showing nested case statements and if conditions for authentication, message fetching, and authorization. This example highlights the complexity that plugs aim to simplify.

```elixir
defmodule HelloWeb.MessageController do
  use HelloWeb, :controller

  def show(conn, params) do
    case Authenticator.find_user(conn) do
      {:ok, user} ->
        case find_message(params["id"]) do
          nil ->
            conn |> put_flash(:info, "That message wasn't found") |> redirect(to: ~p"/")
          message ->
            if Authorizer.can_access?(user, message) do
              render(conn, :show, page: message)
            else
              conn |> put_flash(:info, "You can't access that page") |> redirect(to: ~p"/")
            end
        end
      :error ->
        conn |> put_flash(:info, "You must be logged in") |> redirect(to: ~p"/")
    end
  end
end
```

--------------------------------

### LiveView Push Redirect Timeout Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes a timeout on the client caused by `push_redirect` when used incorrectly. This ensures smoother navigation and prevents client-side hangs.

```elixir
Fix `push_redirect` back causing timeout on the client
```

--------------------------------

### Ecto Repository Module Definition (Postgres)

Source: https://hexdocs.pm/phoenix/1.7.14/directory_structure

This Elixir code defines the `Hello.Repo` module, which serves as the primary interface to the application's database. It uses `Ecto.Repo` and is configured for the `:hello` OTP application with `Ecto.Adapters.Postgres` as the database adapter.

```elixir
defmodule Hello.Repo do
  use Ecto.Repo,
    otp_app: :hello,
    adapter: Ecto.Adapters.Postgres
end

```

--------------------------------

### Create Phoenix Telemetry Supervisor

Source: https://hexdocs.pm/phoenix/1.7.14/telemetry

Defines the Telemetry supervisor for a Phoenix application. This module manages Telemetry processes, defines metrics to be captured, and can start periodic measurements.

```elixir
# lib/my_app_web/telemetry.ex
defmodule MyAppWeb.Telemetry do
  use Supervisor
  import Telemetry.Metrics

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      {:telemetry_poller, measurements: periodic_measurements(), period: 10_000}
      # Add reporters as children of your supervision tree.
      # {Telemetry.Metrics.ConsoleReporter, metrics: metrics()}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  def metrics do
    [
      # Phoenix Metrics
      summary("phoenix.endpoint.stop.duration",
        unit: {:native, :millisecond}
      ),
      summary("phoenix.router_dispatch.stop.duration",
        tags: [:route],
        unit: {:native, :millisecond}
      ),
      # VM Metrics
      summary("vm.memory.total", unit: {:byte, :kilobyte}),
      summary("vm.total_run_queue_lengths.total"),
      summary("vm.total_run_queue_lengths.cpu"),
      summary("vm.total_run_queue_lengths.io")
    ]
  end

  defp periodic_measurements do
    [
      # A module, function and arguments to be invoked periodically.
      # This function must call :telemetry.execute/3 and a metric must be added above.
      # {MyApp, :count_users, []}
    ]
  end
end
```

--------------------------------

### LiveView Server Crash Recovery

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes the page becoming unresponsive when the server crashes while handling a live patch. This ensures better resilience to server errors.

```elixir
Fix page becoming unresponsive when the server crashes while handling a live patch
```

--------------------------------

### Phoenix Tracker Update Examples

Source: https://hexdocs.pm/phoenix/_pubsub/1.1.2/Phoenix

Demonstrates how to update user statistics using Phoenix.Tracker.update. It shows updating with a static value and with a function that modifies existing metadata. Assumes MyTracker and u.id are defined.

```elixir
iex> Phoenix.Tracker.update(MyTracker, self(), "lobby", u.id, %{stat: "zzz"})
{:ok, "1WpAofWYIAA="}

iex> Phoenix.Tracker.update(MyTracker, self(), "lobby", u.id, fn meta -> Map.put(meta, :away, true) end)
{:ok, "1WpAofWYIAA="}
```

--------------------------------

### drainer_spec/1

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/Phoenix.Socket

Returns an optional child specification for terminating the socket gracefully during application shutdown. This process is started late in the supervision tree to drain connections.

```APIDOC
## drainer_spec(keyword)

### Description
Returns a child specification for terminating the socket. This is a process that is started late in the supervision tree with the specific goal of draining connections on application shutdown. Similar to `child_spec/1`, it receives the socket options from the endpoint.

### Method
`drainer_spec/1`

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```elixir
# Example configuration in endpoint:
socket "/my_app", MyApp.Socket, shutdown: 5000

# This implies drainer_spec([shutdown: 5000]) will be invoked.
```

### Response
#### Success Response (200)
- `:supervisor.child_spec()`: A supervisor child specification for the drainer process.
- `:ignore`: Indicates no drainer spec is necessary for this socket.

#### Response Example
```elixir
# Example return value:
{:ok, %{id: :my_socket_drainer, start: {MyApp.SocketDrainer, :start_link, []}}}
```

--------------------------------

### LiveView Test Nested Component Deletion

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Properly tracks nested components on deletion within `Phoenix.LiveViewTest`. This ensures accurate state management during testing.

```elixir
Properly track nested components on deletion on `Phoenix.LiveViewTest`
```

--------------------------------

### Phoenix JSON View Module Definition

Source: https://hexdocs.pm/phoenix/1.7.17/controllers

Defines a Phoenix view module for rendering JSON responses. The `home/1` function returns a map that will be automatically serialized to JSON by Phoenix.

```elixir
defmodule HelloWeb.PageJSON do
  def home(_assigns) do
    %{message: "this is some JSON"}
  end
end
```

--------------------------------

### Inspect Schema Migrations Table

Source: https://hexdocs.pm/phoenix/ecto

Queries the `schema_migrations` table in the PostgreSQL database to view the history of applied migrations. This table stores the version (timestamp) of each migration that has been successfully executed.

```sql
hello_dev=# select * from schema_migrations;
 version        |     inserted_at
---------------+---------------------
 20250317170448 | 2025-03-17 21:07:26
 20250318001628 | 2025-03-18 01:45:00
(2 rows)

```

--------------------------------

### Phoenix LiveView handle_params example

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/deployments

Illustrates how to handle URL parameters in Phoenix LiveView using `handle_params/3`. This function is invoked when URL parameters change, allowing for dynamic state updates based on the URL, such as selecting a tab. This approach reduces server state and makes navigation shareable.

```elixir
defmodule MyAppWeb.MyLive do
  use MyAppWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _url, socket) do
    tab = Map.get(params, "tab", "home")
    {:noreply, assign(socket, :tab, tab)}
  end
end
```

--------------------------------

### LiveView Textarea Patch Focus Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes a `<textarea>` being patched by LiveView while focused. This ensures that user focus is maintained when the textarea content is updated.

```elixir
Fix `<textarea>` being patched by LiveView while focused
```

--------------------------------

### HEEx Layout Component Definition

Source: https://hexdocs.pm/phoenix/components

Illustrates the definition of a layout component in Phoenix using the `~H` sigil. This component is designed to wrap other content, as shown in the example for `Layouts.app`.

```heex
def app(assigns) do
  ~H"""
  <header class="navbar px-4 sm:px-6 lg:px-8">
  ...
  </header>
  """
end
```

--------------------------------

### Plug.Upload Struct Example in Elixir

Source: https://hexdocs.pm/phoenix/1.7.17/file_uploads

Illustrates the structure of a `Plug.Upload` struct as it appears in the development logs. This struct contains details about the uploaded file, such as its content type, original filename, and the temporary path where Plug has stored it.

```elixir
%Plug.Upload{content_type: "image/png", filename: "meta-cover.png", path: "/var/folders/_6/xbsnn7tx6g9dblyx149nrvbw0000gn/T//plug-1434/multipart-558399-917557-1"}
```

--------------------------------

### Referencing Static Images in CSS

Source: https://hexdocs.pm/phoenix/asset_management

Provides an example of referencing a static image within a CSS file. It highlights a potential `esbuild` error if the path is not resolved and explains the solution.

```css
body {
  background-image: url(/images/bg.png);
}

```

--------------------------------

### Phoenix LiveView Link Patch example

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/deployments

Shows how to use the `<.link patch={...}>` component in Phoenix LiveView for client-side navigation without a full page reload. This is recommended for managing states like tabs, as it updates the URL and triggers `handle_params/3` on the server, reducing server-side state management.

```heex
<Heex.sigil_p patch={~s"/?tab=home"}>Home</Heex.sigil_p>
<.link patch={~s"/?tab=about"}>About</.link>
<.link patch={~s"/?tab=contact"}>Contact</.link>
```

--------------------------------

### Phoenix View Test Case in Elixir

Source: https://hexdocs.pm/phoenix/1.7.14/testing

An example of a view test case in Elixir using Phoenix. It inherits from HelloWeb.ConnCase and imports Phoenix.Template to use the render_to_string/4 function for testing view rendering. This allows for direct string comparison of rendered output.

```elixir
defmodule HelloWeb.ErrorHTMLTest do
  use HelloWeb.ConnCase, async: true

  # Bring render_to_string/4 for testing custom views
  import Phoenix.Template

  test "renders 404.html" do
    assert render_to_string(HelloWeb.ErrorHTML, "404", "html", []) == "Not Found"
  end

  test "renders 500.html" do
    assert render_to_string(HelloWeb.ErrorHTML, "500", "html", []) == "Internal Server Error"
  end
end
```

--------------------------------

### Animate Element on Mount using JS

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/bindings

Shows how to use the `phx-mounted` binding to execute a `Phoenix.LiveView.JS` command when an element is added to the DOM. This example applies a CSS animation class upon mounting.

```html
<div phx-mounted={JS.transition("animate-ping", time: 500)}>
  Content that animates on mount
</div>
```

--------------------------------

### Fetch All User Records using Repo.all/1 in Elixir

Source: https://hexdocs.pm/phoenix/1.7.17/ecto

Illustrates how to retrieve all records of a specific schema (User in this case) from the database using `Repo.all/1`. It displays the SQL query executed and the resulting Elixir data structures mapped from the database rows.

```Elixir
iex> Repo.all(User)
[debug] QUERY OK source="users" db=5.8ms queue=1.4ms idle=1672.0ms
SELECT u0."id", u0."bio", u0."email", u0."name", u0."number_of_pets", u0."inserted_at", u0."updated_at" FROM "users" AS u0 []
[
  %Hello.User{
    __meta__: #Ecto.Schema.Metadata<:loaded, "users">
    bio: nil,
    email: "user1@example.com",
    id: 1,
    inserted_at: ~N[2021-02-25 01:58:55],
    name: nil,
    number_of_pets: nil,
    updated_at: ~N[2021-02-25 01:58:55]
  },
  %Hello.User{
    __meta__: #Ecto.Schema.Metadata<:loaded, "users">
    bio: nil,
    email: "user2@example.com",
    id: 2,
    inserted_at: ~N[2021-02-25 02:03:28],
    name: nil,
    number_of_pets: nil,
    updated_at: ~N[2021-02-25 02:03:28]
  }
]
```

--------------------------------

### Add igniter upgrader for LiveView 1.0 to 1.1

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Introduces an `igniter` upgrader to facilitate the transition from LiveView 1.0 to 1.1. This command-line tool simplifies the dependency and code updates required for migration.

```bash
mix igniter.upgrade phoenix_live_view@1.1.0-rc.3

# Or for applying upgrades after dependency update:
mix igniter.apply_upgrades phoenix_live_view:1.0.0:1.1.0
```

--------------------------------

### Authenticate with Fly.io CLI

Source: https://hexdocs.pm/phoenix/1.7.14/fly

Commands to sign up for a new Fly.io account or log in to an existing one using the Fly.io CLI. Authentication is necessary before deploying applications.

```bash
$ fly auth signup
copy
```

```bash
$ flyctl auth login
copy
```

--------------------------------

### LiveView Scroll Position Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes scroll position issues when using back/forward navigation with `live_redirect`'s. This improves the user experience during navigation.

```elixir
Fix scroll position when using back/forward with `live_redirect`'s
```

--------------------------------

### Phoenix Project Directory Structure Overview

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/directory_structure

This snippet displays the typical top-level directory structure created when generating a new Phoenix application using `mix phx.new`. It serves as a visual guide to the project's organization.

```text
├── _build
├── assets
├── config
├── deps
├── lib
│   ├── hello
│   ├── hello.ex
│   ├── hello_web
│   └── hello_web.ex
├── priv
└── test

```

--------------------------------

### Phoenix Controller Action with Full Parameter Map

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/request_lifecycle

An alternative definition for a Phoenix controller action 'show'. This version uses a pattern match to bind both the 'messenger' parameter and the entire 'params' map, allowing access to all request parameters within the action.

```elixir
def show(conn, %{"messenger" => messenger} = params) do
  ...
end
```

--------------------------------

### Dockerfile for Elixir Release Runner Stage

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/releases

This Dockerfile defines the final runtime stage for an Elixir release. It uses a minimal Debian base image and installs necessary runtime dependencies like libstdc++6, openssl, and ncurses. This stage ensures only the compiled release artifacts and essential libraries are included in the production image.

```dockerfile
# start a new build stage so that the final image will only contain
# the compiled release and other runtime necessities
FROM ${RUNNER_IMAGE}

RUN apt-get update && \
  apt-get install -y --no-install-recommends libstdc++6 openssl libncurses5 locales ca-certificates \
  && rm -rf /var/lib/apt/lists/*
```

--------------------------------

### LiveComponent Rendering with HEEx Templates

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Explains the requirement for stateful LiveComponents (with an `:id`) to use HEEx templates (`~H` or `.heex`). LEEx templates (`~L` or `.leex`) are no longer supported to address bugs and improve client-side rendering efficiency.

```elixir
<%= live_component FormComponent, id: "form" %>
```

```elixir
<.live_component module={FormComponent} id="form" />
```

--------------------------------

### Add stream_async for asynchronous stream insertion

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Introduces `Phoenix.LiveView.stream_async/4` to asynchronously insert items into a stream. This enhances performance and user experience by allowing gradual updates to streams.

```elixir
def stream_async(view, stream_name, items, opts \\ \\ []) do
  # ... implementation for asynchronous stream insertion ...
end
```

--------------------------------

### Generate Live Resource with Context (Elixir)

Source: https://hexdocs.pm/phoenix/contexts

This command generates a new Live resource, including a schema and a context module, for managing 'Post' entities with 'title' and 'body' attributes. It automatically sets up the necessary files for database interaction and CRUD operations.

```bash
mix phx.gen.live Post posts title body:text
```

--------------------------------

### Phoenix Router Configuration

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Defines the router module, including pipelines for different request types (browser and API) and route scopes. Pipelines allow applying a set of plugs to various routes.

```elixir
defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {HelloWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloWeb do
  #   pipe_through :api
  # end
  # ...
end
```

--------------------------------

### Deprecation Warnings in Elixir

Source: https://hexdocs.pm/phoenix/_html/4.0.0/changelog

Deprecation warnings have been updated to point to the correct alternative functions. This guides developers towards the modern API and helps in migrating away from deprecated features smoothly.

```elixir
# Deprecated: Phoenix.HTML.old_function/1
# Use: Phoenix.HTML.new_function/1 instead
```

--------------------------------

### Get Format Encoder (Elixir)

Source: https://hexdocs.pm/phoenix/_template/1.0.4/Phoenix

Returns the specific Elixir module responsible for encoding a given template format (e.g., 'html', 'xml'). If no encoder is found for the format, it returns nil.

```elixir
@spec format_encoder(format :: String.t()) :: module() | nil
```

--------------------------------

### Add Repo to Supervision Tree in application.ex

Source: https://hexdocs.pm/phoenix/1.7.14/mix_tasks

After generating a new repository, it must be added to your application's supervision tree, typically defined in `lib/your_app/application.ex`. This ensures the repository starts and runs as part of your application.

```elixir
. . .
children = [
  Hello.Repo,
  # Our custom repo
  OurCustom.Repo,
  # Start the endpoint when the application starts
  HelloWeb.Endpoint,
]
. . .

```

--------------------------------

### Phoenix.Endpoint.SyncCodeReloadPlug: init/1 Callback

Source: https://hexdocs.pm/phoenix/1.7.17/Phoenix.Endpoint

Implements the `Plug.init/1` callback for Phoenix.Endpoint.SyncCodeReloadPlug. This function is responsible for initializing the plug with given arguments. It is part of the Plug specification for middleware in Phoenix applications.

```elixir
init(arg)
Callback implementation for `Plug.init/1`.
```

--------------------------------

### Generate HTML Context and Resources - Phoenix

Source: https://hexdocs.pm/phoenix/1.7.14/contexts

This command generates a context module, Ecto schema, controllers, templates, and tests for managing products. It sets up the basic CRUD operations for a product catalog and is designed for web interfaces.

```bash
mix phx.gen.html Catalog Product products title:string \
description:string price:decimal views:integer
```

--------------------------------

### Define a Basic Phoenix HTML View

Source: https://hexdocs.pm/phoenix/1.7.14/request_lifecycle

This code defines a new Phoenix HTML view module. It uses the `HelloWeb, :html` macro to set up the view for HTML rendering. This is the foundational step for creating presentation logic in Phoenix.

```elixir
defmodule HelloWeb.HelloHTML do
  use HelloWeb, :html
end
```

--------------------------------

### Configure Static Assets Serving in Phoenix Endpoint

Source: https://hexdocs.pm/phoenix/1.7.14/directory_structure

This snippet shows how Phoenix configures the serving of static assets using the Plug.Static plug within the endpoint.ex file. This setup allows the application to serve static files from the priv/static directory.

```Elixir
Plug.Static
```

--------------------------------

### Post-Generation Commands for mix phx.gen.auth

Source: https://hexdocs.pm/phoenix/1.7.17/mix_tasks

After running `mix phx.gen.auth`, you need to execute specific commands to update your project's dependencies and apply the generated database migrations. Finally, you can access the registration page to create an account.

```bash
mix deps.get

mix ecto.migrate

# Then visit "/users/register"
```

--------------------------------

### Handle Async Operations with assign_async, start_async, and AsyncResult in LiveView

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This enhancement introduces new features for declaratively handling asynchronous operations within LiveView and LiveComponents. It allows developers to manage async tasks more effectively, improving the responsiveness and user experience of applications. The `assign_async`, `start_async`, `<.async_result>`, and `AsyncResult` components facilitate this.

```elixir
assign_async(
  :my_data,
  fn -> fetch_data() |> then(fn {:ok, data} -> {:ok, data} end)
end
)

# In the template:
<.async_result for={@my_data} id="my-data">
  <:loading>
    Loading data...
  </:loading>
  <:ok result={data}>
    Data loaded: <%= inspect data %>
  </:ok>
  <:error reason={err}>
    Error loading data: <%= inspect err %>
  </:error>
</.async_result>
```

--------------------------------

### LiveView Push Event Cleanup Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes LiveView `push_event`'s not clearing up properly in components. This prevents leftover event data from causing issues.

```elixir
Fix LiveView `push_event`'s not clearing up in components
```

--------------------------------

### Dockerfile for Elixir Release Build Stage

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/releases

This Dockerfile defines the build stage for an Elixir release. It uses a Debian-based Elixir image to install build dependencies, fetch project dependencies, compile the Elixir code, and finally build the release artifact. It includes steps for setting environment variables and copying project files.

```dockerfile
# Find eligible builder and runner images on Docker Hub. We use Ubuntu/Debian
# instead of Alpine to avoid DNS resolution issues in production.
#
# https://hub.docker.com/r/hexpm/elixir/tags?page=1&name=ubuntu
# https://hub.docker.com/_/ubuntu?tab=tags
#
# This file is based on these images:
#
#   - https://hub.docker.com/r/hexpm/elixir/tags - for the build image
#   - https://hub.docker.com/_/debian?tab=tags&page=1&name=bullseye-20230612-slim - for the release image
#   - https://pkgs.org/ - resource for finding needed packages
#   - Ex: hexpm/elixir:1.15.8-erlang-25.3.2.15-debian-bookworm-20241016-slim
#
ARG ELIXIR_VERSION=1.15.8
ARG OTP_VERSION=25.3.2.15
ARG DEBIAN_VERSION=bookworm-20241016-slim

ARG BUILDER_IMAGE="hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"
ARG RUNNER_IMAGE="debian:${DEBIAN_VERSION}"

FROM ${BUILDER_IMAGE} AS builder

# install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends build-essential git \
    && rm -rf /var/lib/apt/lists/*

# prepare build dir
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ENV MIX_ENV="prod"

# install mix dependencies
COPY mix.exs mix.lock ./
RUN mix deps.get --only $MIX_ENV
RUN mkdir config

# copy compile-time config files before we compile dependencies
# to ensure any relevant config change will trigger the dependencies
# to be re-compiled.
COPY config/config.exs config/${MIX_ENV}.exs config/
RUN mix deps.compile

COPY priv priv

COPY lib lib

COPY assets assets

# compile assets
RUN mix assets.deploy

# Compile the release
RUN mix compile

# Changes to config/runtime.exs don't require recompiling the code
COPY config/runtime.exs config/

COPY rel rel
RUN mix release
```

--------------------------------

### Add Presence Module to Supervision Tree

Source: https://hexdocs.pm/phoenix/1.7.14/presence

Integrates the Phoenix Presence module into the application's supervision tree in `application.ex`. This ensures that the presence functionality is started and managed as part of the application's lifecycle.

```elixir
children = [
  ...
  HelloWeb.Presence,
]

```

--------------------------------

### Render Verified Route Links in Templates (Elixir)

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Shows how to use the ~p sigil within template components to generate links to specific routes. This ensures that links in templates are always in sync with router definitions.

```elixir
<.link href={~p"/"}>Welcome Page!</.link>
<.link href={~p"/comments"}>View Comments</.link>
```

--------------------------------

### Invoking Phoenix Release Commands

Source: https://hexdocs.pm/phoenix/releases

Example command to execute custom Elixir code, such as migration functions, within a Phoenix release. This is done by calling the 'eval' command on the release's executable.

```bash
$ _build/prod/rel/my_app/bin/my_app eval "MyApp.Release.migrate"
```

--------------------------------

### Generate Comment Routes with mix phx.routes

Source: https://hexdocs.pm/phoenix/1.7.14/routing

This output shows the routes generated for the `/comments` resource after excluding the `delete` action. It includes all default actions except for the DELETE route.

```shell
GET    /comments           HelloWeb.CommentController :index
GET    /comments/:id/edit  HelloWeb.CommentController :edit
GET    /comments/new       HelloWeb.CommentController :new
GET    /comments/:id       HelloWeb.CommentController :show
POST   /comments           HelloWeb.CommentController :create
PATCH  /comments/:id       HelloWeb.CommentController :update
PUT    /comments/:id       HelloWeb.CommentController :update
```

--------------------------------

### Get Template Engines (Elixir)

Source: https://hexdocs.pm/phoenix/_template/1.0.4/Phoenix

Returns a keyword list mapping template engine extensions (atoms) to their corresponding Elixir modules. This is used internally by Phoenix to determine which engine to use for a given file type.

```elixir
@spec engines() :: %{required(atom()) => module()}
```

--------------------------------

### Fix Deprecation Warnings in Phoenix.HTML

Source: https://hexdocs.pm/phoenix/_html/4.1.1/changelog

This bug fix addresses deprecation warnings in Phoenix.HTML by pointing them to the correct alternative functions or methods, guiding developers towards current best practices.

```elixir
    * Fix deprecation warnings to point to the correct alternative
```

--------------------------------

### Fix LiveView JS import warning

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Resolves a warning that occurred when importing LiveView JavaScript files. This improves the cleanliness of build processes and console output.

```javascript
// Example of correct import path to avoid warnings
import LiveView from 'phoenix_live_view';

```

--------------------------------

### Get the Node Name of the PubSub Server

Source: https://hexdocs.pm/phoenix/_pubsub

Retrieves the node name of the running PubSub server. This function takes the pubsub system name as an argument and returns the node's name.

```elixir
node_name(pubsub)
```

```elixir
@spec node_name(t()) :: node_name()
```

--------------------------------

### Elixir Endpoint Configuration Snippet

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/plug

An example of how to configure plugs directly within the endpoint definition. This snippet shows the placement of 'plug :introspect' and 'plug HelloWeb.Router', indicating common plugs applied at the endpoint level before router dispatch.

```elixir
defmodule HelloWeb.Endpoint do
  ...

  plug :introspect
  plug HelloWeb.Router
end
```

--------------------------------

### Phoenix Route Organization with Pipelines

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Demonstrates how to define and use pipelines for browser and authentication purposes to group routes within scopes. This method helps in managing access control and inspecting routes based on required functionality.

```elixir
pipeline :browser do
  ...
end

pipeline :auth do
  plug HelloWeb.Authentication
end

scope "/" do
  pipe_through [:browser]

  get "/reviews", PostController, :index
  get "/reviews/:id", PostController, :show
end

scope "/" do
  pipe_through [:browser, :auth]

  get "/reviews/new", PostController, :new
  post "/reviews", PostController, :create
end
```

--------------------------------

### Phoenix Endpoint Configuration for Sockets

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/deployment

Elixir code snippet showing the default configuration for Phoenix Sockets in the `endpoint.ex` file. It specifies the available transports (WebSocket and Long-Polling) and their connection information.

```elixir
socket "/live", Phoenix.LiveView.Socket,
  websocket: [connect_info: [session: @session_options]],
  longpoll: [connect_info: [session: @session_options]]

```

--------------------------------

### Generate Phoenix Channel and Tests

Source: https://hexdocs.pm/phoenix/1.7.14/testing_channels

Generates a basic Phoenix channel, its associated test file, and a support file for channel testing. It also prompts to create the default UserSocket if it doesn't exist, which is necessary for channel functionality. The output includes instructions for configuring the socket endpoint and integrating the client-side JavaScript.

```bash
$ mix phx.gen.channel Room
* creating lib/hello_web/channels/room_channel.ex
* creating test/hello_web/channels/room_channel_test.exs
* creating test/support/channel_case.ex

The default socket handler - HelloWeb.UserSocket - was not found.

Do you want to create it? [Yn]  
* creating lib/hello_web/channels/user_socket.ex
* creating assets/js/user_socket.js

Add the socket handler to your `lib/hello_web/endpoint.ex`, for example:

    socket "/socket", HelloWeb.UserSocket,
      websocket: true,
      longpoll: false

For the front-end integration, you need to import the `user_socket.js`
in your `assets/js/app.js` file:

    import "./user_socket.js"

```

--------------------------------

### Get LiveView Children - Elixir

Source: https://hexdocs.pm/phoenix/_live_view/0.10.0/Phoenix

Retrieves the current list of children of a parent LiveView. The children are returned in the order they appear in the rendered HTML. This is useful for inspecting and interacting with nested LiveViews.

```elixir
{:ok, view, _html} = live(conn, "/thermo")
assert [clock_view] = children(view)
assert render_click(clock_view, :snooze) =~ "snoozing"
```

--------------------------------

### Referencing External Image in CSS

Source: https://hexdocs.pm/phoenix/1.7.14/asset_management

Provides an example of how to reference an image file in CSS. It also shows the potential error message if the path is not correctly handled by esbuild.

```css
body {
  background-image: url(/images/bg.png);
}
```

```text
error: Could not resolve "/images/bg.png" (mark it as external to exclude it from the bundle)
```

--------------------------------

### Generate Ecto Schema and Migration with Phoenix

Source: https://hexdocs.pm/phoenix/1.7.14/ecto

Generates an Ecto schema for a 'User' with specified fields and creates a corresponding database migration file. This task automates the initial setup for data models in Phoenix applications.

```bash
$ mix phx.gen.schema User users name:string email:string \
bio:string number_of_pets:integer

* creating ./lib/hello/user.ex
* creating priv/repo/migrations/20170523151118_create_users.exs

Remember to update your repository by running migrations:

   $ mix ecto.migrate

```

--------------------------------

### Subscription and Configuration

Source: https://hexdocs.pm/phoenix/_pubsub/2.1.3/Phoenix

Functions for subscribing to topics and configuring the PubSub system.

```APIDOC
## POST /pubsub/subscribe

### Description
Subscribes the caller to a PubSub adapter's topic.

### Method
POST

### Endpoint
`/pubsub/subscribe`

### Parameters
#### Request Body
- **pubsub** (string) - The name of the pubsub system
- **topic** (string) - The topic to subscribe to, for example: `"users:123"`
- **opts** (map, optional) - A map of subscription options.

### Request Example
```json
{
  "pubsub": "my_pubsub",
  "topic": "users:123",
  "opts": {"durable": true}
}
```

### Response
#### Success Response (200)
- **status** (string) - Indicates success, e.g., `"ok"`

#### Response Example
```json
{
  "status": "ok"
}
```

## POST /pubsub/child_spec

### Description
Returns a child specification for starting a PubSub with given options in a supervisor.

### Method
POST

### Endpoint
`/pubsub/child_spec`

### Parameters
#### Request Body
- **options** (map) - A map containing configuration options for the PubSub.
  - **name** (atom) - Required. The name of the pubsub to be started.
  - **adapter** (atom, optional) - The adapter to use (defaults to `Phoenix.PubSub.PG2`).
  - **pool_size** (integer, optional) - Number of pubsub partitions to launch.

### Request Example
```json
{
  "options": {
    "name": :my_pubsub_server,
    "adapter": Phoenix.PubSub.PG2,
    "pool_size": 4
  }
}
```

### Response
#### Success Response (200)
- **child_spec** (map) - The supervisor child specification.

#### Response Example
```json
{
  "child_spec": {
    "id": :my_pubsub_server,
    "start": {:phoenix_pubsub, :start_link, [[:my_pubsub_server, [adapter: Phoenix.PubSub.PG2, pool_size: 4]]]}
  }
}
```

## GET /pubsub/node_name

### Description
Returns the node name of the PubSub server.

### Method
GET

### Endpoint
`/pubsub/node_name`

### Parameters
#### Query Parameters
- **pubsub** (string) - The name of the pubsub system

### Response
#### Success Response (200)
- **node_name** (string) - The name of the current node.

#### Response Example
```json
{
  "node_name": "nonode@localhost"
}
```
```

--------------------------------

### Define Controller Plugs with Action Guards (Elixir)

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/plug

This example demonstrates how to define plugs directly within a controller module. It also shows how to use the `when action in [...]` guard to execute a plug only for specific controller actions.

```elixir
defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug HelloWeb.Plugs.Locale, "en" when action in [:index]
end
```

--------------------------------

### Get elements by topic in Phoenix.Tracker.State

Source: https://hexdocs.pm/phoenix/_pubsub/1.1.2/Phoenix.Tracker

Retrieves a list of elements associated with a specific topic that belong to an online replica. This function is useful for filtering state based on topic and online status.

```elixir
get_by_topic(state, topic) :: [key_meta()]
```

--------------------------------

### Build Phoenix Application Release Package

Source: https://hexdocs.pm/phoenix/1.7.14/releases

This command builds the production-ready release package for a Phoenix application. It assembles the application with its dependencies and runtime configurations, creating a deployable artifact.

```shell
$ MIX_ENV=prod mix release
Generated my_app app
* assembling my_app-0.1.0 on MIX_ENV=prod
* using config/runtime.exs to configure the release at runtime

Release created at _build/prod/rel/my_app!

    # To start your system
    _build/prod/rel/my_app/bin/my_app start

...
```

--------------------------------

### Get Socket Transport PID - Phoenix LiveView

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/Phoenix

Returns the process identifier (PID) of the socket's transport layer. This function raises an `ArgumentError` if the socket is not currently connected.

```elixir
iex> transport_pid(socket)
#PID<0.107.0>
```

--------------------------------

### Deprecated live_component Syntax

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Highlights the deprecation of the older `live_component` syntax and promotes the new function component syntax. The change requires using HEEx templates and offers improved LiveComponent features such as slots.

```elixir
<%= live_component MyModule, id: @user.id, user: @user %>
```

```elixir
<.live_component module={MyModule} id={@user.id} user={@user} />
```

--------------------------------

### Add MyApp.MyServer to Supervisor Tree

Source: https://hexdocs.pm/phoenix/1.7.14/telemetry

Integrates the MyApp.MyServer GenServer into the application's supervisor tree by adding it to the children list in the application module. This ensures the GenServer is started and supervised when the application launches.

```elixir
children = [
  # Start a server that greets the world
  {MyApp.MyServer, fn -> "Hello, world!" end},
]
```

--------------------------------

### LiveView Mobile Safari Click Event Bubble

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Ensures all click events bubble for mobile Safari. This improves event handling consistency across different browsers.

```elixir
Ensure all click events bubble for mobile Safari
```

--------------------------------

### Set Environment Variables for Secrets

Source: https://hexdocs.pm/phoenix/1.7.14/deployment

Configures environment variables for `SECRET_KEY_BASE` and `DATABASE_URL` required for a Phoenix application in production. It's crucial to replace placeholders with actual values and avoid committing secrets directly.

```bash
$ export SECRET_KEY_BASE=REALLY_LONG_SECRET
$ export DATABASE_URL=ecto://USER:PASS@HOST/database
```

--------------------------------

### Allow assign_async to return keyword list

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Permits `assign_async` in Phoenix LiveView to return a keyword list. This offers more flexibility in how asynchronous assignments are structured and passed to LiveView components.

```elixir
iex(1)> Phoenix.LiveView.assign_async(socket, my_data: {:ok, [name: "Alice", age: 30]})
```

--------------------------------

### Subscribe and Broadcast Messages with Phoenix.PubSub

Source: https://hexdocs.pm/phoenix/_pubsub/index

Demonstrates basic usage of Phoenix.PubSub for subscribing to a topic and broadcasting messages. It shows how to alias the module, subscribe a process, broadcast a message, and check for received messages.

```iex
alias Phoenix.PubSub

PubSub.subscribe(:my_pubsub, "user:123")
# :ok

Process.info(self(), :messages)
# {:messages, []}

PubSub.broadcast(:my_pubsub, "user:123", {:user_update, %{id: 123, name: "Shane"}})
# :ok

Process.info(self(), :messages)
# {:messages, [{:user_update, %{id: 123, name: "Shane"}}]}
```

--------------------------------

### Phoenix LiveDashboard Route Configuration with Hooks (Elixir)

Source: https://hexdocs.pm/phoenix/_live_dashboard/Phoenix.LiveDashboard

Example of configuring the LiveDashboard route to include custom hooks. This shows how to pass a module containing `on_mount` hooks to the `live_dashboard` function.

```elixir
live_dashboard "/dashboard",
  additional_pages: [
    route_name: MyAppWeb.MyCustomPage
  ],
  on_mount: [
    MyAppWeb.MyLiveDashboardHooks
  ]
```

--------------------------------

### Phoenix Project Test File Structure

Source: https://hexdocs.pm/phoenix/1.7.17/testing

Illustrates the default directory structure for tests in a Phoenix application. It includes controller tests, support files, and the test helper.

```treeview
test
├── hello_web
│   └── controllers
│       ├── error_html_test.exs
│       ├── error_json_test.exs
│       └── page_controller_test.exs
├── support
│   ├── conn_case.ex
│   └── data_case.ex
└── test_helper.exs

```

--------------------------------

### Simulate LiveView Hook Event

Source: https://hexdocs.pm/phoenix/_live_view/Phoenix

This example shows how to send a hook event to a LiveView and assert the updated rendered output. It uses `live/2` to establish the view and `render_hook/3` to dispatch the event with associated data.

```Elixir
{:ok, view, html} = live(conn, "/thermo")
assert html =~ "The temp is: 30℉"
assert render_hook(view, :refresh, %{deg: 32}) =~ "The temp is: 32℉"
```

--------------------------------

### LiveView Hook DOM ID Error Logging

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Logs an error on the client when a hook is used without a DOM ID. This helps in debugging hook configurations.

```elixir
Log error on client when using a hook without a DOM ID
```

--------------------------------

### Generate Full URLs with Verified Routes (Elixir)

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Explains how to generate full URLs from verified route paths using the `Phoenix.VerifiedRoutes.url/1` function. This function constructs complete URLs based on environment configuration, including host and port information.

```elixir
url(~p"/users")
"http://localhost:4000/users"
```

--------------------------------

### LiveView Recursive Component Diffs

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Handles recursive components correctly when generating DOM diffs. This prevents errors and ensures proper updates for complex component structures.

```elixir
Handle recursive components when generating diffs
```

--------------------------------

### Explicitly Setting Views per Format in Phoenix Controller

Source: https://hexdocs.pm/phoenix/1.7.17/controllers

Shows how to explicitly define which view modules should be used for specific response formats (HTML and JSON) within a Phoenix controller.

```elixir
plug :put_view, html: HelloWeb.PageHTML, json: HelloWeb.PageJSON
```

--------------------------------

### Fix LiveViewTest submit_form and follow_trigger_action crashes

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Addresses crashes in `Phoenix.LiveViewTest.submit_form/2` and `Phoenix.LiveViewTest.follow_trigger_action/2` when using keyword lists and not properly handling atom keys. This ensures more robust form testing in LiveView.

```elixir
defmodule Phoenix.LiveViewTest do
  # ...

  # Fix for submit_form/2 and follow_trigger_action/2 when using keyword lists
  def submit_form(view, params \\ []) when is_list(params) do
    # ... original implementation ...
  end

  def follow_trigger_action(view, action, params \\ []) when is_list(params) do
    # ... original implementation ...
  end
  # ...
end
```

--------------------------------

### Configuring esbuild Loaders for Third-Party Fonts and Images

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/asset_management

Example configuration in `config/config.exs` to instruct esbuild to copy specific file types (like .woff, .ttf, .eot, .woff2) to the output directory and prefix their paths with `/assets/`. This ensures fonts and images from third-party JS packages are correctly loaded.

```elixir
args: ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/* --public-path=/assets/ --loader:.woff=copy  --loader:.ttf=copy --loader:.eot=copy --loader:.woff2=copy)

```

--------------------------------

### Configure Phoenix Presence Module

Source: https://hexdocs.pm/phoenix/1.7.14/presence

Configures the generated Phoenix Presence module by specifying the OTP application name and the PubSub server to be used. This setup is crucial for the presence system to function correctly within the Phoenix application.

```elixir
use Phoenix.Presence,
  otp_app: :hello,
  pubsub_server: Hello.PubSub

```

--------------------------------

### Spawn and Test LiveView with Path using Phoenix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/Phoenix

Spawns a connected LiveView process and optionally navigates to a specified path. This macro is used for testing LiveView components and their initial rendering. It returns the connection, the view module, and the rendered HTML.

```elixir
{:ok, view, html} = live(conn, "/path")
assert view.module == MyLive
assert html =~ "the count is 3"

assert {:error, {:redirect, %{to: "/somewhere"}}} = live(conn, "/path")copy
```

--------------------------------

### LiveView Phx-Trigger-Action Race Condition

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Addresses a race condition on `phx-trigger-action` that could cause reconnects before a server form submit. This enhances form submission reliability.

```elixir
Fix race condition on `phx-trigger-action` causing reconnects before server form submit
```

--------------------------------

### Configure Elixir/Erlang Clustering with DNS Discovery

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/releases

Sets up environment variables for Elixir/Erlang clustering in a release environment. This script configures Erlang distribution ports, node naming using environment variables, and specifies the DNS query for service discovery.

```bash
# Uncomment if IPv6 is required
# export ECTO_IPV6="true"
# export ERL_AFLAGS "-proto_dist inet6_tcp"

# Erlang uses a port mapper daemon on each node,
# it by default runs on port 4369
export ERL_EPMD_PORT=4369

# Use the ports 4370-4372 for nodes to communicate.
export ERL_AFLAGS "-kernel inet_dist_listen_min 4370 inet_dist_listen_max 4372"

export RELEASE_DISTRIBUTION="name"
export RELEASE_NODE="app-${PLATFORM_DEPLOYMENT_SHA}@${PLATFORM_DEPLOYMENT_IP}"
export DNS_CLUSTER_QUERY="your-app.internal"

```

--------------------------------

### LiveView Push Hook Events

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Ensures that push hook events are not attempted unless the LiveView is connected. This prevents errors related to sending events over a disconnected channel.

```elixir
Do not attempt push hook events unless connected
```

--------------------------------

### Use LiveView's JS.patch and JS.navigate for Testing with render_click

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This enhancement allows developers to test `JS.patch` and `JS.navigate` functions more easily by using the `render_click` helper. This improves the testability of LiveView interactions involving client-side navigation and patching, ensuring smoother transitions and accurate URL updates.

```elixir
test "navigates to user profile", %{session: session} do
  {:ok, _view, _html} = live_component(Web.UserLive.Index, %{}, session: session)
  |> render_click(target: "#profile-link-1")

  assert has_element?(@dom, "h1", "User Profile")
end
```

--------------------------------

### Create Heroku Postgres Add-on

Source: https://hexdocs.pm/phoenix/1.7.14/heroku

This bash command provisions a mini Heroku Postgres database add-on for the application. This automatically sets the `DATABASE_URL` environment variable, which Ecto uses to connect to the database.

```bash
$ heroku addons:create heroku-postgresql:mini
```

--------------------------------

### Initial Controller Logic Without Plugs (Elixir)

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/plug

This code snippet shows the original, nested logic for handling request transformations without using plugs, highlighting the complexity and duplication.

```elixir
defmodule HelloWeb.MessageController do
  use HelloWeb, :controller

  def show(conn, params) do
    case Authenticator.find_user(conn) do
      {:ok, user} ->
        case find_message(params["id"]) do
          nil ->
            conn |> put_flash(:info, "That message wasn\'t found") |> redirect(to: ~p"/")
          message ->
            if Authorizer.can_access?(user, message) do
              render(conn, :show, page: message)
            else
              conn |> put_flash(:info, "You can\'t access that page") |> redirect(to: ~p"/")
            end
        end
      :error ->
        conn |> put_flash(:info, "You must be logged in") |> redirect(to: ~p"/")
    end
  end
end
```

--------------------------------

### Generate Phoenix Secret Key

Source: https://hexdocs.pm/phoenix/1.7.14/deployment

Generates a secret key for your Phoenix application, typically used for signing and encrypting sensitive information. This key should be stored securely, often in environment variables.

```bash
$ mix phx.gen.secret
REALLY_LONG_SECRET
```

--------------------------------

### Manage Ecto Database with Mix Tasks

Source: https://hexdocs.pm/phoenix/1.7.14/mix_tasks

Phoenix applications often include Ecto for database management. These Mix tasks allow for the creation, dropping, dumping, loading, migration, and rollback of the Ecto repository. Tasks can be run with `--no-start` to avoid starting the application.

```shell
mix help --search "ecto"
```

```shell
mix ecto.create
```

```shell
mix ecto.drop
```

```shell
mix ecto.dump
```

```shell
mix ecto.gen.migration
```

```shell
mix ecto.gen.repo
```

```shell
mix ecto.load
```

```shell
mix ecto.migrate
```

```shell
mix ecto.migrations
```

```shell
mix ecto.reset
```

```shell
mix ecto.rollback
```

```shell
mix ecto.setup
```

```shell
mix ecto.create --no-start
```

--------------------------------

### Configure Database for Test Partitions

Source: https://hexdocs.pm/phoenix/testing

This configuration snippet from `config/test.exs` shows how the database name is dynamically set using the `MIX_TEST_PARTITION` environment variable. This allows for distinct database names when running tests in partitions.

```elixir
database: "hello_test#{System.get_env("MIX_TEST_PARTITION")}",
```

--------------------------------

### Customizing Phoenix.HTML JavaScript Link Click Behavior

Source: https://hexdocs.pm/phoenix/_html/4.1.1/Phoenix

Shows how to override the default confirmation behavior of Phoenix.HTML's JavaScript library by listening to the 'phoenix.link.click' event. This example implements a custom prompt-based confirmation.

```javascript
window.addEventListener('phoenix.link.click', function (e) {
  // Introduce custom behaviour
  var message = e.target.getAttribute("data-prompt");
  var answer = e.target.getAttribute("data-prompt-answer");
  if(message && answer && (answer != window.prompt(message))) {
    e.preventDefault();
  }
}, false);
```

--------------------------------

### Emit Telemetry Event Example

Source: https://hexdocs.pm/phoenix/1.7.14/telemetry

Demonstrates how to execute a Telemetry event, specifically the `:phoenix, :endpoint, :stop` event. This event is dispatched by Plug.Telemetry after each request, reporting the response duration.

```elixir
:telemetry.execute([:phoenix, :endpoint, :stop], %{duration: duration}, %{conn: conn})
```

--------------------------------

### Presence Initialization

Source: https://hexdocs.pm/phoenix/1.4.16/js/index

Documentation for initializing the Presence tracking functionality.

```APIDOC
## Presence Initialization

### Description
Initializes the Presence tracking for a given channel.

### Parameters
#### Path Parameters
- **channel** (Channel) - The Channel instance to associate presence with.
- **opts** (Object) - Options for presence tracking, e.g., `{events: {state: "state", diff: "diff"}}`.
```

--------------------------------

### Handle LiveView Hooks Remounting

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes issues related to LiveView hooks not being remounted after a reconnection or recovery. This ensures that hook callbacks are correctly invoked upon re-establishment of the LiveView connection.

```elixir
Fix hooks not getting remounted after LiveView reconnect
Fix hooks not getting remounted after LiveView recovery
```

--------------------------------

### Phoenix Mix phx.new Options for API-Only Apps

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/json_and_apis

This section lists command-line options for `mix phx.new` to generate an API-only Phoenix application. It details flags like `--no-html`, `--no-assets`, and `--no-esbuild` that disable unnecessary components for RESTful APIs.

```bash
$ mix help phx.new
```

--------------------------------

### Test JSON API Endpoints with cURL

Source: https://hexdocs.pm/phoenix/1.7.14/json_and_apis

Demonstrates using cURL to interact with the generated JSON API. This includes testing GET, POST, PUT, and DELETE requests to manage 'url' resources.

```bash
curl -i http://localhost:4000/api/urls
```

```bash
curl -iX POST http://localhost:4000/api/urls \
   -H 'Content-Type: application/json' \
   -d '{"url": {"link":"https://phoenixframework.org", "title":"Phoenix Framework"}}'
```

```bash
curl -iX POST http://localhost:4000/api/urls \
   -H 'Content-Type: application/json' \
   -d '{"url": {"link":"https://elixir-lang.org", "title":"Elixir"}}'
```

```bash
curl -i http://localhost:4000/api/urls/1
```

```bash
curl -iX PUT http://localhost:4000/api/urls/2 \
   -H 'Content-Type: application/json' \
   -d '{"url": {"title":"Elixir Programming Language"}}'
```

```bash
curl -iX DELETE http://localhost:4000/api/urls/2 \
   -H 'Content-Type: application/json'
```

--------------------------------

### Phoenix Test Directory Structure

Source: https://hexdocs.pm/phoenix/testing

Illustrates the standard file and directory layout for tests in a Phoenix project. This includes controller tests, support files, and the main test helper. Understanding this structure is crucial for organizing and locating test files.

```tree
test
├── hello_web
│   ├── controllers
│   │   ├── error_html_test.exs
│   │   ├── error_json_test.exs
│   │   └── page_controller_test.exs
├── support
│   ├── conn_case.ex
│   └── data_case.ex
└── test_helper.exs
```

--------------------------------

### Phoenix Channels Client Message Format Example

Source: https://hexdocs.pm/phoenix/1.7.17/writing_a_channels_client

This demonstrates the structure of messages sent from a client to a Phoenix Channel using Phoenix.Socket.V2.JSONSerializer. It includes join/message references, topic, event name, and payload.

```plaintext
[join_reference, message_reference, topic_name, event_name, payload]
```

--------------------------------

### CSS for LiveView Loading States

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/syncing-changes

Provides an example CSS rule to style elements with the 'phx-click-loading' class. This allows for immediate visual feedback to the user, such as fading the text, while the server processes the event.

```css
.phx-click-loading.opaque-on-click {
  opacity: 50%;
}
```

--------------------------------

### Bind Focus and Blur Events in Phoenix LiveView

Source: https://hexdocs.pm/phoenix/_live_view/bindings

This HTML example illustrates binding focus and blur events to an input element using `phx-focus` and `phx-blur`. It also shows how `phx-window-focus` and `phx-window-blur` can be used for window-level focus detection.

```html
<input name="email" phx-focus="myfocus" phx-blur="myblur"/>

```

```html
<div class="container"
    phx-window-focus="page-active"
    phx-window-blur="page-inactive"
    phx-value-page="123">
  ...
</div>

```

--------------------------------

### Introduce Phoenix.LiveView.UploadWriter

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This enhancement introduces `Phoenix.LiveView.UploadWriter`, a new module designed to facilitate more robust and flexible handling of file uploads within LiveView. It provides a structured way to manage the upload process, including writing chunks and handling errors.

```elixir
# Example usage within a LiveView context:
case Phoenix.LiveView.UploadWriter.write_chunk(writer, chunk) do
  {:ok, new_writer} ->
    # Continue upload
  {:error, reason, updated_writer} ->
    # Handle error and potentially retry or abort
end
```

--------------------------------

### Use Function Component in HEEx Template

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Shows how to use a previously defined Elixir function component within a HEEx template. This promotes composability and code reuse.

```heex
<MyComponent.btn text="Save">
```

--------------------------------

### Test Synchronous Channel Reply

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/testing_channels

Tests a synchronous reply from a channel by pushing a message to the socket and asserting the expected reply. This example demonstrates how to test a 'ping' event that should reply with a status of :ok.

```elixir
test "ping replies with status ok", %{socket: socket} do
  ref = push(socket, "ping", %{"hello" => "there"})
  assert_reply ref, :ok, %{"hello" => "there"}
end

```

--------------------------------

### Phoenix LiveView Handle Params Telemetry Events

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/telemetry

Telemetry events for the handle_params lifecycle of Phoenix LiveView. Covers start, stop, and exception events, including metadata such as socket, params, and uri.

```elixir
[:phoenix, :live_view, :handle_params, :start]
%{system_time: System.monotonic_time}
%{socket: Phoenix.LiveView.Socket.t, params: unsigned_params, uri: String.t()}
```

```elixir
[:phoenix, :live_view, :handle_params, :stop]
%{duration: native_time}
%{socket: Phoenix.LiveView.Socket.t, params: unsigned_params, uri: String.t()}
```

```elixir
[:phoenix, :live_view, :handle_params, :exception]
%{duration: native_time}
%{socket: Phoenix.LiveView.Socket.t, kind: atom, reason: term, params: unsigned_params, uri: String.t()}
```

--------------------------------

### Phoenix LiveView Render Telemetry Events

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/telemetry

Telemetry events for the render lifecycle of Phoenix LiveView. Includes start, stop, and exception events with metadata for socket, force, and changed status.

```elixir
[:phoenix, :live_view, :render, :start]
%{system_time: System.monotonic_time}
%{socket: Phoenix.LiveView.Socket.t, force?: boolean, changed?: boolean}
```

```elixir
[:phoenix, :live_view, :render, :stop]
%{duration: native_time}
%{socket: Phoenix.LiveView.Socket.t, force?: boolean, changed?: boolean}
```

```elixir
[:phoenix, :live_view, :render, :exception]
%{duration: native_time}
%{socket: Phoenix.LiveView.Socket.t, kind: atom, reason: term, force?: boolean, changed?: boolean}
```

--------------------------------

### Create and Configure Gigalixir Application

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/gigalixir

Creates a new Gigalixir application and specifies the Erlang and Elixir versions to be used for the build. Also includes steps to set Node.js version and commit configuration files.

```bash
gigalixir create -n "your-app-name"

echo 'elixir_version=1.17.2' > elixir_buildpack.config
echo 'erlang_version=27.0' >> elixir_buildpack.config
git add elixir_buildpack.config

echo 'node_version=22.7.0' > phoenix_static_buildpack.config
git add elixir_buildpack.config phoenix_static_buildpack.config assets/package.json

git commit -m "Set versions"
```

--------------------------------

### Apply Ecto Migrations

Source: https://hexdocs.pm/phoenix/ecto

Applies all pending Ecto database migrations. This command executes the `change/0` function in each unapplied migration file, updating the database schema. It also manages a `schema_migrations` table to track applied migrations.

```bash
$ mix ecto.migrate
[info] == Running Hello.Repo.Migrations.AddCommentsTable.change/0 forward
[info] create table comments
[info] == Migrated in 0.1s

```

```bash
$ mix ecto.migrate -n 2
[info] == Running Hello.Repo.Migrations.CreatePost.change/0 forward
[info] create table posts
[info] == Migrated in 0.0s
[info] == Running Hello.Repo.Migrations.AddCommentsTable.change/0 forward
[info] create table comments
[info] == Migrated in 0.0s

```

```bash
$ mix ecto.migrate --step 2

```

```bash
$ mix ecto.migrate --to 20150317170448

```

--------------------------------

### Get Phoenix JSON Library

Source: https://hexdocs.pm/phoenix/1.7.14/Phoenix

Retrieves the currently configured JSON encoding library used by the Phoenix framework. This function is useful for understanding or dynamically accessing the active JSON library.

```elixir
json_library()
```

--------------------------------

### Standard HTML Form Example

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/security

Illustrates a basic HTML form structure for submitting data, typically used in web applications. This form is vulnerable to CSRF if not protected.

```html
<form action="/posts" method="post">

  <label for="post_title">Title</label>
  <input id="post_title" name="post[title]" type="text">

  <label for="post_body">Body</label>
  <textarea id="post_body" name="post[body]">
  </textarea>

  <div>
    <button type="submit">Save</button>
  </div>
</form>
```

--------------------------------

### Action for Handling Redirect Target in Phoenix Controller

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/controllers

Defines a controller action that serves as the target for a redirect. In this example, the `redirect_test` action simply renders the `:home` template, demonstrating a successful redirection to a new address.

```elixir
def redirect_test(conn, _params) do
  render(conn, :home)
end
```

--------------------------------

### Spawn LiveView Process

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/Phoenix

Spawns a connected LiveView process. This function is used to initiate a LiveView session, optionally navigating to a specific `path`.

```elixir
live(conn, path \ nil)
```

--------------------------------

### Elixir Telemetry Console Output Example

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/telemetry

This illustrates the expected output in the IEx console when the MyApp.MyServer GenServer successfully executes its function and emits a ':stop' telemetry event. It shows the event name, measurements, and metadata.

```elixir
[Telemetry.Metrics.ConsoleReporter] Got new event!
Event name: my_app.my_server.call.stop
All measurements: %{duration: 4000}
All metadata: %{}

Metric measurement: #Function<2.111777250/1 in Telemetry.Metrics.maybe_convert_measurement/2> (summary)
With value: 0.004 millisecond
Tag values: %{}

"Hello, world!"
```

--------------------------------

### HEEx Looping with For Comprehensions

Source: https://hexdocs.pm/phoenix/1.7.14/components

Shows how to generate lists or tables dynamically using `for` comprehensions within HEEx templates. This example iterates over a range and interpolates computed values into table cells.

```heex
<table>
  <tr>
    <th>Number</th>
    <th>Power</th>
  </tr>
  <%= for number <- 1..10 do %>
    <tr>
      <td><%= number %></td>
      <td><%= number * number %></td>
    </tr>
  <% end %>
</table>
```

--------------------------------

### Phoenix Product Controller - Elixir

Source: https://hexdocs.pm/phoenix/1.7.14/contexts

The generated `ProductController` handles web requests for product management. It interacts with the `Catalog` context to perform actions like listing, creating, and showing products. It utilizes `Phoenix.Controller` functions for rendering views, redirecting, and managing flash messages.

```Elixir
defmodule HelloWeb.ProductController do
  use HelloWeb, :controller

  alias Hello.Catalog
  alias Hello.Catalog.Product

  def index(conn, _params) do
    products = Catalog.list_products()
    render(conn, :index, products: products)
  end

  def new(conn, _params) do
    changeset = Catalog.change_product(%Product{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"product" => product_params}) do
    case Catalog.create_product(product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product created successfully.")
        |> redirect(to: ~p"/products/#{product}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    product = Catalog.get_product!(id)
    render(conn, :show, product: product)
  end
end
```

--------------------------------

### Simplify HEEx slot code generation

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Optimizes the code generated for slots in HEEx templates when the slot contains no dynamic code. This leads to smaller and more efficient compiled templates.

```elixir
defmodule MyComponent do
  use Phoenix.Component

  slot :inner_content

  def render(assigns) do
    ~H"<div>%{render_slot(assigns, :inner_content)}</div>"
  end
end

# Example with no dynamic code in slot:
<.my_component>Just text</.my_component>
# Simplified generated code.
```

--------------------------------

### Set Environment Variables for Phoenix Release

Source: https://hexdocs.pm/phoenix/1.7.14/releases

This snippet demonstrates how to set essential environment variables required for building a Phoenix application release. It includes generating a secret key base and configuring the database URL.

```shell
$ mix phx.gen.secret
REALLY_LONG_SECRET
$ export SECRET_KEY_BASE=REALLY_LONG_SECRET
$ export DATABASE_URL=ecto://USER:PASS@HOST/database
```

--------------------------------

### Handle Query Strings with Verified Routes (Elixir)

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Demonstrates two methods for including query strings in verified route paths: directly embedding them as strings or using a dictionary of key-value pairs. This ensures proper URL formatting for routes with parameters.

```elixir
~p"/users/17?admin=true&active=false"
"/users/17?admin=true&active=false"

~p"/users/17?#{[admin: true]}"
"/users/17?admin=true"
```

--------------------------------

### Generate HTML resource scaffold with mix phx.gen.html

Source: https://hexdocs.pm/phoenix/1.7.17/testing

This command generates a complete HTML resource scaffold, including schema, context, controllers, views, and tests. It significantly speeds up development by creating boilerplate code.

```shell
$ mix phx.gen.html Blog Post posts title body:text
* creating lib/hello_web/controllers/post_controller.ex
* creating lib/hello_web/controllers/post_html/edit.html.heex
* creating lib/hello_web/controllers/post_html/index.html.heex
* creating lib/hello_web/controllers/post_html/new.html.heex
* creating lib/hello_web/controllers/post_html/show.html.heex
* creating lib/hello_web/controllers/post_html/post_form.html.heex
* creating lib/hello_web/controllers/post_html.ex
* creating test/hello_web/controllers/post_controller_test.exs
* creating lib/hello/blog/post.ex
* creating priv/repo/migrations/20211001233016_create_posts.exs
* creating lib/hello/blog.ex
* injecting lib/hello/blog.ex
* creating test/hello/blog_test.exs
* injecting test/hello/blog_test.exs
* creating test/support/fixtures/blog_fixtures.ex
* injecting test/support/fixtures/blog_fixtures.ex
```

--------------------------------

### LiveView Hooks Reconnected Callback Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes the `reconnected` callback for hooks being fired even when there was no prior disconnect. This ensures the callback is invoked only when a reconnection actually occurs.

```elixir
Fix hooks `reconnected` callback being fired with no prior disconnect
```

--------------------------------

### Set Default Command for Docker Container

Source: https://hexdocs.pm/phoenix/1.7.14/releases

This Dockerfile instruction specifies the default command to execute when a container based on this image is started. It sets the application's server script as the command, ensuring the Phoenix application runs automatically upon container launch.

```dockerfile
CMD ["/app/bin/server"]
```

--------------------------------

### Setting HTTP Status Code

Source: https://hexdocs.pm/phoenix/1.7.17/controllers

The `put_status/2` function from `Plug.Conn` can be used to set the HTTP status code for a response. You can provide either an integer status code or an atom representing the status.

```APIDOC
## PUT_STATUS /home

### Description
Sets the HTTP status code for the response.

### Method
PUT

### Endpoint
/home

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```elixir
def home(conn, _params) do
  conn
  |> put_status(202)
  |> render(:home, layout: false)
end
```

### Response
#### Success Response (200/202)
- **Status Code** (integer) - The specified HTTP status code (e.g., 202).

#### Response Example
(Depends on the template `:home`)
```

--------------------------------

### Get controller info for a URL and HTTP method

Source: https://hexdocs.pm/phoenix/1.7.14/Mix.Tasks.Phx

This command uses both the `--info` and `--method` options to find the controller details for a specific URL and HTTP method. This allows for precise identification of route handlers.

```bash
$ mix phx.routes --info http://0.0.0.0:4000/users --method post
```

--------------------------------

### Fetch Dependencies after Authentication Generation

Source: https://hexdocs.pm/phoenix/mix_phx_gen_auth

Fetches new dependencies added to the `mix.exs` file after running the `mix phx.gen.auth` command. This ensures all required libraries for the authentication system are downloaded.

```shell
mix deps.get
```

--------------------------------

### Map Key Warning

Source: https://hexdocs.pm/phoenix/_html/4.1.1/changelog

A warning is issued for maps with atom keys when used in form contexts. This aims to guide developers towards using string keys for consistency and potential compatibility with JavaScript.

```elixir
Phoenix.HTML.FormData.cast/2
```

--------------------------------

### Handle Click Event with phx-value-* in LiveView Server

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/bindings

Example of handling a click event on the server-side where the payload includes values from `phx-value-*` attributes. The `handle_event` function receives these values as a map.

```elixir
def handle_event("inc", %{"myvar1" => "val1", "myvar2" => "val2"}, socket) do
  # ... process event ...
end
```

--------------------------------

### Create Cart Controller in Elixir

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/cross_context_boundaries

Defines the HelloWeb.CartController module to handle requests for displaying the shopping cart. It uses the ShoppingCart context to fetch and prepare cart data for rendering. The 'show' function renders the 'show.html' template, passing a changeset for potential cart modifications.

```elixir
defmodule HelloWeb.CartController do
  use HelloWeb, :controller

  alias Hello.ShoppingCart

  def show(conn, _params) do
    render(conn, :show, changeset: ShoppingCart.change_cart(conn.assigns.current_scope, conn.assigns.cart))
  end
end
```

--------------------------------

### LiveView Throttled Keydown Event Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes a bug where throttling keydown events would cause key presses to be missed. This ensures that all key events are processed correctly.

```elixir
Fix bug where throttling keydown events would eat key presses
```

--------------------------------

### Ensuring npm Dependencies in Phoenix Build/Deploy

Source: https://hexdocs.pm/phoenix/asset_management

Configures the `mix.exs` file to ensure `npm ci` is run before asset build or deployment steps. This guarantees that npm dependencies are installed correctly, preventing build failures.

```elixir
      "assets.build": ["cmd --cd assets npm ci", "tailwind your_app", "esbuild your_app"],
      "assets.deploy": [
        "cmd --cd assets npm ci",
        "tailwind your_app --minify",
        "esbuild your_app --minify",
        "phx.digest"
      ]

```

--------------------------------

### Update LiveView Routing Options (Elixir)

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Migrates routing from `:layout` and `:container` options in `Phoenix.LiveView.Routing.live/4` to `:root_layout` and `:container` options in `Phoenix.Router.live_session/3` to align with LiveView 0.16 changes. This ensures proper layout rendering for live sessions.

```elixir
live_session :session_name, root_layout: {MyAppWeb.LayoutView, "custom_layout.html"} do
  live "/path", MyAppWeb.PageLive
end
```

--------------------------------

### Invoke Custom Admin Layout Component

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/components

Shows how to invoke a custom `admin` layout component from the `Layouts` module. This is an example of creating and using alternative layouts dynamically within a Phoenix application.

```html
<Layouts.admin flash={@flash}>
  ...
</Layouts.admin>
```

--------------------------------

### Allow ColocatedHooks at LiveComponent root

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Enables `ColocatedHook`s to be used at the root level of a LiveComponent in Phoenix LiveView. This provides more flexibility in organizing and defining component-specific JavaScript behavior.

```elixir
defmodule MyComponent do
  use Phoenix.LiveComponent

  # ColocatedHook can now be defined here at the root
  @live_component {
    MyComponent,
    colocated_hooks: [MyHook]
  }

  def render(assigns) do
    # ...
  end
end
```

--------------------------------

### Phoenix Controller Plug Declaration

Source: https://hexdocs.pm/phoenix/plug

Shows how to declare plugs directly within a Phoenix controller. This allows for plug execution before controller actions are invoked. An example demonstrates conditional execution of a plug based on the action being performed.

```elixir
defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug HelloWeb.Plugs.Locale, "en"

```

```elixir
defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug HelloWeb.Plugs.Locale, "en" when action in [:index]

```

--------------------------------

### Phoenix JSON View Module Example

Source: https://hexdocs.pm/phoenix/1.7.14/controllers

This Elixir code defines a simple view module for rendering JSON responses in Phoenix. The `home/1` function takes assigns and returns a map, which Phoenix will automatically serialize to JSON.

```elixir
defmodule HelloWeb.PageJSON do
  def home(_assigns) do
    %{message: "this is some JSON"}
  end
endcopy
```

--------------------------------

### Phoenix HTML Controller Test Structure

Source: https://hexdocs.pm/phoenix/1.7.14/testing_controllers

Defines a test module for a Phoenix controller, inheriting from `HelloWeb.ConnCase` for connection setup. It includes fixtures and module attributes for use in tests, and organizes tests for different controller actions using `describe` blocks.

```elixir
defmodule HelloWeb.PostControllerTest do
  use HelloWeb.ConnCase

  import Hello.BlogFixtures

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}
  
  describe "index" do
    test "lists all posts", %{conn: conn} do
      conn = get(conn, ~p"/posts")
      assert html_response(conn, 200) =~ "Listing Posts"
    end
  end

  ...
```

--------------------------------

### LiveView Bug Fix: Live Layout Application

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This fix addresses an issue where the live layout was not being applied until after the initial connected render. The correction ensures that the live layout is correctly applied from the mount phase, providing a consistent initial rendering. The input is the initial render of a LiveView, and the output is the correct application of the layout.

```elixir
Fix live layout not being applied until connected render
Fix live layout not being applied when passed to `:live_session` during disconnect render
```

--------------------------------

### Filtered Resources API (Comments - Except Delete)

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/routing

This section demonstrates how to use the `:except` option with the `resources` macro to exclude specific actions. Example shows all actions except delete for comments.

```APIDOC
## GET /comments

### Description
Retrieves a list of all comments.

### Method
GET

### Endpoint
/comments

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
None

### Response
#### Success Response (200)
- **comments** (array) - A list of comment objects.

#### Response Example
```json
{
  "comments": [
    {
      "id": 1,
      "text": "Great post!"
    }
  ]
}
```

## GET /comments/:id/edit

### Description
Retrieves a form to edit a specific comment.

### Method
GET

### Endpoint
/comments/:id/edit

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the comment.

#### Query Parameters
None

#### Request Body
None

### Request Example
None

### Response
#### Success Response (200)
- **html** (string) - HTML form for editing the comment.

#### Response Example
```html
<html><body><form>...</form></body></html>
```

## GET /comments/new

### Description
Retrieves a form to create a new comment.

### Method
GET

### Endpoint
/comments/new

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
None

### Response
#### Success Response (200)
- **html** (string) - HTML form for creating a new comment.

#### Response Example
```html
<html><body><form>...</form></body></html>
```

## GET /comments/:id

### Description
Retrieves a specific comment by its ID.

### Method
GET

### Endpoint
/comments/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the comment.

#### Query Parameters
None

#### Request Body
None

### Request Example
None

### Response
#### Success Response (200)
- **comment** (object) - The comment object.

#### Response Example
```json
{
  "comment": {
    "id": 1,
    "text": "Great post!"
  }
}
```

## POST /comments

### Description
Creates a new comment.

### Method
POST

### Endpoint
/comments

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
- **text** (string) - Required - The content of the comment.

### Request Example
```json
{
  "text": "Another comment"
}
```

### Response
#### Success Response (200 or 201)
- **comment** (object) - The created comment object.

#### Response Example
```json
{
  "comment": {
    "id": 2,
    "text": "Another comment"
  }
}
```

## PATCH /comments/:id

### Description
Updates an existing comment.

### Method
PATCH

### Endpoint
/comments/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the comment.

#### Query Parameters
None

#### Request Body
- **text** (string) - Optional - The updated content of the comment.

### Request Example
```json
{
  "text": "Updated comment"
}
```

### Response
#### Success Response (200)
- **comment** (object) - The updated comment object.

#### Response Example
```json
{
  "comment": {
    "id": 2,
    "text": "Updated comment"
  }
}
```

## PUT /comments/:id

### Description
Updates an existing comment (alternative to PATCH).

### Method
PUT

### Endpoint
/comments/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The unique identifier of the comment.

#### Query Parameters
None

#### Request Body
- **text** (string) - Optional - The updated content of the comment.

### Request Example
```json
{
  "text": "Updated comment"
}
```

### Response
#### Success Response (200)
- **comment** (object) - The updated comment object.

#### Response Example
```json
{
  "comment": {
    "id": 2,
    "text": "Updated comment"
  }
}
```
```

--------------------------------

### Get Template Hash (Elixir)

Source: https://hexdocs.pm/phoenix/_template/1.0.4/Phoenix

Calculates and returns a binary hash of all template paths within a given root directory. Phoenix uses this hash to detect changes and trigger recompilation when templates are modified.

```elixir
@spec hash(root(), pattern :: String.t(), %{required(atom()) => module()}) :: binary()
```

--------------------------------

### Support handle_async Lifecycle Callback in LiveView

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This enhancement introduces the `handle_async` lifecycle callback to LiveView. This allows developers to handle asynchronous operations directly within the LiveView lifecycle, simplifying the management of background tasks and data fetching.

```elixir
def handle_async(:task_done, result, socket) do
  {:noreply, assign(socket, :data, result)}
end

def handle_event("start_task", _, socket) do
  tasks = %{my_task: fetch_data_async()} # Assume fetch_data_async returns a Task
  {:noreply, put_in(socket.assigns.tasks, tasks)}
end
```

--------------------------------

### Functions

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/Phoenix

Overview and usage of various LiveView functions.

```APIDOC
## Functions

### `__using__(opts)`

Uses LiveView in the current module to mark it a LiveView.

#### Options

* `:namespace` - configures the namespace the `LiveView` is in
* `:container` - configures the container the `LiveView` will be wrapped in
* `:layout` - configures the layout the `LiveView` will be rendered in

#### Example
```elixir
use Phoenix.LiveView,
  namespace: MyAppWeb,
  container: {:tr, class: "colorized"},
  layout: {MyAppWeb.LayoutView, "live.html"}
```

### `assign(socket, attrs)`

See `assign/3`.

### `assign(socket, key, value)`

Adds key value pairs to socket assigns. A single key value pair may be passed, or a keyword list of assigns may be provided to be merged into existing socket assigns.

#### Examples
```elixir
inex> assign(socket, :name, "Elixir")
inex> assign(socket, name: "Elixir", logo: "💧")
```

### `assign_new(socket, key, func)`

Assigns a value into the socket only if it does not exist. Useful for lazily assigning values and referencing parent assigns.

#### Referencing parent assigns
When a LiveView is mounted in a disconnected state, the Plug.Conn assigns will be available for reference via `assign_new/3`, allowing assigns to be shared for the initial HTTP request. On connected mount, `assign_new/3` will be invoked, and the LiveView will use its session to rebuild the originally shared assign. Likewise, nested LiveView children have access to their parent's assigns on mount using `assign_new`, which allows assigns to be shared down the nested LiveView tree.

#### Examples
```elixir
# controller
conn
|> assign(:current_user, user)
|> LiveView.Controller.live_render(MyLive, session: %{"user_id" => user.id})

# LiveView mount
def mount(_params, %{"user_id" => user_id}, socket) do
  {:ok, assign_new(socket, :current_user, fn -> Accounts.get_user!(user_id) end)}
end
```

### `clear_flash(socket)`

Clears the flash.

#### Examples
```elixir
inex> clear_flash(socket)
```

### `clear_flash(socket, key)`

Clears a key from the flash.

#### Examples
```elixir
inex> clear_flash(socket, :info)
```

### `connected?(socket)`

Returns true if the socket is connected.

Useful for checking the connectivity status when mounting the view. For example, on initial page render, the view is mounted statically, rendered, and the HTML is sent to the client. Once the client connects to the server, a LiveView is then spawned and mounted statefully within a process. Use `connected?/1` to conditionally perform stateful work, such as subscribing to pubsub topics, sending messages, etc.

#### Examples
```elixir
defmodule DemoWeb.ClockLive do
  use Phoenix.LiveView
  ...
  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tick)
    {:ok, assign(socket, date: :calendar.local_time())}
  end

  def handle_info(:tick, socket) do
    {:noreply, assign(socket, date: :calendar.local_time())}
  end
end
```

### `get_connect_params(socket)`

Accesses the connect params sent by the client for use on connected mount.

### `push_patch(socket, opts)`

Annotates the socket for navigation within the current LiveView.

### `push_redirect(socket, opts)`

Annotates the socket for navigation to another LiveView.

### `put_flash(socket, kind, msg)`

Adds a flash message to the socket to be displayed on redirect.

### `redirect(socket, opts)`

Annotates the socket for redirect to a destination path.

### `send_update(module, assigns)`

Asynchronously updates a component with new assigns.

### `transport_pid(socket)`

Returns the transport pid of the socket.

### `update(socket, key, func)`

Updates an existing key in the socket assigns.
```

--------------------------------

### Test LiveView Redirected Mount

Source: https://hexdocs.pm/phoenix/_live_view/Phoenix

Demonstrates how to test a LiveView mount that results in a redirect. It uses the `live/1` function from `Phoenix.LiveViewTest` and asserts that the expected redirect error tuple is returned. This is useful for verifying navigation logic during initial view setup.

```elixir
test "redirected mount", %{conn: conn} do
  assert {:error, {:redirect, %{to: "/somewhere"}}} = live(conn, "my-path")
end
```

--------------------------------

### Order Show HEEx Template

Source: https://hexdocs.pm/phoenix/1.7.14/contexts

This HEEx template (`show.html.heex`) renders the details of a completed order. It displays a header with a thank you message and the user's UUID, followed by a table listing the order's line items (product title, quantity, price), and finally the total price.

```heex
<.header>
  Thank you for your order!
  <:subtitle>
     <strong>User uuid: </strong><%= @order.user_uuid %>
  </:subtitle>
</.header>

<.table id="items" rows={@order.line_items}>
  <:col :let={item} label="Title"><%= item.product.title %></:col>
  <:col :let={item} label="Quantity"><%= item.quantity %></:col>
  <:col :let={item} label="Price">
    <%= HelloWeb.CartHTML.currency_to_str(item.price) %>
  </:col>
</.table>

<strong>Total price:</strong>
<%= HelloWeb.CartHTML.currency_to_str(@order.total_price) %>

<.back navigate={~p"/products"}>Back to products</.back>
```

--------------------------------

### Phoenix JSON API - CRUD Operations

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/json_and_apis

This section covers the standard CRUD (Create, Read, Update, Delete) operations for the /api/urls endpoint, generated using Phoenix's phx.gen.json.

```APIDOC
## GET /api/urls

### Description
Retrieves a list of all URLs.

### Method
GET

### Endpoint
/api/urls

### Parameters
None

### Request Example
```json
{}
```

### Response
#### Success Response (200)
- **data** (array) - An array of URL objects.

#### Response Example
```json
{
  "data": [
    {
      "id": 1,
      "link": "https://phoenixframework.org",
      "title": "Phoenix Framework"
    }
  ]
}
```

## POST /api/urls

### Description
Creates a new URL entry.

### Method
POST

### Endpoint
/api/urls

### Parameters
#### Request Body
- **url** (object) - Required - The URL object to create.
  - **link** (string) - Required - The URL string.
  - **title** (string) - Required - The title of the URL.

### Request Example
```json
{
  "url": {
    "link": "https://phoenixframework.org",
    "title": "Phoenix Framework"
  }
}
```

### Response
#### Success Response (201)
- **data** (object) - The newly created URL object.

#### Response Example
```json
{
  "data": {
    "id": 1,
    "link": "https://phoenixframework.org",
    "title": "Phoenix Framework"
  }
}
```

## GET /api/urls/:id

### Description
Retrieves a specific URL entry by its ID.

### Method
GET

### Endpoint
/api/urls/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The ID of the URL to retrieve.

### Request Example
```json
{}
```

### Response
#### Success Response (200)
- **data** (object) - The URL object.

#### Response Example
```json
{
  "data": {
    "id": 1,
    "link": "https://phoenixframework.org",
    "title": "Phoenix Framework"
  }
}
```

## PUT /api/urls/:id

### Description
Updates an existing URL entry by its ID.

### Method
PUT

### Endpoint
/api/urls/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The ID of the URL to update.
#### Request Body
- **url** (object) - Required - The updated URL object.
  - **link** (string) - Optional - The updated URL string.
  - **title** (string) - Optional - The updated title of the URL.

### Request Example
```json
{
  "url": {
    "title": "Phoenix Framework Updated"
  }
}
```

### Response
#### Success Response (200)
- **data** (object) - The updated URL object.

#### Response Example
```json
{
  "data": {
    "id": 1,
    "link": "https://phoenixframework.org",
    "title": "Phoenix Framework Updated"
  }
}
```

## DELETE /api/urls/:id

### Description
Deletes a specific URL entry by its ID.

### Method
DELETE

### Endpoint
/api/urls/:id

### Parameters
#### Path Parameters
- **id** (integer) - Required - The ID of the URL to delete.

### Request Example
```json
{}
```

### Response
#### Success Response (204)
No content is returned on successful deletion.

#### Response Example
```json
null
```
```

--------------------------------

### Phoenix Tracker Callbacks

Source: https://hexdocs.pm/phoenix/_pubsub/1.1.2/Phoenix

Documentation for the `handle_diff` and `init` callbacks within the Phoenix Tracker module.

```APIDOC
## Phoenix.Tracker Callbacks

### `handle_diff/2`

#### Description
Callback function to handle differences in presence information.

#### Method
(N/A - Elixir callback)

#### Endpoint
(N/A - Elixir callback)

#### Parameters
##### State Parameter
- **state** (term()) - The current state.

##### Presence Diff Parameter
- **%{required(topic()) => {joins :: [presence()], leaves :: [presence()]}}** (map()) - A map containing joins and leaves information for the specified topic.

#### Response
##### Success Response (':ok')
- **{:ok, state :: term()}** - Returns the updated state.

#### Response Example
```elixir
{:ok, new_state}
```

### `init/1`

#### Description
Callback function to initialize the tracker state.

#### Method
(N/A - Elixir callback)

#### Endpoint
(N/A - Elixir callback)

#### Parameters
##### Argument Parameter
- **arg0** (Keyword.t()) - A keyword list of arguments for initialization.

#### Response
##### Success Response (':ok')
- **{:ok, state :: term()}** - Returns the initial state.
##### Error Response (':error')
- **{:error, reason :: term()}** - Returns an error reason if initialization fails.

#### Response Example
```elixir
{:ok, initial_state}
{:error, :initialization_failed}
```
```

--------------------------------

### Query User Emails using Ecto.Query DSL in Elixir

Source: https://hexdocs.pm/phoenix/1.7.17/ecto

Shows how to use Ecto's Query DSL to construct a more specific query, selecting only the email addresses from the users table. It requires importing `Ecto.Query` and uses the `from/2` macro to define the query structure.

```Elixir
iex> import Ecto.Query
Ecto.Query

iex> Repo.all(from u in User, select: u.email)
[debug] QUERY OK source="users" db=0.8ms queue=0.9ms idle=1634.0ms
SELECT u0."email" FROM "users" AS u0 []
["user1@example.com", "user2@example.com"]
```

--------------------------------

### Push Initialization and Usage

Source: https://hexdocs.pm/phoenix/1.4.16/js

Details on how to initialize a `Push` object for sending messages through a channel and its associated methods like `resend`, `send`, and `receive`.

```APIDOC
## Push

### Description
Initializes a `Push` object which is used for sending events and payloads through a Phoenix channel. It allows for setting timeouts, resending messages, and handling different receive statuses.

### Method
#### Initialization
`new Push(channel: Channel, event: string, payload: Object, timeout: number)`

#### Instance Members
- **resend(timeout: number)**: Resends the push with a new timeout.
- **send()**: Sends the push.
- **receive(status: any, callback: any)**: Registers a callback to be executed when a message with the specified status is received.

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```javascript
// Assuming 'channel' is an initialized Channel object
let push = new Push(channel, "join", {user: "Alice"}, 5000)

push.receive("ok", (reply) => {
  console.log("Join successful:", reply)
})

push.receive("error", (reason) => {
  console.log("Join failed:", reason)
})

push.send()

// To resend after a delay:
// setTimeout(() => push.resend(10000), 6000)
```

### Response
#### Success Response (200)
- **receive(status, callback)**: The callback function receives the payload associated with the specified status.

#### Response Example
```json
{
  "example": "// The callback function receives the payload from the server response.
// For example, if the status is 'ok', the callback will receive the reply payload."
}
```
```

--------------------------------

### LiveView Component Merging Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Ensures proper merging of different components when sharing component subtrees on initial render. This resolves issues with duplicated or lost component data.

```elixir
Properly merge different components when sharing component subtrees on initial render
```

--------------------------------

### Phoenix Article JSON Rendering Module

Source: https://hexdocs.pm/phoenix/testing_controllers

Defines how article data is structured for JSON output in Phoenix. Includes functions to format a list of articles and a single article for JSON responses. The 'data' function handles the serialization of individual Article structs.

```elixir
defmodule HelloWeb.ArticleJSON do
  alias Hello.News.Article

  def index(%{articles: articles}) do
    %{data: for(article <- articles, do: data(article))}
  end

  def show(%{article: article}) do
    %{data: data(article)}
  end

  defp data(%Article{} = article) do
    %{      id: article.id,
      title: article.title,
      body: article.body
    }
  end
end
```

--------------------------------

### Fix Nested LiveRender Remount

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes nested `live_render` calls that caused remounting of child LiveViews even when the ID did not change. This improves performance by avoiding unnecessary re-renders.

```elixir
Fix nested `live_render`'s causing remount of child LiveView even when ID does not change
```

--------------------------------

### Create Gigalixir Application

Source: https://hexdocs.pm/phoenix/gigalixir

Creates a new application on Gigalixir, allowing you to specify a unique application name. If no name is provided, a random one will be assigned.

```bash
gigalixir create -n "your-app-name"
```

--------------------------------

### Configure Phoenix Browser Pipeline for User and Cart - Elixir

Source: https://hexdocs.pm/phoenix/1.7.14/contexts

This code configures the browser pipeline in `lib/hello_web/router.ex` to include plugs for fetching the current user and their associated shopping cart. It defines helper functions `fetch_current_user` and `fetch_current_cart` to manage user sessions and cart data, ensuring a cart is always available for the user.

```Elixir
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {HelloWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
+   plug :fetch_current_user
+   plug :fetch_current_cart
  end

+ defp fetch_current_user(conn, _) do
+   if user_uuid = get_session(conn, :current_uuid) do
+     assign(conn, :current_uuid, user_uuid)
+   else
+     new_uuid = Ecto.UUID.generate()
+
+     conn
+     |> assign(:current_uuid, new_uuid)
+     |> put_session(:current_uuid, new_uuid)
+   end
+ end

+ alias Hello.ShoppingCart
+
+ defp fetch_current_cart(conn, _opts) do
+   if cart = ShoppingCart.get_cart_by_user_uuid(conn.assigns.current_uuid) do
+     assign(conn, :cart, cart)
+   else
+     {:ok, new_cart} = ShoppingCart.create_cart(conn.assigns.current_uuid)
+     assign(conn, :cart, new_cart)
+   end
+ end
```

--------------------------------

### Applying `on_mount` Hook Directly in LiveView

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/security-model

This example illustrates how to specify an `on_mount` hook directly within a LiveView module. This approach allows for more granular control, enabling you to apply specific authorization logic to individual LiveViews rather than entire sessions.

```elixir
defmodule MyAppWeb.PageLive do
  use MyAppWeb, :live_view
  on_mount MyAppWeb.UserLiveAuth

  ...
end
```

--------------------------------

### Ecto Repo Insert Operation

Source: https://hexdocs.pm/phoenix/1.7.14/contexts

Demonstrates the use of Ecto Repo to insert a new product record into the database. It utilizes a product changeset generated by `Product.changeset/2` and highlights the underlying database access provided by Ecto Repo.

```elixir
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end
```

--------------------------------

### Unified Link Component in Phoenix.Component

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Replaces EEx expression counterparts like `live_redirect`, `live_patch`, and `Phoenix.HTML.link` with a unified `Phoenix.Component.link/1` function component. This component supports different navigation types through attributes like `href`, `navigate`, and `patch`.

```elixir
<.link href="https://myapp.com">my app</.link>
<.link navigate={@path}>remount</.link>
<.link patch={@path}>patch</.link>
```

--------------------------------

### Deprecated render_block Function

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Announces the deprecation of the `render_block/2` function in favor of `render_slot/2`. This change aligns with the introduction of slots in LiveComponents and function components, providing a more consistent API for rendering content.

```elixir
render_block(@socket, @my_block)
```

```elixir
render_slot(@my_block)
```

--------------------------------

### Phoenix Controller Action with Parameter Extraction (Elixir)

Source: https://hexdocs.pm/phoenix/1.7.17/request_lifecycle

Shows an example of a controller action in Phoenix that handles incoming requests with dynamic URL parameters. The 'show/2' function in HelloController pattern matches the 'messenger' parameter from the request's parameters map and passes it to the 'show' template for rendering.

```elixir
def show(conn, %{"messenger" => messenger}) do
  render(conn, :show, messenger: messenger)
end
```

--------------------------------

### Phoenix Plug Callbacks: init/1 and call/2

Source: https://hexdocs.pm/phoenix/Phoenix.Endpoint

Implements the required callback functions for a Phoenix Plug. The `init/1` function is called once when the plug is initialized, and the `call/2` function is invoked for each incoming request to process the connection. These are standard Plug interface methods.

```elixir
def init(arg)

# Callback implementation for `Plug.init/1`.

def call(conn, arg)

# Callback implementation for `Plug.call/2`.
```

--------------------------------

### Set Phoenix Plug Initialization Mode

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/Phoenix

Explains how to set the `:plug_init_mode` to control when plugs are initialized. It recommends `:runtime` for development and `:compile` (default) for production, impacting compilation times.

```elixir
config :phoenix, :plug_init_mode, :runtime
```

--------------------------------

### LiveView Handle Params Telemetry Events (Elixir)

Source: https://hexdocs.pm/phoenix/_live_view/telemetry

These events track the execution of the handle_params/3 callback in Phoenix.LiveView. They provide start and stop measurements, as well as an exception event, detailing the socket, parameters, and URI involved.

```elixir
[:phoenix, :live_view, :handle_params, :start]
Measurement: %{system_time: System.monotonic_time}
Metadata: %{socket: Phoenix.LiveView.Socket.t, params: unsigned_params, uri: String.t()}
```

```elixir
[:phoenix, :live_view, :handle_params, :stop]
Measurement: %{duration: native_time}
Metadata: %{socket: Phoenix.LiveView.Socket.t, params: unsigned_params, uri: String.t()}
```

```elixir
[:phoenix, :live_view, :handle_params, :exception]
Measurement: %{duration: native_time}
Metadata: %{socket: Phoenix.LiveView.Socket.t, kind: atom, reason: term, params: unsigned_params, uri: String.t()}
```

--------------------------------

### Create a Simple GenServer Emitting Telemetry Events in Elixir

Source: https://hexdocs.pm/phoenix/1.7.14/telemetry

Provides an example of a simple GenServer that emits telemetry events. This demonstrates how to integrate custom metrics and instrumentation within an application using the :telemetry package, allowing for custom measurements beyond those provided by frameworks.

```elixir
defmodule MyApp.MyServer do
  use GenServer

  # Client API
  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  # Server Callbacks
  def init(:ok) do
    # Measure the number of users periodically
    # This is just an example, you would typically fetch this from your DB
    {:ok, _pid} =
      :telemetry.start_timer(
        10000,
        Periodic.Fn.new(fn ->
          :telemetry.execute([:my_app, :users], %{total: 100}, %{})
        end),
        name: :my_app_users_poller
      )

    {:ok, %{}}
  end

  # Handle calls
  def handle_call(:ping, _from, state) do
    # Report duration and exceptions of calls
    :telemetry.span([:my_app, :my_server, :handle_call], %{call: :ping}, fn ->
      # Do some work here
      {:reply, :pong, state}
    end)
  end

  # Handle info messages
  def handle_info(:tick, state) do
    # Report metrics for specific events
    :telemetry.execute([:my_app, :my_server, :tick], %{value: System.system_time(:seconds)}, %{})
    {:noreply, state}
  end
end
```

--------------------------------

### Phoenix OrderController Create Action

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/more_examples

Implements the `create` action for the OrderController, which handles the process of completing an order. It calls an Orders context function `complete_order/2` and redirects the user based on the success or failure of the operation.

```elixir
defmodule HelloWeb.OrderController do
  use HelloWeb, :controller

  alias Hello.Orders

  def create(conn, _) do
    case Orders.complete_order(conn.assigns.current_scope, conn.assigns.cart) do
      {:ok, order} ->
        conn
        |> put_flash(:info, "Order created successfully.")
        |> redirect(to: ~p"/orders/#{order}")

      {:error, _reason} ->
        conn
        |> put_flash(:error, "There was an error processing your order")
        |> redirect(to: ~p"/cart")
    end
  end
end
```

--------------------------------

### Elixir LiveDashboard PM Callback Signatures

Source: https://hexdocs.pm/phoenix/_live_dashboard/Phoenix.LiveDashboard

Provides the signatures for optional and required callbacks in Phoenix LiveDashboard PM, such as init, handle_event, and render.

```elixir
@callback handle_event(event :: binary(), unsigned_params(), socket :: Socket.t()) ::
  {:noreply, Socket.t()} | {:reply, map(), Socket.t()}

```

```elixir
@callback handle_info(msg :: term(), socket :: Socket.t()) :: {:noreply, Socket.t()}

```

```elixir
@callback handle_params(unsigned_params(), uri :: String.t(), socket :: Socket.t()) ::
  {:noreply, Socket.t()}

```

```elixir
@callback handle_refresh(socket :: Socket.t()) :: {:noreply, Socket.t()}

```

```elixir
@callback init(term()) :: {:ok, session()} | {:ok, session(), requirements()}

```

```elixir
@callback menu_link(session(), capabilities()) ::
  {:ok, String.t()}
  | {:disabled, String.t()}
  | {:disabled, String.t(), String.t()}
  | :skip

```

```elixir
@callback mount(unsigned_params(), session(), socket :: Socket.t()) ::
  {:ok, Socket.t()} | {:ok, Socket.t(), keyword()}

```

```elixir
@callback render(assigns :: Socket.assigns()) :: Phoenix.LiveView.Rendered.t()

```

--------------------------------

### Deploy Elixir Application Instances to Multiple Regions

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/fly

Guides through adding a new region to an Elixir application's deployment on Fly.io and scaling to multiple instances, distributing them across different geographical locations. It verifies clustering between instances in separate regions.

```bash
$ fly regions add ewr
Region Pool:
ewr
sea
Backup Region:
iad
lax
sjc
vin

$ fly status
... 
Instances
ID       VERSION REGION DESIRED STATUS  HEALTH CHECKS      RESTARTS CREATED
cdf6c422 29      sea    run     running 1 total, 1 passing 0        58s ago

$ fly scale count 2
Count changed to 2

$ fly status
... 
Instances
ID       VERSION REGION DESIRED STATUS  HEALTH CHECKS      RESTARTS CREATED
0a8e6666 30      ewr    run     running 1 total, 1 passing 0        16s ago
cdf6c422 30      sea    run     running 1 total, 1 passing 0        6m47s ago

$ fly ssh console -C "/app/bin/my_app remote"
iex(my-app-1234@fdaa:0:1da8:a7b:ac2:cdf6:c422:2)1> Node.list
[:"my-app-1234@fdaa:0:1da8:a7b:ab2:a8e:6666:2"]
```

--------------------------------

### Phoenix Router Configuration for JSON Format Acceptance

Source: https://hexdocs.pm/phoenix/1.7.17/controllers

Modifies the Phoenix router's browser pipeline to explicitly accept the JSON format in addition to HTML. This is crucial for handling JSON requests.

```elixir
defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html", "json"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {HelloWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end
...
```

--------------------------------

### Phoenix Controller Action Sending Direct Response with Content Type

Source: https://hexdocs.pm/phoenix/1.7.17/controllers

Demonstrates how to send a direct HTTP response in Phoenix while explicitly setting the 'Content-Type' header using `put_resp_content_type/2` before calling `send_resp/3`.

```elixir
def home(conn, _params) do
  conn
  |> put_resp_content_type("text/plain")
  |> send_resp(201, "")
end
```

--------------------------------

### Simulate LiveView Click Event with Additional Value

Source: https://hexdocs.pm/phoenix/_live_view/Phoenix

This example shows how to simulate a click event on a LiveView, including sending an additional value with the event, and then asserting the updated content. It uses `live/2` to set up the view and `render_click/3` to send the event and value.

```Elixir
{:ok, view, html} = live(conn, "/thermo")
assert html =~ "The temperature is: 30℉"
assert render_click(view, :inc) =~ "The temperature is: 31℉"
```

--------------------------------

### Get PubSub Node Name (Elixir)

Source: https://hexdocs.pm/phoenix/_pubsub/index

Retrieves the node name of the running PubSub server. The `node_name/1` function takes the pubsub system name as an argument and returns the identifier of the node where the pubsub is hosted.

```Elixir
alias Phoenix.PubSub

# Get the node name of the :my_pubsub system
PubSub.node_name(:my_pubsub)
```

--------------------------------

### Support passing @myself for Phoenix.LiveView.send_update/3

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This enhancement allows the `@myself` variable to be passed as the target for `Phoenix.LiveView.send_update/3`. This simplifies sending updates to the current LiveView process, particularly within nested components, by providing a direct reference.

```elixir
send_update(@myself, :update_count, [1])
```

--------------------------------

### Define Redirect Target Action in Phoenix Controller

Source: https://hexdocs.pm/phoenix/1.7.14/controllers

Defines the controller action that serves as the target for a redirect. In this example, `redirect_test` simply renders the 'home' view without a layout, demonstrating a successful redirection.

```elixir
def redirect_test(conn, _params) do
  render(conn, :home, layout: false)
end
```

--------------------------------

### Custom esbuild Build Script for Phoenix

Source: https://hexdocs.pm/phoenix/1.7.14/asset_management

A Node.js script (`build.js`) that configures and runs esbuild for bundling JavaScript assets. It supports watch mode and production builds with minification. Requires `esbuild` to be installed as a dev dependency.

```javascript
const esbuild = require("esbuild");

const args = process.argv.slice(2);
const watch = args.includes('--watch');
const deploy = args.includes('--deploy');

const loader = {
  // Add loaders for images/fonts/etc, e.g. { '.svg': 'file' }
};

const plugins = [
  // Add and configure plugins here
];

// Define esbuild options
let opts = {
  entryPoints: ["js/app.js"],
  bundle: true,
  logLevel: "info",
  target: "es2017",
  outdir: "../priv/static/assets",
  external: ["*.css", "fonts/*", "images/*"],
  nodePaths: ["../deps"],
  loader: loader,
  plugins: plugins,
};

if (deploy) {
  opts = {
    ...opts,
    minify: true,
  };
}

if (watch) {
  opts = {
    ...opts,
    sourcemap: "inline",
  };
  esbuild
    .context(opts)
    .then((ctx) => {
      ctx.watch();
    })
    .catch((_error) => {
      process.exit(1);
    });
} else {
  esbuild.build(opts);
}
```

--------------------------------

### Construct Phoenix Socket with Token in JavaScript

Source: https://hexdocs.pm/phoenix/1.7.14/channels

Provides an example of how to construct a Phoenix WebSocket `Socket` in JavaScript, passing the authentication token in the connection parameters. The `window.userToken` is used to initialize the socket, ensuring authenticated communication.

```javascript
let socket = new Socket("/socket", {params: {token: window.userToken}})
```

--------------------------------

### Insert User Record using Repo.insert/2 in Elixir

Source: https://hexdocs.pm/phoenix/1.7.17/ecto

Demonstrates inserting a new user record into the database using the `Repo.insert/2` function with a User struct. It shows the expected output and debug logs for a successful insertion. This method is part of Ecto's repository interface for data persistence.

```Elixir
iex> alias Hello.{Repo, User}
[Hello.Repo, Hello.User]

iex> Repo.insert(%User{email: "user1@example.com"})
[debug] QUERY OK db=6.5ms queue=0.5ms idle=1358.3ms
INSERT INTO "users" ("email","inserted_at","updated_at") VALUES ($1,$2,$3) RETURNING "id" ["user1@example.com", ~N[2021-02-25 01:58:55], ~N[2021-02-25 01:58:55]]
{:ok,
 %Hello.User{
   __meta__: #Ecto.Schema.Metadata<:loaded, "users">
   bio: nil,
   email: "user1@example.com",
   id: 1,
   inserted_at: ~N[2021-02-25 01:58:55],
   name: nil,
   number_of_pets: nil,
   updated_at: ~N[2021-02-25 01:58:55]
 }}

iex> Repo.insert(%User{email: "user2@example.com"})
[debug] QUERY OK db=1.3ms idle=1402.7ms
INSERT INTO "users" ("email","inserted_at","updated_at") VALUES ($1,$2,$3) RETURNING "id" ["user2@example.com", ~N[2021-02-25 02:03:28], ~N[2021-02-25 02:03:28]]
{:ok,
 %Hello.User{
   __meta__: #Ecto.Schema.Metadata<:loaded, "users">
   bio: nil,
   email: "user2@example.com",
   id: 2,
   inserted_at: ~N[2021-02-25 02:03:28],
   name: nil,
   number_of_pets: nil,
   updated_at: ~N[2021-02-25 02:03:28]
 }}
```

--------------------------------

### Render a Nested LiveView in LiveView

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/welcome

Nested LiveViews provide complete isolation by running in a separate process from their parent. They are rendered using `live_render/3` and require a unique `:id` for identification. This is suitable for complex, isolated UI elements.

```elixir
# Example of how a nested LiveView might be rendered (conceptual)
# live_render(@socket, ChildLiveView, id: child_id, session: %{data: some_data})
```

--------------------------------

### Define a HEEx Function Component in LiveView

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/welcome

Function components, defined using HEEx templates, accept an assigns map and return a HEEx template. They are useful for reusing markup within LiveViews. Dependencies include HEEx templating.

```elixir
def weather_greeting(assigns) do
  ~H"""
  <div title="My div" class={@class}>
    <p>Hello {@name}</p>
    <MyApp.Weather.city name="Kraków"/>
  </div>
  """
end
```

--------------------------------

### Fly.io CLI Authentication

Source: https://hexdocs.pm/phoenix/fly

Commands to sign up for a new Fly.io account or log in to an existing one. Authentication is required before deploying applications.

```bash
fly auth signup
fly auth login
```

--------------------------------

### Phoenix.Tracker.update/5 Example Usage (Function)

Source: https://hexdocs.pm/phoenix/_pubsub/Phoenix

Demonstrates updating a presence's metadata by providing a function. This function receives the current metadata and returns the modified metadata, allowing for dynamic updates like setting an 'away' status.

```elixir
iex> Phoenix.Tracker.update(MyTracker, self(), "lobby", u.id, fn meta -> Map.put(meta, :away, true) end)
{:ok, "1WpAofWYIAA="}
```

--------------------------------

### Connecting to Phoenix Channels

Source: https://hexdocs.pm/phoenix/writing_a_channels_client

Explains how to establish a WebSocket connection to Phoenix Channels, including the endpoint URL and required headers.

```APIDOC
## Connecting to Phoenix Channels

### Description
To establish a WebSocket connection to Phoenix Channels, you need to know the `socket` path defined in your application's `Endpoint` module. The connection URL typically appends `/websocket?vsn=2.0.0` to this path. Ensure you include the necessary HTTP headers for a WebSocket upgrade or use a library that handles this automatically.

### Method
GET

### Endpoint
`[host]:[port]/<socket_path>/websocket?vsn=2.0.0`

### Parameters
#### Query Parameters
- **vsn** (string) - Required - Specifies the Phoenix Socket version, typically `2.0.0` for JSON serialization.

### Request Example
```
GET /[socket_path]/websocket?vsn=2.0.0 HTTP/1.1
Host: [host]:[port]
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: [key]
Sec-WebSocket-Version: 13
```

### Response
#### Success Response (101 Switching Protocols)
Indicates that the WebSocket connection has been successfully established.

#### Response Example
(A successful HTTP 101 response indicates the WebSocket connection is open.)
```

--------------------------------

### Define User Resource Routes with Phoenix

Source: https://hexdocs.pm/phoenix/1.7.14/routing

This code snippet demonstrates how to define a resource route for users using the `resources` macro in a Phoenix router. It assumes a `UserController` exists and maps standard HTTP verbs to controller actions like index, show, create, update, and delete.

```elixir
scope "/", HelloWeb do
  pipe_through :browser

  get "/", PageController, :home
  resources "/users", UserController
end
```

--------------------------------

### Define API Routes with Scopes

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/routing

This example demonstrates how to define versioned API routes using nested scopes. It organizes resources like images, reviews, and users under an API scope with versioning. Ensure controllers are correctly namespaced within their respective modules.

```elixir
scope "/api", HelloWeb.Api do
  pipe_through :api

  scope "/v1", V1 do
    resources "/images",  ImageController
    resources "/reviews", ReviewController
    resources "/users",   UserController
  end
end
```

--------------------------------

### Define MyApp.MyServer GenServer with Telemetry

Source: https://hexdocs.pm/phoenix/1.7.14/telemetry

Defines a GenServer module that executes a provided function and emits telemetry events for start, stop, and exceptions. It uses the :telemetry library for event reporting. Dependencies include the standard Elixir/Erlang runtime.

```elixir
defmodule MyApp.MyServer do
  @moduledoc """
  An example GenServer that runs arbitrary functions and emits telemetry events when called.
  """
  use GenServer

  # A common prefix for :telemetry events
  @prefix [:my_app, :my_server, :call]

  def start_link(fun) do
    GenServer.start_link(__MODULE__, fun, name: __MODULE__)
  end

  @doc """
  Runs the function contained within this server.

  ## Events

  The following events may be emitted:

    * `[:my_app, :my_server, :call, :start]` - Dispatched
      immediately before invoking the function. This event
      is always emitted.

      * Measurement: `%{system_time: system_time}`

      * Metadata: `%{}`

    * `[:my_app, :my_server, :call, :stop]` - Dispatched
      immediately after successfully invoking the function.

      * Measurement: `%{duration: native_time}`

      * Metadata: `%{}`

    * `[:my_app, :my_server, :call, :exception]` - Dispatched
      immediately after invoking the function, in the event
      the function throws or raises.

      * Measurement: `%{duration: native_time}`

      * Metadata: `%{kind: kind, reason: reason, stacktrace: stacktrace}`
  """
  def call!, do: GenServer.call(__MODULE__, :called)

  @impl true
  def init(fun) when is_function(fun, 0), do: {:ok, fun}

  @impl true
  def handle_call(:called, _from, fun) do
    # Wrap the function invocation in a "span"
    result = telemetry_span(fun)

    {:reply, result, fun}
  end

  # Emits telemetry events related to invoking the function
  defp telemetry_span(fun) do
    start_time = emit_start()

    try do
      fun.()
    catch
      kind, reason ->
        stacktrace = System.stacktrace()
        duration = System.monotonic_time() - start_time
        emit_exception(duration, kind, reason, stacktrace)
        :erlang.raise(kind, reason, stacktrace)
    else
      result ->
        duration = System.monotonic_time() - start_time
        emit_stop(duration)
        result
    end
  end

  defp emit_start do
    start_time_mono = System.monotonic_time()

    :telemetry.execute(
      @prefix ++ [:start],
      %{system_time: System.system_time()},
      %{}
    )

    start_time_mono
  end

  defp emit_stop(duration) do
    :telemetry.execute(
      @prefix ++ [:stop],
      %{duration: duration},
      %{}
    )
  end

  defp emit_exception(duration, kind, reason, stacktrace) do
    :telemetry.execute(
      @prefix ++ [:exception],
      %{duration: duration},
      %{ 
        kind: kind,
        reason: reason,
        stacktrace: stacktrace
      }
    )
  end
end
```

--------------------------------

### Define Distribution Metric for Ecto Query Queue Time

Source: https://hexdocs.pm/phoenix/1.7.14/telemetry

This example demonstrates defining a distribution metric with Telemetry.Metrics.distribution/2 to visualize how long Ecto queries spend in the queue. It specifies the native millisecond unit.

```elixir
Telemetry.Metrics.distribution("my_app.repo.query.queue_time",
  unit: {:native, :millisecond}
)
```

--------------------------------

### LiveView Text Node Memory Leak Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes a text node DOM memory leak that occurred when using `phx-update` with append/prepend. This improves memory management in LiveView.

```elixir
Fix text node DOM memory leak when using `phx-update` append/prepend
```

--------------------------------

### Setting Environment Variables for Production

Source: https://hexdocs.pm/phoenix/releases

Sets essential environment variables like SECRET_KEY_BASE and DATABASE_URL required for production builds and deployments. These are crucial for security and database connectivity.

```shell
export SECRET_KEY_BASE=REALLY_LONG_SECRET
export DATABASE_URL=ecto://USER:PASS@HOST/database
```

--------------------------------

### Implement JS Hooks for LiveView Updates and Destruction (JavaScript)

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Demonstrates the implementation of `beforeUpdate` and `beforeDestroy` JavaScript hooks within LiveView. These hooks allow for custom logic execution before LiveView components are updated or destroyed on the client-side.

```javascript
let liveSocket = new LiveSocket("/live", Socket, {
  params: {_csrf_token: csrfToken},
  hooks: {
    MyComponent: {
      beforeUpdate() {
        console.log("Component about to update");
      },
      beforeDestroy() {
        console.log("Component about to be destroyed");
      }
    }
  }
});
```

--------------------------------

### Importing NProgress for Progress Animation - CSS

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This snippet demonstrates how to replace the default LiveView CSS import with NProgress CSS. It assumes nprogress is added to your project's package.json. This change is part of enabling progress bar animations.

```css
- @import "../../../../deps/phoenix_live_view/assets/css/live_view.css";
+ @import "../node_modules/nprogress/nprogress.css";
```

--------------------------------

### LiveView Testing: Element Selection and Click Simulation (Elixir)

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Demonstrates an enhanced approach to LiveView testing by allowing tests to directly select DOM elements using CSS selectors and text content before simulating click events. This improves test reliability by ensuring the target element exists and matches expected attributes and content, moving towards integration/acceptance testing without a headless browser.

```elixir
live_view
  |> element("#term .buttons a", "Increment")
  |> render_click()
```

--------------------------------

### Phoenix.LiveView.Socket Functions

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/Phoenix.LiveView

Documentation for the core functions within Phoenix.LiveView.Socket, including connection and identification.

```APIDOC
## connect/3

### Description
Connects the Phoenix.Socket for a LiveView client.

### Method
N/A (Function within a module)

### Endpoint
N/A

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```elixir
# Example usage within a LiveView context
# connect(params, socket, connect_info)
```

### Response
#### Success Response (200)
N/A (Returns a socket or modifies socket state)

#### Response Example
```elixir
# Returns a modified socket after connection
# %Phoenix.LiveView.Socket{}
```

## id/1

### Description
Identifies the Phoenix.Socket for a LiveView client.

### Method
N/A (Function within a module)

### Endpoint
N/A

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```elixir
# Example usage to get socket ID
# id(socket)
```

### Response
#### Success Response (200)
N/A (Returns a socket identifier)

#### Response Example
```elixir
# Returns the socket identifier
# any()
```
```

--------------------------------

### LiveView Layouts - Root Layout Structure

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This Elixir snippet demonstrates the updated structure for root layouts in LiveView. It highlights the use of `@inner_content` to render the main LiveView content, replacing the previous `<%= render(@view_module, @view_template, assigns) %>` pattern.

```elixir
<div>
  <header>
    My Root Layout Header
  </header>
  <main>
    <%= @inner_content %>
  </main>
</div>
```

--------------------------------

### HTML Button with Click Event Binding for LiveView

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/bindings

Example of rendering an HTML button with the `phx-click` binding in Phoenix LiveView. This binding triggers a server-side event named 'inc_temperature' when the button is clicked.

```html
<button phx-click="inc_temperature">+</button>
```

--------------------------------

### Handling Click Events with phx-click Binding

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/welcome

Shows how to bind a DOM element's click event to a server-side LiveView event handler using `phx-click`. This allows for client-server interaction without full page reloads.

```html
<button phx-click="inc_temperature">+</button>
```

```elixir
def handle_event("inc_temperature", _value, socket) do
  {:noreply, update(socket, :temperature, &(&1 + 1))}
end
```

--------------------------------

### Define Function Component in Elixir

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Demonstrates how to define a reusable function component in Elixir using `Phoenix.Component`. This component receives assigns and renders a HEEx template. It requires Elixir v1.12+.

```elixir
defmodule MyComponent do
  use Phoenix.Component

  def btn(assigns) do
    ~H"""
    <button class="btn"><%= @text %></button>
    """
  end
end
```

--------------------------------

### Phoenix LiveComponent Handle Event Start Event

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/telemetry

This event is dispatched by a Phoenix.LiveComponent immediately before the handle_event/3 callback is invoked. It logs the system time of invocation and metadata including the socket, component name, event name, and parameters.

```elixir
[:phoenix, :live_component, :handle_event, :start]
```

--------------------------------

### Define a Custom Mix Task Module

Source: https://hexdocs.pm/phoenix/1.7.14/mix_tasks

Defines a basic 'Hello Greeting' Mix task. It uses `Mix.Task`, sets a short documentation string, includes module documentation, and implements the `run/1` function to display a greeting. This task can be invoked using `mix hello.greeting`.

```elixir
defmodule Mix.Tasks.Hello.Greeting do
  use Mix.Task

  @shortdoc "Sends a greeting to us from Hello Phoenix"

  @moduledoc """
  This is where we would put any long form documentation and doctests.
  """

  @impl Mix.Task
  def run(_args) do
    Mix.shell().info("Greetings from the Hello Phoenix Application!")
  end

  # We can define other functions as needed here.
end
```

--------------------------------

### LiveView Preflighted Refs Form Submit Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes preflighted refs causing `auto_upload: true` to fail to submit the form. This ensures that forms with preflighted uploads can be submitted correctly.

```elixir
Fix preflighted refs causing `auto_upload: true` to fail to submit form
```

--------------------------------

### POST /api/articles

Source: https://hexdocs.pm/phoenix/testing_controllers

Creates a new article. It handles both valid and invalid article data. For valid data, it returns the created article with a 201 status. For invalid data, it returns a 422 unprocessable entity status with errors.

```APIDOC
## POST /api/articles

### Description
Creates a new article. It handles both valid and invalid article data. For valid data, it returns the created article with a 201 status. For invalid data, it returns a 422 unprocessable entity status with errors.

### Method
POST

### Endpoint
/api/articles

### Parameters
#### Request Body
- **article** (object) - Required - The article data to create.
  - **title** (string) - Required - The title of the article.
  - **body** (string) - Required - The body content of the article.

### Request Example
```json
{
  "article": {
    "title": "some title",
    "body": "some body"
  }
}
```

### Response
#### Success Response (201)
- **data** (object) - The created article object.
  - **id** (string) - The unique identifier of the article.
  - **title** (string) - The title of the article.
  - **body** (string) - The body content of the article.

#### Success Response Example (201)
```json
{
  "data": {
    "id": "some-article-id",
    "title": "some title",
    "body": "some body"
  }
}
```

#### Error Response (422)
- **errors** (object) - An object containing validation errors.

#### Error Response Example (422)
```json
{
  "errors": {
    "title": ["can't be blank"]
  }
}
```
```

--------------------------------

### Connecting to Phoenix Channels

Source: https://hexdocs.pm/phoenix/1.7.17/writing_a_channels_client

Details on establishing a WebSocket connection to a Phoenix Channels endpoint, including the required URL format and headers.

```APIDOC
## Connecting to Phoenix Channels

### Description
To establish a WebSocket connection to Phoenix Channels, you need to construct a specific URL and include necessary HTTP headers for the WebSocket upgrade.

### Method
GET (for the initial HTTP request to establish the WebSocket connection)

### Endpoint
`[host]:[port]/[socket_path]/websocket?vsn=2.0.0`

### Parameters
#### Query Parameters
- **vsn** (string) - Required - Specifies the version of the Phoenix Socket protocol. `2.0.0` implies `Phoenix.Socket.V2.JSONSerializer`.

#### Request Headers
Standard HTTP headers for upgrading to a WebSocket connection are required. The exact headers depend on your HTTP client library.

### Request Example
```
GET /[socket_path]/websocket?vsn=2.0.0 HTTP/1.1
Host: [host]:[port]
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: [key]
Sec-WebSocket-Version: 13
```

### Response
#### Success Response (101 Switching Protocols)
Upon successful connection establishment, the server responds with a 101 status code, indicating a switch to the WebSocket protocol.

#### Response Example
(No specific body for 101 response, the connection is upgraded)
```

--------------------------------

### LiveView Hidden Input Selection Error Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes a selection range error that occurred with hidden inputs in LiveView. This resolves an issue affecting form input handling.

```elixir
Fix hidden inputs throwing selection range error
```

--------------------------------

### Generate LineItem Context with Phoenix

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/more_examples

This command generates the Ecto schema, context module, and migrations for a 'LineItem' entity within the existing 'Orders' context. It includes price, quantity, and foreign keys to orders and products. Running `mix ecto.migrate` is necessary.

```bash
mix phx.gen.context Orders LineItem order_line_items \
price:decimal quantity:integer \
order_id:references:orders product_id:references:products --no-scope
```

--------------------------------

### Test Client URL Behavior

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Explains that the test client now consistently sends the full URL for `live_patch` and `live_redirect` operations. This change aligns the test client's behavior with the JavaScript client, ensuring more accurate testing.

```elixir
send_redirect(conn, to: "/new/path")
```

--------------------------------

### LiveView Component Rendering Changes

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Removes `@inner_content` in favor of `render_block` for rendering component blocks. This change affects how inner content is passed and rendered within LiveView components.

```elixir
Remove `@inner_content` in components and introduce `render_block` for rendering component `@inner_block`
```

--------------------------------

### Router Plug for Root Layout

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/Phoenix

Shows how to set the root layout for the entire application using a plug in the router configuration.

```elixir
plug :put_root_layout, {MyApp.LayoutView, :root}
```

--------------------------------

### Rename debug_tags_location to debug_attributes

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Renames the `debug_tags_location` configuration option to `debug_attributes` and adds `data-phx-pid` for improved debugging capabilities in Phoenix LiveView. This provides clearer attribute identification during inspection.

```elixir
config :phoenix, :live_view, debug_attributes: true
# Previously: config :phoenix, :live_view, debug_tags_location: true
```

--------------------------------

### Use "on" as default for checkboxes in LiveViewTest

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Sets the default value to 'on' for checkboxes when using `LiveViewTest`. This aligns with standard HTML form submission behavior for checkboxes.

```elixir
defmodule Phoenix.LiveViewTest do
  # ...

  # Default value for checkboxes is now 'on'
  def submit_form(view, params \\ []) do
    # ... logic ensuring checkbox defaults to 'on' if unchecked ...
  end
  # ...
end
```

--------------------------------

### Phoenix ChannelCase Module Definition

Source: https://hexdocs.pm/phoenix/1.7.14/testing_channels

Defines the `ChannelCase` module, which serves as a testing utility for Phoenix Channels. It sets up a test environment by importing `Phoenix.ChannelTest` and `HelloWeb.ChannelCase` conveniences, and configures the SQL Sandbox for data testing.

```elixir
defmodule HelloWeb.ChannelCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with channels
      import Phoenix.ChannelTest
      import HelloWeb.ChannelCase

      # The default endpoint for testing
      @endpoint HelloWeb.Endpoint
    end
  end

  setup _tags do
    Hello.DataCase.setup_sandbox(tags)
    :ok
  end
end
```

--------------------------------

### Fix LiveViewTest submit form with custom submitter

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Corrects a crash in `LiveViewTest` when submitting a form with a custom submitter but without an ID. This ensures that form submission tests are more reliable.

```elixir
defmodule Phoenix.LiveViewTest do
  # ...

  # Fix for submitting form with custom submitter without ID
  def submit_form(view, params \\ []) do
    # ... revised logic to handle custom submitters ...
  end
  # ...
end
```

--------------------------------

### Create and Inspect an Ecto Changeset

Source: https://hexdocs.pm/phoenix/1.7.17/ecto

This demonstrates creating an Ecto changeset with an empty user struct and empty parameters. The output shows the changeset's structure, including any validation errors. The `valid?` field indicates the changeset's validity, and `errors` lists specific validation failures.

```elixir
iex> changeset = User.changeset(%User{}, %{})
#Ecto.Changeset<
  action: nil,
  changes: %{},
  errors: [
    name: {"can't be blank", [validation: :required]},
    email: {"can't be blank", [validation: :required]},
    bio: {"can't be blank", [validation: :required]},
    number_of_pets: {"can't be blank", [validation: :required]}
  ],
  data: #Hello.User<>
  valid?: false
>
```

```elixir
iex> changeset.valid?
false
```

```elixir
iex> changeset.errors
[
  name: {"can't be blank", [validation: :required]},
  email: {"can't be blank", [validation: :required]},
  bio: {"can't be blank", [validation: :required]},
  number_of_pets: {"can't be blank", [validation: :required]}
]
```

--------------------------------

### Fetch Dependencies after Authentication Generation

Source: https://hexdocs.pm/phoenix/1.7.14/mix_phx_gen_auth

After generating the authentication system, additional dependencies might be added to your `mix.exs` file. This command fetches those dependencies, ensuring your project has all necessary components to run the authentication system.

```bash
$ mix deps.get
```

--------------------------------

### Enhance LiveViewTest submit_form with DOM values

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Includes form values from the DOM in `Phoenix.LiveViewTest.submit_form/2` and `Phoenix.LiveViewTest.follow_trigger_action/2` to better mimic browser behavior during testing. This improves the accuracy of form submission tests.

```elixir
defmodule Phoenix.LiveViewTest do
  # ...

  # Enhance submit_form/2 to include DOM values
  def submit_form(view, params \\ []) do
    # ... new implementation that fetches DOM values ...
  end

  # Enhance follow_trigger_action/2 to include DOM values
  def follow_trigger_action(view, action, params \\ []) do
    # ... new implementation that fetches DOM values ...
  end
  # ...
end
```

--------------------------------

### Phoenix Web Directory Structure

Source: https://hexdocs.pm/phoenix/1.7.17/directory_structure

This snippet outlines the directory structure within `lib/hello_web`, which contains controllers, components, layouts, and configuration files for the web layer of a Phoenix application. It highlights the organization for handling web requests, rendering HTML, and managing internationalization.

```tree
lib/hello_web
├── controllers
│   ├── page_controller.ex
│   ├── page_html.ex
│   ├── error_html.ex
│   ├── error_json.ex
│   └── page_html
│       └── home.html.heex
├── components
│   ├── core_components.ex
│   ├── layouts.ex
│   └── layouts
│       ├── app.html.heex
│       └── root.html.heex
├── endpoint.ex
├── gettext.ex
├── router.ex
└── telemetry.ex
```

--------------------------------

### JS Command for Client-Side JavaScript Operations

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Introduces the `JS` command for executing JavaScript utility operations on the client. This command extends the push API, allowing for more sophisticated client-side interactions and state management directly from LiveView.

```javascript
JS.push("some_event", { detail: "data" })
```

--------------------------------

### Phoenix Test Context Usage

Source: https://hexdocs.pm/phoenix/1.7.17/testing

Shows how to use a test context module like `HelloWeb.ConnCase` in Phoenix tests. This module provides testing utilities specific to Phoenix, extending `ExUnit.Case`.

```elixir
use HelloWeb.ConnCase

```

--------------------------------

### LiveView Component Race Condition Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes a race condition where components are removed and immediately re-added before the client can notify their CIDs have been destroyed. This ensures proper component lifecycle management.

```elixir
Fix race condition when components are removed and then immediately re-added before the client can notify their CIDs have been destroyed
```

--------------------------------

### Define Channel Route in Phoenix

Source: https://hexdocs.pm/phoenix/1.7.14/channels

This snippet demonstrates how to define a channel route in Phoenix. It uses a wildcard '*' to match topics starting with 'room:' and dispatches them to the specified Channel module (HelloWeb.RoomChannel). This configuration is typically found in the UserSocket module.

```elixir
defmodule HelloWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "room:*", HelloWeb.RoomChannel
  ...

```

--------------------------------

### Phoenix Controller Action Ignoring Parameters

Source: https://hexdocs.pm/phoenix/1.7.17/controllers

Shows a controller action pattern where incoming parameters are intentionally ignored by prefixing the `params` variable with an underscore (`_params`). This prevents compiler warnings for unused variables.

```elixir
def some_action(conn, _params) do
  # ... action logic without using params
end
```

--------------------------------

### Spawn LiveView Process

Source: https://hexdocs.pm/phoenix/_live_view/Phoenix

Spawns a connected LiveView process, optionally navigating to a specific path or with custom options. This is fundamental for setting up LiveView environments for testing.

```Elixir
live(conn, path \ nil, opts \ [])
```

--------------------------------

### Phoenix LiveView on_mount Hook for Locale Restoration

Source: https://hexdocs.pm/phoenix/_live_view/gettext

This example shows how to create an `on_mount` hook in Elixir to automatically restore the Gettext locale for every LiveView. This simplifies locale management across the application.

```elixir
defmodule MyAppWeb.RestoreLocale do
  def on_mount(:default, %{"locale" => locale}, _session, socket) do
    Gettext.put_locale(MyApp.Gettext, locale)
    {:cont, socket}
  end

  # catch-all case
  def on_mount(:default, _params, _session, socket), do: {:cont, socket}
end
```

--------------------------------

### Nested Resources: Users and Posts

Source: https://hexdocs.pm/phoenix/1.7.17/routing

This section details how to define nested resources in a Phoenix router. It shows how to associate a 'posts' resource with a 'users' resource, creating routes that are scoped to a specific user ID.

```APIDOC
## Nested Resources: Users and Posts

### Description
Defines nested resources where 'posts' are associated with 'users'. This creates scoped routes for post-related actions that operate on a specific user.

### Method
`resources` (Phoenix Router DSL)

### Endpoint
`/users/:user_id/posts` (and its sub-routes)

### Parameters
#### Path Parameters
- **user_id** (integer) - Required - The ID of the user to whom the posts belong.
- **id** (integer) - Required - The ID of the specific post.

### Request Example
```elixir
# Example of defining nested resources in lib/hello_web/router.ex
resources "/users", UserController do
  resources "/posts", PostController
end
```

### Response
#### Success Response (200)
- **index** (GET /users/:user_id/posts): Returns a list of posts for the specified user.
- **show** (GET /users/:user_id/posts/:id): Returns a specific post for the specified user.
- **new** (GET /users/:user_id/posts/new): Renders a form to create a new post for the specified user.
- **edit** (GET /users/:user_id/posts/:id/edit): Renders a form to edit a specific post for the specified user.
- **create** (POST /users/:user_id/posts): Creates a new post associated with the specified user.
- **update** (PATCH/PUT /users/:user_id/posts/:id): Updates a specific post associated with the specified user.
- **delete** (DELETE /users/:user_id/posts/:id): Deletes a specific post associated with the specified user.

#### Response Example
```elixir
# Example of generating a path for a nested resource
user_id = 42
post_id = 17
~p"/users/#{user_id}/posts/#{post_id}"
# Output: "/users/42/posts/17"

# Example using structs directly
~p"/users/#{user}/posts/#{post}"
# Output: "/users/42/posts/17" (assuming user and post have appropriate IDs)
```
```

--------------------------------

### Fix LiveView Form Recovery

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Addresses an issue where form recovery fails to send input on the first connection failure. This ensures that form data is correctly transmitted after a temporary disconnection.

```elixir
Fix form recovery failing to send input on first connection failure
```

--------------------------------

### Phoenix LiveView Handle Event Telemetry Events

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/telemetry

Telemetry events for the handle_event lifecycle of Phoenix LiveView. Captures start, stop, and exception events with metadata including socket, event name, and parameters.

```elixir
[:phoenix, :live_view, :handle_event, :start]
%{system_time: System.monotonic_time}
%{socket: Phoenix.LiveView.Socket.t, event: String.t(), params: unsigned_params}
```

```elixir
[:phoenix, :live_view, :handle_event, :stop]
%{duration: native_time}
%{socket: Phoenix.LiveView.Socket.t, event: String.t(), params: unsigned_params}
```

```elixir
[:phoenix, :live_view, :handle_event, :exception]
%{duration: native_time}
%{socket: Phoenix.LiveView.Socket.t, kind: atom, reason: term, event: String.t(), params: unsigned_params}
```

--------------------------------

### Elixir: LiveView for Online User List

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/presence

Defines a `HelloWeb.OnlineLive` module using `Phoenix.LiveView`. It mounts the view, tracks users, subscribes to presence events, and renders a dynamic list of online users that updates in real-time.

```elixir
defmodule HelloWeb.OnlineLive do
  use HelloWeb, :live_view

  def mount(params, _session, socket) do
    socket = stream(socket, :presences, [])
    socket =
    if connected?(socket) do
      HelloWeb.Presence.track_user(params["name"], %{id: params["name"]})
      HelloWeb.Presence.subscribe()
      stream(socket, :presences, HelloWeb.Presence.list_online_users())
    else
       socket
    end

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <ul id="online_users" phx-update="stream">
      <li :for={{dom_id, %{id: id, metas: metas}} <- @streams.presences} id={dom_id}>{id} ({length(metas)})</li>
    </ul>
    """
  end

  def handle_info({HelloWeb.Presence, {:join, presence}}, socket) do
    {:noreply, stream_insert(socket, :presences, presence)}
  end

  def handle_info({HelloWeb.Presence, {:leave, presence}}, socket) do
    if presence.metas == [] do
      {:noreply, stream_delete(socket, :presences, presence)}
    else
      {:noreply, stream_insert(socket, :presences, presence)}
    end
  end
end
```

--------------------------------

### Phoenix LiveView Mount Telemetry Events

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/telemetry

Telemetry events for the mount lifecycle of Phoenix LiveView. Includes start, stop, and exception events with associated measurements and metadata like socket, params, session, and uri.

```elixir
[:phoenix, :live_view, :mount, :start]
%{system_time: System.monotonic_time}
%{socket: Phoenix.LiveView.Socket.t, params: unsigned_params | :not_mounted_at_router, session: map, uri: String.t() | nil}
```

```elixir
[:phoenix, :live_view, :mount, :stop]
%{duration: native_time}
%{socket: Phoenix.LiveView.Socket.t, params: unsigned_params | :not_mounted_at_router, session: map, uri: String.t() | nil}
```

```elixir
[:phoenix, :live_view, :mount, :exception]
%{duration: native_time}
%{socket: Phoenix.LiveView.Socket.t, kind: atom, reason: term, params: unsigned_params | :not_mounted_at_router, session: map, uri: String.t() | nil}
```

--------------------------------

### Echo Socket Implementation in Elixir

Source: https://hexdocs.pm/phoenix/1.7.17/Phoenix.Socket

An example implementation of the `Phoenix.Socket.Transport` behaviour in Elixir. This `EchoSocket` demonstrates how to handle connection, initialization, incoming messages, and termination. It does not spawn new processes and can be mounted directly in the endpoint.

```elixir
defmodule EchoSocket do
  @behaviour Phoenix.Socket.Transport

  def child_spec(opts) do
    # We won't spawn any process, so let's ignore the child spec
    :ignore
  end

  def connect(state) do
    # Callback to retrieve relevant data from the connection.
    # The map contains options, params, transport and endpoint keys.
    {:ok, state}
  end

  def init(state) do
    # Now we are effectively inside the process that maintains the socket.
    {:ok, state}
  end

  def handle_in({text, _opts}, state) do
    {:reply, :ok, {:text, text}, state}
  end

  def handle_info(_, state) do
    {:ok, state}
  end

  def terminate(_reason, _state) do
    :ok
  end
end
```

--------------------------------

### Install LiveDashboard Request Logger - Elixir

Source: https://hexdocs.pm/phoenix/_live_dashboard/request_logger

Adds the LiveDashboard request logger plug to the application's endpoint.ex file. This enables request logging within the LiveDashboard. Configuration options include `param_key` and `cookie_key`.

```elixir
plug Phoenix.LiveDashboard.RequestLogger,
  param_key: "request_logger",
  cookie_key: "request_logger"
```

--------------------------------

### Form Handling

Source: https://hexdocs.pm/phoenix/_html/4.3.0/index

Abstraction and protocol for building forms using Phoenix.HTML.

```APIDOC
## Form Handling

### Description
This library provides an abstraction and a protocol for building forms. Refer to `Phoenix.HTML.Form` for detailed usage.

### Functions

*   `Phoenix.HTML.Form` module provides functions for generating form elements and handling form state.
```

--------------------------------

### Phoenix Channel Custom Event Message (Client to Server)

Source: https://hexdocs.pm/phoenix/1.7.14/writing_a_channels_client

Shows how a client would send a custom event message to a Phoenix Channel. This example uses the `report_emergency` event with a specific payload.

```json
[null, "3", "miami:weather", "report_emergency", {"category": "sharknado"}]copy
```

--------------------------------

### Fix key override warning in map

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Resolves a warning related to keys being overridden in maps, which could occur in certain LiveView scenarios. This ensures data integrity and cleaner logs.

```elixir
# Example scenario that might have caused the warning:

# Before fix:
# assign(socket, :my_map, Map.put(%{}, :key, 1) |> Map.put(:key, 2))

# After fix:
# The underlying issue causing key overrides is resolved.
```

--------------------------------

### Implement Order Creation Controller Action

Source: https://hexdocs.pm/phoenix/1.7.14/contexts

This Elixir code defines the `create` action for `HelloWeb.OrderController`. It attempts to complete an order using `Orders.complete_order/1`. Upon success, it redirects to the order's show page with a success flash message; otherwise, it redirects back to the cart with an error message.

```elixir
defmodule HelloWeb.OrderController do
  use HelloWeb, :controller

  alias Hello.Orders

  def create(conn, _) do
    case Orders.complete_order(conn.assigns.cart) do
      {:ok, order} ->
        conn
        |> put_flash(:info, "Order created successfully.")
        |> redirect(to: ~p"/orders/#{order}")

      {:error, _reason} ->
        conn
        |> put_flash(:error, "There was an error processing your order")
        |> redirect(to: ~p"/cart")
    end
  end
end
```

--------------------------------

### Phoenix Channel Custom Event Handling (Server-side)

Source: https://hexdocs.pm/phoenix/1.7.14/writing_a_channels_client

Example of a server-side function (`handle_in`) in Elixir for processing custom events received from a client. It demonstrates how to define a handler for a specific event and its payload.

```elixir
def handle_in("report_emergency", payload, socket) do
  MyApp.Emergencies.report(payload) # or whatever
  {:reply, :ok, socket}
endcopy
```

--------------------------------

### Migrate LEEx form_for to HEEx form Component

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Demonstrates the migration of `form_for` usage from LEEx to the HEEx `form` component. This change is necessary due to HEEx's stricter HTML validation and is recommended for stateful LiveComponents.

```heex
<.form :let={f} for={@changeset}>
  <%= input f, :foo %>
</.form>
```

--------------------------------

### Channel Instantiation

Source: https://hexdocs.pm/phoenix/1.4.16/js/index

Initializes a new Phoenix Channel with a topic, optional parameters, and a socket connection.

```APIDOC
## Channel

### Description
Initializes a new Phoenix Channel.

### Parameters
- **topic** (string) - The topic the channel will subscribe to.
- **params** (Object | function) - Optional parameters to send with the channel join request.
- **socket** (Socket) - The Socket instance to use for the channel connection.
```

--------------------------------

### LiveView Handle Event Telemetry Events (Elixir)

Source: https://hexdocs.pm/phoenix/_live_view/telemetry

This set of events monitors the handle_event/3 callback in Phoenix.LiveView. It includes start, stop, and exception events, capturing the socket, event name, and parameters associated with the event.

```elixir
[:phoenix, :live_view, :handle_event, :start]
Measurement: %{system_time: System.monotonic_time}
Metadata: %{socket: Phoenix.LiveView.Socket.t, event: String.t(), params: unsigned_params}
```

```elixir
[:phoenix, :live_view, :handle_event, :stop]
Measurement: %{duration: native_time}
Metadata: %{socket: Phoenix.LiveView.Socket.t, event: String.t(), params: unsigned_params}
```

```elixir
[:phoenix, :live_view, :handle_event, :exception]
Measurement: %{duration: native_time}
Metadata: %{socket: Phoenix.LiveView.Socket.t, kind: atom, reason: term, event: String.t(), params: unsigned_params}
```

--------------------------------

### Swoosh Mailer Module Definition

Source: https://hexdocs.pm/phoenix/1.7.14/directory_structure

This Elixir code defines the `Hello.Mailer` module using `Swoosh.Mailer`. It configures the mailer to be associated with the `:hello` OTP application, providing the main interface for sending emails.

```elixir
defmodule Hello.Mailer do
  use Swoosh.Mailer, otp_app: :hello
end

```

--------------------------------

### Accessing Session Data in LiveView Mount

Source: https://hexdocs.pm/phoenix/_live_view/index

Shows how to access session data, such as 'current_user_id', within the `mount` callback to personalize data fetching. This relies on session data being correctly stored in signed or encrypted cookies. It assumes a `Thermostat` module for data retrieval.

```elixir
def mount(_params, %{"current_user_id" => user_id}, socket) do
  temperature = Thermostat.get_user_reading(user_id)
  {:ok, assign(socket, :temperature, temperature)}
end
```

--------------------------------

### Phoenix Asset Management with esbuild

Source: https://hexdocs.pm/phoenix/1.7.17/directory_structure

This section describes the `assets` directory in a Phoenix project, focusing on its role in managing front-end source files like JavaScript and CSS. It mentions the use of `esbuild` for compilation, managed by an Elixir package, and the configuration in `config/config.exs`. It also touches upon `priv/static` for served assets and the development workflow for front-end changes.

```text
The `assets` directory contains source files related to front-end assets, such as JavaScript and CSS. Since Phoenix v1.6, we use `esbuild` to compile assets, which is managed by the `esbuild` Elixir package. The integration with `esbuild` is baked into your app. The relevant config can be found in your `config/config.exs` file.

Your other static assets are placed in the `priv/static` folder, where `priv/static/assets` is kept for generated assets. Everything in `priv/static` is served by the `Plug.Static` plug configured in `lib/hello_web/endpoint.ex`. When running in dev mode (`MIX_ENV=dev`), Phoenix watches for any changes you make in the `assets` directory, and then takes care of updating your front end application in your browser as you work.
```

--------------------------------

### LiveView Max Entries Upload Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Replaces a single upload entry when `max_entries` is 1 instead of accumulating multiple file selections. This provides correct behavior for single file uploads.

```elixir
Replace single upload entry when `max_entries` is 1 instead of accumulating multiple file selections
```

--------------------------------

### Add Product Resources to Phoenix Router

Source: https://hexdocs.pm/phoenix/1.7.17/contexts

This code snippet shows how to add a resourceful route for products to the `lib/hello_web/router.ex` file. It integrates the generated `ProductController` into the application's browser scope, enabling access to product-related web pages and actions.

```elixir
scope "/", HelloWeb do
  pipe_through :browser

  get "/", PageController, :index
  resources "/products", ProductController
end
```

--------------------------------

### Ecto Schema Migration Definition

Source: https://hexdocs.pm/phoenix/1.7.17/ecto

Defines a database migration for creating a 'users' table using Ecto. This Elixir code specifies the table structure, including columns for name, email, bio, number_of_pets, and automatically includes timestamps for record creation and updates.

```elixir
defmodule Hello.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :bio, :string
      add :number_of_pets, :integer

      timestamps()
    end
  end
end
```

--------------------------------

### Test Phoenix LiveView Connected Mount in Single Step

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/Phoenix

Provides a concise way to test a connected LiveView mount using a single call to `live/2`. This function combines the initial HTTP GET request and the subsequent socket connection, making tests more streamlined when the disconnected render result is not needed. Requires `Phoenix.LiveViewTest`.

```elixir
import Phoenix.LiveViewTest

test "connected mount", %{conn: conn} do
  {:ok, _view, html} = live(conn, "/my-path")
  assert html =~ "<h1>My Connected View</h1>"
end
```

--------------------------------

### Phoenix LiveView Client Hooks with JavaScript

Source: https://hexdocs.pm/phoenix/_live_view/html-attrs

Explains how to use the `phx-hook` attribute to integrate custom JavaScript logic into LiveView components. Includes examples for lifecycle callbacks and custom event handling.

```html
<div id="example" phx-hook="Example">
  <h1>Events</h1>
  <ul id="example-events"></ul>
</div>
```

```javascript
let Hooks = {}
Hooks.Example = {
  // Callbacks
  mounted()      { this.appendEvent("Mounted") },
  beforeUpdate() { this.appendEvent("Before Update") },
  updated()      { this.appendEvent("Updated") },
  destroyed()    { this.appendEvent("Destroyed") },
  disconnected() { this.appendEvent("Disconnected") },
  reconnected()  { this.appendEvent("Reconnected") },

  // Custom Helper
  appendEvent(name) {
    console.log(name)
    let li = document.createElement("li")
    li.innerText = name
    this.el.querySelector("#example-events").appendChild(li)
  }
}

let liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks})
```

--------------------------------

### Define LiveSession Scopes with Authentication Hooks

Source: https://hexdocs.pm/phoenix/_live_view/security-model

This example demonstrates how to define different `live_session` scopes in the router for distinct authentication flows. It shows how to apply authentication hooks using `on_mount` at the `live_session` level, ensuring that all LiveViews within that session enforce specific security checks. It also illustrates the use of `pipe_through` for regular HTTP requests that precede LiveView connections.

```elixir
scope "/" do
  pipe_through [:authenticate_user]

  live_session :default, on_mount: MyAppWeb.UserLiveAuth do
    live "/", MyAppWeb.HomePageLive
  end
end

scope "/admin" do
  pipe_through [:authenticate_admin]

  live_session :admin, on_mount: MyAppWeb.AdminLiveAuth do
    live "/", MyAppWeb.AdminDashboardLive
  end
end
```

--------------------------------

### Phoenix Blog Context Test Structure

Source: https://hexdocs.pm/phoenix/1.7.14/testing_contexts

This Elixir code defines a test suite for the Blog context, specifically for 'posts'. It utilizes Hello.DataCase for database testing and Hello.BlogFixtures for creating test data. The tests are grouped using 'describe' blocks.

```elixir
defmodule Hello.BlogTest do
  use Hello.DataCase

  alias Hello.Blog

  describe "posts" do
    alias Hello.Blog.Post

    import Hello.BlogFixtures

    @invalid_attrs %{body: nil, title: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Blog.list_posts() == [post]
    end

    ...

```

--------------------------------

### Verify Changeset Validation in IEx (Elixir)

Source: https://hexdocs.pm/phoenix/ecto

Demonstrates how to use an Ecto changeset in IEx to validate data. It shows creating a changeset with an empty user struct and empty parameters, resulting in validation errors for required fields. It also shows how to check the `valid?` status and retrieve `errors` from the changeset.

```shell
$ iex -S mix
```

```elixir
alias Hello.User
changeset = User.changeset(%User{}, %{})
changeset.valid?
changeset.errors
```

```elixir
#Ecto.Changeset<
  action: nil,
  changes: %{},
  errors: [
    name: {"can't be blank", [validation: :required]},
    email: {"can't be blank", [validation: :required]},
    bio: {"can't be blank", [validation: :required]},
    number_of_pets: {"can't be blank", [validation: :required]}
  ],
  data: #Hello.User<>
  valid?: false
>
```

```elixir
false
```

```elixir
[
  name: {"can't be blank", [validation: :required]},
  email: {"can't be blank", [validation: :required]},
  bio: {"can't be blank", [validation: :required]},
  number_of_pets: {"can't be blank", [validation: :required]}
]
```

--------------------------------

### Fetch and Shape Presence Data in Elixir

Source: https://hexdocs.pm/phoenix/1.7.14/presence

The `fetch/2` callback in `HelloWeb.Presence` allows modification of fetched presence data. This example demonstrates how to shape the response by adding an `id` and a `user` map, including populating user data from a database or for demonstration purposes.

```elixir
def fetch(_topic, presences) do
  for {key, %{metas: [meta | metas]}} <- presences, into: %{}
    # user can be populated here from the database here we populate
    # the name for demonstration purposes
    {key, %{metas: [meta | metas], id: meta.id, user: %{name: meta.id}}}
  end
```

--------------------------------

### Connecting to Phoenix Channels

Source: https://hexdocs.pm/phoenix/1.7.14/writing_a_channels_client

Details on establishing a WebSocket connection to a Phoenix Channels endpoint, including the required URL format and headers.

```APIDOC
## Connecting to Phoenix Channels

### Description
Establishes a WebSocket connection to Phoenix Channels. The connection path is derived from the `socket` declaration in the application's `Endpoint` module.

### Method
GET (for initial WebSocket upgrade)

### Endpoint
`[host]:[port]/[socket_path]/websocket?vsn=2.0.0`

Where `[socket_path]` is defined in your application's `Endpoint` module (e.g., `/mobile` in `socket "/mobile", MyAppWeb.MobileSocket`).

### Parameters
#### Query Parameters
- **vsn** (string) - Required - Specifies the serializer version, typically `2.0.0` for `Phoenix.Socket.V2.JSONSerializer`.

### Request Example
```
GET /[socket_path]/websocket?vsn=2.0.0
```

### Response
#### Success Response (101 Switching Protocols)
Indicates a successful WebSocket connection upgrade.

#### Response Example
(No specific JSON response, typically an HTTP 101 response)

### Notes
- Ensure standard HTTP headers for WebSocket upgrade are included.
- Custom `connect/3` functions in your socket module may require additional parameters or headers.
```

--------------------------------

### Slot Usage in Function Components

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Illustrates how to define and render slots within function components. Slots are marked with `<:slot_name>` and rendered using `<%= render_slot @slot_name %>`, enhancing component reusability and composition.

```elixir
<:slot_name>
<%= render_slot @slot_name %>
```

--------------------------------

### Implement Metrics Storage GenServer

Source: https://hexdocs.pm/phoenix/_live_dashboard/metrics_history

Create a 'MyAppWeb.MetricsStorage' module that uses GenServer to store metric histories. This module handles attaching telemetry event handlers, extracting datapoints, managing a circular buffer for each metric, and responding to requests for historical data. It also includes logic for starting, terminating, and handling casts and calls.

```elixir
defmodule MyAppWeb.MetricsStorage do
  use GenServer

  @history_buffer_size 50

  def metrics_history(metric) do
    GenServer.call(__MODULE__, {:data, metric})
  end

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(metrics) do
    Process.flag(:trap_exit, true)

    metric_histories_map =
      metrics
      |> Enum.map(fn metric ->
        attach_handler(metric)
        {metric, CircularBuffer.new(@history_buffer_size)}
      end)
      |> Map.new()

    {:ok, metric_histories_map}
  end

  @impl true
  def terminate(_, metrics) do
    for metric <- metrics do
      :telemetry.detach({__MODULE__, metric, self()})
    end

    :ok
  end

  defp attach_handler(%{event_name: name_list} = metric) do
    :telemetry.attach(
      {__MODULE__, metric, self()},
      name_list,
      &__MODULE__.handle_event/4,
      metric
    )
  end

  def handle_event(_event_name, data, metadata, metric) do
    if data = Phoenix.LiveDashboard.extract_datapoint_for_metric(metric, data, metadata) do
      GenServer.cast(__MODULE__, {:telemetry_metric, data, metric})
    end
  end

  @impl true
  def handle_cast({:telemetry_metric, data, metric}, state) do
    {:noreply, update_in(state[metric], &CircularBuffer.insert(&1, data))}
  end

  @impl true
  def handle_call({:data, metric}, _from, state) do
    if history = state[metric] do
      {:reply, CircularBuffer.to_list(history), state}
    else
      {:reply, [], state}
    end
  end
end
```

--------------------------------

### LiveView Assigns Map Error Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes a `no function clause matching in Keyword.put/3` error that occurred when using a Map of assigns together with `@inner_content`. This resolves an issue with data merging in components.

```elixir
Fix Map of assigns together with `@inner_content` causing `no function clause matching in Keyword.put/3` error
```

--------------------------------

### Phoenix Form Component Example

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/security

Demonstrates the usage of Phoenix's form component for creating forms, including input fields and submit buttons. This component handles CSRF token integration automatically.

```html
<.form :let={f} for={@bio_changeset} action={~p"/users/settings/edit_bio"} method="post" id="edit_bio">
  <div class="pt-4">
    <%= label f, :bio %>
    <%= textarea f, :bio, required: true, class: "" %>
    <%= error_tag f, :bio %>
  </div>

  <div>
    <%= submit "Update Bio", class: "" %>
  </div>
</.form>
```

--------------------------------

### Make hook types less strict

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Reduces the strictness of hook types in Phoenix LiveView, allowing for more flexible hook definitions. This can simplify integration and reduce potential type-related errors.

```elixir
defmodule Phoenix.Component do
  # ...

  # Relaxed type definition for hooks
  @type Hook :: module() | atom() | any() # Example of making it less strict

  # ...
end
```

--------------------------------

### Applying Throttle for Click Events

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/bindings

Uses `phx-throttle` to rate-limit events, such as button clicks. It emits the event immediately and then enforces a minimum interval between subsequent events. This example limits 'volume_up' clicks to once per second.

```html
<button phx-click="volume_up" phx-throttle="1000">+</button>
```

--------------------------------

### Phoenix LiveComponent Update Telemetry Events

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/telemetry

Telemetry events for the update lifecycle of Phoenix LiveComponents. Covers start and stop events with measurements and metadata including socket, component name, and assigned sockets.

```elixir
[:phoenix, :live_component, :update, :start]
%{system_time: System.monotonic_time}
%{socket: Phoenix.LiveView.Socket.t, component: atom, assigns_sockets: [{map(), Phoenix.LiveView.Socket.t}]}
```

```elixir
[:phoenix, :live_component, :update, :stop]
%{duration: native_time}
%{socket: Phoenix.LiveView.Socket.t}
```

--------------------------------

### Scaffolding Authentication with mix phx.gen.auth

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/authn_authz

Generates authentication and authorization scaffolding for a Phoenix project. This command-line tool helps set up user authentication, registration, login, and other related security features. It requires a Phoenix project context.

```bash
mix phx.gen.auth
```

--------------------------------

### Migrate LEEx to HEEx for HTML Attributes

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Illustrates the difference in attribute interpolation between LEEx and HEEx templates. HEEx requires using curly braces for attribute values instead of Elixir interpolation within tags.

```heex
<div id={@id}>
  ...
</div>
```

--------------------------------

### Allow omitting name attribute for ColocatedJS

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Permits omitting the `name` attribute when using `Phoenix.LiveView.ColocatedJS`. This offers more flexibility in defining JavaScript hooks without requiring a specific name attribute.

```elixir
use Phoenix.LiveComponent

# Previously required name attribute:
# @js MyJsHook, name: :my_hook

# Now optional:
@js MyJsHook
```

--------------------------------

### Implement Cart View in Elixir

Source: https://hexdocs.pm/phoenix/1.7.14/contexts

Creates the `HelloWeb.CartHTML` view module to render the 'show.html' template and alias the `ShoppingCart` context. It includes a helper function `currency_to_str/1` for formatting currency values to two decimal places with a preceding dollar sign.

```elixir
defmodule HelloWeb.CartHTML do
  use HelloWeb, :html

  alias Hello.ShoppingCart

  embed_templates "cart_html/*"

  def currency_to_str(%Decimal{} = val), do: "$#{Decimal.round(val, 2)}"
end
```

--------------------------------

### Get Client Connect Parameters - Phoenix LiveView

Source: https://hexdocs.pm/phoenix/_live_view/0.11.0/Phoenix

Retrieves connection parameters sent by the client during mount. These parameters are only available during the initial mount phase. Returns `nil` if called while disconnected and raises `RuntimeError` if called after mount.

```elixir
def mount(_params, _session, socket) do
  {:ok, assign(socket, width: get_connect_params(socket, "width") || @width)}
end
```

--------------------------------

### Run Database Migrations

Source: https://hexdocs.pm/phoenix/1.7.14/contexts

Executes all pending Ecto database migrations, including the newly created migrations for categories and the product-category association. This applies the schema changes to the database.

```bash
$ mix ecto.migrate

18:20:36.489 [info] == Running 20210222231834 Hello.Repo.Migrations.CreateCategories.change/0 forward

18:20:36.493 [info] create table categories
```

--------------------------------

### Expand SSL Key File Path

Source: https://hexdocs.pm/phoenix/1.7.14/using_ssl

This example demonstrates how to expand a relative path to an SSL key file to an absolute path. This is used when the `otp_app:` key is not specified in the HTTPS endpoint configuration, requiring explicit absolute paths for Plug to find the key file.

```elixir
Path.expand("../../../some/path/to/ssl/key.pem", __DIR__)
```

--------------------------------

### Phoenix Router Configuration for Orders

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/more_examples

Adds routes to the Phoenix router for the OrderController, specifically enabling `create` and `show` actions. This configuration is placed within a scope protected by authentication pipes.

```elixir
scope "/", HelloWeb do
  pipe_through [:browser, :require_authenticated_user]

  resources "/cart_items", CartItemController, only: [:create, :delete]

  get "/cart", CartController, :show
  put "/cart", CartController, :update

  resources "/orders", OrderController, only: [:create, :show]
end
```

--------------------------------

### Filter resource routes with `only` option in Phoenix

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/routing

This example shows how to use the `only` option with the `resources` macro to define a subset of routes for a resource. Here, only the `:index` and `:show` actions are generated for the '/posts' resource, as demonstrated by the `mix phx.routes` output.

```elixir
resources "/posts", PostController, only: [:index, :show]
```

```shell
GET     /posts      HelloWeb.PostController :index
GET     /posts/:id  HelloWeb.PostController :show
```

--------------------------------

### Preserve textarea whitespace in LiveViewTest form submission

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Ensures that whitespace within `<textarea>` elements is preserved when submitting forms in `LiveViewTest`. This maintains accurate form data submission during testing.

```elixir
defmodule Phoenix.LiveViewTest do
  # ...

  # Ensure textarea whitespace is preserved during form submission
  def submit_form(view, params \\ []) do
    # ... logic to correctly handle textarea content ...
  end
  # ...
end
```

--------------------------------

### Add New Route to Phoenix Router

Source: https://hexdocs.pm/phoenix/1.7.17/request_lifecycle

This snippet demonstrates how to add a new route to the Phoenix router. It extends the existing browser scope to include a GET request for the '/hello' path, mapping it to the 'index' action of the 'HelloController'.

```elixir
scope "/", HelloWeb do
  pipe_through :browser

  get "/", PageController, :home
  get "/hello", HelloController, :index
end
```

--------------------------------

### Configure SQLite Options in LiveDashboard (Elixir)

Source: https://hexdocs.pm/phoenix/_live_dashboard/ecto_stats

This example shows how to configure options for SQLite Ecto stats in LiveDashboard using `ecto_sqlite3_extras_options`. In this case, an empty list is provided, indicating no specific configurations are applied beyond the default. Refer to the `ecto_sqlite3_extras` documentation for available settings.

```elixir
live_dashboard "/dashboard",
  ecto_repos: [MyApp.Repo],
  ecto_sqlite3_extras_options: []

```

--------------------------------

### Allow Accept Attribute on <.live_file_input> in LiveView

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This enhancement allows the `accept` attribute to be set on the `<.live_file_input>` component. This provides finer control over the types of files that can be selected by the user, improving the user experience and data validation.

```elixir
<.live_file_input name="files" accept="image/png, image/jpeg" />
```

--------------------------------

### Custom 404 Error HTML Template

Source: https://hexdocs.pm/phoenix/1.7.17/custom_error_pages

Example of a custom 404 error page template using HEEX syntax. This template includes application layout and a specific message for non-existent pages. It should be placed in `lib/hello_web/controllers/error_html/404.html.heex`.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Welcome to Phoenix!</title>
    <link rel="stylesheet" href="/assets/app.css"/>
    <script defer type="text/javascript" src="/assets/app.js"></script>
  </head>
  <body>
    <header>
      <section class="container">
        <nav>
          <ul>
            <li><a href="https://hexdocs.pm/phoenix/overview.html">Get Started</a></li>
          </ul>
        </nav>
        <a href="https://phoenixframework.org/" class="phx-logo">
          <img src="/images/logo.svg" alt="Phoenix Framework Logo"/>
        </a>
      </section>
    </header>
    <main class="container">
      <section class="phx-hero">
        <p>Sorry, the page you are looking for does not exist.</p>
      </section>
    </main>
  </body>
</html>
```

--------------------------------

### HEEx Shorthand For Syntax

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/components

Demonstrates the shorthand syntax for comprehensions in HEEx using the `:for` attribute. This provides a cleaner way to render lists or collections compared to the `<%= for ... %>` block.

```heex
<ul>
  <li :for={item <- @items}>{item.name}</li>
</ul>
```

--------------------------------

### Phoenix.HTML: `inputs_for/2`, `inputs_for/3` deprecation

Source: https://hexdocs.pm/phoenix/_html/4.2.0/changelog

Starting in v3.3.2, `inputs_for/2` and `inputs_for/3` (without anonymous functions) are deprecated. This encourages the use of anonymous functions to define nested form inputs, leading to more explicit and maintainable form structures.

```elixir
# Deprecated usage
# inputs_for(@form, @accounts, AccountForm)

# Recommended usage
inputs_for(@form, @accounts, fn acc_form ->
  # AccountForm fields here
end)
```

--------------------------------

### Add Tracker to Supervision Tree - Elixir

Source: https://hexdocs.pm/phoenix/_pubsub/Phoenix

Shows how to add a custom tracker, `MyTracker`, to your Elixir application's supervision tree. This ensures the tracker is started and managed as part of the application's lifecycle, making it fault-tolerant.

```elixir
children = [
  # ...
  {MyTracker, [name: MyTracker, pubsub_server: MyApp.PubSub]}
]
```

--------------------------------

### Define Product-Category Join Table Migration

Source: https://hexdocs.pm/phoenix/1.7.14/contexts

Defines the Ecto migration for creating the 'product_categories' join table. It sets up foreign key references to 'products' and 'categories' with cascading deletes and adds appropriate unique indexes for data integrity.

```Elixir
defmodule Hello.Repo.Migrations.CreateProductCategories do
  use Ecto.Migration

  def change do
    create table(:product_categories, primary_key: false) do
      add :product_id, references(:products, on_delete: :delete_all)
      add :category_id, references(:categories, on_delete: :delete_all)
    end

    create index(:product_categories, [:product_id])
    create unique_index(:product_categories, [:category_id, :product_id])
  end
end
```

--------------------------------

### Phoenix LiveView: Reactive File Input with Drag and Drop

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/form-bindings

Provides an example of implementing reactive file inputs in LiveView, including drag-and-drop support. The 'phx-drop-target' attribute is used on a container element, and '<.live_file_input>' renders the actual file input component.

```html
<div class="container" phx-drop-target={@uploads.avatar.ref}>
  ...
  <.live_file_input upload={@uploads.avatar} />
</div>
```

--------------------------------

### Initialize Presence with Options

Source: https://hexdocs.pm/phoenix/js/index

Initializes a new Presence object for a given channel with optional event configurations. The `opts` parameter allows customization of events for state and diff updates.

```javascript
new Presence(channel, { events: { state: "state", diff: "diff" } })
```

--------------------------------

### Copy Uploaded File in Elixir

Source: https://hexdocs.pm/phoenix/1.7.17/file_uploads

Demonstrates how to copy an uploaded file to a persistent location on the filesystem. This example checks if a 'photo' upload exists, extracts its extension, and copies the file to a new location with a unique name derived from the product ID.

```elixir
if upload = product_params["photo"]) do
  extension = Path.extname(upload.filename)
  File.cp(upload.path, "/media/#{product.id}-cover#{extension}")
end
```

--------------------------------

### LiveView Deprecated Component Syntax to Function Component Syntax

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This snippet shows the transition from deprecated LiveView component rendering syntax to the newer function component syntax. The deprecated syntax used ERB-style tags, while the new syntax utilizes HEEx (`<.>`) components. This change was introduced to standardize component rendering and improve clarity. No specific inputs or outputs are defined, as this is a syntax change.

```elixir
<%= live_img_preview(entry) %>
Use `<.live_img_preview entry={entry} />` instead

<=\n= live_file_input(upload) %>
Use `<.live_file_input upload={upload} />` instead

<=\n= live_component(Component)
Use `<.live_component module={Component} id="hello" />` instead

<=\n= live_img_preview(entry, opts) %>
Use `<.live_img_preview entry={entry} {opts} />`

<=\n= live_file_input(upload, opts) %>
Use `<.live_file_input upload={upload} {opts} />`
```

--------------------------------

### Controller Function to Set Locale in Session

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/gettext

An example of a controller function that sets the user's locale in the Plug session. This is useful when integrating LiveView with traditional controllers, especially for managing user preferences.

```elixir
def put_user_session(conn, current_user) do
  Gettext.put_locale(MyApp.Gettext, current_user.locale)

  conn
  |> put_session(:user_id, current_user.id)
  |> put_session(:locale, current_user.locale)
end
```

--------------------------------

### Useful Gigalixir Commands

Source: https://hexdocs.pm/phoenix/1.7.14/gigalixir

Provides commands for advanced management of the Gigalixir application, such as adding SSH keys, opening a remote console, and accessing remote observer or clustering functionalities.

```bash
gigalixir account:ssh_keys:add "$(cat ~/.ssh/id_rsa.pub)"
gigalixir ps:remote_console
```

--------------------------------

### Handle Query Strings with Verified Routes in Elixir

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/routing

Demonstrates how to include query strings when using the ~p sigil for verified routes in Elixir. It shows examples of adding query parameters directly as strings, using keyword lists, or maps, ensuring correct URL formatting.

```elixir
~p"/users/17?admin=true&active=false"
"/users/17?admin=true&active=false"

~p"/users/17?#{[admin: true]}"
"/users/17?admin=true"

~p"/users/17?#{%{admin: true}}"
"/users/17?admin=true"
```

--------------------------------

### Declare Single Routes in Phoenix

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/router

Defines how to declare individual routes in Phoenix using `get`, `patch`, etc., mapping URLs to controller actions. Also shows verified route syntax using `~p` for dynamic segments.

```elixir
get "/users", UserController, :index
patch "/users/:id", UserController, :update
```

```elixir
# Verified Routes
~p"/users"
~p"/users/#{@user}"
```

--------------------------------

### Phoenix Catalog Context: Create Product

Source: https://hexdocs.pm/phoenix/1.7.17/contexts

This Elixir code snippet from the `Catalog` context module defines the `create_product/1` function. It handles the creation of a new product, returning either a success tuple with the created product or an error tuple with an Ecto changeset if validation fails. This function encapsulates the persistence logic for products.

```elixir
  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \ %{}) do

```

--------------------------------

### Remove live_img_preview/2 in favor of <.live_img_preview /> in LiveView

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This backwards incompatible change removes the `live_img_preview/2` function in favor of the `<.live_img_preview />` functional component. This update provides a more idiomatic way to render image previews within LiveView templates, leveraging the component system.

```elixir
# Old syntax (removed)
<%= live_img_preview(@socket, @image_ref) %>

# New syntax (recommended)
<.live_img_preview ref={@image_ref} />
```

--------------------------------

### Handling Quotes in Attribute Names

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Addresses the enforcement of raising an error when using quotes in attribute names within HEEx templates. This promotes cleaner syntax and prevents potential parsing ambiguities.

```html
<div "my-attribute"="value">
```

--------------------------------

### Phoenix mix phx.new command options for API-only apps

Source: https://hexdocs.pm/phoenix/1.7.14/json_and_apis

This output from `mix help phx.new` lists various flags for customizing Phoenix project generation. Key flags for API-only applications include `--no-html`, `--no-assets`, and `--no-gettext` to omit specific functionalities.

```text
  • --no-assets - equivalent to --no-esbuild and --no-tailwind
  • --no-dashboard - do not include Phoenix.LiveDashboard
  • --no-ecto - do not generate Ecto files
  • --no-esbuild - do not include esbuild dependencies and
    assets. We do not recommend setting this option, unless for API
    only applications, as doing so requires you to manually add and
    track JavaScript dependencies
  • --no-gettext - do not generate gettext files
  • --no-html - do not generate HTML views
  • --no-live - comment out LiveView socket setup in your Endpoint
    and assets/js/app.js. Automatically disabled if --no-html is given
  • --no-mailer - do not generate Swoosh mailer files
  • --no-tailwind - do not include tailwind dependencies and
    assets. The generated markup will still include Tailwind CSS
    classes, those are left-in as reference for the subsequent
    styling of your layout and components
```

--------------------------------

### Configure LiveSocket Metadata for Event Data

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

This snippet shows how to configure metadata for LiveSocket to capture specific event data for click and keydown events. It is useful for debugging and tracking user interactions by defining custom metadata extraction functions.

```javascript
let liveSocket = new LiveSocket("/live", Socket, {
    params: {_csrf_token: csrfToken},
    metadata: {
      click: (e, el) => {
        return {
          altKey: e.altKey,
          shiftKey: e.shiftKey,
          ctrlKey: e.ctrlKey,
          metaKey: e.metaKey,
          x: e.x || e.clientX,
          y: e.y || e.clientY,
          pageX: e.pageX,
          pageY: e.pageY,
          screenX: e.screenX,
          screenY: e.screenY,
          offsetX: e.offsetX,
          offsetY: e.offsetY,
          detail: e.detail || 1,
        }
      },
      keydown: (e, el) => {
        return {
          altGraphKey: e.altGraphKey,
          altKey: e.altKey,
          code: e.code,
          ctrlKey: e.ctrlKey,
          key: e.key,
          keyIdentifier: e.keyIdentifier,
          keyLocation: e.keyLocation,
          location: e.location,
          metaKey: e.metaKey,
          repeat: e.repeat,
          shiftKey: e.shiftKey
        }
      }
    }
  })copy
```

--------------------------------

### Handling URL Parameters with handle_params/3 in LiveView

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/live-navigation

Provides an example of the `handle_params/3` callback in Phoenix LiveView. This callback is invoked when `mount/3` is called and also on subsequent `patch` operations. It's used to process URL parameters, validate input, and update the LiveView's state, triggering a re-render.

```elixir
def handle_params(params, _uri, socket) do
  socket = 
    case params["sort_by"] do
      sort_by when sort_by in ~w(name company) -> assign(socket, sort_by: sort_by)
      _ -> socket
    end

  {:noreply, load_users(socket)}
end
```

--------------------------------

### Define Telemetry Module for LiveDashboard Metrics

Source: https://hexdocs.pm/phoenix/_live_dashboard/metrics

Provides an example Elixir module 'MyAppWeb.Telemetry' that acts as a supervisor for telemetry reporters and defines various metrics for Phoenix, Ecto, and the VM. It includes configurations for periodic polling and different metric types like 'summary'. Ensure 'MyApp' is replaced with your application's name.

```elixir
defmodule MyAppWeb.Telemetry do
  use Supervisor
  import Telemetry.Metrics

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @impl true
  def init(_arg) do
    children = [
      # Telemetry poller will execute the given period measurements
      # every 10_000ms. Learn more here: https://hexdocs.pm/telemetry_metrics
      {:telemetry_poller, measurements: periodic_measurements(), period: 10_000}
      # Add reporters as children of your supervision tree.
      # {Telemetry.Metrics.ConsoleReporter, metrics: metrics()}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  def metrics do
    [
      # Phoenix Metrics
      summary("phoenix.endpoint.stop.duration",
        unit: {:native, :millisecond}
      ),
      summary("phoenix.router_dispatch.stop.duration",
        tags: [:route],
        unit: {:native, :millisecond}
      ),

      # Database Time Metrics
      summary("my_app.repo.query.total_time", unit: {:native, :millisecond}),
      summary("my_app.repo.query.decode_time", unit: {:native, :millisecond}),
      summary("my_app.repo.query.query_time", unit: {:native, :millisecond}),
      summary("my_app.repo.query.queue_time", unit: {:native, :millisecond}),
      summary("my_app.repo.query.idle_time", unit: {:native, :millisecond}),

      # VM Metrics
      summary("vm.memory.total", unit: {:byte, :kilobyte}),
      summary("vm.total_run_queue_lengths.total"),
      summary("vm.total_run_queue_lengths.cpu"),
      summary("vm.total_run_queue_lengths.io")
    ]
  end

  defp periodic_measurements do
    []
  end
end
```

--------------------------------

### LiveView Empty Diff Update Fix

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/changelog

Fixes a bug where an empty diff would cause pending data-ref based updates (like classes and `phx-disable-with`) to not be updated. This ensures all attributes are applied correctly.

```elixir
Fix empty diff causing pending data-ref based updates, such as classes and `phx-disable-with` content to not be updated
```

--------------------------------

### Heroku.yml Configuration for Container Stack

Source: https://hexdocs.pm/phoenix/1.7.14/heroku

This is a sample `heroku.yml` file used when deploying with the container stack. It defines application addons, specifies the Dockerfile for building the web image, and sets environment configurations like MIX_ENV, SECRET_KEY_BASE, and DATABASE_URL.

```yaml
setup:
  addons:
    - plan: heroku-postgresql
      as: DATABASE
build:
  docker:
    web: Dockerfile
  config:
    MIX_ENV: prod
    SECRET_KEY_BASE: $SECRET_KEY_BASE
    DATABASE_URL: $DATABASE_URL
```

--------------------------------

### Allow typing hook element with TypeScript

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Adds support for typing hook elements when using TypeScript with Phoenix LiveView. This improves type safety and developer experience for projects utilizing both technologies.

```typescript
interface LiveViewHook {
  mounted?(element: HTMLElement, options: any) => void;
  updated?(element: HTMLElement, options: any) => void;
  destroyed?(element: HTMLElement) => void;
  // ... other hook lifecycle methods
}

// Usage example:
const myHook: LiveViewHook = {
  mounted(el, opts) { /* ... */ }
};

```

--------------------------------

### Handle Deprecated :name Option in Forms

Source: https://hexdocs.pm/phoenix/_html/4.2.0/changelog

Addresses a bug where the `:name` option was used to configure the underlying input name prefix in forms, which has been deprecated in favor of `:as`. This change ensures compatibility while guiding users towards the preferred `:as` option for input configuration.

```elixir
Phoenix.HTML.Form
```

--------------------------------

### Add change tracking in comprehensions by default

Source: https://hexdocs.pm/phoenix/_live_view/changelog

Enables change tracking in comprehensions by default in Phoenix LiveView. This improves performance by only re-rendering changed items and simplifies usage as `:key` no longer relies on LiveComponents.

```elixir
assigns = %{items: [%{id: 1, name: "A"}, %{id: 2, name: "B"}]}

~H"<ul>
  <.for @items id={item.id}>
    <li>%{item.name}</li>
  </.for>
</ul>"

# Change tracking is now enabled by default for comprehensions.
```

--------------------------------

### Phoenix Project Directory Structure

Source: https://hexdocs.pm/phoenix/1.7.17/directory_structure

Illustrates the top-level directory structure of a new Phoenix application generated with `mix phx.new`. This structure helps organize application code, assets, configurations, and dependencies.

```text
├── _build
├── assets
├── config
├── deps
├── lib
│	├── hello
│	├── hello.ex
│	├── hello_web
│	└── hello_web.ex
├── priv
└── test

```

--------------------------------

### Run generated resource tests with mix test

Source: https://hexdocs.pm/phoenix/1.7.17/testing

After generating a new resource, running `mix test` will execute the newly generated tests along with any existing ones. This command confirms that the scaffolded code and tests are functioning correctly.

```shell
$ mix test
................

Finished in 0.1 seconds
21 tests, 0 failures

Randomized with seed 537537
```

--------------------------------

### Importing Third-Party JS Packages with esbuild

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/asset_management

Demonstrates how to import JavaScript dependencies like 'topbar'. Option 1 uses relative paths for vendored dependencies. Option 2 uses npm to install packages directly into the assets directory, which esbuild then picks up. Option 3 uses Mix to manage dependencies from a GitHub repository.

```javascript
import topbar from "../vendor/topbar"

```

```javascript
import topbar from "topbar"

```

```elixir
      "assets.build": ["cmd --cd assets npm ci", "tailwind your_app", "esbuild your_app"],
      "assets.deploy": [
        "cmd --cd assets npm ci",
        "tailwind your_app --minify",
        "esbuild your_app --minify",
        "phx.digest"
      ]

```

```elixir
# mix.exs
{:topbar, github: "buunguyen/topbar", app: false, compile: false}

```

```javascript
import topbar from "topbar"

```

--------------------------------

### HTML Button with Tailwind Loading Class

Source: https://hexdocs.pm/phoenix/_live_view/1.0.0/syncing-changes

Example of applying a Tailwind CSS class to a button to visually indicate a loading state when a LiveView event is triggered. This class is defined via the `addVariant` plugin.

```html
<button phx-click="clicked" class="phx-click-loading:opacity-50">...</button>
```

--------------------------------

### Create Heroku App and Set Container Stack

Source: https://hexdocs.pm/phoenix/1.7.14/heroku

These commands demonstrate how to create a new application on Heroku and explicitly set its stack to 'container'. This is the first step when intending to use a Dockerfile for your application's build process.

```bash
$ heroku create
$ heroku stack:set container
```

--------------------------------

### Ecto Migration Output

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/more_examples

Displays the output from running Ecto migrations, showing the creation of 'orders' and 'order_line_items' tables along with associated indexes. This confirms the database schema changes have been applied.

```text
$ mix ecto.migrate

17:14:37.715 [info] == Running 20250209214612 Hello.Repo.Migrations.CreateOrders.change/0 forward

17:14:37.720 [info] create table orders

17:14:37.755 [info] == Migrated 20250209214612 in 0.0s

17:14:37.784 [info] == Running 20250209215050 Hello.Repo.Migrations.CreateOrderLineItems.change/0 forward

17:14:37.785 [info] create table order_line_items

17:14:37.795 [info] create index order_line_items_order_id_index

17:14:37.796 [info] create index order_line_items_product_id_index

17:14:37.798 [info] == Migrated 20250209215050 in 0.0s
```

--------------------------------

### Phoenix API Versioning with Nested Scopes

Source: https://hexdocs.pm/phoenix/1.7.14/routing

Demonstrates how to define versioned API routes using nested scopes in Phoenix. It shows a common pattern for organizing API resources like images, reviews, and users under a specific API version. Dependencies include Phoenix.Router and controllers like ImageController, ReviewController, and UserController.

```elixir
scope "/api", HelloWeb.Api, as: :api do
  pipe_through :api

  scope "/v1", V1, as: :v1 do
    resources "/images",  ImageController
    resources "/reviews", ReviewController
    resources "/users",   UserController
  end
end
```

--------------------------------

### HTML Form with CSRF Token

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/security

An example of an HTML form enhanced with a hidden input field for a CSRF token. This token is generated by the server and used to validate the request's authenticity.

```html
<input name="_csrf_token" type="hidden" hidden="" 
  value="WUZXJh07BhAIJ24jP1d-KQEpLwYmMDwQ0-2eYNLH_x8oHoO_qv_HJDqZ">
```

--------------------------------

### Open Fly.io App in Browser (Flyctl)

Source: https://hexdocs.pm/phoenix/1.8.0-rc.4/fly

Opens your deployed application in the default web browser.

```bash
$ fly open

```
