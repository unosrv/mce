defmodule MceWeb.I18nTest do
  @moduledoc """
  Tests for i18n functionality across locales (ko, en, pt_BR).
  """
  use MceWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Gettext, only: [with_locale: 2]

  alias MceWeb.Plugs.SetLocale

  # Helper to get translations in a specific locale
  defp gettext_in(locale, msgid) do
    with_locale(locale, fn ->
      Gettext.gettext(MceWeb.Gettext, msgid)
    end)
  end

  defp dgettext_in(locale, domain, msgid) do
    with_locale(locale, fn ->
      Gettext.dgettext(MceWeb.Gettext, domain, msgid)
    end)
  end

  defp dngettext_in(locale, domain, msgid, msgid_plural, n) do
    with_locale(locale, fn ->
      Gettext.dngettext(MceWeb.Gettext, domain, msgid, msgid_plural, n)
    end)
  end

  describe "Gettext translations" do
    test "Korean locale returns Korean translations" do
      assert gettext_in("ko", "Actions") == "작업"
      assert gettext_in("ko", "close") == "닫기"
      assert gettext_in("ko", "Email") == "이메일"
      assert gettext_in("ko", "Password") == "비밀번호"
      assert gettext_in("ko", "Log in") == "로그인"
      assert gettext_in("ko", "Dark theme") == "어두운 테마"
      assert gettext_in("ko", "Light theme") == "밝은 테마"
    end

    test "Korean locale returns Korean error messages" do
      assert dgettext_in("ko", "errors", "can't be blank") == "필수 입력 항목입니다"
      assert dgettext_in("ko", "errors", "has already been taken") == "이미 사용 중입니다"
      assert dgettext_in("ko", "errors", "is invalid") == "유효하지 않습니다"

      assert dgettext_in("ko", "errors", "does not match confirmation") ==
               "확인 값과 일치하지 않습니다"
    end

    test "Korean locale returns Korean pluralized messages" do
      # Korean has nplurals=1
      # Gettext interpolates %{count} with the actual number
      result =
        dngettext_in(
          "ko",
          "errors",
          "should be at least %{count} character(s)",
          "should be at least %{count} character(s)",
          12
        )

      assert result == "최소 12자 이상이어야 합니다"
    end

    test "English locale falls back to msgid (source text)" do
      # Empty msgstr means fallback to msgid
      assert gettext_in("en", "Actions") == "Actions"
      assert gettext_in("en", "close") == "close"
      assert gettext_in("en", "Email") == "Email"
      assert gettext_in("en", "Password") == "Password"
    end

    test "English locale error messages fall back to msgid" do
      assert dgettext_in("en", "errors", "can't be blank") == "can't be blank"
      assert dgettext_in("en", "errors", "is invalid") == "is invalid"
    end

    test "Portuguese locale falls back to msgid (source text)" do
      # Empty msgstr means fallback to msgid
      assert gettext_in("pt_BR", "Actions") == "Actions"
      assert gettext_in("pt_BR", "Email") == "Email"
    end

    test "unknown locale falls back to default locale" do
      # Setting an unknown locale should still work (falls back to default)
      # Since source is English, unknown locale returns source
      assert gettext_in("de", "Actions") == "Actions"
    end
  end

  describe "SetLocale plug" do
    test "sets default locale (ko) when no session or header", %{conn: conn} do
      conn =
        conn
        |> init_test_session(%{})
        |> SetLocale.call([])

      assert get_session(conn, :locale) == "ko"
      assert conn.assigns.locale == "ko"
      assert Gettext.get_locale(MceWeb.Gettext) == "ko"
    end

    test "uses session locale if set", %{conn: conn} do
      conn =
        conn
        |> init_test_session(%{locale: "en"})
        |> SetLocale.call([])

      assert get_session(conn, :locale) == "en"
      assert conn.assigns.locale == "en"
      assert Gettext.get_locale(MceWeb.Gettext) == "en"
    end

    test "parses Accept-Language header for Korean", %{conn: conn} do
      conn =
        conn
        |> init_test_session(%{})
        |> put_req_header("accept-language", "ko-KR,ko;q=0.9,en;q=0.8")
        |> SetLocale.call([])

      assert get_session(conn, :locale) == "ko"
      assert conn.assigns.locale == "ko"
    end

    test "parses Accept-Language header for English", %{conn: conn} do
      conn =
        conn
        |> init_test_session(%{})
        |> put_req_header("accept-language", "en-US,en;q=0.9")
        |> SetLocale.call([])

      assert get_session(conn, :locale) == "en"
      assert conn.assigns.locale == "en"
    end

    test "parses Accept-Language header for Portuguese (Brazil)", %{conn: conn} do
      conn =
        conn
        |> init_test_session(%{})
        |> put_req_header("accept-language", "pt-BR,pt;q=0.9,en;q=0.8")
        |> SetLocale.call([])

      assert get_session(conn, :locale) == "pt_BR"
      assert conn.assigns.locale == "pt_BR"
    end

    test "handles Accept-Language with quality values", %{conn: conn} do
      # English has higher quality than Korean
      conn =
        conn
        |> init_test_session(%{})
        |> put_req_header("accept-language", "ko;q=0.5,en;q=0.9")
        |> SetLocale.call([])

      # English should be selected (higher q value)
      assert get_session(conn, :locale) == "en"
    end

    test "falls back to default for unsupported locale", %{conn: conn} do
      conn =
        conn
        |> init_test_session(%{})
        |> put_req_header("accept-language", "de-DE,de;q=0.9")
        |> SetLocale.call([])

      # German not supported, falls back to default
      assert get_session(conn, :locale) == "ko"
    end

    test "session locale takes precedence over Accept-Language", %{conn: conn} do
      conn =
        conn
        |> init_test_session(%{locale: "pt_BR"})
        |> put_req_header("accept-language", "en-US,en;q=0.9")
        |> SetLocale.call([])

      # Session should win
      assert get_session(conn, :locale) == "pt_BR"
      assert conn.assigns.locale == "pt_BR"
    end
  end

  describe "LiveLocale on_mount" do
    test "sets locale from session", %{conn: conn} do
      {:ok, _view, html} =
        conn
        |> init_test_session(%{locale: "ko"})
        |> log_in_user(user_fixture())
        |> live(~p"/farms")

      # The page should render (locale is set correctly)
      assert html =~ "farm" or html =~ "농장"
    end

    test "default locale is Korean when session empty", %{conn: conn} do
      conn =
        conn
        |> init_test_session(%{})
        |> log_in_user(user_fixture())

      {:ok, _view, _html} = live(conn, ~p"/farms")

      # Locale should be set to Korean default
      assert Gettext.get_locale(MceWeb.Gettext) == "ko"
    end
  end

  describe "error translations in forms" do
    test "validation errors are translated in Korean locale" do
      # Simulate a changeset with an error
      changeset =
        %Mce.Farms.Farm{}
        |> Ecto.Changeset.cast(%{name: ""}, [:name])
        |> Ecto.Changeset.validate_required([:name])

      # Get the error message
      {msg, _opts} = changeset.errors[:name]

      # When translated, should be Korean
      translated = dgettext_in("ko", "errors", msg)
      assert translated == "필수 입력 항목입니다"
    end

    test "validation errors are English when locale is en" do
      changeset =
        %Mce.Farms.Farm{}
        |> Ecto.Changeset.cast(%{name: ""}, [:name])
        |> Ecto.Changeset.validate_required([:name])

      {msg, _opts} = changeset.errors[:name]
      translated = dgettext_in("en", "errors", msg)

      # English falls back to msgid
      assert translated == "can't be blank"
    end
  end

  describe "supported locales" do
    test "all configured locales are valid" do
      locales = ~w(ko en pt_BR)

      for locale <- locales do
        Gettext.put_locale(MceWeb.Gettext, locale)
        assert Gettext.get_locale(MceWeb.Gettext) == locale
      end
    end

    test "gettext.pot file exists" do
      pot_path = "priv/gettext/default.pot"
      assert File.exists?(pot_path), "POT file should exist at #{pot_path}"
    end

    test "all locale directories have .po files" do
      locales = ~w(ko en pt_BR)

      for locale <- locales do
        default_po = "priv/gettext/#{locale}/LC_MESSAGES/default.po"
        errors_po = "priv/gettext/#{locale}/LC_MESSAGES/errors.po"

        assert File.exists?(default_po), "#{default_po} should exist"
        assert File.exists?(errors_po), "#{errors_po} should exist"
      end
    end
  end

  # Helper to create a test user
  defp user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "test#{System.unique_integer()}@example.com",
        password: "ValidPassword123!",
        nickname: "Test User"
      })
      |> Mce.Accounts.register_user()

    user
  end
end
