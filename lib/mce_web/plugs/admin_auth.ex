defmodule MceWeb.Plugs.AdminAuth do
  @moduledoc """
  Plug to ensure only admin users can access admin routes.
  """
  import Plug.Conn
  import Phoenix.Controller

  def init(opts), do: opts

  def call(conn, _opts) do
    user = conn.assigns[:current_scope] && conn.assigns.current_scope.user

    if user && user.is_admin do
      conn
    else
      conn
      |> put_flash(:error, "You must be an administrator to access this page.")
      |> redirect(to: "/dashboard")
      |> halt()
    end
  end
end
