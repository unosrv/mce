### Initialize LiveSocket in JavaScript

Source: https://hexdocs.pm/phoenix_live_view/welcome

This JavaScript snippet shows the necessary setup for Phoenix LiveView in the `app.js` file. It imports `Socket` and `LiveSocket`, obtains a CSRF token, and initializes `LiveSocket` to connect to the `/live` endpoint, enabling WebSocket communication for LiveView.

```javascript
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}})
liveSocket.connect()
```

--------------------------------

### Elixir LiveView Module for Thermostat

Source: https://hexdocs.pm/phoenix_live_view/index

Defines the behavior for a thermostat LiveView. It includes rendering logic using HEEx templates, initial state setup in `mount`, and handling user interactions to update temperature in `handle_event`. Relies on Phoenix LiveView and HEEx sigils.

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

### Testing LiveView Connected Mount with live/2

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

This example shows a convenient way to test the connected mount of a LiveView using `live/2`. This function combines the GET request and the live mount into a single step, directly returning the view process, assigns, and rendered HTML if successful.

```elixir
test "connected mount", %{conn: conn} do
  {:ok, _view, html} = live(conn, "/my-path")
  assert html =~ "<h1>My Connected View</h1>"
end
```

--------------------------------

### Spawn and Manage LiveView Processes

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Functions for starting and managing LiveView processes. `live/2` spawns a connected LiveView, `live_isolated/3` mounts a LiveView in isolation, and `put_connect_params/2` modifies connection parameters.

```Elixir
live(conn, path \\ nil, opts \\ [])
live_isolated(conn, live_view, opts \\ [])
put_connect_params(conn, params)
```

--------------------------------

### Server-side Key Event Payload Example

Source: https://hexdocs.pm/phoenix_live_view/bindings

An example of the data structure sent to the server when a specific key event occurs in Phoenix LiveView. This specific example shows the payload for an 'Escape' key press, containing the 'key' field.

```elixir
%{"key" => "Escape"}
```

--------------------------------

### Combining Parameters and Session in LiveView Mount

Source: https://hexdocs.pm/phoenix_live_view/welcome

Illustrates how to simultaneously access both URL parameters and session data within the `mount` callback. This allows for fetching data that depends on both the context of the request (URL) and the user's session.

```elixir
def mount(%{"house" => house}, %{"current_user_id" => user_id}, socket) do
  temperature = Thermostat.get_house_reading(user_id, house)
  {:ok, assign(socket, :temperature, temperature)}
end
```

--------------------------------

### Render Live Component with Phoenix.LiveComponent

Source: https://hexdocs.pm/phoenix_live_view/index

This snippet demonstrates how to render a Live Component using the `<.live_component/1>` helper. Live Components are suitable for encapsulating state, markup, and events within a LiveView, running in the same process as the parent LiveView.

```HEEx
<.live_component module={UserComponent} id={user.id} user={user} />
```

--------------------------------

### Update mix.exs for LiveView v1.1 Dependencies

Source: https://hexdocs.pm/phoenix_live_view/changelog

Example of how to update the `mix.exs` file to include `phoenix_live_view` version 1.1 and add `lazy_html` as a test dependency. It also shows how to prepend `:phoenix_live_view` to the compilers list.

```elixir
def deps do
  [
    {:phoenix_live_view, "~> 1.1"},
    {:lazy_html, ">= 0.0.0", only: :test}
  ]
end

def project do
  [
    # ...
    compilers: [:phoenix_live_view] ++ Mix.compilers(),
    # ...
  ]
end
```

--------------------------------

### Spawn LiveView Process for Testing

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Spawns a connected LiveView process. It can perform a GET request to a path and upgrade it to a LiveView, or immediately convert a given Plug.Conn to a LiveView. Supports configuring error handling with `:on_error`.

```elixir
{:ok, view, html} = live(conn, "/path")
assert view.module == MyLive
assert html =~ "the count is 3"

assert {:error, {:redirect, %{to: "/somewhere"}}} = live(conn, "/path")
```

--------------------------------

### Install UpChunk JS Library

Source: https://hexdocs.pm/phoenix_live_view/external-uploads

Installs the UpChunk JS library into the assets directory of a Phoenix project using npm. This is a prerequisite for using UpChunk for chunked uploads.

```bash
$ npm install --prefix assets --save @mux/upchunk

```

--------------------------------

### Elixir Phoenix Router Integration for LiveView

Source: https://hexdocs.pm/phoenix_live_view/index

Integrates the ThermostatLive view into the Phoenix application's router. This allows the LiveView to be accessed via a specific URL. It assumes a standard Phoenix router setup with a browser pipeline.

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

### HEEx Comprehension with Posts (Elixir)

Source: https://hexdocs.pm/phoenix_live_view/assigns-eex

Illustrates how to use HEEx comprehensions in Elixir to iterate over a list of posts and render a section for each. This example shows the basic syntax for traversing collections within templates.

```elixir
<%= for post <- @posts do %>
  <section>
    <h1>{expand_title(post.title)}</h1>
  </section>
<% end %>
```

--------------------------------

### Handling Click Events with LiveView Bindings

Source: https://hexdocs.pm/phoenix_live_view/welcome

Defines a button in HEEx markup that triggers a 'inc_temperature' event on click. The corresponding Elixir code in `handle_event/3` increments the `:temperature` assign, updating the UI.

```html
<button phx-click="inc_temperature">+</button>
```

```elixir
def handle_event("inc_temperature", _value, socket) do
  {:noreply, update(socket, :temperature, &(&1 + 1))}
end
```

--------------------------------

### JavaScript for Phoenix LiveView Connection

Source: https://hexdocs.pm/phoenix_live_view/index

Sets up the client-side JavaScript to establish a connection with the Phoenix LiveView server. It imports necessary components, retrieves CSRF tokens, and initializes the LiveSocket connection over WebSockets. This code is typically found in `app.js`.

```javascript
import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}})
liveSocket.connect()
```

--------------------------------

### Shell: Phoenix LiveView generator command

Source: https://hexdocs.pm/phoenix_live_view/index

Provides the command-line interface (CLI) command to generate a new LiveView resource in a Phoenix v1.6+ project. This command scaffolds the necessary files for a LiveView, including database interactions, routing, and templates, based on the provided resource name and fields.

```shell
$ mix phx.gen.live Blog Post posts title:string body:text
```

--------------------------------

### Test LiveView Component Rendering

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

This example shows how to test the rendered output of a Phoenix LiveView component using `Phoenix.LiveViewTest`. It assigns empty values and asserts that the rendered HTML matches the expected output for a greet component.

```elixir
import Phoenix.Component
import Phoenix.LiveViewTest

test "greets" do
  assigns = %{}
  assert rendered_to_string(~H"""
         <MyComponents.greet name="Mary" />
         """) ==
           "<div>Hello, Mary!</div>"
end
```

--------------------------------

### Accessing Session Data in LiveView Mount

Source: https://hexdocs.pm/phoenix_live_view/welcome

Shows how to access session data, such as 'current_user_id', in the `mount` callback. This is useful for retrieving authentication information or user-specific settings to personalize the LiveView's initial state.

```elixir
def mount(_params, %{"current_user_id" => user_id}, socket) do
  temperature = Thermostat.get_user_reading(user_id)
  {:ok, assign(socket, :temperature, temperature)}
end
```

--------------------------------

### Handling URL Parameters in LiveView with handle_params

Source: https://hexdocs.pm/phoenix_live_view/live-navigation

Provides an example of the `handle_params/3` callback in a LiveView. This callback is invoked on initial mount and after `patch` operations, allowing for validation and state updates based on URL parameters.

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

### LiveComponent Handle Event Start Event - Elixir

Source: https://hexdocs.pm/phoenix_live_view/telemetry

This event signals the beginning of a `Phoenix.LiveComponent`'s `handle_event/3` callback. It provides the system time at invocation, socket details, the component name, the event string, and any associated parameters.

```elixir
[:phoenix, :live_component, :handle_event, :start]
```

--------------------------------

### Elixir: Mount callback with parameters and session

Source: https://hexdocs.pm/phoenix_live_view/index

Demonstrates how to use the `mount` callback in Elixir to access request parameters (e.g., 'house') and session data (e.g., 'current_user_id') to fetch and assign data to the LiveView socket. This is useful for initializing the LiveView state based on URL or user authentication.

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

### Accessing URL Parameters in LiveView Mount

Source: https://hexdocs.pm/phoenix_live_view/welcome

Demonstrates how to extract URL parameters, specifically the 'house' identifier, within the `mount` callback of a LiveView to fetch relevant data. It relies on a `Thermostat` module for data retrieval and assigns the fetched temperature to the socket.

```elixir
def mount(%{"house" => house}, _session, socket) do
  temperature = Thermostat.get_house_reading(house)
  {:ok, assign(socket, :temperature, temperature)}
end
```

--------------------------------

### LiveView JS Command for CSS Transition Animations

Source: https://hexdocs.pm/phoenix_live_view/syncing-changes

This example demonstrates using LiveView's `JS.transition` command to apply CSS-based animations to an element. When the button is clicked, it triggers a `shake` transition on the element with the ID `item`, providing a simple yet effective way to add visual flair to user interactions.

```html
<div id="item">My Item</div>
<button phx-click={JS.transition("shake", to: "#item")}>Shake!</button>
```

--------------------------------

### CSS for Optimistic UI with LiveView Loading Classes

Source: https://hexdocs.pm/phoenix_live_view/syncing-changes

Provides a CSS example demonstrating how to style elements when they are in a loading state due to LiveView events. This allows for immediate visual feedback to the user, such as fading the text of a clicked element.

```css
.phx-click-loading.opaque-on-click {
  opacity: 50%;
}
```

--------------------------------

### Listening for Server-Pushed Events in Browser (JavaScript)

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Shows how to listen for custom server-pushed events in the browser using `window.addEventListener`. The example listens for a 'highlight' event and retrieves an element by its ID from the event details to perform client-side logic.

```javascript
let liveSocket = new LiveSocket(...)
window.addEventListener("phx:highlight", (e) => {
  let el = document.getElementById(e.detail.id)
  if(el) {
    // logic for highlighting
  }
})
```

--------------------------------

### UploadLive Component Example - Elixir

Source: https://hexdocs.pm/phoenix_live_view/uploads

A complete Phoenix LiveView component for handling file uploads. It includes mounting the view, allowing uploads with specific accept types and max entries, handling cancel events, and consuming uploaded entries by saving them to disk. It also defines helper functions for converting error atoms to strings.

```elixir
defmodule MyAppWeb.UploadLive do
  use MyAppWeb, :live_view

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok,
    socket
    |> assign(:uploaded_files, [])
    |> allow_upload(:avatar, accept: ~w(.jpg .jpeg), max_entries: 2)}
  end

  @impl Phoenix.LiveView
  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  @impl Phoenix.LiveView
  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :avatar, ref)}
  end

  @impl Phoenix.LiveView
  def handle_event("save", _params, socket) do
    uploaded_files = 
      consume_uploaded_entries(socket, :avatar, fn %{path: path}, _entry ->
        dest = Path.join([:code.priv_dir(:my_app), "static", "uploads", Path.basename(path)])
        # You will need to create `priv/static/uploads` for `File.cp!/2` to work.
        File.cp!(path, dest)
        {:ok, ~p"/uploads/#{Path.basename(dest)}"}
      end)

    {:noreply, update(socket, :uploaded_files, &(&1 ++ uploaded_files))}
  end

  defp error_to_string(:too_large), do: "Too large"
  defp error_to_string(:too_many_files), do: "You have selected too many files"
  defp error_to_string(:not_accepted), do: "You have selected an unacceptable file type"
end
```

--------------------------------

### Render Nested LiveView with live_render/3

Source: https://hexdocs.pm/phoenix_live_view/index

This demonstrates rendering a LiveView within another LiveView using `live_render/3`. Nested LiveViews run in a separate process, providing error isolation. The `:id` option is mandatory for uniquely identifying the child LiveView.

```Elixir
live_render(@socket, ChildLiveView, id: child_id)
```

--------------------------------

### Import Colocated Hooks in app.js

Source: https://hexdocs.pm/phoenix_live_view/changelog

Example of how to import and integrate colocated hooks into your main JavaScript entry file (`app.js`). This involves importing the `colocatedHooks` object and passing it to the `LiveSocket` constructor.

```javascript
import {LiveSocket} from "phoenix_live_view"
import {hooks as colocatedHooks} from "phoenix-colocated/my_app"
import topbar from "../vendor/topbar"

const liveSocket = new LiveSocket("/live", Socket, {
  longPollFallbackMs: 2500,
  params: {_csrf_token: csrfToken},
  hooks: {...colocatedHooks}
})
...
```

--------------------------------

### Handling Focus and Blur Events with Phoenix LiveView Bindings

Source: https://hexdocs.pm/phoenix_live_view/bindings

This example demonstrates binding focus and blur events to input elements using `phx-focus` and `phx-blur` in Phoenix LiveView. It also shows how to bind window-level focus and blur events using `phx-window-focus` and `phx-window-blur`, enabling the server to react to focus changes on specific elements or the entire page.

```elixir
<input name="email" phx-focus="myfocus" phx-blur="myblur"/>

<div class="container"
    phx-window-focus="page-active"
    phx-window-blur="page-inactive"
    phx-value-page="123">
  ...
</div>
```

--------------------------------

### LiveView Mount Telemetry Events

Source: https://hexdocs.pm/phoenix_live_view/telemetry

Monitors the start, stop, and exceptions during the mount phase of a Phoenix.LiveView. Dispatched before, after, and on exception of the mount/3 callback.

```elixir
[:phoenix, :live_view, :mount, :start]
[:phoenix, :live_view, :mount, :stop]
[:phoenix, :live_view, :mount, :exception]
```

--------------------------------

### LiveView Handle Params Telemetry Events

Source: https://hexdocs.pm/phoenix_live_view/telemetry

Tracks the execution of the handle_params/3 callback in Phoenix.LiveView. Events are dispatched at the start and end of the callback, and if an exception occurs.

```elixir
[:phoenix, :live_view, :handle_params, :start]
[:phoenix, :live_view, :handle_params, :stop]
[:phoenix, :live_view, :handle_params, :exception]
```

--------------------------------

### LiveView Event Handling with Server-Side Authorization

Source: https://hexdocs.pm/phoenix_live_view/security-model

Provides an example of handling a 'delete_project' event in a LiveView, including server-side authorization. It uses `on_mount` for initial authentication and passes the current user to the `Project.delete!` context function for permission checks.

```elixir
on_mount MyAppWeb.UserLiveAuth

def mount(_params, _session, socket) do
  {:ok, load_projects(socket)}
end

def handle_event("delete_project", %{"project_id" => project_id}, socket) do
  Project.delete!(socket.assigns.current_user, project_id)
  {:noreply, update(socket, :projects, &Enum.reject(&1, fn p -> p.id == project_id end)}
end

defp load_projects(socket) do
  projects = Project.all_projects(socket.assigns.current_user)
  assign(socket, projects: projects)
end
```

--------------------------------

### Update esbuild Configuration for Colocated Hooks

Source: https://hexdocs.pm/phoenix_live_view/changelog

Example of updating the `esbuild` configuration in `config/config.exs` to support colocated hooks. This involves modifying the `args` and `env` for `esbuild` to correctly handle the `NODE_PATH` and alias resolution.

```elixir
your_app_name: [
  args:
    ~w(js/app.js --bundle --target=es2022 --outdir=../priv/static/assets/js --external:/fonts/* --external:/images/* --alias:@=.),
  env: %{"NODE_PATH" => [Path.expand("../deps", __DIR__), Mix.Project.build_path()]},
]
```

--------------------------------

### HTML/Elixir: DOM binding for click event

Source: https://hexdocs.pm/phoenix_live_view/index

Shows how to bind a DOM element (a button) to a LiveView event named 'inc_temperature' using the `phx-click` attribute in HTML. This allows client-side interactions to trigger server-side logic.

```html+elixir
<button phx-click="inc_temperature">+</button>
```

--------------------------------

### Testing LiveView Disconnected Mount with Phoenix.ConnTest

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

This snippet illustrates testing the initial disconnected mount of a LiveView using standard HTTP request functions from `Phoenix.ConnTest` and `Phoenix.LiveViewTest`. It first performs a GET request to retrieve the initial HTML and then uses `live/1` to mount the view in a connected state.

```elixir
import Plug.Conn
import Phoenix.ConnTest
import Phoenix.LiveViewTest
@endpoint MyEndpoint

test "disconnected and connected mount", %{conn: conn} do
  conn = get(conn, "/my-path")
  assert html_response(conn, 200) =~ "<h1>My Disconnected View</h1>"

  {:ok, view, html} = live(conn)
end
```

--------------------------------

### Define LiveSession Scopes with Authentication Hooks

Source: https://hexdocs.pm/phoenix_live_view/security-model

This example demonstrates how to define different `live_session` scopes in the router, each with its own authentication hook (`on_mount`). This allows for distinct authentication flows for different types of users or application sections. Regular HTTP requests are piped through specific authentication plugs.

```elixir
scope "/" do
  pipe_through [:authenticate_user]

  live_session :default, on_mount: MyAppWeb.UserLiveAuth do
    live "/", PageLive
  end
end

scope "/admin" do
  pipe_through [:authenticate_admin]

  live_session :admin, on_mount: MyAppWeb.AdminLiveAuth do
    live "/admin", AdminLive
  end
end
```

--------------------------------

### Generate Presigned Upload URL (Elixir)

Source: https://hexdocs.pm/phoenix_live_view/external-uploads

An example of a private function in Elixir that handles the presigning of upload URLs for external storage. This function is passed to the `:external` option in `allow_upload/3` and returns metadata for the client.

```elixir
defp presign_upload(entry, socket) do
  {:ok, %{"Location" => link}} =
    SomeTube.start_session(%{
      "uploadType" => "resumable",
      "x-upload-content-length" => entry.client_size
    })

  {:ok, %{uploader: "UpChunk", entrypoint: link}, socket}
end

```

--------------------------------

### Clear LiveView Flash Messages with lv:clear-flash

Source: https://hexdocs.pm/phoenix_live_view/bindings

This example shows how to use the `lv:clear-flash` event prefix to trigger the clearing of flash messages on the server. A `phx-value-key` attribute can specify which flash key to remove.

```html
<p class="alert" phx-click="lv:clear-flash" phx-value-key="info">
  {Phoenix.Flash.get(@flash, :info)}
</p>
```

--------------------------------

### JavaScript: Extending Phoenix LiveView's ViewHook

Source: https://hexdocs.pm/phoenix_live_view/js-interop

This JavaScript code demonstrates how to create a custom LiveView hook by extending the provided `ViewHook` class. The example shows a basic structure with a `mounted` lifecycle callback, which is a common pattern for initializing hook behavior when the element is added to the DOM. It's a more structured way to define hooks compared to plain objects.

