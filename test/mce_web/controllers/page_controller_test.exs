defmodule MceWeb.PageControllerTest do
  use MceWeb.ConnCase

  test "GET / displays MCE landing page", %{conn: conn} do
    conn = get(conn, ~p"/")
    response = html_response(conn, 200)
    assert response =~ "MCE"
    # Default locale is Korean, so check for Korean translations
    assert response =~ "메탄 탄소" or response =~ "Methane Carbon"
    assert response =~ "배출량 계산기" or response =~ "Emissions Calculator"
  end

  test "GET / has login and register links", %{conn: conn} do
    conn = get(conn, ~p"/")
    response = html_response(conn, 200)
    assert response =~ "/users/log-in"
    assert response =~ "/users/register"
  end
end
