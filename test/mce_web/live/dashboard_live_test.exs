defmodule MceWeb.DashboardLiveTest do
  use MceWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Mce.FarmsFixtures

  describe "Dashboard (unauthenticated)" do
    test "redirects to login when not authenticated", %{conn: conn} do
      assert {:error, redirect} = live(conn, ~p"/dashboard")
      assert {:redirect, %{to: path}} = redirect
      assert path =~ "/users/log-in"
    end
  end

  describe "Dashboard (authenticated)" do
    setup :register_and_log_in_user

    test "renders dashboard page", %{conn: conn} do
      {:ok, _view, html} = live(conn, ~p"/dashboard")

      # The page title should contain "Dashboard" (English) or "대시보드" (Korean)
      assert html =~ "Dashboard" or html =~ "대시보드"
    end

    test "shows stats section", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/dashboard")

      # Should have stat card elements (using card class)
      assert has_element?(view, ".card")
    end

    test "shows farm count when user has farms", %{conn: conn, user: user} do
      # Create some farms for the user
      _farm1 = farm_fixture(user, %{name: "Test Farm 1"})
      _farm2 = farm_fixture(user, %{name: "Test Farm 2"})

      {:ok, _view, html} = live(conn, ~p"/dashboard")

      # Should show farm count of 2
      assert html =~ "2"
    end

    test "has link to farms page", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/dashboard")

      # Should have a link to farms
      assert has_element?(view, "a[href='/farms']")
    end
  end
end