```javascript
import { ViewHook} from "phoenix_live_view"

class MyHook extends ViewHook {
  mounted() {
    ...
  }
}

let liveSocket = new LiveSocket(..., {
  hooks: {
    MyHook
  }
})
```

--------------------------------

### LiveComponent Update Telemetry Events

Source: https://hexdocs.pm/phoenix_live_view/telemetry

Tracks the update process for Phoenix.LiveComponent. Events are dispatched at the start and end of the update/2 or update_many/1 callbacks, and on exceptions. The stop event includes updated socket information.

```elixir
[:phoenix, :live_component, :update, :start]
[:phoenix, :live_component, :update, :stop]
```

--------------------------------

### Get LiveView Page Title in Test

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Retrieves the most recently set page title within a LiveView test. This is useful for verifying that title updates triggered by events are functioning correctly.

```elixir
render_click(view, :event_that_triggers_page_title_update)
assert page_title(view) =~ "my title"
```

--------------------------------

### Custom Phoenix LiveView Input Component

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

An example of a simple `input` function component in Elixir for Phoenix LiveView. This component renders an HTML input element, accepting a `Phoenix.HTML.FormField` and other global attributes.

```elixir
attr :field, Phoenix.HTML.FormField
attr :rest, :global, include: ~w(type)
def input(assigns) do
  ~H"""
  <input id={@field.id} name={@field.name} value={@field.value} {@rest} />
  """
end
```

--------------------------------

### Get LiveView Children in Test

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Retrieves a list of current LiveView children associated with a parent LiveView. The children are returned in the order they appear in the rendered HTML, useful for verifying nested LiveView structures.

```elixir
{:ok, view, _html} = live(conn, "/thermo")
assert [clock_view] = live_children(view)
assert render_click(clock_view, :snooze) =~ "snoozing"
```

--------------------------------

### Elixir: Function component for markup organization

Source: https://hexdocs.pm/phoenix_live_view/index

Defines an Elixir function component that receives assigns and returns a HEEx template. This is used to organize reusable markup and can include embedded components or dynamically assigned values. It's a way to compartmentalize markup and logic within LiveViews.

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

### Explicitly Passing Assigns to Child Components (Elixir)

Source: https://hexdocs.pm/phoenix_live_view/assigns-eex

Shows an Elixir example of passing specific assigns to child components, allowing for better control over re-rendering and change tracking. This approach is preferred over passing all assigns, as it leverages LiveView's built-in mechanisms for efficient updates.

```elixir
def card(assigns) do
  ~H"""
  <div class="card">
    <.card_header title={@title} class={@title_class} />
    <.card_body>
      {render_slot(@inner_block)}
    </.card_body>
    <.card_footer on_close={@on_close} />
  </div>
  """
end
```

--------------------------------

### LiveView JS Commands for Hiding Elements on Click

Source: https://hexdocs.pm/phoenix_live_view/syncing-changes

This example showcases LiveView's JavaScript commands for immediate client-side element manipulation. The `JS.push` command initiates a server event, and the subsequent `JS.hide()` command immediately removes the clicked element from the DOM, providing instant feedback to the user without waiting for a server round trip.

```html
<button phx-click={JS.push("delete") |> JS.hide()}>Delete</button>
```

--------------------------------

### Server-side Live Navigation with push_navigate

Source: https://hexdocs.pm/phoenix_live_view/live-navigation

Shows how to initiate live navigation from the server using `Phoenix.LiveView.push_navigate/2`. This action dismounts the current LiveView and mounts a new one, useful for navigating between different LiveViews within the same session.

```elixir
{:noreply, push_navigate(socket, to: ~p"/pages/#{@page + 1}")}
```

--------------------------------

### Applying Tailwind Loading Styles with LiveView Attributes

Source: https://hexdocs.pm/phoenix_live_view/syncing-changes

This example shows how to apply Tailwind CSS classes, specifically using the custom `phx-click-loading` variant, directly to HTML elements within a LiveView template. When the button is clicked and enters a loading state managed by LiveView, the specified `opacity-50` class will be applied, visually indicating the loading process.

```html
<button phx-click="clicked" class="phx-click-loading:opacity-50">...</button>
```

--------------------------------

### LiveView Event Handling for HTTP Form Submission

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

Provides an example of a LiveView `handle_event` function that processes a form submission. It includes validation logic and toggles the `@trigger_submit` assign to control form submission behavior.

```elixir
def handle_event("save", params, socket) do
  case validate_change_password(socket.assigns.user, params) do
    {:ok, changeset} ->
      {:noreply, assign(socket, changeset: changeset, trigger_submit: true)}

    {:error, changeset} ->
      {:noreply, assign(socket, changeset: changeset)}
  end
end

```

--------------------------------

### LiveView Client-Side `phx-change` Event Payload

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

This example demonstrates the payload structure received by the server's `handle_event/3` function when a `phx-change` event is triggered by an input. The `_target` parameter indicates the path to the input within the form parameters.

```html
<input name="user[username]"/>
```

--------------------------------

### LiveView Mount and Pagination Logic

Source: https://hexdocs.pm/phoenix_live_view/bindings

Handles the initial mounting of the LiveView, assigning pagination state, and fetching posts. The `paginate_posts` function determines the direction of scrolling (next or previous page) and prepares the data for streaming, including setting stream `at` and `limit` for virtualization and tracking the `end_of_timeline?` state.

```elixir
def mount(_, _, socket) do
  {:ok,
    socket
    |> assign(page: 1, per_page: 20)
    |> paginate_posts(1)}
end

defp paginate_posts(socket, new_page) when new_page >= 1 do
  %{per_page: per_page, page: cur_page} = socket.assigns
  posts = Blog.list_posts(offset: (new_page - 1) * per_page, limit: per_page)

  {posts, at, limit} =
    if new_page >= cur_page do
      {posts, -1, per_page * 3 * -1}
    else
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
```

--------------------------------

### Raise when using ColocatedHook/ColocatedJS on unsupported Phoenix version

Source: https://hexdocs.pm/phoenix_live_view/changelog

Implements error handling to raise an exception when `ColocatedHook` or `ColocatedJS` are used with an unsupported version of Phoenix. This prevents potential runtime errors and guides users to compatible versions.

```elixir
# No specific code snippet available, this is a backend validation.
```

--------------------------------

### Trigger `phx-submit` Event with JavaScript (JavaScript)

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

This JavaScript example demonstrates how to trigger a `phx-submit` event on a form element. It dispatches a 'submit' event with bubbling and cancelable options enabled, allowing for programmatic form submission.

```javascript
document.getElementById("my-form").dispatchEvent(
  new Event("submit", {bubbles: true, cancelable: true})
)
```

--------------------------------

### Customize JS Push Event with Options

Source: https://hexdocs.pm/phoenix_live_view/bindings

Explains how to customize the `JS.push` command with options like `target` and `loading` to control event routing and apply CSS loading states on the client.

```html
<button phx-click={JS.push("clicked", target: @myself, loading: ".container")}>click</button>
```

--------------------------------

### Elixir: Handle click event in LiveView

Source: https://hexdocs.pm/phoenix_live_view/index

Illustrates the server-side Elixir code for handling the 'inc_temperature' event triggered by a DOM binding. It increments the 'temperature' assign on the socket and returns the updated socket. This is a core part of LiveView's event handling mechanism.

```elixir
def handle_event("inc_temperature", _value, socket) do
  {:noreply, update(socket, :temperature, &(&1 + 1))}
end
```

--------------------------------

### JavaScript: Importing Colocated Hooks in app.js

Source: https://hexdocs.pm/phoenix_live_view/js-interop

This JavaScript snippet shows how to import and integrate colocated hooks into your Phoenix LiveView application's main JavaScript file (`app.js`). It demonstrates importing a manifest of colocated hooks and merging them into the `LiveSocket` configuration. This assumes a Phoenix 1.8+ project setup with `esbuild` handling the compilation.

```javascript
... 
  import {Socket} from "phoenix"
  import {LiveSocket} from "phoenix_live_view"
  import topbar from "../vendor/topbar"
+ import {hooks as colocatedHooks} from "phoenix-colocated/my_app"

  let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
  let liveSocket = new LiveSocket("/live", Socket, {
    longPollFallbackMs: 2500,
    params: {_csrf_token: csrfToken},
+   hooks: {...colocatedHooks}
  })
...
```

--------------------------------

### Render and Interact with LiveView Output

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Functions for rendering LiveView content and simulating user interactions. `render/1` returns the HTML, `render_async/1` awaits async tasks, and various `render_*` functions simulate DOM events like blur, change, click, focus, keydown, and keyup.

```Elixir
render(view_or_element)
render_async(view_or_element, timeout \\ Application.fetch_env!(:ex_unit, :assert_receive_timeout))
render_blur(element, value \\ %{})
render_change(element, value \\ %{})
render_click(element, value \\ %{})
render_focus(element, value \\ %{})
render_keydown(element, value \\ %{})
render_keyup(element, value \\ %{})
```

--------------------------------

### Configure Phoenix LiveView Uploads with Custom Writer

Source: https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView

This example demonstrates how to configure Phoenix LiveView to use a custom upload writer. The `allow_upload/3` function is used with a lambda that returns the custom writer module and its options. This allows for custom handling of uploaded file chunks.

```elixir
socket
|> allow_upload(:avatar, 
  accept: :any,
  writer: fn _name, _entry, _socket -> {EchoWriter, level: :debug} end
)
```

--------------------------------

### Phoenix LiveView CoreComponents Input with Error Filtering

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

An example of an `input` function component in Elixir for Phoenix LiveView's `CoreComponents` that filters error messages. It uses `Phoenix.Component.used_input?/1` to only display errors for fields that have been interacted with.

```elixir
def input(%{field: %Phoenix.HTML.FormField{} = field} = assigns) do
  errors = if Phoenix.Component.used_input?(field), do: field.errors, else: []

  assigns
  |> assign(field: nil, id: assigns.id || field.id)
  |> assign(:errors, Enum.map(errors, &translate_error(&1)))
end
```

--------------------------------

### Live Navigation Options Comparison

Source: https://hexdocs.pm/phoenix_live_view/live-navigation

Summarizes the behavior and use cases for different LiveView navigation methods: HTTP-based redirects, `navigate` operations, and `patch` operations, highlighting their impact on page reloads and LiveView lifecycle.

```text
* <.link href={...}> and `redirect/2` are HTTP-based, work everywhere, and perform full page reloads
* <.link navigate={...}> and `push_navigate/2` work across LiveViews in the same session. They mount a new LiveView while keeping the current layout
* <.link patch={...}> and `push_patch/2` updates the current LiveView and sends only the minimal diff while also maintaining the scroll position
```

--------------------------------

### Animate Element on Mount with JS Command

Source: https://hexdocs.pm/phoenix_live_view/bindings

Shows how to use the `phx-mounted` binding with a JS.transition command to apply animations when an element is initially added to the DOM.

```html
<div phx-mounted={JS.transition("animate-ping", time: 500)}>
</div>
```

--------------------------------

### Updating Page Title in Handle Info

Source: https://hexdocs.pm/phoenix_live_view/live-layouts

Provides an example of how to update the `@page_title` assign within a `handle_info/2` function in a LiveView. This is useful for reflecting changes like new message counts in the browser tab title during live navigation.

```Elixir
def handle_info({:new_messages, count}, socket) do
  {:noreply, assign(socket, page_title: "Latest Posts (#{count} new)")}
end
```

--------------------------------

### LiveView Event Handling for Page Navigation

Source: https://hexdocs.pm/phoenix_live_view/bindings

Handles `"next-page

--------------------------------

### Perform Preflight Upload Request for Testing

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Initiates a preflight upload request, primarily used for testing external uploaders. It helps retrieve `:external` entry metadata, such as the upload reference and chunk size configuration.

```elixir
avatar = file_input(lv, "#my-form-id", :avatar, [%{name: ..., ...}, ...])
assert {:ok, %{ref: _ref, config: %{chunk_size: _}}} = preflight_upload(avatar)
```

--------------------------------

### Raising Specific Exceptions for Unexpected Errors in Elixir

Source: https://hexdocs.pm/phoenix_live_view/error-handling

Illustrates how to use a 'bang' version of a function (e.g., `leave!`) to explicitly raise a specific exception when an unexpected condition occurs. This is a common Elixir pattern for signaling errors that should not happen under normal operation and are intended to be caught or crash the process. The example uses `MyApp.Org.leave!` which is expected to raise an exception if the condition is not met.

```elixir
MyApp.Org.leave!(socket.assigns.current_org, member)
{:noreply, socket}
```

--------------------------------

### LiveView Form Reset Functionality

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

This example illustrates how to reset a LiveView form using a standard HTML button with `type="reset"`. When clicked, it resets form inputs and emits a `phx-change` event. The server can differentiate between a regular change and a reset event by checking the `_target` param.

```html
<form phx-change="changed">
  ...
  <button type="reset" name="reset">Reset</button>
</form>
```

--------------------------------

### Sending Click Event with Custom Values via JS in Phoenix LiveView

Source: https://hexdocs.pm/phoenix_live_view/bindings

This example shows how to trigger a click event using `Phoenix.LiveView.JS.push/3` in Phoenix LiveView, allowing for custom values to be sent to the server. The `value` option within the JS function allows for structured data transmission, which is then processed by the `handle_event` callback on the server.

```elixir
<div phx-click={JS.push("inc", value: %{myvar1: @val1})}>

def handle_event("inc", %{"myvar1" => "val1"}, socket) do
  
end
```

--------------------------------

### Testing LiveView Redirected Mount

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

This code demonstrates how to test a LiveView that results in a redirect upon mounting. It uses `live/1` with a specific path, expecting an error tuple containing a `:redirect` option with the target URL.

```elixir
test "redirected mount", %{conn: conn} do
  assert {:error, {:redirect, %{to: "/somewhere"}}} = live(conn, "my-path")
end
```

--------------------------------

### Show/Hide Modal with JS Commands

Source: https://hexdocs.pm/phoenix_live_view/bindings

Demonstrates using JS.show, JS.hide, and JS.toggle for client-side modal visibility control without server roundtrips. Uses CSS classes for transitions.

```html
<div id="modal" class="modal">
  My Modal
</div>

<button phx-click={JS.show(to: "#modal", transition: "fade-in")}>
  show modal
</button>

<button phx-click={JS.hide(to: "#modal", transition: "fade-out")}>
  hide modal
</button>

<button phx-click={JS.toggle(to: "#modal", in: "fade-in", out: "fade-out")}>
  toggle modal
</button>
```

--------------------------------

### JavaScript: Phoenix LiveView Custom DOM Manipulation Hook

Source: https://hexdocs.pm/phoenix_live_view/js-interop

This JavaScript code defines a custom hook for Phoenix LiveView to manage DOM attribute updates. It iterates through attributes of the 'from' element and copies attributes starting with 'data-js-' to the 'to' element, preventing LiveView from overwriting them during DOM patching. This is useful for maintaining specific JavaScript-controlled attributes.

```javascript
onBeforeElUpdated(from, to) {
  for (const attr of from.attributes) {
    if (attr.name.startsWith("data-js-")) {
      to.setAttribute(attr.name, attr.value);
    }
  }
}
```

--------------------------------

### LiveView Mount Authorization with Phoenix Plugs

Source: https://hexdocs.pm/phoenix_live_view/security-model

Demonstrates how to replicate plug-based authorization within a LiveView's `mount/3` callback to ensure authenticated and confirmed users. It fetches the user from the session and redirects to login if confirmations are missing.

```elixir
def mount(_params, %{"user_id" => user_id} = _session, socket) do
  socket = assign(socket, current_user: Accounts.get_user!(user_id))

  socket =
    if socket.assigns.current_user.confirmed_at do
      socket
    else
      redirect(socket, to: "/login")
    end

  {:ok, socket}
end
```

--------------------------------

### Handle Redirects and Form Submissions

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Functions for handling navigation and form interactions. `follow_redirect/3` handles redirects from render actions, `follow_trigger_action/2` processes `phx-trigger-action`, and `put_submitter/2` specifies the submitter for a form.

```Elixir
follow_redirect(reason, conn, to \\ nil)
follow_trigger_action(form, conn)
put_submitter(form, element_or_selector)
```

--------------------------------

### Set Connect Parameters for LiveView Connections

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Allows setting connection parameters that will be used for LiveView connections. These parameters are accessible within the LiveView via `Phoenix.LiveView.get_connect_params/1`.

```elixir
conn |> put_connect_params(%{"param" => "value"})
```

--------------------------------

### Configure LiveView Uploads

Source: https://hexdocs.pm/phoenix_live_view/uploads

Sets up file upload handling in Phoenix LiveView by assigning an empty list for uploaded files and configuring upload parameters like accepted file types and maximum entries using `allow_upload/3`. This is typically done in the `mount` callback.

```elixir
@impl Phoenix.LiveView
def mount(_params, _session, socket) do
  {:ok,
   socket
   |> assign(:uploaded_files, [])
   |> allow_upload(:avatar, accept: ~w(.jpg .jpeg), max_entries: 2)}
end
```

--------------------------------

### Configure LiveView for External Uploads (Elixir)

Source: https://hexdocs.pm/phoenix_live_view/external-uploads

Demonstrates how to configure a Phoenix LiveView's `mount/3` function to allow external uploads. It assigns an initial state and sets up the `allow_upload/3` callback with an external presign function.

```elixir
def mount(_params, _session, socket) do
  {:ok,
   socket
   |> assign(:uploaded_files, [])
   |> allow_upload(:avatar, accept: :any, max_entries: 3, external: &presign_upload/2)}
end

```

--------------------------------

### LiveView JS Commands for Optimistic UI Updates (Targeting Specific Elements)

Source: https://hexdocs.pm/phoenix_live_view/syncing-changes

This LiveView template snippet demonstrates using JavaScript commands to manage optimistic UI updates. The `JS.push` command triggers a server event while specifying a `loading` target (`#post-row-13`), allowing a specific element (not just the clicked button) to visually indicate a loading state, such as fading out.

```html
<button phx-click={JS.push("delete", loading: "#post-row-13")}>Delete</button>
```

--------------------------------

### Client-side Live Navigation with Link Component

Source: https://hexdocs.pm/phoenix_live_view/live-navigation

Demonstrates how to use the `Phoenix.Component.link/1` component with `patch` or `navigate` attributes to trigger live navigation from the client. This updates the page without a full reload, enhancing user experience.

```html
<.link patch={~p"/pages/#{@page + 1}"}>Next</.link>
```

--------------------------------

### Follow Trigger Actions in LiveView Forms

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

The `follow_trigger_action/2` macro is used to follow up on HTTP form submissions that set `phx-trigger-action` to true. It takes a form element and the connection, asserting the subsequent request details like method and parameters.

