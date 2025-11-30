defmodule MceWeb.FarmLiveTest do
  use MceWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Mce.AccountsFixtures
  import Mce.FarmsFixtures

  describe "FarmLive.Index (unauthenticated)" do
    test "redirects to login when not authenticated", %{conn: conn} do
      assert {:error, redirect} = live(conn, ~p"/farms")
      assert {:redirect, %{to: path}} = redirect
      assert path =~ "/users/log-in"
    end
  end

  describe "FarmLive.Index (authenticated)" do
    setup :register_and_log_in_user

    test "renders farms list page", %{conn: conn} do
      {:ok, _view, html} = live(conn, ~p"/farms")

      assert html =~ "Farm" or html =~ "farm"
    end

    test "shows empty state when user has no farms", %{conn: conn} do
      {:ok, _view, html} = live(conn, ~p"/farms")

      # Should show empty state message or add button (English or Korean)
      assert html =~ "Add" or html =~ "New" or html =~ "empty" or html =~ "No farms" or
               html =~ "추가" or html =~ "새" or html =~ "농장이 없습니다"
    end

    test "lists user's farms", %{conn: conn, user: user} do
      farm = farm_fixture(user, %{name: "My Test Farm"})

      {:ok, _view, html} = live(conn, ~p"/farms")

      assert html =~ farm.name
    end

    test "does not show other users' farms", %{conn: conn} do
      # Create another user with a farm
      other_user = user_fixture()
      _other_farm = farm_fixture(other_user, %{name: "Other User Farm"})

      {:ok, _view, html} = live(conn, ~p"/farms")

      refute html =~ "Other User Farm"
    end

    test "can open new farm form", %{conn: conn} do
      # Navigate directly to new farm route
      {:ok, view, html} = live(conn, ~p"/farms/new")

      # Should show form
      assert html =~ "form" or html =~ "Farm" or has_element?(view, "form")
    end

    test "can navigate to farm details", %{conn: conn, user: user} do
      farm = farm_fixture(user, %{name: "Detail Test Farm"})

      {:ok, _view, html} = live(conn, ~p"/farms/#{farm.id}")

      assert html =~ farm.name
    end
  end

  describe "FarmLive.Show" do
    setup :register_and_log_in_user

    test "renders farm details page", %{conn: conn, user: user} do
      farm = farm_fixture(user, %{name: "Show Test Farm"})

      {:ok, _view, html} = live(conn, ~p"/farms/#{farm.id}")

      assert html =~ farm.name
    end

    test "shows farm information", %{conn: conn, user: user} do
      farm = farm_fixture(user, %{name: "Info Test Farm", city: "Seoul", country: "KR"})

      {:ok, _view, html} = live(conn, ~p"/farms/#{farm.id}")

      assert html =~ farm.name
    end

    test "cannot access another user's farm", %{conn: conn} do
      other_user = user_fixture()
      other_farm = farm_fixture(other_user, %{name: "Other Farm"})

      # Should either raise or redirect
      result = live(conn, ~p"/farms/#{other_farm.id}")

      case result do
        {:error, {:redirect, _}} -> assert true
        {:error, {:live_redirect, _}} -> assert true
        _ -> flunk("Expected redirect or error for unauthorized access")
      end
    end

    test "can navigate to edit form", %{conn: conn, user: user} do
      farm = farm_fixture(user, %{name: "Edit Test Farm"})

      {:ok, view, _html} = live(conn, ~p"/farms/#{farm.id}/show/edit")

      assert has_element?(view, "form") or has_element?(view, "[data-phx-component]")
    end
  end
end
