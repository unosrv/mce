defmodule MceWeb.Plugs.SetLocale do
  @moduledoc """
  Plug to set the locale for the current request.

  Priority order:
  1. Session locale (user preference)
  2. Accept-Language header
  3. Default locale (ko)
  """
  import Plug.Conn

  @locales ~w(ko en pt_BR)
  @default_locale "ko"

  def init(opts), do: opts

  def call(conn, _opts) do
    locale =
      get_session(conn, :locale) ||
        get_preferred_locale(conn) ||
        @default_locale

    Gettext.put_locale(MceWeb.Gettext, locale)

    conn
    |> put_session(:locale, locale)
    |> assign(:locale, locale)
  end

  defp get_preferred_locale(conn) do
    conn
    |> get_req_header("accept-language")
    |> parse_accept_language()
    |> Enum.find(&(&1 in @locales))
  end

  defp parse_accept_language([]), do: []

  defp parse_accept_language([header | _]) do
    header
    |> String.split(",")
    |> Enum.map(&parse_language_tag/1)
    |> Enum.sort_by(fn {_lang, q} -> q end, :desc)
    |> Enum.map(fn {lang, _q} -> lang end)
  end

  defp parse_language_tag(tag) do
    case String.split(String.trim(tag), ";") do
      [lang] ->
        {normalize_locale(lang), 1.0}

      [lang, q_part] ->
        q =
          case Regex.run(~r/q=([\d.]+)/, q_part) do
            [_, q_str] -> String.to_float(q_str)
            _ -> 1.0
          end

        {normalize_locale(lang), q}
    end
  end

  defp normalize_locale(lang) do
    lang = String.trim(lang)

    cond do
      String.starts_with?(lang, "ko") -> "ko"
      String.starts_with?(lang, "pt") -> "pt_BR"
      String.starts_with?(lang, "en") -> "en"
      true -> lang
    end
  end
end
