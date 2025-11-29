defmodule MceWeb.Router do
  use MceWeb, :router

  import MceWeb.UserAuth
  import Backpex.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {MceWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_scope_for_user
    plug :set_locale_from_params
    plug MceWeb.Plugs.SetLocale
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Handle locale query parameter
  defp set_locale_from_params(conn, _opts) do
    case conn.params["locale"] do
      locale when locale in ~w(ko en pt_BR) ->
        Plug.Conn.put_session(conn, :locale, locale)

      _ ->
        conn
    end
  end

  scope "/", MceWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  # scope "/api", MceWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:mce, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: MceWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Admin pipeline and routes

  pipeline :admin do
    plug MceWeb.Plugs.AdminAuth
  end

  scope "/admin", MceWeb.Admin do
    pipe_through [:browser, :require_authenticated_user, :admin]

    backpex_routes()

    live_session :admin,
      on_mount: [
        {MceWeb.UserAuth, :mount_current_scope},
        Backpex.InitAssigns
      ] do
      live_resources "/users", UserLive
      live_resources "/farms", FarmLive
      live_resources "/livestock-groups", LivestockGroupLive
    end
  end

  ## Authentication routes

  scope "/", MceWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/users/register", UserRegistrationController, :new
    post "/users/register", UserRegistrationController, :create
  end

  scope "/", MceWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/users/settings", UserSettingsController, :edit
    put "/users/settings", UserSettingsController, :update
    get "/users/settings/confirm-email/:token", UserSettingsController, :confirm_email
  end

  scope "/", MceWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :authenticated_user,
      on_mount: [
        {MceWeb.UserAuth, :mount_current_scope},
        {MceWeb.LiveLocale, :default}
      ] do
      # Dashboard
      live "/dashboard", DashboardLive.Index, :index

      # Farm Comparison
      live "/compare", CompareLive.Index, :index

      # Farm Management
      live "/farms", FarmLive.Index, :index
      live "/farms/new", FarmLive.Index, :new
      live "/farms/:id/edit", FarmLive.Index, :edit
      live "/farms/:id", FarmLive.Show, :show
      live "/farms/:id/show/edit", FarmLive.Show, :edit

      # Livestock Management
      live "/farms/:farm_id/livestock/new", LivestockLive.WizardLive, :new
      live "/farms/:farm_id/livestock/:id/edit", LivestockLive.WizardLive, :edit

      # Emissions Reports
      live "/farms/:farm_id/emissions", EmissionsLive.Show, :show
    end
  end

  scope "/", MceWeb do
    pipe_through [:browser]

    get "/users/log-in", UserSessionController, :new
    get "/users/log-in/:token", UserSessionController, :confirm
    post "/users/log-in", UserSessionController, :create
    delete "/users/log-out", UserSessionController, :delete
  end
end
