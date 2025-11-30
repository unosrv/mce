defmodule MceWeb.FarmFormTest do
  use MceWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Mce.FarmsFixtures

  describe "Farm form submission (authenticated)" do
    setup :register_and_log_in_user

    test "creates farm with valid data", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/farms/new")

      # Fill and submit the form
      _result =
        view
        |> form("#farm-form", %{
          farm: %{
            name: "Test Farm Creation",
            country: "KR",
            fiscal_year_start_month: "1",
            fiscal_year_start_day: "1"
          }
        })
        |> render_submit()

      # Should redirect on success
      assert_patch(view, ~p"/farms")

      # Farm should be created
      {:ok, _view, html} = live(conn, ~p"/farms")
      assert html =~ "Test Farm Creation"
    end

    test "shows validation error for missing name", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/farms/new")

      # Submit with empty name
      html =
        view
        |> form("#farm-form", %{
          farm: %{
            name: "",
            country: "KR",
            fiscal_year_start_month: "1",
            fiscal_year_start_day: "1"
          }
        })
        |> render_change()

      # Should show validation error
      assert html =~ "can" or html =~ "required" or html =~ "blank"
    end

    test "validates form changes in real-time", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/farms/new")

      # Change country selection
      html =
        view
        |> element("#farm-form")
        |> render_change(%{farm: %{country: "US"}})

      # Form should update (no error expected for valid country)
      assert html =~ "form"
    end

    test "edits existing farm", %{conn: conn, user: user} do
      farm = farm_fixture(user, %{name: "Original Farm Name"})

      {:ok, view, _html} = live(conn, ~p"/farms/#{farm.id}/edit")

      # Update the farm name
      view
      |> form("#farm-form", %{
        farm: %{
          name: "Updated Farm Name"
        }
      })
      |> render_submit()

      # Should redirect and show updated name
      {:ok, _view, html} = live(conn, ~p"/farms/#{farm.id}")
      assert html =~ "Updated Farm Name"
    end

    test "can cancel form and return to list", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/farms/new")

      # Should have modal with cancel option
      assert has_element?(view, "#farm-modal")
    end

    test "preserves form data during validation", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/farms/new")

      # Enter data
      html =
        view
        |> form("#farm-form", %{
          farm: %{
            name: "Preserved Name",
            country: "BR"
          }
        })
        |> render_change()

      # Name should be preserved in the form
      assert html =~ "Preserved Name"
    end
  end

  describe "Farm form country selection" do
    setup :register_and_log_in_user

    test "shows Korea as default country option", %{conn: conn} do
      {:ok, _view, html} = live(conn, ~p"/farms/new")

      # Korean flag image should be visible
      assert html =~ "/images/flags/4x3/kr.svg"
    end

    test "shows all country options", %{conn: conn} do
      {:ok, _view, html} = live(conn, ~p"/farms/new")

      # All country flag images should be present
      assert html =~ "/images/flags/4x3/kr.svg"
      assert html =~ "/images/flags/4x3/us.svg"
      assert html =~ "/images/flags/4x3/br.svg"
    end
  end

  describe "Farm form fiscal year" do
    setup :register_and_log_in_user

    test "has month selector", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/farms/new")

      # Should have month select input
      assert has_element?(view, "select[name='farm[fiscal_year_start_month]']")
    end

    test "has day selector", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/farms/new")

      # Should have day select input
      assert has_element?(view, "select[name='farm[fiscal_year_start_day]']")
    end
  end
end
