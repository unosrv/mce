defmodule Mce.I18n.Units do
  @moduledoc """
  Unit conversion module for locale-aware formatting.

  Supports:
  - Weight: kg (metric) <-> lbs (imperial)
  - Area: hectares (metric) <-> acres (imperial)
  - Temperature: Celsius <-> Fahrenheit
  - Volume: litres <-> gallons
  """

  @locale_units %{
    "ko" => %{weight: :kg, area: :hectares, temp: :celsius, volume: :litres},
    "en" => %{weight: :lbs, area: :acres, temp: :fahrenheit, volume: :gallons},
    "pt_BR" => %{weight: :kg, area: :hectares, temp: :celsius, volume: :litres}
  }

  @doc """
  Format weight value based on locale.
  Internal storage is always in kg.
  """
  def format_weight(kg, locale) when is_number(kg) do
    case get_unit(locale, :weight) do
      :kg -> "#{round_value(kg, 1)} kg"
      :lbs -> "#{round_value(kg * 2.20462, 1)} lbs"
    end
  end

  def format_weight(%Decimal{} = kg, locale) do
    format_weight(Decimal.to_float(kg), locale)
  end

  def format_weight(nil, _locale), do: "-"

  @doc """
  Format area value based on locale.
  Internal storage is always in hectares.
  """
  def format_area(hectares, locale) when is_number(hectares) do
    case get_unit(locale, :area) do
      :hectares -> "#{round_value(hectares, 2)} ha"
      :acres -> "#{round_value(hectares * 2.47105, 2)} ac"
    end
  end

  def format_area(nil, _locale), do: "-"

  @doc """
  Format temperature value based on locale.
  Internal storage is always in Celsius.
  """
  def format_temperature(celsius, locale) when is_number(celsius) do
    case get_unit(locale, :temp) do
      :celsius -> "#{round_value(celsius, 1)}°C"
      :fahrenheit -> "#{round_value(celsius * 9 / 5 + 32, 1)}°F"
    end
  end

  def format_temperature(nil, _locale), do: "-"

  @doc """
  Format volume value based on locale.
  Internal storage is always in litres.
  """
  def format_volume(litres, locale) when is_number(litres) do
    case get_unit(locale, :volume) do
      :litres -> "#{round_value(litres, 1)} L"
      :gallons -> "#{round_value(litres * 0.264172, 1)} gal"
    end
  end

  def format_volume(nil, _locale), do: "-"

  @doc """
  Convert input weight to kg for storage.
  """
  def to_kg(value, locale) when is_number(value) do
    case get_unit(locale, :weight) do
      :kg -> value
      :lbs -> value / 2.20462
    end
  end

  def to_kg(nil, _locale), do: nil

  @doc """
  Convert input area to hectares for storage.
  """
  def to_hectares(value, locale) when is_number(value) do
    case get_unit(locale, :area) do
      :hectares -> value
      :acres -> value / 2.47105
    end
  end

  def to_hectares(nil, _locale), do: nil

  @doc """
  Convert input temperature to Celsius for storage.
  """
  def to_celsius(value, locale) when is_number(value) do
    case get_unit(locale, :temp) do
      :celsius -> value
      :fahrenheit -> (value - 32) * 5 / 9
    end
  end

  def to_celsius(nil, _locale), do: nil

  @doc """
  Get the display unit for a given type and locale.
  """
  def display_unit(locale, type) do
    case get_unit(locale, type) do
      :kg -> "kg"
      :lbs -> "lbs"
      :hectares -> "ha"
      :acres -> "ac"
      :celsius -> "°C"
      :fahrenheit -> "°F"
      :litres -> "L"
      :gallons -> "gal"
      unit -> to_string(unit)
    end
  end

  @doc """
  Check if a locale uses metric system.
  """
  def metric?(locale) do
    get_unit(locale, :weight) == :kg
  end

  # Private helpers

  defp get_unit(locale, type) do
    locale_config = Map.get(@locale_units, locale, @locale_units["ko"])
    Map.get(locale_config, type)
  end

  defp round_value(value, precision) when is_float(value) do
    Float.round(value, precision)
  end

  defp round_value(value, _precision) when is_integer(value), do: value

  defp round_value(%Decimal{} = value, precision) do
    value
    |> Decimal.round(precision)
    |> Decimal.to_float()
    |> Float.round(precision)
  end
end