```elixir
form = form(live_view, selector, %{"form" => "data"})

# First we submit the form. Optionally verify that phx-trigger-action
# is now part of the form.
assert render_submit(form) =~ ~r/phx-trigger-action/

# Now follow the request made by the form
conn = follow_trigger_action(form, conn)
assert conn.method == "POST"
assert conn.params == %{"form" => "data"}
```

--------------------------------

### Submit LiveView Form to Plug Pipeline

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Demonstrates how to submit a LiveView form to the plug pipeline using the `submit_form/2` macro. This is useful when form submissions need to interact with the plug session or controller. It takes a form element and a connection, returning the modified connection.

```elixir
form = form(live_view, selector, %{"form" => "data"})

# Now submit the LiveView form to the plug pipeline
conn = submit_form(form, conn)
assert conn.method == "POST"
assert conn.params == %{"form" => "data"}
```

--------------------------------

### Default `on_mount` Hook for All LiveViews

Source: https://hexdocs.pm/phoenix_live_view/security-model

Shows how to set a default `on_mount` hook (`MyAppWeb.UserLiveAuth`) in the `live_view` macro within `MyAppWeb`. This applies the authentication logic to all LiveViews generated by this macro.

```elixir
def live_view do
  quote do
    use Phoenix.LiveView

    on_mount MyAppWeb.UserLiveAuth
    unquote(html_helpers())
  end
end
```

--------------------------------

### Simulate LiveView Navigation and Assert HTML

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a LiveView navigation and asserts the presence of specific text within the rendered HTML. Useful for basic page load verification.

```elixir
```elixir
{:ok, view, html} = live(conn, "/thermo")
assert html =~ "The temp is: 30℉"
assert render_change(view, :validate, %{deg: 123}) =~ "123 exceeds limits"
```
```

--------------------------------

### Preflight Upload Request

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Initiates a preflight upload request for testing purposes. This function is typically used before a full upload to check server capabilities or metadata.

```Elixir
preflight_upload(upload)
```

--------------------------------

### Compose JS Commands: Push Event and Remove Class

Source: https://hexdocs.pm/phoenix_live_view/bindings

Illustrates composing multiple JS commands using the pipe operator (|>) to first push an event to the server and then remove a class from an element on the client.

```html
<div id="modal" class="modal">
  My Modal
</div>

<button phx-click={JS.push("modal-closed") |> JS.remove_class("show", to: "#modal", transition: "fade-out")}>
  hide modal
</button>
```

--------------------------------

### Using Elixir block constructs in HEEx templates

Source: https://hexdocs.pm/phoenix_live_view/assigns-eex

Shows how Elixir's built-in block constructs like `for` and `if` can be used within HEEx templates, and how variables introduced by these constructs are correctly handled by LiveView's change tracking.

```heex
<%= for post <- @posts do %>
  ...
<% end %>
```

--------------------------------

### Configuring LiveSocket Metadata for Click Events in JavaScript

Source: https://hexdocs.pm/phoenix_live_view/bindings

This JavaScript code configures a `LiveSocket` instance to send additional metadata with click events. The `metadata.click` function captures event details like `altKey`, `clientX`, and `clientY`, which are then sent to the server along with regular event payloads, providing richer context for server-side event handling.

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

### Fix LiveViewTest submit_form and follow_trigger_action crashing with keyword lists

Source: https://hexdocs.pm/phoenix_live_view/changelog

Addresses a regression in v1.1.9 where `Phoenix.LiveViewTest.submit_form/2` and `Phoenix.LiveViewTest.follow_trigger_action/2` would crash when using keyword lists without proper handling of atom keys. This fix ensures these testing utilities are more robust.

```elixir
iex> Phoenix.LiveViewTest.submit_form(page, "form", [\"email\" : \"test@example.com\"]) # Works now
```

--------------------------------

### Test LiveComponent Rendering in Elixir

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Provides two methods for testing LiveComponents. The first uses `render_component/2` for standalone mounting and rendering without event interaction. The second method involves mounting the LiveView containing the component and then scoping events to test interactions.

```elixir
assert render_component(MyComponent, id: 123, user: %User{}) =~ "some markup in component"

{:ok, view, html} = live(conn, "/users")
html = view |> element("#user-13 a", "Delete") |> render_click()
refute html =~ "user-13"
refute view |> element("#user-13") |> has_element?()
```

--------------------------------

### Render Stateful Component with ID and Asserts

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Renders a stateful component by its module, providing necessary arguments like ID and assigns, then asserts the rendered markup. This tests the mounting, updating, and rendering lifecycle of stateful components.

```elixir
```elixir
assert render_component(MyComponent, id: 123, user: %User{}) =~
         "some markup in component"
```
```

--------------------------------

### Simulate and Assert LiveView Patch

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Functions to simulate a `push_patch` and assert that a LiveView patch occurs within a specified timeout. `assert_patch` and `assert_patched` verify patch events, returning the new path. They can optionally take a target path for more specific assertions.

```elixir
render_patch(view, path)
assert_patch view
assert_patch view, 30
path = assert_patch view
assert path =~ ~r/path/+ 
assert_patch view, "/path"
assert_patch view, "/path", 30
assert_patched view, "/path"
```

--------------------------------

### Allow assign_async to return a keyword list

Source: https://hexdocs.pm/phoenix_live_view/changelog

Enhances `assign_async` to accept and return a keyword list. This provides more flexibility in how asynchronous assigns are managed and updated within LiveView, simplifying data handling.

```elixir
iex> assign_async(socket, :my_data, fn -> {:ok, [name: "Alice", age: 30]} end)
  # Now accepts keyword list
```

--------------------------------

### Directly Specifying `on_mount` Hook in LiveView

Source: https://hexdocs.pm/phoenix_live_view/security-model

Demonstrates how to directly specify the `on_mount` hook (`MyAppWeb.UserLiveAuth`) within a specific LiveView module, ensuring that the authentication logic runs for that particular LiveView.

```elixir
defmodule MyAppWeb.PageLive do
  use MyAppWeb, :live_view
  on_mount MyAppWeb.UserLiveAuth

  ...
end
```

--------------------------------

### HEEx Comprehension with :for Attribute (Elixir)

Source: https://hexdocs.pm/phoenix_live_view/assigns-eex

Demonstrates an alternative syntax for HEEx comprehensions in Elixir using the special ':for' attribute. This provides a more concise way to iterate over collections directly within the template.

```elixir
<section :for={post <- @posts}>
  <h1>{expand_title(post.title)}</h1>
</section>
```

--------------------------------

### Live Redirect

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Performs a live redirect from one LiveView to another with specified options.

```Elixir
live_redirect(view, opts)
```

--------------------------------

### Render Component with Router Option

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Renders a component, passing a router option, and asserts the resulting markup. This is useful when components rely on routing information.

```elixir
```elixir
assert render_component(MyComponent, %{id: 123, user: %User{}}, router: SomeRouter) =~
         "some markup in component"
```
```

--------------------------------

### Optimized HEEx Comprehension with :key (Elixir)

Source: https://hexdocs.pm/phoenix_live_view/assigns-eex

Shows how to optimize HEEx comprehensions in Elixir by using the ':key' attribute with a unique identifier (e.g., 'post.id'). This allows LiveView to efficiently track changes within the collection, leading to more targeted re-renders.

```elixir
<section :for={post <- @posts} :key={post.id}>
  <h1>{expand_title(post.title)}</h1>
</section>
```

--------------------------------

### Listen to LiveView Page Loading Events with JavaScript

Source: https://hexdocs.pm/phoenix_live_view/syncing-changes

This snippet demonstrates how to listen for 'phx:page-loading-start' and 'phx:page-loading-stop' events on the window object using JavaScript. These events are dispatched by Phoenix LiveView during navigation actions like redirects, patches, and form submissions. The code uses the 'topbar' library to visually indicate page loading status.

```javascript
import topbar from "topbar"
window.addEventListener("phx:page-loading-start", info => topbar.delayedShow(500))
window.addEventListener("phx:page-loading-stop", info => topbar.hide())
```

--------------------------------

### Add metadata to phx:page-loading-start event

Source: https://hexdocs.pm/phoenix_live_view/changelog

Adds more metadata to the `phx:page-loading-start` event, particularly in error scenarios. This enhancement provides developers with richer information when page loading fails, aiding in debugging and error handling.

```javascript
liveSocket.addEventListener("phx:page-loading-start", (event) => {
  console.log("Page loading started with metadata:", event.detail);
});
```

--------------------------------

### Simulate File Uploads in LiveView Forms

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

The `file_input/4` macro constructs a file input suitable for testing file uploads within a form. It takes the LiveView, a form selector, the upload name, and a list of file metadata. The output can be used with `render_upload/2`.

```elixir
avatar = file_input(lv, "#my-form-id", :avatar, [%{
  last_modified: 1_594_171_879_000,
  name: "myfile.jpeg",
  content: File.read!("myfile.jpg"),
  size: 1_396_009,
  type: "image/jpeg"
}])

assert render_upload(avatar, "myfile.jpeg") =~ "100%"
```

--------------------------------

### Render Components and Hooks

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Functions for rendering components and triggering hook events. `render_component/3` renders a given component with specified assigns, while `render_hook/3` sends an event to a LiveView or element's hook.

```Elixir
render_component(component, assigns \\ Macro.escape(%{}), opts \\ [])
render_hook(view_or_element, event, value \\ %{})
```

--------------------------------

### Page Title and Browser Interaction

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Utilities for managing the page title and interacting with the browser. `page_title/1` retrieves the current page title, and `open_browser/2` opens the default browser to display the rendered HTML.

```Elixir
page_title(view)
open_browser(view_or_element, open_fun \\ &open_with_system_cmd/1)
```

--------------------------------

### Create Form Elements for LiveView Testing

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

The `form/3` function returns a form element to scope further testing functions. It expects the current LiveView, a CSS selector for the form, and optional form data. The form data is validated against the form markup.

```elixir
form(view, selector, %{"field" => "value"})
```

--------------------------------

### Spawn Isolated LiveView for Component Testing

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Spawns a LiveView process in isolation, rendering it as the sole element. Ideal for testing LiveView components that are not directly routable. Supports session and error handling options, forwarding other options to `live_render/3`.

```elixir
{:ok, view, html} =
  live_isolated(conn, MyAppWeb.ClockLive, session: %{"tz" => "EST"})

# Example with put_connect_params
{:ok, view, html} =
  conn
  |> put_connect_params(%{"param" => "value"})
  |> live_isolated(AppWeb.ClockLive, session: %{"tz" => "EST"})
```

--------------------------------

### LiveView Template for Infinite Scrolling List

Source: https://hexdocs.pm/phoenix_live_view/bindings

Renders an unordered list (`<ul>`) that supports infinite scrolling using `phx-update="stream"`. It utilizes `phx-viewport-top` and `phx-viewport-bottom` bindings to trigger events for loading previous or next pages. Conditional CSS classes are applied to ensure smooth scrolling behavior.

```html+elixir
<ul
  id="posts"
  phx-update="stream"
  phx-viewport-top={@page > 1 && JS.push("prev-page", page_loading: true)}
  phx-viewport-bottom={!@end_of_timeline? && JS.push("next-page", page_loading: true)}
  class={[
    if(@end_of_timeline?, do: "pb-10", else: "pb-[calc(200vh)]"),
    if(@page == 1, do: "pt-10", else: "pt-[calc(200vh)]")
  ]}
>
  <li :for={{id, post} <- @streams.posts} id={id}>
    <.post_card post={post} />
  </li>
</ul>
<div :if={@end_of_timeline?} class="mt-5 text-[50px] text-center">
  🎉 You made it to the beginning of time 🎉
</div>
```

--------------------------------

### Test File Uploads

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Helper function for testing file uploads within a form. `file_input/4` constructs the necessary input element for simulating file uploads in tests.

```Elixir
file_input(view, form_selector, name, entries)
```

--------------------------------

### Using function components in LiveView

Source: https://hexdocs.pm/phoenix_live_view/assigns-eex

Demonstrates how to use and define function components in LiveView, passing assigns as attributes and accessing them within the component's template.

```heex
<.show_name name={@user.name} />
```

```elixir
attr :x, :integer, required: true
attr :y, :integer, required: true
attr :title, :string, required: true
def sum_component(assigns) do
  assigns = assign(assigns, sum: assigns.x + assigns.y)

  ~H"""
  <h1>{@title}</h1>

  {@sum}
  """
end
```

--------------------------------

### Handle Specific Key Presses with LiveView Event Bindings

Source: https://hexdocs.pm/phoenix_live_view/bindings

Demonstrates how to handle specific key presses like 'ArrowUp' and 'ArrowDown' within a LiveView component using phx-window-keyup. It shows how to extract the pressed key from the event payload and conditionally update the socket assigns. Fallback handlers are recommended for robustness.

```elixir
def render(assigns) do
  ~H"""
  <div id="thermostat" phx-window-keyup="update_temp">
    Current temperature: {@temperature}
  </div>
  """
end

def handle_event("update_temp", %{"key" => "ArrowUp"}, socket) do
  {:ok, new_temp} = Thermostat.inc_temperature(socket.assigns.id)
  {:noreply, assign(socket, :temperature, new_temp)}
end

def handle_event("update_temp", %{"key" => "ArrowDown"}, socket) do
  {:ok, new_temp} = Thermostat.dec_temperature(socket.assigns.id)
  {:noreply, assign(socket, :temperature, new_temp)}
end

def handle_event("update_temp", _, socket) do
  {:noreply, socket}
end
```

--------------------------------

### LiveView Comprehension Change Tracking with :key

Source: https://hexdocs.pm/phoenix_live_view/changelog

Demonstrates how to use the new :key attribute in comprehensions for efficient change tracking in lists. This improves performance by only sending changes for updated or moved items, rather than re-rendering the entire list.

```heex
<ul>
  <li :for={item <- @items} :key={item.id}>{item.name}</li>
</ul>
```

--------------------------------

### Upgrade Phoenix LiveView using Mix

Source: https://hexdocs.pm/phoenix_live_view/changelog

Commands to upgrade Phoenix LiveView using the `igniter` Mix task. These commands help automate the process of updating dependencies and applying necessary changes when migrating to a new version.

```shell
mix igniter.upgrade phoenix_live_view

mix igniter.apply_upgrades phoenix_live_view:1.0.0:1.1.0
```

--------------------------------

### Apply on_mount Hook to All LiveViews in Phoenix

Source: https://hexdocs.pm/phoenix_live_view/gettext

Configures the `live_view` macro in Phoenix to automatically apply the `MyAppWeb.RestoreLocale` hook on every LiveView, ensuring locale consistency across the application.

```elixir
def live_view do
  quote do
    use Phoenix.LiveView

    on_mount MyAppWeb.RestoreLocale
    unquote(view_helpers())
  end
end
```

--------------------------------

### Handle Click Event on Server with Phoenix LiveView

Source: https://hexdocs.pm/phoenix_live_view/bindings

This snippet demonstrates how to handle a click event triggered by a `phx-click` binding on the client-side. The server-side `handle_event` callback receives the event name and socket, processes a temperature increment, and updates the socket assigns. It assumes a `Thermostat` module for business logic.

```elixir
<button phx-click="inc_temperature">+</button>

def handle_event("inc_temperature", _value, socket) do
  {:ok, new_temp} = Thermostat.inc_temperature(socket.assigns.id)
  {:noreply, assign(socket, :temperature, new_temp)}
end
```

--------------------------------

### LiveView JS Command: Push Event to Server

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Pushes an event to the server using the `push` command. Options include `target` for LiveComponents, `loading`, `page_loading`, and `value`. This function is part of the JavaScript command interface provided by LiveView.

```javascript
this.js().push(el, type, opts = {})
```

--------------------------------

### Client-side UpChunk Integration (JavaScript)

Source: https://hexdocs.pm/phoenix_live_view/external-uploads

Shows how to set up the UpChunk JavaScript library on the client-side to handle file uploads initiated by LiveView. It includes event listeners for progress, errors, and success, and integrates with LiveView's upload entry callbacks.

```javascript
import * as UpChunk from "@mux/upchunk"

let Uploaders = {}

Uploaders.UpChunk = function(entries, onViewError){
  entries.forEach(entry => {
    // create the upload session with UpChunk
    let { file, meta: { entrypoint } } = entry
    let upload = UpChunk.createUpload({ endpoint: entrypoint, file })

    // stop uploading in the event of a view error
    onViewError(() => upload.pause())

    // upload error triggers LiveView error
    upload.on("error", (e) => entry.error(e.detail.message))

    // notify progress events to LiveView
    upload.on("progress", (e) => {
      if(e.detail < 100){ entry.progress(e.detail) }
    })

    // success completes the UploadEntry
    upload.on("success", () => entry.progress(100))
  })
}

// Don't forget to assign Uploaders to the liveSocket
let liveSocket = new LiveSocket("/live", Socket, {
  uploaders: Uploaders,
  params: {_csrf_token: csrfToken}
})

```

--------------------------------

### Capture Key Event Metadata with LiveSocket

Source: https://hexdocs.pm/phoenix_live_view/bindings

Illustrates how to configure LiveSocket to capture additional metadata from keydown events. The 'metadata' option in the LiveSocket constructor accepts a function that receives the event and element, returning custom data to be sent to the server.

```javascript
let liveSocket = new LiveSocket("/live", Socket, {
  params: {_csrf_token: csrfToken},
  metadata: {
    keydown: (e, el) => {
      return {
        key: e.key,
        metaKey: e.metaKey,
        repeat: e.repeat
      }
    }
  }
})
```

--------------------------------

### Server-side Live Navigation with push_patch

Source: https://hexdocs.pm/phoenix_live_view/live-navigation

Illustrates triggering live navigation from the server using `Phoenix.LiveView.push_patch/2`. This function updates the current LiveView's URL and parameters without dismounting and remounting the view.

```elixir
{:noreply, push_patch(socket, to: ~p"/pages/#{@page + 1}")}
```

--------------------------------

### Simulate Keyup Event with LiveView Render

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a keyup event on a specific element within a LiveView and returns the rendered result. This is useful for testing components that react to key release events. It requires the LiveView connection, the event name, and optional values.

```elixir
assert render_keyup(view, :inc) =~ "The temp is: 31℉"
```

--------------------------------

### LiveView JS Commands for Adding Classes to Elements

Source: https://hexdocs.pm/phoenix_live_view/syncing-changes

This snippet illustrates using LiveView's JavaScript commands to dynamically add a CSS class to an element. After triggering a server event with `JS.push`, the `JS.add_class("opacity-50")` command applies the specified class to the element, enabling visual state changes like fading.

```html
<button phx-click={JS.push("delete") |> JS.add_class("opacity-50")}>Delete</button>
```

