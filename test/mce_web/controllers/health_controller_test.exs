defmodule MceWeb.HealthControllerTest do
  use MceWeb.ConnCase, async: true

  describe "GET /health" do
    test "returns 200 with status ok", %{conn: conn} do
      conn = get(conn, "/health")

      assert json_response(conn, 200) == %{"status" => "ok"}
    end
  end
end
