defmodule MceWeb.Layouts do
  @moduledoc """
  This module holds layouts and related functionality
  used by your application.
  """
  use MceWeb, :html

  # Embed all files in layouts/* within this module.
  # The default root.html.heex file contains the HTML
  # skeleton of your application, namely HTML headers
  # and other static content.
  embed_templates "layouts/*"

  @doc """
  Renders your app layout.

  This function is typically invoked from every template,
  and it often contains your application menu, sidebar,
  or similar.

  ## Examples

      <Layouts.app flash={@flash}>
        <h1>Content</h1>
      </Layouts.app>

  """
  attr :flash, :map, required: true, doc: "the map of flash messages"

  attr :current_scope, :map,
    default: nil,
    doc: "the current [scope](https://hexdocs.pm/phoenix/scopes.html)"

  attr :locale, :string, default: "ko", doc: "the current locale"

  slot :inner_block, required: true

  def app(assigns) do
    ~H"""
    <div class="flex flex-col min-h-screen">
      <header class="navbar bg-base-100/80 backdrop-blur-sm shadow-sm sticky top-0 z-50 px-4 sm:px-6 lg:px-8">
        <%!-- Brand & Navigation (left-aligned) --%>
        <div class="navbar-start gap-6">
          <a href="/" class="flex items-center gap-2">
            <.icon name="hero-chart-bar" class="size-8 text-primary" />
            <span class="text-lg font-bold text-primary">MCE</span>
          </a>
          <nav :if={@current_scope} class="hidden md:flex gap-4">
            <.link
              navigate={~p"/dashboard"}
              class="flex items-center gap-2 px-2 py-1 text-base-content/70 hover:text-primary border-b-2 border-transparent hover:border-primary transition-colors"
            >
              <.icon name="hero-chart-bar" class="size-4" />
              {gettext("Dashboard")}
            </.link>
          </nav>
        </div>

        <%!-- Settings & User (right) --%>
        <div class="navbar-end">
          <ul class="flex flex-row px-1 space-x-2 items-center">
            <li>
              <.language_switcher locale={@locale} />
            </li>
            <li>
              <.theme_toggle />
            </li>
            <li :if={@current_scope}>
              <.user_menu user={@current_scope.user} />
            </li>
          </ul>
        </div>
      </header>

      <main class="flex-1 bg-base-200/50">
        {render_slot(@inner_block)}
      </main>
    </div>

    <.flash_group flash={@flash} />
    """
  end

  @doc """
  User menu dropdown with settings and logout.
  """
  attr :user, :map, required: true

  def user_menu(assigns) do
    ~H"""
    <div class="dropdown dropdown-end">
      <div tabindex="0" role="button" class="btn btn-ghost btn-sm gap-2">
        <.icon name="hero-user-circle" class="size-5" />
        <span class="hidden sm:inline">{@user.nickname || @user.email}</span>
        <.icon name="hero-chevron-down" class="size-3" />
      </div>
      <ul tabindex="0" class="dropdown-content menu bg-base-100 rounded-box z-50 w-52 p-2 shadow-lg">
        <li class="menu-title">
          <span class="text-xs font-normal text-base-content/60">{@user.email}</span>
        </li>
        <li :if={@user.is_admin}>
          <.link href={~p"/admin"} class="gap-2 text-primary">
            <.icon name="hero-cog-8-tooth" class="size-4" />
            {gettext("Admin")}
          </.link>
        </li>
        <li>
          <.link href={~p"/users/settings"} class="gap-2">
            <.icon name="hero-cog-6-tooth" class="size-4" />
            {gettext("Settings")}
          </.link>
        </li>
        <div class="divider my-1"></div>
        <li>
          <.link href={~p"/users/log-out"} method="delete" class="gap-2 text-error">
            <.icon name="hero-arrow-right-on-rectangle" class="size-4" />
            {gettext("Log out")}
          </.link>
        </li>
      </ul>
    </div>
    """
  end

  @doc """
  Shows the flash group with standard titles and content.

  ## Examples

      <.flash_group flash={@flash} />
  """
  attr :flash, :map, required: true, doc: "the map of flash messages"
  attr :id, :string, default: "flash-group", doc: "the optional id of flash container"

  def flash_group(assigns) do
    ~H"""
    <div id={@id} aria-live="polite">
      <.flash kind={:info} flash={@flash} />
      <.flash kind={:error} flash={@flash} />

      <.flash
        id="client-error"
        kind={:error}
        title={gettext("We can't find the internet")}
        phx-disconnected={show(".phx-client-error #client-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#client-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>

      <.flash
        id="server-error"
        kind={:error}
        title={gettext("Something went wrong!")}
        phx-disconnected={show(".phx-server-error #server-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#server-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>
    </div>
    """
  end

  @doc """
  Provides dark vs light theme toggle based on themes defined in app.css.

  See <head> in root.html.heex which applies the theme before page load.
  """
  def theme_toggle(assigns) do
    ~H"""
    <div class="card relative flex flex-row items-center border-2 border-base-300 bg-base-300 rounded-full">
      <div class="absolute w-1/3 h-full rounded-full border-1 border-base-200 bg-base-100 brightness-200 left-0 [[data-theme=mce-light]_&]:left-1/3 [[data-theme=mce-dark]_&]:left-2/3 transition-[left]" />

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="system"
        title={gettext("System theme")}
      >
        <.icon name="hero-computer-desktop-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="mce-light"
        title={gettext("Light theme")}
      >
        <.icon name="hero-sun-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="mce-dark"
        title={gettext("Dark theme")}
      >
        <.icon name="hero-moon-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>
    </div>
    """
  end

  @doc """
  Admin layout for Backpex admin panel.
  """
  attr :flash, :map, required: true, doc: "the map of flash messages"
  attr :fluid?, :boolean, default: true, doc: "if the content uses full width"
  attr :current_url, :string, required: true, doc: "the current url"
  attr :current_scope, :map, default: nil, doc: "the current scope with user info"
  attr :locale, :string, default: "ko", doc: "the current locale"

  slot :inner_block, required: true

  def admin(assigns) do
    ~H"""
    <div class="min-h-screen bg-base-200">
      <%!-- Admin Header --%>
      <header class="navbar bg-base-100 border-b border-base-300 fixed top-0 z-50 px-4">
        <div class="flex-1 gap-4">
          <.link href={~p"/admin/users"} class="flex items-center gap-2 text-primary">
            <.icon name="hero-cog-8-tooth" class="size-7" />
            <span class="text-lg font-bold">{gettext("Admin")}</span>
          </.link>
        </div>

        <div class="flex-none">
          <ul class="flex flex-row px-1 space-x-2 items-center">
            <li>
              <.link
                href={~p"/dashboard"}
                class="btn btn-ghost btn-sm gap-2"
              >
                <.icon name="hero-arrow-left" class="size-4" />
                {gettext("Back to App")}
              </.link>
            </li>
            <li>
              <.language_switcher locale={@locale} />
            </li>
            <li>
              <.theme_toggle />
            </li>
            <li :if={@current_scope}>
              <.user_menu user={@current_scope.user} />
            </li>
          </ul>
        </div>
      </header>

      <div class="flex pt-16">
        <%!-- Sidebar --%>
        <aside class="w-64 bg-base-100 border-r border-base-300 fixed left-0 top-16 bottom-0 overflow-y-auto hidden md:block">
          <nav class="p-4">
            <ul class="menu menu-lg gap-1">
              <li>
                <.link
                  navigate={~p"/admin/users"}
                  class={[
                    "flex items-center gap-3",
                    active_admin_link?(@current_url, "/admin/users") && "bg-primary/10 text-primary"
                  ]}
                >
                  <.icon name="hero-users" class="size-5" />
                  {gettext("Users")}
                </.link>
              </li>
              <li>
                <.link
                  navigate={~p"/admin/farms"}
                  class={[
                    "flex items-center gap-3",
                    active_admin_link?(@current_url, "/admin/farms") && "bg-primary/10 text-primary"
                  ]}
                >
                  <.icon name="hero-building-office-2" class="size-5" />
                  {gettext("Farms")}
                </.link>
              </li>
              <li>
                <.link
                  navigate={~p"/admin/livestock-groups"}
                  class={[
                    "flex items-center gap-3",
                    active_admin_link?(@current_url, "/admin/livestock-groups") &&
                      "bg-primary/10 text-primary"
                  ]}
                >
                  <.icon name="hero-beaker" class="size-5" />
                  {gettext("Livestock Groups")}
                </.link>
              </li>
              <li>
                <.link
                  navigate={~p"/admin/feed-presets"}
                  class={[
                    "flex items-center gap-3",
                    active_admin_link?(@current_url, "/admin/feed-presets") &&
                      "bg-primary/10 text-primary"
                  ]}
                >
                  <.icon name="hero-clipboard-document-list" class="size-5" />
                  {gettext("Feed Presets")}
                </.link>
              </li>
              <li>
                <.link
                  navigate={~p"/admin/ipcc-factors"}
                  class={[
                    "flex items-center gap-3",
                    active_admin_link?(@current_url, "/admin/ipcc-factors") &&
                      "bg-primary/10 text-primary"
                  ]}
                >
                  <.icon name="hero-document-chart-bar" class="size-5" />
                  {gettext("IPCC Factors")}
                </.link>
              </li>
            </ul>
          </nav>
        </aside>

        <%!-- Main Content --%>
        <main class="flex-1 md:ml-64 p-6 min-h-[calc(100vh-4rem)] min-w-0 overflow-x-auto">
          <Backpex.HTML.Layout.flash_messages flash={@flash} />
          <div class="max-w-full overflow-x-auto">
            {render_slot(@inner_block)}
          </div>
        </main>
      </div>
    </div>
    """
  end

  defp active_admin_link?(current_url, path) do
    String.starts_with?(current_url, path)
  end

  @doc """
  Dashboard layout with responsive collapsible drawer sidebar.
  Uses DaisyUI's is-drawer-close and is-drawer-open pattern.
  """
  attr :flash, :map, required: true, doc: "the map of flash messages"
  attr :current_scope, :map, required: true, doc: "the current scope"
  attr :locale, :string, default: "ko", doc: "the current locale"
  attr :current_url, :string, default: "/dashboard", doc: "the current URL path"

  slot :inner_block, required: true

  def dashboard_layout(assigns) do
    ~H"""
    <div class="drawer lg:drawer-open">
      <input id="dashboard-drawer" type="checkbox" class="drawer-toggle" />

      <%!-- Main Content Area --%>
      <div class="drawer-content flex flex-col min-w-0">
        <%!-- Dashboard Header --%>
        <header class="navbar bg-base-100/80 backdrop-blur-sm border-b border-base-300 sticky top-0 z-40 px-4">
          <div class="flex-none lg:hidden">
            <label for="dashboard-drawer" class="btn btn-square btn-ghost">
              <.icon name="hero-bars-3" class="size-6" />
            </label>
          </div>
          <div class="flex-1 gap-4">
            <%!-- Empty - brand is in sidebar header --%>
          </div>
          <div class="flex-none">
            <ul class="flex flex-row px-1 space-x-2 items-center">
              <li>
                <.language_switcher locale={@locale} />
              </li>
              <li>
                <.theme_toggle />
              </li>
              <li>
                <.user_menu user={@current_scope.user} />
              </li>
            </ul>
          </div>
        </header>

        <%!-- Page Content --%>
        <main class="flex-1 bg-base-200/50 overflow-x-auto">
          {render_slot(@inner_block)}
        </main>
      </div>

      <%!-- Sidebar --%>
      <div class="drawer-side z-50 is-drawer-close:overflow-visible">
        <label for="dashboard-drawer" aria-label="close sidebar" class="drawer-overlay"></label>
        <div class="flex min-h-full flex-col bg-base-100 border-r border-base-300 is-drawer-close:w-16 is-drawer-open:w-64 transition-[width] duration-200">
          <%!-- Sidebar Header - Brand only --%>
          <div class="flex h-16 items-center justify-center border-b border-base-300 px-4">
            <.link href="/" class="flex items-center gap-2">
              <.icon name="hero-chart-bar" class="size-7 text-primary" />
              <span class="text-lg font-bold text-primary is-drawer-close:hidden">MCE</span>
            </.link>
          </div>

          <%!-- Navigation Menu --%>
          <nav class="flex-1 p-2">
            <ul class="menu gap-1">
              <li>
                <.link
                  navigate={~p"/dashboard"}
                  class={[
                    "flex items-center gap-3 is-drawer-close:justify-center is-drawer-close:tooltip is-drawer-close:tooltip-right",
                    active_dashboard_link?(@current_url, "/dashboard") && "bg-primary/10 text-primary"
                  ]}
                  data-tip={gettext("Overview")}
                >
                  <.icon name="hero-home" class="size-5 shrink-0" />
                  <span class="is-drawer-close:hidden">{gettext("Overview")}</span>
                </.link>
              </li>
              <li>
                <.link
                  navigate={~p"/farms"}
                  class={[
                    "flex items-center gap-3 is-drawer-close:justify-center is-drawer-close:tooltip is-drawer-close:tooltip-right",
                    active_dashboard_link?(@current_url, "/farms") && "bg-primary/10 text-primary"
                  ]}
                  data-tip={gettext("Farms")}
                >
                  <.icon name="hero-building-office-2" class="size-5 shrink-0" />
                  <span class="is-drawer-close:hidden">{gettext("Farms")}</span>
                </.link>
              </li>
              <li>
                <.link
                  navigate={~p"/compare"}
                  class={[
                    "flex items-center gap-3 is-drawer-close:justify-center is-drawer-close:tooltip is-drawer-close:tooltip-right",
                    active_dashboard_link?(@current_url, "/compare") && "bg-primary/10 text-primary"
                  ]}
                  data-tip={gettext("Compare Farms")}
                >
                  <.icon name="hero-scale" class="size-5 shrink-0" />
                  <span class="is-drawer-close:hidden">{gettext("Compare Farms")}</span>
                </.link>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </div>

    <.flash_group flash={@flash} />
    """
  end

  defp active_dashboard_link?(current_url, "/dashboard") do
    current_url == "/dashboard" or current_url == "/"
  end

  defp active_dashboard_link?(current_url, path) do
    String.starts_with?(current_url, path)
  end
end