--------------------------------

### Simulate Keydown Event on Element and Assert Rendered HTML

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a keydown event on an element with a `phx-keydown` or `phx-window-keydown` attribute and asserts the rendered HTML. This is for testing keyboard event handling in LiveViews.

```elixir
```elixir
{:ok, view, html} = live(conn, "/thermo")
assert html =~ "The temp is: 30℉"
assert render_keydown(view, :validate, %{deg: 123}) =~ "123 exceeds limits"
```
```

--------------------------------

### Configuring LiveSocket with DOM onBeforeElUpdated Callback in JavaScript

Source: https://hexdocs.pm/phoenix_live_view/js-interop

This JavaScript snippet demonstrates how to configure a `LiveSocket` instance with a `dom.onBeforeElUpdated` callback. This callback is executed just before LiveView patches DOM operations, allowing integration with client-side libraries that need to reinitialize or copy attributes from DOM elements. The callback receives `fromEl` and `toEl` as arguments.

```javascript
let liveSocket = new LiveSocket("/live", Socket, {
  params: {_csrf_token: csrfToken},
  hooks: Hooks,
  dom: {
    onBeforeElUpdated(fromEl, toEl) {
      // Custom logic to reinitialize or copy attributes
    }
  }
})
...
```

--------------------------------

### Simulate File Upload with LiveView Render

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Performs a file upload simulation within a LiveView and returns the rendered result. This function is crucial for testing file input components and ensuring correct upload handling. It supports testing partial uploads by specifying a percentage.

```elixir
avatar = file_input(lv, "#my-form-id", :avatar, [
  %{last_modified: 1594171879000, name: "myfile.jpeg", content: File.read!("myfile.jpg"), size: 1396009, type: "image/jpeg"}
])

assert render_upload(avatar, "myfile.jpeg") =~ "100%"
```

```elixir
assert render_upload(avatar, "myfile.jpeg", 49) =~ "49%"
assert render_upload(avatar, "myfile.jpeg", 51) =~ "100%"
```

--------------------------------

### Configuring `on_mount` Hook in Phoenix Router

Source: https://hexdocs.pm/phoenix_live_view/security-model

Illustrates how to register the custom `on_mount` hook (`MyAppWeb.UserLiveAuth`) within the `live_session` configuration in a Phoenix router, applying it to all routes defined within that session.

```elixir
live_session :default, on_mount: MyAppWeb.UserLiveAuth do
  # Your routes
end
```

--------------------------------

### Simulate and Assert LiveView Redirect

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Functions to simulate events that trigger redirects and assert that a LiveView redirect occurs within a specified timeout. `assert_redirect` and `assert_redirected` verify redirect events, returning flash messages and optionally checking the target path. The timeout can be customized.

```elixir
render_click(view, :event_that_triggers_redirect)
{path, flash} = assert_redirect view
assert flash["info"] == "Welcome"
assert path =~ ~r/path\/\d+/

render_click(view, :event_that_triggers_redirect)
assert_redirect view, 30

render_click(view, :event_that_triggers_redirect)
flash = assert_redirected view, "/path"
assert flash["info"] == "Welcome"
```

--------------------------------

### Simulate Browser Events in LiveView Tests

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Functions to simulate browser events like click, focus, blur, submit, change, keydown, and keyup on LiveView elements. These functions return the rendered output after the `handle_event/3` callback is executed. They can optionally take a DOM selector or directly trigger events by LiveView process.

```elixir
assert view
       |> element("button#inc")
       |> render_click() =~ "The temperature is: 31℉"
assert render_click(view, :inc, %{}) =~ "The temperature is: 31℉"
```

--------------------------------

### LiveView `on_mount` Hook for Authentication

Source: https://hexdocs.pm/phoenix_live_view/security-model

Shows how to create a reusable `on_mount` hook in Elixir for LiveView authentication. This hook fetches the user based on a session token and halts or continues the mount process based on user confirmation.

```elixir
defmodule MyAppWeb.UserLiveAuth do
  import Phoenix.Component
  import Phoenix.LiveView
  alias MyAppWeb.Accounts # from `mix phx.gen.auth`

  def on_mount(:default, _params, %{"user_token" => user_token} = _session, socket) do
    socket =
      assign_new(socket, :current_user, fn ->
        Accounts.get_user_by_session_token(user_token)
      end)

    if socket.assigns.current_user.confirmed_at do
      {:cont, socket}
    else
      {:halt, redirect(socket, to: "/login")}
    end
  end
end
```

--------------------------------

### Basic LiveSession Scopes in Phoenix Router

Source: https://hexdocs.pm/phoenix_live_view/security-model

This code snippet illustrates the basic usage of `live_session` in the Phoenix router to group LiveViews. It shows how to define different scopes (`:default` and `:admin`) and associate them with different authentication plug pipelines (`:authenticate_user` and `:http_auth_admin`). Navigation within a `live_session` skips regular HTTP requests.

```elixir
scope "/" do
  pipe_through [:authenticate_user]
  get "/", PageController

  live_session :default do
    live "/", PageLive
  end
end

scope "/admin" do
  pipe_through [:http_auth_admin]
  get "/admin/dashboard", AdminController

  live_session :admin do
    live "/admin", AdminLive
  end
end
```

--------------------------------

### Display Upload Entries and Progress

Source: https://hexdocs.pm/phoenix_live_view/uploads

Iterates over upload entries, displaying file information, progress bars, and cancel buttons. It utilizes `phx-drop-target` for drag-and-drop functionality and includes error handling for individual entries and overall uploads using `upload_errors/2` and `upload_errors/1`.

```html
<%!-- lib/my_app_web/live/upload_live.html.heex --%> 

<%!-- use phx-drop-target with the upload ref to enable file drag and drop --%> 
<section phx-drop-target={@uploads.avatar.ref}> 
  <%!-- render each avatar entry --%> 
  <article :for={entry <- @uploads.avatar.entries} class="upload-entry">
    <figure>
      <.live_img_preview entry={entry} />
      <figcaption>{entry.client_name}</figcaption>
    </figure>

    <%!-- entry.progress will update automatically for in-flight entries --%> 
    <progress value={entry.progress} max="100"> {entry.progress}% </progress>

    <%!-- a regular click event whose handler will invoke Phoenix.LiveView.cancel_upload/3 --%> 
    <button type="button" phx-click="cancel-upload" phx-value-ref={entry.ref} aria-label="cancel">&times;</button>

    <%!-- Phoenix.Component.upload_errors/2 returns a list of error atoms --%> 
    <p :for={err <- upload_errors(@uploads.avatar, entry)} class="alert alert-danger">{error_to_string(err)}</p>
  </article>

  <%!-- Phoenix.Component.upload_errors/1 returns a list of error atoms --%> 
  <p :for={err <- upload_errors(@uploads.avatar)} class="alert alert-danger">
    {error_to_string(err)}
  </p>
</section>
```

--------------------------------

### Follow Redirects in LiveView Tests

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

The `follow_redirect/3` macro handles redirects triggered by LiveView actions or error tuples. It takes the result of a LiveView action and the connection, optionally asserting the target URL. It returns the updated LiveView or connection based on the redirect type.

```elixir
live_view
|> render_click("redirect")
|> follow_redirect(conn)
```

```elixir
assert {:error, {:redirect, %{to: "/somewhere"}}} = result = live(conn, "my-path")
{:ok, view, html} = follow_redirect(result, conn)
```

```elixir
live_view
|> render_click("redirect")
|> follow_redirect(conn, "/redirected/page")
```

--------------------------------

### Add igniter upgrader for LiveView 1.0 to 1.1

Source: https://hexdocs.pm/phoenix_live_view/changelog

Introduces an `igniter` upgrader to facilitate the migration from LiveView 1.0 to 1.1. This tool simplifies the upgrade process by automating necessary code changes.

```bash
mix igniter.upgrade phoenix_live_view@1.1.0-rc.3
# Note: requires a subsequent mix igniter.apply_upgrades phoenix_live_view:1.0.0:1.1.0
```

--------------------------------

### Assigning values to socket in LiveView

Source: https://hexdocs.pm/phoenix_live_view/assigns-eex

Demonstrates how to store and update values in the LiveView socket's assigns using the `assign/2` function. This is crucial for managing state that will be rendered in HEEx templates.

```elixir
assign(socket, :users, Repo.all(User))
```

```elixir
assign(assigns, sum: assigns.x + assigns.y)
```

--------------------------------

### Manage LiveView Elements and Forms

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Provides functions to select and interact with elements and forms within a LiveView. `element/3` scopes subsequent actions, while `form/3` returns a form element for form-specific operations.

```Elixir
element(view, selector, text_filter \\ nil)
form(view, selector, form_data \\ %{})
```

--------------------------------

### LiveView JS Command: Show Element

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Shows an HTML element using the `show` command. Options include `display`, `transition`, `time`, and `blocking`. This function is part of the JavaScript command interface provided by LiveView.

```javascript
this.js().show(el, opts = {})
```

--------------------------------

### Testing Function Components with ~H Sigil and rendered_to_string/1

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

This method tests Elixir function components by directly using the `~H` sigil within `rendered_to_string/1`. It allows testing components as they would be rendered in a template, converting the output to a string for assertion. This is often simpler for complex components.

```elixir
import Phoenix.Component
import Phoenix.LiveViewTest

test "greets" do
  assigns = %{}
  assert rendered_to_string(~H"""
         <MyComponents.greet name=\"Mary\" />
         """) ==
           "<div>Hello, Mary!</div>"
end
```

--------------------------------

### Push Event with Reply Callback (JavaScript)

Source: https://hexdocs.pm/phoenix_live_view/js-interop

This JavaScript code defines a LiveView hook that listens for click events. When clicked, it pushes a 'get_message' event to the LiveView server and includes a callback function to handle the reply, logging the received message to the console. It assumes the LiveView has a corresponding `handle_event` function that responds with `:reply`.

```javascript
Hooks.ClickMeHook = {
  mounted() {
    this.el.addEventListener("click", () => {
      // Push event to LiveView with callback for reply
      this.pushEvent("get_message", {}, (reply) => {
        console.debug(reply.message);
      });
    });
  }
}
```

--------------------------------

### Add change tracking in comprehensions by default

Source: https://hexdocs.pm/phoenix_live_view/changelog

Enables change tracking in comprehensions by default. The `:key` attribute no longer uses LiveComponents, allowing it to be used on components and improving payload sizes. This enhances performance and flexibility.

```elixir
<.my_component :for={item <- @items} id={item.id} key={item.id} />
# Change tracking is now enabled by default for comprehensions
```

--------------------------------

### Fetching Associated Data with Ecto and Handling No Results in Elixir

Source: https://hexdocs.pm/phoenix_live_view/error-handling

Demonstrates how to query associated data using Ecto in Elixir and handle cases where no results are found. The `Repo.get!` function is used, which raises an `Ecto.NoResultsError` if the record is not found. This is typical for validating user access or retrieving specific records where their existence is expected.

```elixir
organizations_query = Ecto.assoc(socket.assigns.current_user, :organizations)
Repo.get!(organizations_query, params["org_id"])
```

--------------------------------

### Testing Function Components with render_component/3

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

This snippet demonstrates how to test Elixir function components using the `render_component/3` function from `Phoenix.LiveViewTest`. It takes a function reference and assigns, returning the rendered HTML. This is useful for isolated component testing.

```elixir
import Phoenix.LiveViewTest

test "greets" do
  assert render_component(&MyComponents.greet/1, name: "Mary") ==
           "<div>Hello, Mary!</div>"
end
```

--------------------------------

### Phoenix LiveView Form Structure with phx-change and phx-submit

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

This snippet demonstrates the basic structure of a Phoenix LiveView form, utilizing `phx-change` for real-time validation and `phx-submit` for form submission. It shows how to bind these events to a form component.

```html
<.form for={@form} phx-change="validate" phx-submit="save">
  <.input type="text" field={@form[:username]} />
  <.input type="email" field={@form[:email]} />
  <button>Save</button>
</.form>
```

--------------------------------

### Passing All Assigns to Child Components (Elixir)

Source: https://hexdocs.pm/phoenix_live_view/assigns-eex

Demonstrates how to pass all 'assigns' from a parent component to child components using regular function call syntax in Elixir. This method ensures change tracking information is passed correctly, re-rendering only necessary parts. However, it's generally recommended to avoid passing all assigns and let LiveView manage change tracking.

```elixir
def card(assigns) do
  ~H"""
  <div class="card">
    {card_header(assigns)}
    {card_body(assigns)}
    {card_footer(assigns)}
  </div>
  """
end
```

--------------------------------

### Using Live Title Component for Page Title

Source: https://hexdocs.pm/phoenix_live_view/live-layouts

Demonstrates the usage of the `Phoenix.Component.live_title/1` component to manage the page title. This component supports adding automatic prefixes and suffixes, and handles title updates on subsequent LiveView navigation.

```HEEx
<Phoenix.Component.live_title default="Welcome" prefix="MyApp – ">
  {assigns[:page_title]}
</Phoenix.Component.live_title>
```

--------------------------------

### Embedding JS Commands in HTML for LiveView Events (HTML)

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Demonstrates how to embed Phoenix JS commands directly into HTML elements using a `data-*` attribute. This allows for declarative client-side actions that can be triggered by server-pushed events via `LiveSocket.execJS`.

```html
<div id={"item-#{item.id}"} class="item" data-highlight={JS.transition("highlight")}>
  {item.title}
</div>
```

--------------------------------

### Simulate Keyup Event with Element and LiveView Render

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a keyup event targeting a specific DOM element within a LiveView and returns the rendered result. This function allows testing of elements with `phx-keyup` or `phx-window-keyup` attributes. It requires the LiveView connection, the element selector, and optional values.

```elixir
assert view |> element("#inc") |> render_keyup() =~ "The temp is: 31℉"
```

--------------------------------

### Simulate Form Submission

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Functions to simulate form submissions within a LiveView context. `render_submit` can send a form submit event using an element or directly to the view with an event and value. `submit_form` processes the form submission through the plug pipeline.

```elixir
render_submit(element, value \\ %{})
render_submit(view, event, value)
submit_form(form, conn)
```

--------------------------------

### Rendering child templates in LiveView

Source: https://hexdocs.pm/phoenix_live_view/assigns-eex

Illustrates how to render nested HEEx templates within a parent LiveView, passing necessary assigns to the child template.

```heex
{render("child_template.html", assigns)}
```

--------------------------------

### LiveView JS Command to Dispatch Custom Clipboard Copy Event

Source: https://hexdocs.pm/phoenix_live_view/syncing-changes

This LiveView template code uses the `JS.dispatch` command to trigger a custom JavaScript event (`app:clipcopy`) on a specified element (`#printed-output`). This allows for decoupling the UI interaction from the JavaScript logic, enabling features like client-side clipboard copying to be invoked declaratively from the server-rendered template.

```html
<button phx-click={JS.dispatch("app:clipcopy", to: "#printed-output")}>Copy</button>
```

--------------------------------

### Phoenix.LiveView.UploadWriter Behavior

Source: https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView

This section details the Phoenix.LiveView.UploadWriter behavior, which provides a way to handle uploaded file chunks in a custom manner. It outlines the callbacks available for implementing custom upload writers, including `init/1`, `write_chunk/2`, `meta/1`, and `close/2`, along with their expected parameters and return types.

```APIDOC
## Phoenix.LiveView.UploadWriter Behavior

### Description

This behavior allows for custom handling of uploaded file chunks in Phoenix LiveView. Instead of writing directly to disk, you can process chunks as they arrive, for example, by streaming them to another server.

**Note**: Upload writers run within the channel uploader process. Blocking operations will block the channel, and errors can crash the channel process.

### Callbacks

#### `init(opts)`

- **Description**: Initializes the upload writer with provided options.
- **Parameters**:
  - `opts` (term) - Options passed during upload setup.
- **Returns**:
  - `{:ok, state}`: On successful initialization, returns the initial state of the writer.
  - `{:error, term}`: If initialization fails.

#### `write_chunk(data, state)`

- **Description**: Processes a chunk of uploaded data.
- **Parameters**:
  - `data` (binary) - The chunk of data received.
  - `state` (term) - The current state of the writer.
- **Returns**:
  - `{:ok, state}`: If the chunk is processed successfully, returns the updated state.
  - `{:error, reason, state}`: If an error occurs during processing, returns an error reason and the current state.

#### `meta(state)`

- **Description**: Returns metadata about the writer's current state. This metadata is relayed to the LiveView when the upload is consumed.
- **Parameters**:
  - `state` (term) - The current state of the writer.
- **Returns**:
  - `map()` - A map containing metadata about the writer's state.

#### `close(state, reason)`

- **Description**: Called when the upload is complete or has been cancelled.
- **Parameters**:
  - `state` (term) - The final state of the writer.
  - `reason` (:done | :cancel | {:error, term}) - The reason for closing the upload. Possible values include `:done`, `:cancel`, or `{:error, term}` if an error occurred during `write_chunk/2`.
- **Returns**:
  - `{:ok, state}`: On successful closing.
  - `{:error, term}`: If closing fails.

### Example Usage

To use a custom upload writer, pass a function to `allow_upload/3` that returns `{Writer, writer_opts}`:

```elixir
socket
|> allow_upload(:avatar, 
  accept: :any,
  writer: fn _name, _entry, _socket -> {EchoWriter, level: :debug} end
)
```

An example `EchoWriter` implementation:

```elixir
defmodule EchoWriter do
  @behaviour Phoenix.LiveView.UploadWriter

  require Logger

  @impl true
  def init(opts) do
    {:ok, %{total: 0, level: Keyword.fetch!(opts, :level)}}
  end

  @impl true
  def meta(state), do: %{level: state.level}

  @impl true
  def write_chunk(data, state) do
    size = byte_size(data)
    Logger.log(state.level, "received chunk of #{size} bytes")
    {:ok, %{state | total: state.total + size}}
  end

  @impl true
  def close(state, reason) do
    Logger.log(state.level, "closing upload after #{state.total} bytes, #{inspect(reason)}")
    {:ok, state}
  end
end
```
```

--------------------------------

### Phoenix LiveSocket Configuration with S3 Uploaders

Source: https://hexdocs.pm/phoenix_live_view/external-uploads

Integrates the client-side S3 uploaders into the Phoenix LiveView application. This involves importing the Uploaders module and passing it as the `uploaders` option in the LiveSocket constructor in `app.js`.

```javascript
// for uploading to S3
import Uploaders from "./uploaders"

let liveSocket = new LiveSocket("/live",
   Socket, {
     params: {_csrf_token: csrfToken},
     uploaders: Uploaders
  }
)

```

--------------------------------

### Respond to PushEvent with :reply (Elixir)

Source: https://hexdocs.pm/phoenix_live_view/js-interop

