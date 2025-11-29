defmodule MceWeb.CompareLiveTest do
  use MceWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Mce.FarmsFixtures

  describe "CompareLive.Index (unauthenticated)" do
    test "redirects to login when not authenticated", %{conn: conn} do
      assert {:error, redirect} = live(conn, ~p"/compare")
      assert {:redirect, %{to: path}} = redirect
      assert path =~ "/users/log-in"
    end
  end

  describe "CompareLive.Index (authenticated)" do
    setup :register_and_log_in_user

    test "renders comparison page", %{conn: conn} do
      {:ok, _view, html} = live(conn, ~p"/compare")

      assert html =~ "Compare" or html =~ "compare" or html =~ "Comparison"
    end

    test "lists farms for comparison when user has farms", %{conn: conn, user: user} do
      farm1 = farm_fixture(user, %{name: "Compare Farm 1"})
      farm2 = farm_fixture(user, %{name: "Compare Farm 2"})

      {:ok, _view, html} = live(conn, ~p"/compare")

      assert html =~ farm1.name or html =~ farm2.name
    end

    test "has farm selection interface", %{conn: conn, user: user} do
      _farm = farm_fixture(user, %{name: "Selection Test Farm"})

      {:ok, view, _html} = live(conn, ~p"/compare")

      # Should have farm selection UI with badge showing count
      assert has_element?(view, ".badge")
    end
  end
end
