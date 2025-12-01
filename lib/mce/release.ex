defmodule Mce.Release do
  @moduledoc """
  Used for executing DB release tasks when run in production without Mix installed.

  ## Usage

  Run migrations:
      bin/mce eval "Mce.Release.migrate"

  Run seeds:
      bin/mce eval "Mce.Release.seed"

  Run both migrations and seeds:
      bin/mce eval "Mce.Release.setup"

  Rollback to a specific version:
      bin/mce eval "Mce.Release.rollback(Mce.Repo, 20241201000000)"
  """
  @app :mce

  @doc """
  Runs all pending migrations.
  """
  def migrate do
    load_app()

    for repo <- repos() do
      {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
    end
  end

  @doc """
  Rolls back the database to a specific migration version.
  """
  def rollback(repo, version) do
    load_app()
    {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version))
  end

  @doc """
  Runs the seeds file to populate the database with initial data.
  """
  def seed do
    load_app()

    for repo <- repos() do
      {:ok, _, _} =
        Ecto.Migrator.with_repo(repo, fn _repo ->
          seeds_file = priv_path_for(repo, "seeds.exs")

          if File.exists?(seeds_file) do
            Code.eval_file(seeds_file)
          end
        end)
    end
  end

  @doc """
  Runs migrations and then seeds. Convenience function for initial setup.
  """
  def setup do
    migrate()
    seed()
  end

  defp repos do
    Application.fetch_env!(@app, :ecto_repos)
  end

  defp load_app do
    # Many platforms require SSL when connecting to the database
    Application.ensure_all_started(:ssl)
    Application.ensure_loaded(@app)
  end

  defp priv_path_for(repo, filename) do
    app = Keyword.get(repo.config(), :otp_app)
    priv_dir = Application.app_dir(app, "priv")
    Path.join([priv_dir, "repo", filename])
  end
end
