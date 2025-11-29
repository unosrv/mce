defmodule MceWeb.PageController do
  use MceWeb, :controller

  def home(conn, _params) do
    conn
    |> assign(:hide_root_nav, true)
    |> render(:home)
  end
end
