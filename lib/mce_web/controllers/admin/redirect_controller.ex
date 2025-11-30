defmodule MceWeb.Admin.RedirectController do
  use MceWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: ~p"/admin/users")
  end
end
