defmodule Mce.I18n.UnitsTest do
  use ExUnit.Case, async: true

  alias Mce.I18n.Units

  describe "format_weight/2" do
    test "formats kg for Korean locale" do
      assert Units.format_weight(100, "ko") == "100 kg"
      assert Units.format_weight(55.5, "ko") == "55.5 kg"
    end

    test "formats lbs for English locale" do
      # 100 kg * 2.20462 = 220.462 lbs
      assert Units.format_weight(100, "en") == "220.5 lbs"
    end

    test "formats kg for Brazilian Portuguese locale" do
      assert Units.format_weight(100, "pt_BR") == "100 kg"
    end

    test "handles nil value" do
      assert Units.format_weight(nil, "ko") == "-"
    end

    test "handles Decimal values" do
      assert Units.format_weight(Decimal.new("100.5"), "ko") == "100.5 kg"
    end
  end

  describe "format_area/2" do
    test "formats hectares for Korean locale" do
      assert Units.format_area(10, "ko") == "10 ha"
      assert Units.format_area(5.55, "ko") == "5.55 ha"
    end

    test "formats acres for English locale" do
      # 10 hectares * 2.47105 = 24.7105 acres
      assert Units.format_area(10, "en") == "24.71 ac"
    end

    test "handles nil value" do
      assert Units.format_area(nil, "ko") == "-"
    end
  end

  describe "format_temperature/2" do
    test "formats Celsius for Korean locale" do
      assert Units.format_temperature(25, "ko") == "25°C"
      assert Units.format_temperature(18.5, "ko") == "18.5°C"
    end

    test "formats Fahrenheit for English locale" do
      # 25°C * 9/5 + 32 = 77°F
      assert Units.format_temperature(25, "en") == "77.0°F"
      # 0°C = 32°F
      assert Units.format_temperature(0, "en") == "32.0°F"
    end

    test "handles nil value" do
      assert Units.format_temperature(nil, "ko") == "-"
    end
  end

  describe "format_volume/2" do
    test "formats litres for Korean locale" do
      assert Units.format_volume(100, "ko") == "100 L"
    end

    test "formats gallons for English locale" do
      # 100 litres * 0.264172 = 26.4172 gallons
      assert Units.format_volume(100, "en") == "26.4 gal"
    end

    test "handles nil value" do
      assert Units.format_volume(nil, "ko") == "-"
    end
  end

  describe "to_kg/2" do
    test "returns kg as-is for metric locales" do
      assert Units.to_kg(100, "ko") == 100
      assert Units.to_kg(100, "pt_BR") == 100
    end

    test "converts lbs to kg for English locale" do
      # 100 lbs / 2.20462 ≈ 45.36 kg
      result = Units.to_kg(100, "en")
      assert_in_delta result, 45.36, 0.01
    end

    test "handles nil value" do
      assert Units.to_kg(nil, "en") == nil
    end
  end

  describe "to_hectares/2" do
    test "returns hectares as-is for metric locales" do
      assert Units.to_hectares(10, "ko") == 10
    end

    test "converts acres to hectares for English locale" do
      # 10 acres / 2.47105 ≈ 4.047 hectares
      result = Units.to_hectares(10, "en")
      assert_in_delta result, 4.047, 0.01
    end

    test "handles nil value" do
      assert Units.to_hectares(nil, "en") == nil
    end
  end

  describe "to_celsius/2" do
    test "returns Celsius as-is for metric locales" do
      assert Units.to_celsius(25, "ko") == 25
    end

    test "converts Fahrenheit to Celsius for English locale" do
      # (77 - 32) * 5/9 = 25°C
      result = Units.to_celsius(77, "en")
      assert_in_delta result, 25.0, 0.1
      # 32°F = 0°C
      assert Units.to_celsius(32, "en") == 0.0
    end

    test "handles nil value" do
      assert Units.to_celsius(nil, "en") == nil
    end
  end

  describe "display_unit/2" do
    test "returns correct unit symbols for Korean locale" do
      assert Units.display_unit("ko", :weight) == "kg"
      assert Units.display_unit("ko", :area) == "ha"
      assert Units.display_unit("ko", :temp) == "°C"
      assert Units.display_unit("ko", :volume) == "L"
    end

    test "returns correct unit symbols for English locale" do
      assert Units.display_unit("en", :weight) == "lbs"
      assert Units.display_unit("en", :area) == "ac"
      assert Units.display_unit("en", :temp) == "°F"
      assert Units.display_unit("en", :volume) == "gal"
    end
  end

  describe "metric?/1" do
    test "returns true for metric locales" do
      assert Units.metric?("ko") == true
      assert Units.metric?("pt_BR") == true
    end

    test "returns false for imperial locales" do
      assert Units.metric?("en") == false
    end

    test "defaults to metric for unknown locales" do
      assert Units.metric?("unknown") == true
    end
  end
end
