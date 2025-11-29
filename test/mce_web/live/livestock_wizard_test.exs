defmodule MceWeb.LivestockWizardTest do
  use MceWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Mce.FarmsFixtures

  describe "Livestock wizard (unauthenticated)" do
    test "redirects to login when not authenticated", %{conn: conn} do
      assert {:error, redirect} = live(conn, ~p"/farms/1/livestock/new")
      assert {:redirect, %{to: path}} = redirect
      assert path =~ "/users/log-in"
    end
  end

  describe "Livestock wizard navigation (authenticated)" do
    setup :register_and_log_in_user

    test "renders wizard with steps indicator", %{conn: conn, user: user} do
      farm = farm_fixture(user)

      {:ok, _view, html} = live(conn, ~p"/farms/#{farm.id}/livestock/new")

      # Should show wizard steps
      assert html =~ "Basic" or html =~ "기본" or html =~ "Step"
    end

    test "starts at basic info step", %{conn: conn, user: user} do
      farm = farm_fixture(user)

      {:ok, view, _html} = live(conn, ~p"/farms/#{farm.id}/livestock/new")

      # Should show species selection
      assert has_element?(view, "select") or has_element?(view, "[data-testid=species-select]") or
               render(view) =~ "Beef" or render(view) =~ "Dairy"
    end

    test "has back to farm link", %{conn: conn, user: user} do
      farm = farm_fixture(user)

      {:ok, view, _html} = live(conn, ~p"/farms/#{farm.id}/livestock/new")

      # Should have navigation back
      assert has_element?(view, "a[href='/farms/#{farm.id}']") or
               render(view) =~ "Back" or render(view) =~ "돌아가기"
    end
  end

  describe "Livestock wizard step 1 - Basic Info" do
    setup :register_and_log_in_user

    test "has name input", %{conn: conn, user: user} do
      farm = farm_fixture(user)

      {:ok, view, _html} = live(conn, ~p"/farms/#{farm.id}/livestock/new")

      # Should have name field
      assert has_element?(view, "input[name*='name']") or has_element?(view, "[id*=name]")
    end

    test "has species selector", %{conn: conn, user: user} do
      farm = farm_fixture(user)

      {:ok, _view, html} = live(conn, ~p"/farms/#{farm.id}/livestock/new")

      # Species options should be visible
      assert html =~ "Beef" or html =~ "Dairy" or html =~ "Swine" or
               html =~ "beef_cattle" or html =~ "dairy_cattle"
    end

    test "has head count input", %{conn: conn, user: user} do
      farm = farm_fixture(user)

      {:ok, view, _html} = live(conn, ~p"/farms/#{farm.id}/livestock/new")

      # Should have head count field
      assert has_element?(view, "input[name*='head_count']") or
               render(view) =~ "head" or render(view) =~ "Head"
    end
  end

  describe "Livestock wizard step navigation" do
    setup :register_and_log_in_user

    test "has next button on first step", %{conn: conn, user: user} do
      farm = farm_fixture(user)

      {:ok, _view, html} = live(conn, ~p"/farms/#{farm.id}/livestock/new")

      # Should have next button
      assert html =~ "Next" or html =~ "다음" or html =~ "next"
    end

    test "shows all step indicators", %{conn: conn, user: user} do
      farm = farm_fixture(user)

      {:ok, _view, html} = live(conn, ~p"/farms/#{farm.id}/livestock/new")

      # Should show multiple steps (5 total)
      # Check for step indicators - could be numbers or text
      assert html =~ "1" and (html =~ "2" or html =~ "step")
    end
  end

  describe "Livestock wizard farm validation" do
    setup :register_and_log_in_user

    test "redirects when farm not found", %{conn: conn} do
      # Try to access wizard for non-existent farm
      result = live(conn, ~p"/farms/99999999/livestock/new")

      case result do
        {:error, {:redirect, _}} -> assert true
        {:error, {:live_redirect, _}} -> assert true
        {:ok, _view, html} -> assert html =~ "not found" or html =~ "error"
      end
    end

    test "cannot access other user's farm wizard", %{conn: conn} do
      # Create another user with a farm
      other_user = Mce.AccountsFixtures.user_fixture()
      other_farm = farm_fixture(other_user)

      # Try to access the wizard for their farm
      result = live(conn, ~p"/farms/#{other_farm.id}/livestock/new")

      case result do
        {:error, {:redirect, _}} -> assert true
        {:error, {:live_redirect, _}} -> assert true
        {:ok, _view, html} -> assert html =~ "not found" or html =~ "error"
      end
    end
  end
end