This Elixir code defines a `handle_event` function within a LiveView that responds to a 'get_message' event pushed from the client. It uses the `:reply` tuple to send data back to the client's `pushEvent` callback. The payload includes a 'message' key with a greeting string.

```elixir
def handle_event("get_message", _params, socket) do
  # Use :reply to respond to the pushEvent
  {:reply, %{message: "Hello from LiveView!"}, socket}
end
```

--------------------------------

### Perform Live Redirect Between LiveViews

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Executes a live redirect from one LiveView to another. If within the same session, it mounts the new LiveView and shuts down the old one. Cross-session redirects result in an error redirect condition.

```elixir
assert {:ok, page_live, _html} = live(conn, "/page/1")
assert {:ok, page2_live, _html} = live(conn, "/page/2")

assert {:error, {:redirect, _}} = live_redirect(page2_live, to: "/admin")
```

--------------------------------

### Elixir LiveView Mount and Presign Upload for S3

Source: https://hexdocs.pm/phoenix_live_view/external-uploads

Configures the LiveView mount function to allow external uploads and defines a private function to generate pre-signed S3 upload URLs. This function uses the SimpleS3Upload library to create signed URLs with specified metadata, content type, and expiration.

```elixir
def mount(_params, _session, socket) do
  {:ok,
    socket
    |> assign(:uploaded_files, [])
    |> allow_upload(:avatar, accept: :any, max_entries: 3, external: &presign_upload/2)}
end

defp presign_upload(entry, socket) do
  uploads = socket.assigns.uploads
  bucket = "phx-upload-example"
  key = "public/#{entry.client_name}"

  config = %{
    region: "us-east-1",
    access_key_id: System.fetch_env!("AWS_ACCESS_KEY_ID"),
    secret_access_key: System.fetch_env!("AWS_SECRET_ACCESS_KEY")
  }

  {:ok, fields} =
    SimpleS3Upload.sign_form_upload(config, bucket,
      key: key,
      content_type: entry.client_type,
      max_file_size: uploads[entry.upload_config].max_file_size,
      expires_in: :timer.hours(1)
    )

  meta = %{uploader: "S3", key: key, url: "http://#{bucket}.s3-#{config.region}.amazonaws.com", fields: fields}
  {:ok, meta, socket}
end
```

--------------------------------

### Enable Debugging for LiveView Client Events

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Activates debug logging for the LiveView client, providing insights into lifecycle and payload events exchanged between the client and server. The `LiveSocket` instance is exposed on the `window` object to allow easy access and control via the browser's developer console. Debugging state persists for the browser session.

```javascript
// app.js
let liveSocket = new LiveSocket(...)
liveSocket.connect()
window.liveSocket = liveSocket

// in the browser's web console
>> liveSocket.enableDebug()
```

--------------------------------

### Implement Custom Phoenix LiveView Upload Writer

Source: https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView

This snippet shows a custom implementation of the Phoenix.LiveView.UploadWriter behaviour. The EchoWriter logs received chunk sizes and tracks the total bytes uploaded. It demonstrates the use of init/1, write_chunk/2, and close/2 callbacks for custom upload handling.

```elixir
defmodule EchoWriter do
  @behaviour Phoenix.LiveView.UploadWriter

  require Logger

  @impl true
  def init(opts) do
    {:ok, %{total: 0, level: Keyword.fetch!(opts, :level)}}
  end

  @impl true
  def meta(state), do: %{level: state.level}

  @impl true
  def write_chunk(data, state) do
    size = byte_size(data)
    Logger.log(state.level, "received chunk of #{size} bytes")
    {:ok, %{state | total: state.total + size}}
  end

  @impl true
  def close(state, reason) do
    Logger.log(state.level, "closing upload after #{state.total} bytes, #{inspect(reason)}")
    {:ok, state}
  end
end
```

--------------------------------

### Setting Root Layout in Router

Source: https://hexdocs.pm/phoenix_live_view/live-layouts

Demonstrates how to configure the root layout for a Phoenix LiveView application within the router configuration. This is typically done using the `plug :put_root_layout` directive.

```Elixir
plug :put_root_layout, html: {MyAppWeb.Layouts, :root}
```

--------------------------------

### Generate Signed PUT URL for S3 Upload (Elixir)

Source: https://hexdocs.pm/phoenix_live_view/external-uploads

This Elixir function `presign_upload/2` generates a pre-signed URL for a PUT request to an S3-compatible bucket. It requires the `ex_aws` and `ex_aws_s3` libraries to be configured. The function takes an `entry` object (containing client name and type) and a `socket` as input, and returns an `{:ok, url, socket}` tuple containing the signed URL.

```elixir
def presign_upload(entry, socket) do
  config = ExAws.Config.new(:s3)
  bucket = "bucket"
  key = "public/#{entry.client_name}"

  {:ok, url} =
    ExAws.S3.presigned_url(config, :put, bucket, key,
      expires_in: 3600,
      query_params: [{"Content-Type", entry.client_type}]
    )
   {:ok, %{uploader: "S3", key: key, url: url}, socket}
end
```

--------------------------------

### CSS Loading States for Forms (CSS & HTML)

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

This shows how to use CSS classes to manage form submission states. The `.phx-submit-loading` class toggles the display of messages and input fields, providing visual feedback during submission. Ensure unique HTML IDs on forms to prevent DOM replacement issues.

```css
.while-submitting { display: none; }
.inputs { display: block; }

.phx-submit-loading .while-submitting { display: block; }
.phx-submit-loading .inputs { display: none; }
```

```html
<form phx-change="update">
  <div class="while-submitting">Please wait while we save our content...</div>
  <div class="inputs">
    <input type="text" name="text" value={@text}>
  </div>
</form>
```

--------------------------------

### Reactive File Inputs with Drag and Drop in LiveView

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

Shows how to implement reactive file inputs in LiveView, including drag and drop support using the `phx-drop-target` attribute. The `live_file_input` component is used for this functionality.

```html
<div class="container" phx-drop-target={@uploads.avatar.ref}>
  ...
  <.live_file_input upload={@uploads.avatar} />
</div>

```

--------------------------------

### Render Async Tasks

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Waits for all ongoing asynchronous tasks (assign_async, stream_async, start_async) for a LiveView or element to complete. It then renders the LiveView or element with the updated state. The default timeout is ExUnit's assert_receive_timeout (100 ms).

```elixir
{:ok, lv, html} = live(conn, "/path")
assert html =~ "loading data..."
assert render_async(lv) =~ "data loaded!"
```

--------------------------------

### Render Change Event from View

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a change event on a LiveView and returns the rendered result. This is used to test how the LiveView responds to change events triggered from various inputs within the view. Returns the rendered content or an `{:error, redirect}` tuple.

```elixir
{:ok, view, html} = live(conn, "/thermo")
assert html =~ "The temp is: 30℉"
assert render_change(view, :inactive) =~ "Tap to wake"
```

--------------------------------

### Test LiveView Regular Messages in Elixir

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Demonstrates how to test the side effects of sending and receiving regular messages within a LiveView, which are essentially GenServer processes. It involves sending a message to the LiveView's PID and then using the `render` function to assert the updated HTML output.

```elixir
send(view.pid, {:set_temp, 50})
assert render(view) =~ "The temperature is: 50℉"
```

--------------------------------

### Simplify HEEx slot code generation

Source: https://hexdocs.pm/phoenix_live_view/changelog

Optimizes the code generated for slots in HEEx when the slot does not contain any dynamic code. This results in cleaner and potentially more performant generated HTML.

```heex
<.my_component>
  <!-- Static content -->
</.my_component> # Simplified generation
```

--------------------------------

### Rendering HEEx templates with assigns

Source: https://hexdocs.pm/phoenix_live_view/assigns-eex

Shows how to render HEEx templates and access assign values within them using the `@` syntax. This includes accessing nested data like struct fields.

```heex
<h1>{@title}</h1>
```

```heex
<div id={"user_#{@user.id}"}>
  {@user.name}
</div>
```

```heex
<%= for post <- @posts do %>
  ...
<% end %>
```

--------------------------------

### Execute Encoded JavaScript Commands in LiveView

Source: https://hexdocs.pm/phoenix_live_view/js-interop

This snippet demonstrates executing pre-encoded JavaScript commands within a LiveView context. It can be used with client hooks via `this.js().exec()` or with the LiveSocket instance via `liveSocket.js()`. The encoded JS commands are typically constructed using `Phoenix.LiveView.JS`.

```javascript
this.js().exec(this.el.getAttribute('phx-remove'))
```

```javascript
liveSocket.js().exec(anyElement, encodedJS)
```

--------------------------------

### Render File Input with LiveView

Source: https://hexdocs.pm/phoenix_live_view/uploads

Renders a file input component using `live_file_input/1` within a form. The form is configured with `phx-submit` and `phx-change` events to handle the upload process and validation. Attributes like `id`, `accept`, and `multiple` can be automatically set by `allow_upload/3`.

```html
<%!-- lib/my_app_web/live/upload_live.html.heex --%> 

<form id="upload-form" phx-submit="save" phx-change="validate">
  <.live_file_input upload={@uploads.avatar} />
  <button type="submit">Upload</button>
</form>
```

--------------------------------

### Simulate File Upload

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Performs a file upload simulation within a LiveView, rendering the result of the upload process. This function is useful for testing file upload components and their handling.

```elixir
render_upload(upload, entry_name, percent \\ 100)
```

--------------------------------

### Simulate Button Click and Assert Rendered HTML

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a click on a button element within a LiveView and asserts the updated HTML content. This function helps verify client-side interactions and DOM updates.

```elixir
```elixir
{:ok, view, html} = live(conn, "/thermo")

assert view
       |> element("button", "Increment")
       |> render_click() =~ "The temperature is: 30℉"
```
```

--------------------------------

### Use Reusable JS Command Function in HTML

Source: https://hexdocs.pm/phoenix_live_view/bindings

Demonstrates calling a custom Elixir function `hide_modal` directly within a `phx-click` binding in HTML, simplifying complex client-side interactions.

```html
<button phx-click={hide_modal("#modal")}>hide modal</button>
```

--------------------------------

### Phoenix LiveView Form Event Handling Callbacks

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

Elixir code demonstrating `handle_event` callbacks in a Phoenix LiveView. This handles 'validate' and 'save' events triggered by form bindings, including user creation logic and error handling with changesets.

```elixir
def render(assigns) ...

def mount(_params, _session, socket) do
  {:ok, assign(socket, form: to_form(Accounts.change_user(%User{})))}
end

def handle_event("validate", %{"user" => params}, socket) do
  form = 
    %User{} 
    |> Accounts.change_user(params)
    |> to_form(action: :validate)

  {:noreply, assign(socket, form: form)}
end

def handle_event("save", %{"user" => user_params}, socket) do
  case Accounts.create_user(user_params) do
    {:ok, user} ->
      {:noreply,
       socket
       |> put_flash(:info, "user created")
       |> redirect(to: ~p"/users/#{user}")}

    {:error, %Ecto.Changeset{} = changeset} ->
      {:noreply, assign(socket, form: to_form(changeset))}
  end
end
```

--------------------------------

### Fix Phoenix.LiveView.Debug.live_components/1 returning error tuple

Source: https://hexdocs.pm/phoenix_live_view/changelog

Corrects an issue where `Phoenix.LiveView.Debug.live_components/1` would raise an error instead of returning an error tuple. This ensures more predictable error handling for debugging functions.

```elixir
iex> Phoenix.LiveView.Debug.live_components(socket)
  # Now returns {:error, reason} instead of raising
```

--------------------------------

### Load User Locale from Database in LiveView Mount

Source: https://hexdocs.pm/phoenix_live_view/gettext

Fetches a user's locale preference from the database within the LiveView `mount/3` callback by retrieving the `user_id` from the session. It then sets the Gettext locale accordingly.

```elixir
def mount(_params, %{"user_id" => user_id}, socket) do
  user = Users.get_user!(user_id)
  Gettext.put_locale(MyApp.Gettext, user.locale)
  {:ok, socket}
end
```

--------------------------------

### Refute Push Event and Redirects

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Functions to assert the absence of certain events or actions. `refute_push_event/4` ensures an event is not pushed within a timeout, while `refute_redirected/1` and `refute_redirected/2` assert that no redirect occurred.

```Elixir
refute_push_event(view, event, payload, timeout \\ Application.fetch_env!(:ex_unit, :refute_receive_timeout))
refute_redirected(view)
refute_redirected(view, to)
```

--------------------------------

### Simulate Keydown Event with LiveView Render

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a keydown event on a specific element within a LiveView and returns the rendered result. This is useful for testing interactive components. It requires the LiveView connection, the event name, and optional values.

```elixir
assert render_keydown(view, :inc) =~ "The temp is: 31℉"
```

--------------------------------

### Handling variables and assigns in LiveView render functions

Source: https://hexdocs.pm/phoenix_live_view/assigns-eex

Explains why defining local variables within the `render` function of a LiveView is discouraged due to LiveView's inability to track changes to these variables, leading to unnecessary re-renders. It suggests using `assign/2` or `assign_new/3` instead.

```elixir
def render(assigns) do
  sum = assigns.x + assigns.y
  title = assigns.title

  ~H"""
  <h1>{title}</h1>

  {sum}
  """
end
```

--------------------------------

### Manipulate Element Classes with JS Commands

Source: https://hexdocs.pm/phoenix_live_view/bindings

Shows how to use JS.add_class and JS.remove_class to control element visibility by applying or removing CSS classes, triggered by phx-click events.

```html
<div id="modal" class="modal">
  My Modal
</div>

<button phx-click={JS.add_class("show", to: "#modal", transition: "fade-in")}>
  show modal
</button>

<button phx-click={JS.remove_class("show", to: "#modal", transition: "fade-out")}>
  hide modal
</button>
```

--------------------------------

### Phoenix LiveView Event Loading Classes

Source: https://hexdocs.pm/phoenix_live_view/syncing-changes

Illustrates how Phoenix LiveView automatically adds CSS loading classes to HTML elements when events are pushed to the server. These classes are applied until the server acknowledges the event, enabling simple optimistic UI updates.

```html
<button phx-click="clicked" phx-window-keydown="key">...</button>
```

--------------------------------

### Add Phoenix.LiveView.stream_async/4 for asynchronous stream insertion

Source: https://hexdocs.pm/phoenix_live_view/changelog

Introduces `Phoenix.LiveView.stream_async/4`, a new function for asynchronously inserting items into a stream. This enhancement improves performance and user experience by allowing streams to be updated without blocking the main thread.

```elixir
iex> stream_async(socket, :my_stream, 1000, fn -> {:ok, fetch_items()} end)
  # Asynchronously inserts items into the stream
```

--------------------------------

### Re-enable component change tracking for static dynamic expressions

Source: https://hexdocs.pm/phoenix_live_view/changelog

Re-enables change tracking for components when the dynamic expression has no dependencies, such as `<.my_component some="key" {%{static: \"map\"}}>`. This ensures that components are re-rendered correctly even with static assignments.

```elixir
<.my_component some={"value"} static_assign={%{key: "value"}} /> # Change tracking re-enabled
```

--------------------------------

### Elixir: ESBuild Configuration for Colocated Hooks

Source: https://hexdocs.pm/phoenix_live_view/js-interop

This Elixir configuration snippet shows how to set up `esbuild` to support colocated hooks in a Phoenix project. It defines the `NODE_PATH` environment variable to include the project's build path, allowing `esbuild` to locate and process the colocated hook code. This configuration is crucial for the `phoenix-colocated` package to function correctly.

```elixir
config :esbuild,
  ...
  my_app: [
    args:
      ~w(js/app.js --bundle --target=es2022 --outdir=../priv/static/assets/js --external:/fonts/* --external:/images/* --alias:@=.),
    cd: Path.expand("../assets", __DIR__),
    env: %{
      "NODE_PATH" => [Path.expand("../deps", __DIR__), Mix.Project.build_path()]
    }
  ]
```

--------------------------------

### Assertive Code Execution with Pattern Matching in Elixir

Source: https://hexdocs.pm/phoenix_live_view/error-handling

Shows how to use pattern matching in Elixir to enforce expected outcomes. If the `MyApp.Org.leave` function does not return `true`, a `MatchError` exception is raised. This is useful for handling unexpected scenarios where a function's return value is critical and deviating from it indicates a problem. It's a more assertive way to handle success conditions.

```elixir
true = MyApp.Org.leave(socket.assigns.current_org, member)
{:noreply, socket}
```

--------------------------------

### Simulate Focus Event on LiveView and Assert Rendered HTML

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a focus event on a LiveView and asserts the rendered HTML. This function is for testing general LiveView focus event handling.

```elixir
```elixir
{:ok, view, html} = live(conn, "/thermo")
assert html =~ "The temp is: 30℉"
assert render_focus(view, :inactive) =~ "Tap to wake"
```
```

--------------------------------

### Phoenix LiveView Button Loading State

Source: https://hexdocs.pm/phoenix_live_view/syncing-changes

Demonstrates how to disable a button and change its text while an event is being processed by the server. This is achieved using the `phx-disable-with` attribute, providing immediate user feedback.

```html
<button phx-disable-with="Submitting...">Submit</button>
```

--------------------------------

### LiveView JS Command: Apply CSS Transition

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Applies a CSS transition to an HTML element using the `transition` command. Options include `time` and `blocking`. This function is part of the JavaScript command interface provided by LiveView.

```javascript
this.js().transition(el, transition, opts = {})
```

--------------------------------

### Executing JS Commands on Server-Pushed Events (JavaScript)

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Illustrates how to integrate server-pushed events with Phoenix JS commands. By embedding JS commands in a `data-*` attribute, `LiveSocket.execJS` can be used within the event listener to trigger these commands on specific elements when the event occurs.

```javascript
let liveSocket = new LiveSocket(...)
window.addEventListener("phx:highlight", (e) => {
  document.querySelectorAll(`[data-highlight]`).forEach(el => {
    if(el.id == e.detail.id){
      liveSocket.execJS(el, el.getAttribute("data-highlight"))
    }
  })
})
```

--------------------------------

### Phoenix Router Configuration for Locale Parameter

Source: https://hexdocs.pm/phoenix_live_view/gettext

Defines a router scope to include a 'locale' parameter in URLs, allowing for locale-based routing in Phoenix applications.

```elixir
scope "/:locale" do
  live ...
  get ...
end
```

--------------------------------

### Nested Input Handling with .inputs_for

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

Illustrates how to handle nested form inputs using the `.inputs_for` function component. It automatically adds hidden input fields for tracking Ecto association IDs.

```html
<.inputs_for :let={fp} field={f[:friends]}>
  <.input field={fp[:name]} type="text" />
</.inputs_for>

```

--------------------------------

### Consume Uploaded Entries - Elixir

Source: https://hexdocs.pm/phoenix_live_view/uploads

