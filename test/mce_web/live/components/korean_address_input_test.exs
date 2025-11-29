defmodule MceWeb.Live.Components.KoreanAddressInputTest do
  @moduledoc """
  Tests for the KoreanAddressInput LiveComponent.

  These tests verify:
  - Component rendering
  - Event handling for address selection
  - Data transformation from JS camelCase to Elixir snake_case
  - Callback execution
  """
  use MceWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias MceWeb.Live.Components.KoreanAddressInput

  describe "rendering" do
    test "renders with default assigns" do
      html =
        render_component(KoreanAddressInput,
          id: "test-address"
        )

      # Check for essential elements
      assert html =~ ~s(id="test-address")
      assert html =~ ~s(data-postcode-trigger)
      assert html =~ "hero-magnifying-glass"
    end

    test "renders with custom label" do
      html =
        render_component(KoreanAddressInput,
          id: "test-address",
          label: "Farm Address"
        )

      assert html =~ "Farm Address"
    end

    test "renders with custom placeholder" do
      html =
        render_component(KoreanAddressInput,
          id: "test-address",
          placeholder: "Search for farm location"
        )

      assert html =~ "Search for farm location"
    end

    test "renders with hint text" do
      html =
        render_component(KoreanAddressInput,
          id: "test-address",
          hint: "Enter the road name address"
        )

      assert html =~ "Enter the road name address"
    end

    test "renders hidden fields when include_hidden_fields is true" do
      html =
        render_component(KoreanAddressInput,
          id: "test-address",
          include_hidden_fields: true,
          field_prefix: "farm"
        )

      assert html =~ ~s(name="farm[postal_code]")
      assert html =~ ~s(name="farm[road_address]")
      assert html =~ ~s(name="farm[jibun_address]")
      assert html =~ ~s(name="farm[sido]")
      assert html =~ ~s(name="farm[sigungu]")
    end

    test "does not render hidden fields by default" do
      html =
        render_component(KoreanAddressInput,
          id: "test-address"
        )

      refute html =~ ~s(name="address[postal_code]")
    end

    test "input is readonly by default" do
      html =
        render_component(KoreanAddressInput,
          id: "test-address"
        )

      assert html =~ "readonly"
      assert html =~ "bg-base-200"
    end

    test "input is editable when readonly is false" do
      html =
        render_component(KoreanAddressInput,
          id: "test-address",
          readonly: false
        )

      refute html =~ ~r/readonly[^=]/
    end
  end

  describe "address-selected event" do
    test "transforms camelCase params to snake_case" do
      # Simulate the JS event with camelCase params
      params = %{
        "roadAddress" => "서울특별시 강남구 테헤란로 152",
        "jibunAddress" => "서울특별시 강남구 역삼동 737",
        "postalCode" => "06236",
        "buildingName" => "강남파이낸스센터",
        "buildingCode" => "1168010100107370001",
        "sido" => "서울특별시",
        "sigungu" => "강남구",
        "bname" => "역삼동",
        "bcode" => "1168010100",
        "roadAddressEnglish" => "152, Teheran-ro, Gangnam-gu, Seoul",
        "jibunAddressEnglish" => "737, Yeoksam-dong, Gangnam-gu, Seoul",
        "addressType" => "R",
        "userSelectedType" => "R",
        "apartment" => false,
        "query" => "테헤란로 152"
      }

      # Create a socket with the component
      socket =
        %Phoenix.LiveView.Socket{}
        |> Phoenix.Component.assign(:id, "test-address")
        |> Phoenix.Component.assign(:value, "")
        |> Phoenix.Component.assign(:address_data, %{})
        |> Phoenix.Component.assign(:on_select, nil)
        |> Phoenix.Component.assign(:label, "Address")
        |> Phoenix.Component.assign(:placeholder, "Click to search")
        |> Phoenix.Component.assign(:hint, nil)
        |> Phoenix.Component.assign(:name, "address")
        |> Phoenix.Component.assign(:readonly, true)
        |> Phoenix.Component.assign(:include_hidden_fields, false)
        |> Phoenix.Component.assign(:field_prefix, "address")

      # Call handle_event directly
      {:noreply, updated_socket} =
        KoreanAddressInput.handle_event("address-selected", params, socket)

      address_data = updated_socket.assigns.address_data

      # Verify snake_case transformation
      assert address_data.road_address == "서울특별시 강남구 테헤란로 152"
      assert address_data.jibun_address == "서울특별시 강남구 역삼동 737"
      assert address_data.postal_code == "06236"
      assert address_data.building_name == "강남파이낸스센터"
      assert address_data.building_code == "1168010100107370001"
      assert address_data.sido == "서울특별시"
      assert address_data.sigungu == "강남구"
      assert address_data.bname == "역삼동"
      assert address_data.bcode == "1168010100"
      assert address_data.road_address_english == "152, Teheran-ro, Gangnam-gu, Seoul"
      assert address_data.jibun_address_english == "737, Yeoksam-dong, Gangnam-gu, Seoul"
      assert address_data.address_type == "R"
      assert address_data.user_selected_type == "R"
      assert address_data.apartment == false
      assert address_data.query == "테헤란로 152"
    end

    test "formats display value with building name" do
      params = %{
        "roadAddress" => "서울특별시 강남구 테헤란로 152",
        "jibunAddress" => "",
        "postalCode" => "06236",
        "buildingName" => "강남파이낸스센터",
        "buildingCode" => "",
        "sido" => "서울특별시",
        "sigungu" => "강남구",
        "bname" => "",
        "bcode" => "",
        "roadAddressEnglish" => "",
        "jibunAddressEnglish" => "",
        "addressType" => "R",
        "userSelectedType" => "R",
        "apartment" => false,
        "query" => ""
      }

      socket =
        %Phoenix.LiveView.Socket{}
        |> Phoenix.Component.assign(:id, "test-address")
        |> Phoenix.Component.assign(:value, "")
        |> Phoenix.Component.assign(:address_data, %{})
        |> Phoenix.Component.assign(:on_select, nil)
        |> Phoenix.Component.assign(:label, nil)
        |> Phoenix.Component.assign(:placeholder, nil)
        |> Phoenix.Component.assign(:hint, nil)
        |> Phoenix.Component.assign(:name, "address")
        |> Phoenix.Component.assign(:readonly, true)
        |> Phoenix.Component.assign(:include_hidden_fields, false)
        |> Phoenix.Component.assign(:field_prefix, "address")

      {:noreply, updated_socket} =
        KoreanAddressInput.handle_event("address-selected", params, socket)

      # Display value should include building name in parentheses
      assert updated_socket.assigns.value == "서울특별시 강남구 테헤란로 152 (강남파이낸스센터)"
    end

    test "formats display value without building name" do
      params = %{
        "roadAddress" => "서울특별시 강남구 테헤란로 152",
        "jibunAddress" => "",
        "postalCode" => "06236",
        "buildingName" => "",
        "buildingCode" => "",
        "sido" => "",
        "sigungu" => "",
        "bname" => "",
        "bcode" => "",
        "roadAddressEnglish" => "",
        "jibunAddressEnglish" => "",
        "addressType" => "R",
        "userSelectedType" => "R",
        "apartment" => false,
        "query" => ""
      }

      socket =
        %Phoenix.LiveView.Socket{}
        |> Phoenix.Component.assign(:id, "test-address")
        |> Phoenix.Component.assign(:value, "")
        |> Phoenix.Component.assign(:address_data, %{})
        |> Phoenix.Component.assign(:on_select, nil)
        |> Phoenix.Component.assign(:label, nil)
        |> Phoenix.Component.assign(:placeholder, nil)
        |> Phoenix.Component.assign(:hint, nil)
        |> Phoenix.Component.assign(:name, "address")
        |> Phoenix.Component.assign(:readonly, true)
        |> Phoenix.Component.assign(:include_hidden_fields, false)
        |> Phoenix.Component.assign(:field_prefix, "address")

      {:noreply, updated_socket} =
        KoreanAddressInput.handle_event("address-selected", params, socket)

      # Display value should be just the road address
      assert updated_socket.assigns.value == "서울특별시 강남구 테헤란로 152"
    end

    test "calls on_select callback with address data" do
      test_pid = self()

      callback = fn data ->
        send(test_pid, {:address_selected, data})
      end

      params = %{
        "roadAddress" => "서울특별시 강남구 테헤란로 152",
        "jibunAddress" => "",
        "postalCode" => "06236",
        "buildingName" => "",
        "buildingCode" => "",
        "sido" => "서울특별시",
        "sigungu" => "강남구",
        "bname" => "",
        "bcode" => "",
        "roadAddressEnglish" => "",
        "jibunAddressEnglish" => "",
        "addressType" => "R",
        "userSelectedType" => "R",
        "apartment" => false,
        "query" => ""
      }

      socket =
        %Phoenix.LiveView.Socket{}
        |> Phoenix.Component.assign(:id, "test-address")
        |> Phoenix.Component.assign(:value, "")
        |> Phoenix.Component.assign(:address_data, %{})
        |> Phoenix.Component.assign(:on_select, callback)
        |> Phoenix.Component.assign(:label, nil)
        |> Phoenix.Component.assign(:placeholder, nil)
        |> Phoenix.Component.assign(:hint, nil)
        |> Phoenix.Component.assign(:name, "address")
        |> Phoenix.Component.assign(:readonly, true)
        |> Phoenix.Component.assign(:include_hidden_fields, false)
        |> Phoenix.Component.assign(:field_prefix, "address")

      {:noreply, _updated_socket} =
        KoreanAddressInput.handle_event("address-selected", params, socket)

      # Verify callback was called
      assert_receive {:address_selected, data}
      assert data.road_address == "서울특별시 강남구 테헤란로 152"
      assert data.postal_code == "06236"
    end

    test "handles missing params gracefully" do
      # Minimal params - some fields might be missing
      params = %{
        "roadAddress" => "서울특별시 강남구 테헤란로 152",
        "postalCode" => "06236"
      }

      socket =
        %Phoenix.LiveView.Socket{}
        |> Phoenix.Component.assign(:id, "test-address")
        |> Phoenix.Component.assign(:value, "")
        |> Phoenix.Component.assign(:address_data, %{})
        |> Phoenix.Component.assign(:on_select, nil)
        |> Phoenix.Component.assign(:label, nil)
        |> Phoenix.Component.assign(:placeholder, nil)
        |> Phoenix.Component.assign(:hint, nil)
        |> Phoenix.Component.assign(:name, "address")
        |> Phoenix.Component.assign(:readonly, true)
        |> Phoenix.Component.assign(:include_hidden_fields, false)
        |> Phoenix.Component.assign(:field_prefix, "address")

      {:noreply, updated_socket} =
        KoreanAddressInput.handle_event("address-selected", params, socket)

      # Should default missing fields to empty strings
      assert updated_socket.assigns.address_data.road_address == "서울특별시 강남구 테헤란로 152"
      assert updated_socket.assigns.address_data.postal_code == "06236"
      assert updated_socket.assigns.address_data.jibun_address == ""
      assert updated_socket.assigns.address_data.building_name == ""
    end
  end

  describe "address-cancelled event" do
    test "handles cancel without error" do
      socket =
        %Phoenix.LiveView.Socket{}
        |> Phoenix.Component.assign(:id, "test-address")
        |> Phoenix.Component.assign(:value, "")
        |> Phoenix.Component.assign(:address_data, %{})

      {:noreply, updated_socket} =
        KoreanAddressInput.handle_event("address-cancelled", %{}, socket)

      # State should remain unchanged
      assert updated_socket.assigns.value == ""
      assert updated_socket.assigns.address_data == %{}
    end
  end
end
