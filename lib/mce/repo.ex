defmodule Mce.Repo do
  use Ecto.Repo,
    otp_app: :mce,
    adapter: Ecto.Adapters.Postgres
end
