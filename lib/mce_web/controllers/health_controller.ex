defmodule MceWeb.HealthController do
  @moduledoc """
  Health check endpoint for container orchestration.

  Used by Docker HEALTHCHECK, Kubernetes probes, and Dokploy
  to verify the application is running and healthy.
  """
  use MceWeb, :controller

  def index(conn, _params) do
    # Basic health check - just verify the app is responding
    # For more advanced checks, you could verify database connectivity:
    #   Mce.Repo.query!("SELECT 1")
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{status: "ok"}))
  end
end
