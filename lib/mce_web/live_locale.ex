defmodule MceWeb.LiveLocale do
  @moduledoc """
  LiveView hook to set the locale from session.

  Usage in router.ex:
      live_session :authenticated,
        on_mount: [{MceWeb.LiveLocale, :default}] do
        # routes...
      end
  """
  import Phoenix.Component

  @default_locale "ko"

  def on_mount(:default, _params, session, socket) do
    locale = session["locale"] || @default_locale
    Gettext.put_locale(MceWeb.Gettext, locale)
    {:cont, assign(socket, :locale, locale)}
  end
end
