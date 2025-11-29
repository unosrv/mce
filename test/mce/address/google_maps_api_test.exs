defmodule Mce.Address.GoogleMapsApiTest do
  @moduledoc """
  Tests for Google Maps Places API client.

  These tests focus on:
  - Mock data functionality (default behaviour without API key)
  - Response parsing functions
  - Error handling
  """
  use ExUnit.Case, async: true

  alias Mce.Address.GoogleMapsApi

  describe "autocomplete with mock data" do
    test "returns empty list for empty input" do
      {:ok, results} = GoogleMapsApi.autocomplete("", "US")
      assert results == []
    end

    test "returns US mock addresses matching input" do
      {:ok, results} = GoogleMapsApi.autocomplete("Main", "US")

      assert length(results) > 0
      assert Enum.all?(results, fn r -> String.contains?(r.description, "Main") end)
    end

    test "returns BR mock addresses matching input" do
      {:ok, results} = GoogleMapsApi.autocomplete("Paulista", "BR")

      assert length(results) > 0
      assert Enum.all?(results, fn r -> String.contains?(r.description, "Paulista") end)
    end

    test "returns empty list for unknown country" do
      {:ok, results} = GoogleMapsApi.autocomplete("Test", "XX")
      assert results == []
    end

    test "filters mock addresses case-insensitively" do
      {:ok, results_upper} = GoogleMapsApi.autocomplete("MAIN", "US")
      {:ok, results_lower} = GoogleMapsApi.autocomplete("main", "US")

      # Both should return results (case-insensitive)
      assert length(results_upper) > 0
      assert length(results_lower) > 0
    end

    test "mock results have required fields" do
      {:ok, [first | _]} = GoogleMapsApi.autocomplete("Main", "US")

      assert Map.has_key?(first, :place_id)
      assert Map.has_key?(first, :description)
      assert Map.has_key?(first, :main_text)
      assert Map.has_key?(first, :secondary_text)
    end
  end

  describe "get_place_details with mock data" do
    test "returns address details for valid mock place_id" do
      {:ok, result} = GoogleMapsApi.get_place_details("mock_us_1")

      assert result.place_id == "mock_us_1"
      assert result.address_line1 == "123 Main Street"
      assert result.city == "San Francisco"
      assert result.state_province == "CA"
      assert result.postal_code == "94102"
      assert result.country == "US"
      assert result.latitude == 37.7749
      assert result.longitude == -122.4194
    end

    test "returns error for invalid place_id" do
      assert {:error, :not_found} = GoogleMapsApi.get_place_details("invalid_place_id")
    end

    test "returns Brazilian address details" do
      {:ok, result} = GoogleMapsApi.get_place_details("mock_br_1")

      assert result.place_id == "mock_br_1"
      assert result.city == "Sao Paulo"
      assert result.state_province == "SP"
      assert result.country == "BR"
    end

    test "address result has all expected fields" do
      {:ok, result} = GoogleMapsApi.get_place_details("mock_us_1")

      # Check all fields in the address_result type
      assert is_binary(result.place_id)
      assert is_binary(result.description)
      assert is_binary(result.address_line1) or is_nil(result.address_line1)
      assert is_nil(result.address_line2) or is_binary(result.address_line2)
      assert is_binary(result.city) or is_nil(result.city)
      assert is_binary(result.state_province) or is_nil(result.state_province)
      assert is_binary(result.postal_code) or is_nil(result.postal_code)
      assert is_binary(result.country) or is_nil(result.country)
      assert is_float(result.latitude) or is_nil(result.latitude)
      assert is_float(result.longitude) or is_nil(result.longitude)
    end
  end

  describe "mock data coverage" do
    test "has US mock addresses" do
      {:ok, results} = GoogleMapsApi.autocomplete("Street", "US")
      assert length(results) >= 1
    end

    test "has BR mock addresses" do
      {:ok, results} = GoogleMapsApi.autocomplete("Rua", "BR")
      assert length(results) >= 1
    end

    test "US mocks cover different cities" do
      # Test with broad search terms for different US cities
      {:ok, sf_results} = GoogleMapsApi.autocomplete("San Francisco", "US")
      {:ok, la_results} = GoogleMapsApi.autocomplete("Los Angeles", "US")
      {:ok, austin_results} = GoogleMapsApi.autocomplete("Austin", "US")

      assert length(sf_results) > 0 or length(la_results) > 0 or length(austin_results) > 0
    end

    test "BR mocks cover different cities" do
      {:ok, sp_results} = GoogleMapsApi.autocomplete("Sao Paulo", "BR")
      {:ok, rio_results} = GoogleMapsApi.autocomplete("Rio", "BR")

      assert length(sp_results) > 0 or length(rio_results) > 0
    end
  end

  describe "session token support" do
    test "autocomplete accepts session_token option" do
      # Should not raise with session_token option
      {:ok, _results} =
        GoogleMapsApi.autocomplete("Main", "US", session_token: "test-session-token")
    end

    test "get_place_details accepts session_token option" do
      {:ok, _result} =
        GoogleMapsApi.get_place_details("mock_us_1", session_token: "test-session-token")
    end
  end
end