Processes uploaded files within a Phoenix LiveView's 'save' event handler. It uses `consume_uploaded_entries/3` to iterate over uploaded files, copies them to a specified directory, and returns a list of paths for the persistent files. Requires `File.cp!/2` and path manipulation functions.

```elixir
def handle_event("save", _params, socket) do
  uploaded_files = 
    consume_uploaded_entries(socket, :avatar, fn %{path: path}, _entry ->
      dest = Path.join(Application.app_dir(:my_app, "priv/static/uploads"), Path.basename(path))
      # You will need to create `priv/static/uploads` for `File.cp!/2` to work.
      File.cp!(path, dest)
      {:ok, ~p"/uploads/#{Path.basename(dest)}"}
    end)

  {:noreply, update(socket, :uploaded_files, &(&1 ++ uploaded_files))}
end
```

--------------------------------

### Handle Server-Pushed Events for Charting (JavaScript)

Source: https://hexdocs.pm/phoenix_live_view/js-interop

This JavaScript hook is designed to handle 'points' events pushed from the server, intended for rendering chart data. The `mounted` function sets up an event listener for the 'points' event, which receives a payload containing a 'points' array. This array is then passed to a hypothetical `MyChartLib.addPoints` function for visualization.

```javascript
/**
 * @type {import("phoenix_live_view").Hook}
 */
Hooks.Chart = {
  mounted(){
    this.handleEvent("points", ({points}) => MyChartLib.addPoints(points))
  }
}
```

--------------------------------

### Simulate Keydown Event with Element and LiveView Render

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a keydown event targeting a specific DOM element within a LiveView and returns the rendered result. This function allows for more granular control over which element receives the event. It requires the LiveView connection, the element selector, and optional values.

```elixir
assert view |> element("#inc") |> render_keydown() =~ "The temp is: 31℉"
```

--------------------------------

### Avoiding direct data loading in HEEx templates

Source: https://hexdocs.pm/phoenix_live_view/assigns-eex

Highlights the anti-pattern of performing database queries or other data loading operations directly within HEEx templates, as this bypasses LiveView's change tracking.

```heex
<%= for user <- Repo.all(User) do %>
  {user.name}
<% end %>
```

--------------------------------

### Simulate Hook Event on Component Element and Assert Rendered HTML

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a hook event directed at a specific component element within a LiveView and asserts the rendered HTML. This is for testing hooks targeting components, especially when `phx-target` is used.

```elixir
```elixir
{:ok, view, _html} = live(conn, "/thermo")
assert view
       |> element("#thermo-component")
       |> render_hook(:refresh, %{deg: 32}) =~ "The temp is: 32℉"
```
```

--------------------------------

### Handle Expected Errors with Flash Messages in Elixir

Source: https://hexdocs.pm/phoenix_live_view/error-handling

Demonstrates how to use `flash` messages to inform the user about expected errors, such as a user being unable to perform an action. This approach is suitable for scenarios where an operation might fail but should be communicated gracefully to the user. The function `put_flash/3` is used to set the error message.

```elixir
if MyApp.Org.leave(socket.assigns.current_org, member) do
  {:noreply, socket}
else
  {:noreply, put_flash(socket, :error, "last member cannot leave organization")}
end
```

--------------------------------

### Simulate Hook Event on LiveView and Assert Rendered HTML

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a hook event on a LiveView and asserts the rendered HTML. This is used for testing custom JavaScript hooks that communicate with LiveViews.

```elixir
```elixir
{:ok, view, html} = live(conn, "/thermo")
assert html =~ "The temp is: 30℉"
assert render_hook(view, :refresh, %{deg: 32}) =~ "The temp is: 32℉"
```
```

--------------------------------

### Push Chart Event from Server (Elixir)

Source: https://hexdocs.pm/phoenix_live_view/js-interop

This Elixir code demonstrates how to push an out-of-band event named 'points' from the server to the client. It's typically used within a LiveView's `update` function. The event carries a payload containing `new_points`, which will be handled by any client-side hooks listening for the 'points' event.

```elixir
socket =    socket      |> assign(assigns)      |> push_event("points", %{points: new_points})

  {:noreply, socket}
```

--------------------------------

### Tailwind CSS Variant Integration for LiveView Loading States

Source: https://hexdocs.pm/phoenix_live_view/syncing-changes

This snippet demonstrates how to configure Tailwind CSS to recognize custom variants for LiveView's loading states (`phx-click-loading`, `phx-submit-loading`, `phx-change-loading`). This allows for easy styling of elements during user interactions, improving visual feedback. It utilizes the `addVariant` function provided by the Tailwind CSS plugin API.

```javascript
plugins: [
  plugin(({ addVariant }) => {
    addVariant("phx-click-loading", ["\.phx-click-loading&", "\.phx-click-loading &",]);
    addVariant("phx-submit-loading", ["\.phx-submit-loading&", "\.phx-submit-loading &",]);
    addVariant("phx-change-loading", ["\.phx-change-loading&", "\.phx-change-loading &",]);
  }),
]
```

--------------------------------

### Simulate Network Latency in LiveView Client

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Enables a latency simulator for the LiveView JavaScript client to test application behavior under varied network conditions. The `enableLatencySim(milliseconds)` function sets a one-way latency in milliseconds, and `disableLatencySim()` turns it off. These functions are accessible via the `window.liveSocket` object in the browser console and persist for the session.

```javascript
// app.js
let liveSocket = new LiveSocket(...)
liveSocket.connect()
window.liveSocket = liveSocket

// in the browser's web console
>> liveSocket.enableLatencySim(1000)
[Log] latency simulator enabled for the duration of this browser session.
      Call disableLatencySim() to disable
```

--------------------------------

### Render LiveView or Element HTML

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Retrieves the HTML string of a rendered LiveView or a specific element within it. If a LiveView is provided, the entire view is rendered. If an element selector is used (after `with_target/2`), only that context's HTML is returned.

```elixir
{:ok, view, _html} = live(conn, "/thermo")
assert render(view) =~ ~s|<button id="alarm">Snooze</div>|

assert view
       |> element("#alarm")
       |> render() == "Snooze"
```

--------------------------------

### Throttle Click Events

Source: https://hexdocs.pm/phoenix_live_view/bindings

Demonstrates rate-limiting a button click using phx-throttle. The '+' button will only trigger the 'volume_up' event once every 1000 milliseconds, preventing excessive event firing from rapid clicks.

```html
<button phx-click="volume_up" phx-throttle="1000">+</button>
```

--------------------------------

### Render Blur Event from View

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a blur event on a LiveView and returns the rendered result. This function is used to test reactions to blur events across the entire view. It returns the LiveView's rendered content or an `{:error, redirect}` tuple.

```elixir
{:ok, view, html} = live(conn, "/thermo")
assert html =~ "The temp is: 30℉"
assert render_blur(view, :inactive) =~ "Tap to wake"
```

--------------------------------

### LiveView Server-Side Event Handling for Form Recovery

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

These Elixir functions demonstrate server-side event handling in a LiveView for form recovery. `handle_event/3` is used for regular validation on `phx-change`, while a separate event like `recover_wizard` handles rebuilding state based on client input.

```elixir
def handle_event("validate_wizard_step", params, socket) do
  # regular validations for current step
  {:noreply, socket}
end

def handle_event("recover_wizard", params, socket) do
  # rebuild state based on client input data up to the current step
  {:noreply, socket}
end
```

--------------------------------

### Handle Namespaced Server-Pushed Events (JavaScript)

Source: https://hexdocs.pm/phoenix_live_view/js-interop

This JavaScript hook demonstrates how to handle server-pushed events that are namespaced. The `mounted` function dynamically constructs the expected event name using the hook's element ID (`this.el.id`) to match the server-sent event name. This allows for scoped event handling, particularly useful when multiple LiveComponents or hooks might otherwise conflict.

```javascript
Hooks.Chart = {
  mounted(){
    this.handleEvent(`points-${this.el.id}`, (points) => MyChartLib.addPoints(points));
  }
}
```

--------------------------------

### Submitting Form Actions Over HTTP in LiveView

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

Demonstrates using the `phx-trigger-action` attribute to trigger a standard HTTP form submit. This is useful for pre-validation before posting to a controller route, especially for operations requiring Plug session mutation.

```html
<.form :let={f} for={@changeset}
  action={~p"/users/reset_password"}
  phx-submit="save"
  phx-trigger-action={@trigger_submit}>

```

--------------------------------

### Phoenix LiveView Form Event Handling and Submission

Source: https://hexdocs.pm/phoenix_live_view/html-attrs

Illustrates form event handling with `phx-change`, `phx-submit`, and `phx-auto-recover`. Shows how to use `phx-disable-with` on buttons for user feedback during submission and `phx-debounce`/`phx-throttle` on inputs.

```html
<form phx-change="validate" phx-submit="save">
  <input type="text" name="name" phx-debounce="500" phx-throttle="500" />
  <button type="submit" phx-disable-with="Saving...">Save</button>
</form>
```

--------------------------------

### Find Nested LiveViews

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Utility functions for navigating the LiveView hierarchy. `find_live_child/2` retrieves a specific nested LiveView by its ID, while `live_children/1` lists all direct children of a parent LiveView.

```Elixir
find_live_child(parent, child_id)
live_children(parent)
```

--------------------------------

### Simulate Event Click on LiveView and Assert Rendered HTML

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a click event with associated data on a LiveView and asserts the resulting HTML. This is useful for testing event handling logic within LiveViews.

```elixir
```elixir
{:ok, view, html} = live(conn, "/thermo")
assert html =~ "The temperature is: 30℉"
assert render_click(view, :inc) =~ "The temperature is: 31℉"
```
```

--------------------------------

### Sending Click Event with phx-value-* Attributes in Phoenix LiveView

Source: https://hexdocs.pm/phoenix_live_view/bindings

This snippet illustrates sending click events to the server in Phoenix LiveView using multiple `phx-value-*` attributes. These attributes are automatically collected and sent as a map to the `handle_event` callback on the server, allowing for rich parameter passing without explicit JS calls.

```elixir
<div phx-click="inc" phx-value-myvar1="val1" phx-value-myvar2="val2">

def handle_event("inc", %{"myvar1" => "val1", "myvar2" => "val2"}, socket) do
```
```

--------------------------------

### LiveView JS Commands for Hiding Specific Elements by Selector

Source: https://hexdocs.pm/phoenix_live_view/syncing-changes

This code demonstrates how to use LiveView's `JS.hide()` command with a CSS selector. When the button is clicked, it triggers a server event and then uses JavaScript to hide a specific element identified by the selector `#post-row-13`, useful for scenarios where the target element is not the button itself.

```html
<button phx-click={JS.push("delete") |> JS.hide("#post-row-13")}>Delete</button>
```

--------------------------------

### LiveView Server-Side Handling of Form Reset Event

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

This Elixir code shows how to handle form reset events on the server within a LiveView. The `handle_event/3` function checks for the `"_target"` parameter, specifically looking for `["reset"]`, to differentiate form resets from other form changes.

```elixir
def handle_event("changed", %{"_target" => ["reset"]} = params, socket) do
  # handle form reset
end

def handle_event("changed", params, socket) do
  # handle regular form change
end
```

--------------------------------

### Set User Session with Locale in Controller

Source: https://hexdocs.pm/phoenix_live_view/gettext

Demonstrates setting the user's locale in the Plug session within a controller action after processing user data. This locale can then be used by LiveViews.

```elixir
def put_user_session(conn, current_user) do
  Gettext.put_locale(MyApp.Gettext, current_user.locale)

  conn
  |> put_session(:user_id, current_user.id)
  |> put_session(:locale, current_user.locale)
end
```

--------------------------------

### Dynamically Updating Page Title on Mount

Source: https://hexdocs.pm/phoenix_live_view/live-layouts

Shows how to set the `@page_title` assign within the `mount/3` function of a LiveView. This allows the HTML document title to be dynamically updated when the LiveView is initially loaded.

```Elixir
def mount(_params, _session, socket) do
  socket = assign(socket, page_title: "Latest Posts")
  {:ok, socket}
end
```

--------------------------------

### Phoenix LiveView Client Hook Integration

Source: https://hexdocs.pm/phoenix_live_view/html-attrs

Shows how to define and use `phx-hook` to integrate custom JavaScript logic with LiveView components, enabling bidirectional communication via `pushEvent` and `handleEvent`.

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

### Number Input Handling in LiveView

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

Demonstrates the default HTML for number inputs and an alternative using `inputmode` for better user experience and compatibility. LiveView prevents change events for invalid inputs to allow native browser validation.

```html
<input type="number">

```

```html
<input type="text" inputmode="numeric" pattern="[0-9]*">

```

--------------------------------

### Phoenix LiveView Click Event Handling

Source: https://hexdocs.pm/phoenix_live_view/html-attrs

Demonstrates how to use `phx-click` to trigger server-side events and `phx-value-*` to pass parameters. Also shows using `JS.toggle` for client-side DOM manipulation.

```html
<button type="button" phx-click="click" phx-value-user={@current_user.id}>Click Me</button>
<button type="button" phx-click={JS.toggle(to: "#example")}>Toggle</button>
```

--------------------------------

### LiveView Server-Side `phx-change` Payload Structure

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

This snippet shows the typical structure of the `params` argument in a LiveView's `handle_event/3` function when handling a `phx-change` event. It includes the `_target` which maps to the input's name and the nested form data.

```elixir
%{"_target" => ["user", "username"], "user" => %{"username" => "Name"}}
```

--------------------------------

### Ensure Compilation Order for Colocated Hooks in Mix Aliases

Source: https://hexdocs.pm/phoenix_live_view/changelog

Illustrates how to modify custom Mix aliases in `mix.exs` to ensure that compilation (`mix compile`) runs before assets deployment (`assets.deploy`). This is crucial for colocated hooks to be properly extracted before bundling.

```elixir
release: ["compile", "assets.deploy", "release"]
```

--------------------------------

### JavaScript Event Listener for Clipboard Copy Functionality

Source: https://hexdocs.pm/phoenix_live_view/syncing-changes

This JavaScript code sets up a client-side event listener for a custom event named `app:clipcopy`. When triggered, it attempts to copy the text content of the target element (or its value if it's an input) to the user's clipboard using the `navigator.clipboard` API. It includes fallback behavior for browsers that don't support the API.

```javascript
window.addEventListener("app:clipcopy", (event) => {
  if ("clipboard" in navigator) {
    if (event.target.tagName === "INPUT") {
      navigator.clipboard.writeText(event.target.value);
    } else {
      navigator.clipboard.writeText(event.target.textContent);
    }
  } else {
    alert(
      "Sorry, your browser does not support clipboard copy.\nThis generally requires a secure origin — either HTTPS or localhost.",
    );
  }
});
```

--------------------------------

### Open Browser to View Current HTML in LiveView Test

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Opens the default browser to display the current HTML content of a LiveView or a specific element. Can be chained with form submissions to inspect the state after an action.

```elixir
view
|> element("#term > :first-child", "Increment")
|> open_browser()

assert view
       |> form("#term", user: %{name: "hello"})
       |> open_browser()
       |> render_submit() =~ "Name updated"
```

--------------------------------

### Simulate Focus Event on Element and Assert Rendered HTML

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a focus event on a specific element within a LiveView and asserts the rendered HTML. This is useful for testing elements that react to focus events.

```elixir
```elixir
{:ok, view, html} = live(conn, "/thermo")

assert view
       |> element("#inactive")
       |> render_focus() =~ "Tap to wake"
```
```

--------------------------------

### Assert LiveView Reply

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Asserts that a hook reply is returned from a `handle_event` callback in a LiveView. This allows testing the response payload of asynchronous event handlers. The default timeout is ExUnit's `assert_receive_timeout`.

```elixir
assert_reply view, %{result: "ok", transaction_id: _}
```

--------------------------------

### Pushing Custom Events from Server to Browser (Elixir)

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Demonstrates how to use `Phoenix.LiveView.push_event/3` in Elixir to send a custom event from the server to the LiveView client. This is useful for triggering client-side actions based on server-side logic. The event name is prefixed with `phx:` in the browser.

```elixir
def handle_info({:item_updated, item}, socket) do
  {:noreply, push_event(socket, "highlight", %{id: "item-#{item.id}"})}
end
```

--------------------------------

### LiveView JS Command: Navigate

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Sends a navigation event to the server and updates the browser's pushState history using the `navigate` command. The `replace` option can be used to replace the current history entry. This function is part of the JavaScript command interface provided by LiveView.

```javascript
this.js().navigate(href, opts = {})
```

--------------------------------

### Phoenix LiveView Socket Connection Lifecycle Events

Source: https://hexdocs.pm/phoenix_live_view/html-attrs

Shows how to use `phx-connected` and `phx-disconnected` attributes to execute JavaScript commands when the LiveSocket connection state changes, useful for UI feedback.

```html
<div id="status" class="hidden" phx-disconnected={JS.show()} phx-connected={JS.hide()}>
  Attempting to reconnect...
</div>
```

--------------------------------

### Enhance LiveViewTest form submission with DOM values

Source: https://hexdocs.pm/phoenix_live_view/changelog

Introduces the inclusion of form values directly from the DOM in `Phoenix.LiveViewTest.submit_form/2` and `Phoenix.LiveViewTest.follow_trigger_action/2`. This enhancement makes the testing utilities more accurately mimic browser behavior during form submissions.

```elixir
iex> Phoenix.LiveViewTest.submit_form(page, form, "submit", [\"username\" : \"john_doe\"])
  # Now includes DOM values
```

--------------------------------

### Assert Redirected LiveView

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Asserts that a live redirect was successfully performed.

```Elixir
assert_redirected(view)
```

--------------------------------

### Simulate Form Submission with LiveView Render

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a form submission event within a LiveView and returns the rendered result. This function is essential for testing forms and their backend processing. It can take various values, including form data and file uploads.

```elixir
assert view
       |> element("form")
       |> render_submit(%{deg: 123, avatar: upload}) =~ "123 exceeds limits"
```

```elixir
assert view
       |> form("#term", user: %{name: "hello"})
       |> render_submit(%{user: %{"hidden_field" => "example"}}) =~ "Name updated"
```

```elixir
assert view
       |> form("#term", user: %{name: "hello"})
       |> put_submitter("button[name=example_action]")
       |> render_submit() =~ "Action taken"
```

--------------------------------

### Password Input Value Management in Phoenix.HTML

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

Explains the special handling for password inputs in Phoenix.HTML for security. Password field values are not automatically reused, requiring explicit `:value` setting in markup.

```html
<.input field={f[:password]} value={input_value(f[:password].value)} />
<.input field={f[:password_confirmation]} value={input_value(f[:password_confirmation].value)} />

```

--------------------------------

### Simulate Form Submission Event with LiveView Render

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a form submission event directly to a LiveView and returns the rendered result. This function is useful when you want to trigger a submission without specifically targeting a form element. It requires the LiveView connection, the event name, and optional values.

```elixir
assert render_submit(view, :refresh, %{deg: 32}) =~ "The temp is: 32℉"
```

--------------------------------

### LiveView Handle Event Telemetry Events

Source: https://hexdocs.pm/phoenix_live_view/telemetry

Provides telemetry for the handle_event/3 callback in Phoenix.LiveView. Events are triggered before, after, and in case of exceptions during event handling.

```elixir
[:phoenix, :live_view, :handle_event, :start]
[:phoenix, :live_view, :handle_event, :stop]
[:phoenix, :live_view, :handle_event, :exception]
```

--------------------------------

### LiveComponent Handle Event Exception Event - Elixir

Source: https://hexdocs.pm/phoenix_live_view/telemetry

This event is triggered when an exception arises within a `Phoenix.LiveComponent`'s `handle_event/3` callback. It records the duration, socket details, exception reason, component name, event string, and parameters.

```elixir
[:phoenix, :live_component, :handle_event, :exception]
```

--------------------------------

### Assert Patched LiveView

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Asserts that a live patch was successfully performed and returns the new path of the LiveView.

```Elixir
assert_patched(view, to)
```

--------------------------------

### Phoenix LiveView DOM Element Lifecycle and Patching

Source: https://hexdocs.pm/phoenix_live_view/html-attrs

Demonstrates using `phx-mounted` and `phx-remove` for executing JS during element lifecycle events, and `phx-update` for controlling DOM patching behavior like `ignore` for iframes.

```html
<div
  id="iframe-container"
  phx-mounted={JS.transition("animate-bounce", time: 2000)}
  phx-remove={JS.hide(transition: {"transition-all transform ease-in duration-200", "opacity-100", "opacity-0"})}>
  <button type="button" phx-click={JS.exec("phx-remove", to: "#iframe-container")}>Hide</button>
  <iframe id="iframe" src="https://example.com" phx-update="ignore"></iframe>
</div>
```

--------------------------------

### Phoenix LiveView Static Asset Tracking

Source: https://hexdocs.pm/phoenix_live_view/html-attrs

Illustrates the use of the `phx-track-static` attribute on links and scripts to ensure that static assets are correctly tracked and served by Phoenix. This is typically used in the root layout.

```html
<link phx-track-static rel="stylesheet" href={~p"/assets/app.css"} />
<script defer phx-track-static type="text/javascript" src={~p"/assets/app.js"}></script>
```

--------------------------------

### Check Element Existence

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Checks for the presence of an element on the page. `has_element?/1` checks for a specific element, while `has_element?/3` checks for an element matching a selector and optional text filter.

```Elixir
has_element?(element)
has_element?(view, selector, text_filter \\ nil)
```

--------------------------------

### Convert Rendered Template to String

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Converts a rendered LiveView template or component into a string representation. This is helpful for asserting on the HTML output of a rendered view.

```elixir
rendered_to_string(rendered)
```

--------------------------------

### Configure LiveView Debugging in config/dev.exs

Source: https://hexdocs.pm/phoenix_live_view/changelog

Configuration settings for enabling enhanced debugging features in Phoenix LiveView, specifically `debug_heex_annotations` and `debug_attributes`. This helps in identifying and resolving issues during development.

```elixir
config :phoenix_live_view,
  debug_heex_annotations: true,
  debug_attributes: true,
  enable_expensive_runtime_checks: true
```

--------------------------------

### Assert LiveView Push Event

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Asserts that a specific event is pushed by the LiveView within a given timeout. This is useful for verifying that client-side events are correctly handled and propagated. The default timeout is ExUnit's `assert_receive_timeout`.

```elixir
assert_push_event view, "scores", %{points: 100, user: "josé"}
```

--------------------------------

### Render Blur Event from Element

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a blur event on a specific element that has a `phx-blur` attribute. It sends the event to the appropriate LiveView and returns the rendered result of the LiveView or an error tuple if a redirect occurs. Additional values can be passed via the `value` argument.

```elixir
{:ok, view, html} = live(conn, "/thermo")

assert view
       |> element("#inactive")
       |> render_blur() =~ "Tap to wake"
```

--------------------------------

### LiveView Hook as Native Class

Source: https://hexdocs.pm/phoenix_live_view/changelog

Illustrates how to define LiveView JavaScript hooks as native classes, extending the `ViewHook` class. This offers a more object-oriented approach to organizing hook logic.

```javascript
import { LiveSocket, ViewHook } from "phoenix_live_view"

class MyHook extends ViewHook {
  mounted() {
    ...
  }
}

let liveSocket = new LiveSocket(..., {
  hooks: {
    MyHook
  }
})
```

--------------------------------

### Set Gettext Locale in LiveView Mount Callback (URL Parameter)

Source: https://hexdocs.pm/phoenix_live_view/gettext

Sets the Gettext locale within the `mount/3` callback of a LiveView when the locale is provided as a URL parameter. This ensures the correct language is used for rendering.

```elixir
def mount(%{"locale" => locale}, _session, socket) do
  Gettext.put_locale(MyApp.Gettext, locale)
  {:ok, socket}
end
```

--------------------------------

### Define Reusable JS Command Function in Elixir

Source: https://hexdocs.pm/phoenix_live_view/bindings

Defines a reusable Elixir function `hide_modal` that composes JS commands to push an event and remove a class, making client-side logic more organized.

```elixir
alias Phoenix.LiveView.JS

def hide_modal(js \ %JS{}, selector) do
  js
  |> JS.push("modal-closed")
  |> JS.remove_class("show", to: selector, transition: "fade-out")
end
```

--------------------------------

### Define Upload Error Messages

Source: https://hexdocs.pm/phoenix_live_view/uploads

Defines helper functions to translate upload error atoms into user-friendly strings. These functions are used in conjunction with `upload_errors/2` for entry-specific errors and `upload_errors/1` for general upload errors.

```elixir
defp error_to_string(:too_large), do: "Too large"
defp error_to_string(:not_accepted), do: "You have selected an unacceptable file type"
defp error_to_string(:too_many_files), do: "You have selected too many files"
```

--------------------------------

### Push Namespaced Event from Server (Elixir)

Source: https://hexdocs.pm/phoenix_live_view/js-interop

This Elixir code shows how to push a namespaced event from the server, ensuring it's only received by the intended client-side hook. The event name is constructed dynamically using the `id` from the assigns, creating a unique event like 'points-some-id'. This is crucial for scoping events when dealing with multiple instances of components or hooks.

```elixir
def update(%{id: id, points: points} = assigns, socket) do
  socket =    socket      |> assign(assigns)      |> push_event("points-#{id}", points)

  {:ok, socket}
end
```

--------------------------------

### LiveView on_mount Hook for Automatic Locale Restoration

Source: https://hexdocs.pm/phoenix_live_view/gettext

Implements an `on_mount` hook in LiveView to automatically set the Gettext locale based on a 'locale' parameter. This hook can be applied globally to all LiveViews.

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

### Fix warning when importing LiveView JS

Source: https://hexdocs.pm/phoenix_live_view/changelog

Addresses a warning that occurred when importing LiveView JavaScript modules. This cleanup improves the developer experience by removing unnecessary warnings during build or runtime.

```javascript
import {LiveView} from "@phoenix/live_view"; // Warning resolved
```

--------------------------------

### Set LiveView Event Target in Tests

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Illustrates how to set the event target for a LiveView in tests using `with_target/2`. This emulates the `phx-target` attribute, allowing you to invoke events on specific components or multiple components simultaneously without dispatching from an element.

```elixir
view
|> with_target("#user-1,#user-2")
|> render_click("Hide", %{})
```

--------------------------------

### LiveComponent Handle Event Stop Event - Elixir

Source: https://hexdocs.pm/phoenix_live_view/telemetry

This event is dispatched by a `Phoenix.LiveComponent` upon successful completion of its `handle_event/3` callback. It includes the duration of the callback execution, socket information, component name, event string, and parameters.

```elixir
[:phoenix, :live_component, :handle_event, :stop]
```

--------------------------------

### Handle Direct S3 Upload via PUT Request (JavaScript)

Source: https://hexdocs.pm/phoenix_live_view/external-uploads

This JavaScript function `Uploaders.S3` handles direct file uploads to S3-compatible services using `PUT` requests. It utilizes `XMLHttpRequest` to send the file to a pre-signed URL obtained from the backend. The function provides progress updates and error handling, taking an array of `entries` and an `onViewError` callback as arguments.

```javascript
Uploaders.S3 = function (entries, onViewError) {
  entries.forEach(entry => {
    let xhr = new XMLHttpRequest()
    onViewError(() => xhr.abort())
    xhr.onload = () => xhr.status === 200 ? entry.progress(100) : entry.error()
    xhr.onerror = () => entry.error()

    xhr.upload.addEventListener("progress", (event) => {
      if(event.lengthComputable){
        let percent = Math.round((event.loaded / event.total) * 100)
        if(percent < 100){ entry.progress(percent) }
      }
    })

    let url = entry.meta.url
    xhr.open("PUT", url, true)
    xhr.send(entry.file)
  })
}
```

--------------------------------

### Render Anonymous Function Component

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Renders an anonymous function component with provided assigns and asserts the rendered markup. This is used for testing stateless function components.

```elixir
```elixir
assert render_component(&Weather.city/1, name: "Kraków") =~
         "some markup in component"
```
```

--------------------------------

### LiveView Render Telemetry Events

Source: https://hexdocs.pm/phoenix_live_view/telemetry

Monitors the rendering process of a Phoenix.LiveView. Telemetry events are dispatched before, after, and on exceptions during the render/1 callback.

```elixir
[:phoenix, :live_view, :render, :start]
[:phoenix, :live_view, :render, :stop]
[:phoenix, :live_view, :render, :exception]
```

--------------------------------

### Assert LiveView Redirects

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Asserts that a live redirect will occur within a specified timeout. Overloads exist to check for a redirect to any path or a specific path, and to assert that a redirect was performed.

```Elixir
assert_redirect(view, timeout \\ Application.fetch_env!(:ex_unit, :assert_receive_timeout))
assert_redirect(view, to, timeout)
assert_redirected(view, to)
```

--------------------------------

### Assert LiveView Replies

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Asserts that a hook reply was returned from a `handle_event` callback within a specified timeout. This is useful for testing asynchronous event handling in LiveView.

```Elixir
assert_reply(view, payload, timeout \\ Application.fetch_env!(:ex_unit, :assert_receive_timeout))
```

--------------------------------

### Assert LiveView Patches

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Asserts that a live patch will occur within a specified timeout. Overloads exist to check for a patch to any path or a specific path.

```Elixir
assert_patch(view, timeout \\ Application.fetch_env!(:ex_unit, :assert_receive_timeout))
assert_patch(view, to, timeout)
```

--------------------------------

### Handle Upload Validation Callback

Source: https://hexdocs.pm/phoenix_live_view/uploads

Implements the `handle_event/3` callback in Phoenix LiveView to process the 'validate' event triggered by `phx-change` on the form. This callback is necessary for triggering client-side validation of uploads based on the `allow_upload/3` specification.

```elixir
@impl Phoenix.LiveView
def handle_event("validate", _params, socket) do
  {:noreply, socket}
end
```

--------------------------------

### Fix LiveViewTest not considering LiveViews as main with live_render

Source: https://hexdocs.pm/phoenix_live_view/changelog

Resolves an issue in `LiveViewTest` where some LiveViews were not correctly identified as main when using `live_render`. This ensures accurate testing of LiveView hierarchies.

```elixir
iex> live_render(session, MyAppWeb.MyLiveView, :index) # Now correctly identified as main
```

--------------------------------

### Render Change Event from Element

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Simulates a change event on a form element with a `phx-change` attribute. It sends the event, including any `phx-value-*` attributes and additional values provided, to the LiveView. Returns the rendered LiveView or an error tuple. Hidden input values can also be provided.

```elixir
{:ok, view, html} = live(conn, "/thermo")

assert view
       |> element("form")
       |> render_change(%{deg: 123}) =~ "123 exceeds limits"

# Passing metadata
{:ok, view, html} = live(conn, "/thermo")

assert view
       |> element("form")
       |> render_change(%{_target: ["deg"], deg: 123}) =~ "123 exceeds limits"
```

```elixir
refute view
      |> form("#term", user: %{name: "hello"})
      |> render_change(%{user: %{"hidden_field" => "example"}}) =~ "can't be blank"
```

--------------------------------

### HTMLFormatter: Respect multi-line attributes

Source: https://hexdocs.pm/phoenix_live_view/changelog

Updates the `HTMLFormatter` to avoid formatting attributes into a single line when they are spread over multiple lines. This change aligns the formatter's behavior with the Elixir formatter, preserving existing code structure.

```elixir
<div
  data-foo="bar"
  data-baz="qux"
></div> # Formatter now respects these newlines
```

--------------------------------

### Accessing Page Title in Root Layout

Source: https://hexdocs.pm/phoenix_live_view/live-layouts

Illustrates how the `@page_title` assign is accessed and rendered within the root layout file (e.g., "root.html.heex"). This enables dynamic title updates for browser tabs.

```HEEx
<title>{@page_title}</title>
```

--------------------------------

### Throttle Window Keydown Events

Source: https://hexdocs.pm/phoenix_live_view/bindings

Applies throttling to window-level keydown events. The 'keydown' event will be processed at most once every 500 milliseconds, which is useful for actions that should not be repeated too frequently, such as in games or continuous input scenarios.

```html
<div phx-window-keydown="keydown" phx-throttle="500">
  ...
</div>
```

--------------------------------

### Find Nested LiveView Child

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

The `find_live_child/2` function retrieves a nested LiveView child process from a parent LiveView using its ID. It returns the child LiveView process, which can then be used for further interactions like rendering events.

```elixir
{:ok, view, _html} = live(conn, "/thermo")
assert clock_view = find_live_child(view, "clock")
assert render_click(clock_view, :snooze) =~ "snoozing"
```

--------------------------------

### Refute Push Event

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Asserts that a specific event will NOT be pushed within a given timeout. It's used to verify that certain actions do not trigger expected events. The default timeout is inherited from ExUnit's refute_receive_timeout (100 ms).

```elixir
refute_push_event view, "scores", %{points: _, user: "josé"}
```

--------------------------------

### LiveComponent Update Exception Event - Elixir

Source: https://hexdocs.pm/phoenix_live_view/telemetry

This event is dispatched by a Phoenix.LiveComponent when an exception occurs during the `update/2` or `update_many/1` callbacks. It captures timing, socket information, the reason for the exception, and component details. Note that for `update/2`, a single event might represent multiple calls.

```elixir
[:phoenix, :live_component, :update, :exception]
```

--------------------------------

### Refute Redirected

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Asserts that a redirect to a specific path was NOT performed. If no path is provided, it asserts that no redirection occurred. Returns :ok if the specified redirect is not found in the mailbox.

```elixir
render_click(view, :event_that_triggers_redirect_to_path)
:ok = refute_redirected view, "/wrong_path"
```

--------------------------------

### Restore Gettext Locale from Session in LiveView Mount

Source: https://hexdocs.pm/phoenix_live_view/gettext

Retrieves and sets the Gettext locale from the session data within the `mount/3` callback of a LiveView. This assumes the locale has been previously stored in the session.

```elixir
def mount(_params, %{"locale" => locale}, socket) do
  Gettext.put_locale(MyApp.Gettext, locale)
  {:ok, socket}
end
```

--------------------------------

### Elixir/HEEx: Colocated JavaScript Hook for Input Formatting

Source: https://hexdocs.pm/phoenix_live_view/js-interop

This Elixir HEEx code defines a colocated JavaScript hook directly within a component. The hook, named `.PhoneNumber`, listens for 'input' events on its element and formats the entered phone number into a standard `XXX-XXX-XXXX` format. Colocated hooks are compiled and managed by Phoenix, simplifying component-specific JavaScript integration.

```elixir
def phone_number_input(assigns) do
  ~H"""
  <input type="text" name="user[phone-number]" id="user-phone-number" phx-hook=".PhoneNumber" />
  <script :type={Phoenix.LiveView.ColocatedHook} name=".PhoneNumber">
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

### LiveView JS Command: Patch

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Sends a patch event to the server and updates the browser's pushState history using the `patch` command. The `replace` option can be used to replace the current history entry. This function is part of the JavaScript command interface provided by LiveView.

```javascript
this.js().patch(href, opts = {})
```

--------------------------------

### Allow assigning generic hooks to type Hook

Source: https://hexdocs.pm/phoenix_live_view/changelog

This enhancement allows for the assignment of generic hooks to the `Hook` type, providing more flexibility in how custom JavaScript hooks are defined and managed within LiveView. It simplifies the integration of reusable hook logic.

```elixir
iex> Phx.LiveView.assign(socket, hook: %{\"my-hook\" => MyAppWeb.MyHook}) # Now supports generic hook types
```

--------------------------------

### JavaScript S3 Client-Side Uploader

Source: https://hexdocs.pm/phoenix_live_view/external-uploads

Implements the client-side JavaScript logic for uploading files directly to S3. This function takes upload entries and an error handler, constructs a FormData object with pre-signed URL fields and the file, and uses XMLHttpRequest to perform the upload, reporting progress and errors back to the LiveView.

```javascript
let Uploaders = {}

Uploaders.S3 = function(entries, onViewError){
  entries.forEach(entry => {
    let formData = new FormData()
    let {url, fields} = entry.meta
    Object.entries(fields).forEach(([key, val]) => formData.append(key, val))
    formData.append("file", entry.file)
    let xhr = new XMLHttpRequest()
    onViewError(() => xhr.abort())
    xhr.onload = () => xhr.status === 204 ? entry.progress(100) : entry.error()
    xhr.onerror = () => entry.error()
    xhr.upload.addEventListener("progress", (event) => {
      if(event.lengthComputable){
        let percent = Math.round((event.loaded / event.total) * 100)
        if(percent < 100){ entry.progress(percent) }
      }
    })

    xhr.open("POST", url, true)
    xhr.send(formData)
  })
}

export default Uploaders;
```

--------------------------------

### Assert LiveView Push Events

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Asserts that a specific event will be pushed within a given timeout. This function is useful for verifying that client-side events are correctly handled by the LiveView.

```Elixir
assert_push_event(view, event, payload, timeout \\ Application.fetch_env!(:ex_unit, :assert_receive_timeout))
```

--------------------------------

### Cancel Upload Event Handler - Elixir

Source: https://hexdocs.pm/phoenix_live_view/uploads

Handles the 'cancel-upload' event in a Phoenix LiveView. It takes the socket and a map containing the upload reference, then calls `cancel_upload/3` to stop the upload process. No external dependencies are required beyond Phoenix.LiveView.

```elixir
def handle_event("cancel-upload", %{"ref" => ref}, socket) do
  {:noreply, cancel_upload(socket, :avatar, ref)}
end
```

--------------------------------

### Simulate Form Submission in LiveView Test

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

This function mimics user interaction by submitting a form within a LiveView test. It does not allow setting hidden input values directly, but they can be provided when calling `render_submit/2` or `render_change/2`.

```elixir
assert view
      |> form("#term", user: %{name: "hello"})
      |> render_submit() =~ "Name updated"
```

--------------------------------

### LiveView JS Command: Add CSS Class

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Adds one or more CSS classes to an HTML element using the `addClass` command. Options include `transition`, `time`, and `blocking`. This function is part of the JavaScript command interface provided by LiveView.

```javascript
this.js().addClass(el, names, opts = {})
```

--------------------------------

### LiveView JS Command: Toggle Element Visibility

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Toggles the visibility of an HTML element using the `toggle` command. Options include `display`, `in`, `out`, `time`, and `blocking`. This function is part of the JavaScript command interface provided by LiveView.

```javascript
this.js().toggle(el, opts = {})
```

--------------------------------

### Put Submitter on Form Element

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Attaches a submitter element to a form, which will be included in the form submission payload. The submitter must exist within the form and be a 'submit' button/input or a button without a type. This is useful for distinguishing which element initiated a form submission.

```elixir
form = view |> form("#my-form")

assert form
       |> put_submitter("button[name=example]")
       |> render_submit() =~ "Submitted example"
```

--------------------------------

### Allow typing hook element with TypeScript

Source: https://hexdocs.pm/phoenix_live_view/changelog

Enables typing of hook elements when using TypeScript. This improves developer experience and code safety by providing better autocompletion and type checking for custom hooks integrated with LiveView.

```typescript
declare module "~live-view" {
  interface LiveViewHooks {
    MyHook: { el: HTMLElement } // Typed hook element
  }
}
```

--------------------------------

### Render Component Content Outside DOM with Phoenix Portal

Source: https://hexdocs.pm/phoenix_live_view/changelog

The `Phoenix.Component.portal/1` component allows rendering parts of a component's template outside its regular DOM hierarchy. This is useful for elements like tooltips or dialogs that might be clipped by parent `overflow: hidden` CSS rules. Events within a portal are still handled by the correct LiveView.

```heex
<%!-- in some nested LiveView or component --%>
<.portal id="my-element" target="body">
  <%!-- any content here will be teleported into the body tag --%>
</.portal>
```

--------------------------------

### Fix invalid component rendering with dynamic assigns

Source: https://hexdocs.pm/phoenix_live_view/changelog

Corrects an issue that caused invalid component rendering when using dynamic assigns (`<.my_component {...}>`) in rare circumstances. Change tracking was disabled in these cases to prevent bugs, improving stability.

```elixir
<.my_component {...assigns} /> # Rendering is now stable
```

--------------------------------

### Fix JavaScript type definitions in bundler resolution mode

Source: https://hexdocs.pm/phoenix_live_view/changelog

Ensures that JavaScript type definitions are correctly considered when using TypeScript in bundler resolution mode. This improves type checking and autocompletion for LiveView JavaScript integration.

```typescript
// No specific code snippet available, this is a configuration/build fix.
```

--------------------------------

### Update Floki Selectors to LazyHTML Text Filter in LiveViewTest

Source: https://hexdocs.pm/phoenix_live_view/changelog

LiveView v1.1 uses LazyHTML instead of Floki for `LiveViewTest`. Floki-specific selectors like `fl-contains` are no longer supported. Replace them with the `text_filter` option in the `element/3` function for compatibility.

```elixir
 {:ok, _login_live, login_html} =
   lv
-  |> element(~s|main a:fl-contains("Sign up")|)
+  |> element("main a", "Sign up")
   |> render_click()
   |> follow_redirect(conn, ~p"<%= schema.route_prefix %>/register")
```

--------------------------------

### Select Element with Text Filter in LiveView Tests

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

The `element/3` function selects an HTML element within a LiveView, optionally filtering by text content or attribute selectors. It expects the LiveView, a CSS selector, and an optional text filter. An error is raised if the selector or text filter results in more than one element.

```elixir
assert view
      |> element("#term > :first-child", "Increment")
      |> render() =~ "Increment</a>"
```

```elixir
assert view
       |> element(~s{[href="/foo"][id="foo.bar.baz"]})
       |> render() =~ "Increment</a>"
```

--------------------------------

### Phoenix LiveView Input with Individual Change Event

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

This snippet shows how to bind a `phx-change` event to an individual input field within a form in Phoenix LiveView. This allows for specific handling of changes to that particular input, targeting `@myself` for event processing.

```html
<.form for={@form} phx-change="validate" phx-submit="save">
  ...
  <.input field={@form[:email]}  phx-change="email_changed" phx-target={@myself} />
</.form>
```

--------------------------------

### LiveComponent Destroyed Event - Elixir

Source: https://hexdocs.pm/phoenix_live_view/telemetry

This event is dispatched by a `Phoenix.LiveComponent` immediately after it has been destroyed. It does not have an associated measurement but includes metadata such as the socket, component name, component ID, and the LiveView socket.

```elixir
[:phoenix, :live_component, :destroyed]
```

--------------------------------

### Set LiveView Event Target

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Sets the target for LiveView events originating from a specific view. This allows controlling where events are dispatched within the LiveView hierarchy.

```elixir
with_target(view, target)
```

--------------------------------

### Define a Colocated Hook in LiveView Component

Source: https://hexdocs.pm/phoenix_live_view/changelog

Demonstrates how to define a colocated hook within a LiveView component using the `<script :type={ColocatedHook}>` syntax. This allows the hook's JavaScript logic to be written directly alongside the HEEX template.

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

### LiveView Form Recovery Configuration

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

This snippet shows how to configure automatic form recovery in Phoenix LiveView using `phx-auto-recover`. It allows specifying a custom event for recovery when forms are stateful. The default recovery triggers on `phx-change` for forms with an `id`.

```html
<form id="wizard" phx-change="validate_wizard_step" phx-auto-recover="recover_wizard">
</form>
```

--------------------------------

### LiveView JS Command: Hide Element

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Hides an HTML element using the `hide` command. Options include `transition`, `time`, and `blocking`. This function is part of the JavaScript command interface provided by LiveView.

```javascript
this.js().hide(el, opts = {})
```

--------------------------------

### Phone Number Formatting Hook in JavaScript

Source: https://hexdocs.pm/phoenix_live_view/js-interop

This JavaScript code defines a `PhoneNumber` hook for Phoenix LiveView. The `mounted` callback adds an event listener to the input element (`this.el`) to format the phone number as the user types, automatically applying hyphens after the 3rd and 6th digits. A DOM ID must be set on the element using `phx-hook` for this to work.

```javascript
/**
 * @type {import("phoenix_live_view").HooksOptions}
 */
let Hooks = {}
Hooks.PhoneNumber = {
  mounted() {
    this.el.addEventListener("input", e => {
      let match = this.el.value.replace(/\D/g, "").match(/^(\d{3})(\d{3})(\d{4})$/)
      if(match) {
        this.el.value = `${match[1]}-${match[2]}-${match[3]}`
      }
    })
  }
}

let liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks, ...})
...
```

--------------------------------

### Phoenix LiveView Handling Individual Input Change Event

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

Elixir code for a Phoenix LiveView `handle_event` callback that processes an individual input change event, such as 'email_changed'. It receives the specific parameter for the changed field and can perform custom logic.

```elixir
def handle_event("email_changed", %{"user" => %{"email" => email}}, socket) do
  ...
end
```

--------------------------------

### Rename debug_tags_location to debug_attributes

Source: https://hexdocs.pm/phoenix_live_view/changelog

Renames the `debug_tags_location` configuration option to `debug_attributes` and adds `data-phx-pid` for improved debugging capabilities. This provides clearer naming and more useful identifiers for debugging LiveView elements.

```elixir
config :phoenix_live_view, 
  debug_attributes: true # Replaces debug_tags_location
```

--------------------------------

### Fix race condition in pending joins for patches

Source: https://hexdocs.pm/phoenix_live_view/changelog

Corrects a race condition where patches were being discarded if a join operation was still pending. This bug fix ensures that patch updates are handled correctly even when asynchronous operations are in progress, maintaining state consistency.

```elixir
# No specific code snippet available, this is a backend fix.
```

--------------------------------

### LiveView JS Command: Toggle CSS Class

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Toggles one or more CSS classes on an HTML element using the `toggleClass` command. Options include `transition`, `time`, and `blocking`. This function is part of the JavaScript command interface provided by LiveView.

```javascript
this.js().toggleClass(el, names, opts = {})
```

--------------------------------

### Check for Element with Text on Page in LiveView Test

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Verifies if an element matching the provided CSS selector and optionally containing specific text exists on the LiveView page. This offers more granular control than just checking for element presence.

```elixir
assert has_element?(view, "#some-element")
```

--------------------------------

### LiveView Button with `phx-disable-with`

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

This HTML snippet demonstrates how to use the `phx-disable-with` attribute on a submit button. During form submission, the button's text will change to the specified value (e.g., 'Saving...') and revert to its original text after the server acknowledges the event.

```html
<button type="submit" phx-disable-with="Saving...">Save</button>
```

--------------------------------

### Prevent LiveView Attribute Patching with JS.ignore_attributes

Source: https://hexdocs.pm/phoenix_live_view/changelog

Use `JS.ignore_attributes` in the `phx-mounted` attribute to prevent LiveView from patching specific attributes. This is particularly useful for native elements like `<dialog>` or `<details>` whose `open` attribute is managed by the browser.

```heex
<details phx-mounted={JS.ignore_attributes(["open"])}>
  <summary>...</summary>
  ...
</details>
```

--------------------------------

### Ensure nested variable access is change tracked in components

Source: https://hexdocs.pm/phoenix_live_view/changelog

Ensures that nested variable access within components is properly change tracked. This fix guarantees that changes to nested data structures trigger re-renders as expected, maintaining UI consistency.

```elixir
<.my_component user={%{profile: %{name: @name}}} /> # Nested access is now tracked
```

--------------------------------

### Allow ColocatedHook to work at root of LiveComponent

Source: https://hexdocs.pm/phoenix_live_view/changelog

Enhances `ColocatedHook` to function correctly when placed at the root of a LiveComponent. This provides more flexibility in defining and attaching JavaScript hooks to components.

```elixir
defmodule MyAppWeb.MyComponent do
  use Phoenix.Component

  embed_templates "*.html"

  # ColocatedHook can now be used here
end
```

--------------------------------

### LiveView JS Command: Set Attribute

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Sets an HTML attribute on an element using the `setAttribute` command. This function is part of the JavaScript command interface provided by LiveView.

```javascript
this.js().setAttribute(el, attr, val)
```

--------------------------------

### Make hook types less strict

Source: https://hexdocs.pm/phoenix_live_view/changelog

Reduces the strictness of hook type definitions, allowing for more flexibility in how hooks are declared and used. This change aims to simplify hook integration and reduce potential type-related issues.

```elixir
# No specific code snippet available, this is a backend change.
```

--------------------------------

### Allow omitting name attribute for Phoenix.LiveView.ColocatedJS

Source: https://hexdocs.pm/phoenix_live_view/changelog

Enables omitting the `name` attribute when using `Phoenix.LiveView.ColocatedJS`. This simplifies the usage of JavaScript callbacks by removing the need for explicit naming in certain scenarios.

```elixir
use Phoenix.LiveView

# Previously required a name, now optional
js_connect("my-event", MyAppWeb.MyJS)
# Or with a name:
js_connect("my-event", MyAppWeb.MyJS, name: "my-callback")
```

--------------------------------

### Trigger `phx-change` Event with JavaScript (JavaScript)

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

This JavaScript code shows how to programmatically trigger a `phx-change` event on an element, useful for custom form components like date pickers. It dispatches an 'input' event with bubbling enabled. When using client hooks, `this.el` refers to the element.

```javascript
document.getElementById("my-select").dispatchEvent(
  new Event("input", {bubbles: true})
)
```

--------------------------------

### Debounce Form Input Validation

Source: https://hexdocs.pm/phoenix_live_view/bindings

Shows how to use the phx-debounce attribute on form inputs to delay event emission. 'blur' triggers validation only when the input loses focus, while a numerical value (e.g., '2000') delays the event by that many milliseconds, useful for user experience improvements.

```html
<form phx-change="validate" phx-submit="save">
  <input type="text" name="user[email]" phx-debounce="blur"/>
  <input type="text" name="user[username]" phx-debounce="2000"/>
</form>
```

--------------------------------

### Check for Element Existence on Page in LiveView Test

Source: https://hexdocs.pm/phoenix_live_view/Phoenix

Checks if a specific HTML element, identified by a CSS selector, exists on the current LiveView page. This is useful for verifying UI components are rendered.

```elixir
assert view |> element("#some-element") |> has_element?()
```

--------------------------------

### Ensure whitespace preservation in textarea during form submission testing

Source: https://hexdocs.pm/phoenix_live_view/changelog

Ensures that whitespace within textarea content is preserved when submitting forms in `LiveViewTest`. This fix guarantees accurate testing of form submissions involving textareas.

```elixir
iex> Phoenix.LiveViewTest.submit_form(page, form, [\"message\" : \"  Hello  \"])
  # Whitespace preserved
```

--------------------------------

### Infinite Scrolling Hook with Data Attributes (JavaScript)

Source: https://hexdocs.pm/phoenix_live_view/js-interop

This JavaScript hook implements infinite scrolling functionality. It reads the current page number from a 'data-page' attribute on its element and listens for scroll events. When the user scrolls near the bottom of the page, it increments the page number and pushes a 'load-more' event to the LiveView server. The `updated` lifecycle hook ensures the `pending` page number is reset when the component re-renders.

```javascript
/**
 * @type {import("phoenix_live_view").Hook}
 */
Hooks.InfiniteScroll = {
  page() { return this.el.dataset.page },
  mounted(){
    this.pending = this.page()
    window.addEventListener("scroll", e => {
      if(this.pending == this.page() && scrollAt() > 90){
        this.pending = this.page() + 1
        this.pushEvent("load-more", {})
      }
    })
  },
  updated(){ this.pending = this.page() }
}
```

--------------------------------

### Set live_socket_id for User Session in Phoenix LiveView

Source: https://hexdocs.pm/phoenix_live_view/security-model

This snippet demonstrates how to set the `live_socket_id` in the user's session when they log in. This ID is crucial for identifying and managing all active LiveView connections for that user. It utilizes the `put_session` function to store the `current_user_id` and a custom `live_socket_id` formatted as a string.

```elixir
conn
|> put_session(:current_user_id, user.id)
|> put_session(:live_socket_id, "users_socket:#{user.id}")
```

--------------------------------

### Use 'on' as default value for checkboxes in LiveViewTest

Source: https://hexdocs.pm/phoenix_live_view/changelog

Sets 'on' as the default value for checkboxes when using `LiveViewTest` utilities. This aligns the testing behavior with standard HTML form submissions.

```elixir
iex> Phoenix.LiveViewTest.submit_form(page, form, [\"agree\" : true]) # Default value is 'on'
```

--------------------------------

### Fix LiveViewTest crash with custom form submitter without ID

Source: https://hexdocs.pm/phoenix_live_view/changelog

Corrects a crash in `LiveViewTest` that occurred when submitting a form with a custom submitter but without an associated ID. This ensures form submissions using custom elements are handled robustly in tests.

```elixir
iex> Phoenix.LiveViewTest.submit_form(page, form, "custom-submitter") # Works even without form ID
```

--------------------------------

### LiveView JS Command: Toggle Attribute

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Toggles an HTML attribute on an element between two values using the `toggleAttribute` command. This function is part of the JavaScript command interface provided by LiveView.

```javascript
this.js().toggleAttribute(el, attr, val1, val2)
```

--------------------------------

### Disable Button Outside Form with `phx-disable-with` (HTML)

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

This snippet demonstrates how to disable a button outside of a form using the `phx-disable-with` attribute without altering its text. LiveView automatically ignores clicks on elements awaiting server acknowledgment, preventing duplicate events.

```html
<button type="button" phx-disable-with>...</button>
```

--------------------------------

### Prevent focus_wrap from focusing last element on Firefox

Source: https://hexdocs.pm/phoenix_live_view/changelog

Fixes a bug where `focus_wrap` would focus the last element instead of the first on Firefox in rare cases. This ensures consistent focus management across browsers.

```javascript
// No specific code snippet available, this is a backend fix.
```

--------------------------------

### Broadcast Disconnect Event in Phoenix LiveView

Source: https://hexdocs.pm/phoenix_live_view/security-model

This code snippet shows how to broadcast a 'disconnect' event to all LiveView sockets associated with a specific user. By broadcasting to a topic derived from the `live_socket_id`, you can effectively signal all connected clients to disconnect. This is the server-side action that complements setting the `live_socket_id`.

```elixir
MyAppWeb.Endpoint.broadcast("users_socket:#{user.id}", "disconnect", %{})
```

--------------------------------

### LiveView JS Command: Remove CSS Class

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Removes one or more CSS classes from an HTML element using the `removeClass` command. Options include `transition`, `time`, and `blocking`. This function is part of the JavaScript command interface provided by LiveView.

```javascript
this.js().removeClass(el, names, opts = {})
```

--------------------------------

### Prevent Form Submission with JavaScript Hook (JavaScript & HTML)

Source: https://hexdocs.pm/phoenix_live_view/form-bindings

This snippet illustrates using a JavaScript hook to conditionally prevent form submissions. The 'CustomFormSubmission' hook listens for the 'submit' event, allowing you to implement custom validation logic before allowing the submission to proceed to LiveView or the browser.

```javascript
/**
 * @type {import("phoenix_live_view").HooksOptions}
 */
let Hooks = {}
Hooks.CustomFormSubmission = {
  mounted() {
    this.el.addEventListener("submit", (event) => {
      if (!this.shouldSubmit()) {
        // prevent the event from bubbling to the default LiveView handler
        event.stopPropagation()
        // prevent the default browser behavior (submitting the form over HTTP)
        event.preventDefault()
      }
    })
  },
  shouldSubmit() {
    // Check if we should submit the form
    ...
  }
}
```

```html
<form phx-hook="CustomFormSubmission">
  <input type="text" name="text" value={@text}>
</form>
```

--------------------------------

### LiveView JS Command: Remove Attribute

Source: https://hexdocs.pm/phoenix_live_view/js-interop

Removes an HTML attribute from an element using the `removeAttribute` command. This function is part of the JavaScript command interface provided by LiveView.

```javascript
this.js().removeAttribute(el, attr)
```

=== COMPLETE CONTENT === This response contains all available snippets from this library. No additional content exists. Do not make further requests.
