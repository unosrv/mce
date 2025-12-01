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

  ## Dangerous Operations (Use with caution!)

  Truncate all data (keeps schema, removes all rows):
      bin/mce eval "Mce.Release.truncate_all"

  Hard reset (DROP all tables, re-run migrations, re-seed):
      bin/mce eval "Mce.Release.reset"

  Drop all tables only:
      bin/mce eval "Mce.Release.drop_all"
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

  # ===========================================================================
  # Dangerous Operations - Use with extreme caution!
  # ===========================================================================

  @doc """
  DANGEROUS: Truncates all tables, removing all data but keeping the schema.
  This is safer than drop_all as it preserves table structure.

  Use case: Clear all data and re-seed without dropping tables.
  """
  def truncate_all do
    load_app()

    for repo <- repos() do
      {:ok, _, _} =
        Ecto.Migrator.with_repo(repo, fn repo ->
          # Get all tables except schema_migrations
          tables = get_all_tables(repo)

          IO.puts("WARNING: About to truncate #{length(tables)} tables...")
          IO.puts("Tables: #{Enum.join(tables, ", ")}")

          # Truncate each table with CASCADE to handle foreign keys
          Enum.each(tables, fn table ->
            IO.puts("Truncating #{table}...")
            Ecto.Adapters.SQL.query!(repo, "TRUNCATE TABLE \"#{table}\" CASCADE")
          end)

          IO.puts("Done! All tables truncated.")
        end)
    end
  end

  @doc """
  DANGEROUS: Drops all tables in the database.
  This removes all data AND schema. Use reset/0 to also re-run migrations and seeds.

  Warning: This is irreversible! Make sure you have backups.
  """
  def drop_all do
    load_app()

    for repo <- repos() do
      {:ok, _, _} =
        Ecto.Migrator.with_repo(repo, fn repo ->
          IO.puts("WARNING: Dropping all tables...")

          # Drop all tables using CASCADE
          Ecto.Adapters.SQL.query!(repo, """
          DO $$ DECLARE
            r RECORD;
          BEGIN
            FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') LOOP
              EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE';
            END LOOP;
          END $$;
          """)

          IO.puts("Done! All tables dropped.")
        end)
    end
  end

  @doc """
  DANGEROUS: Performs a complete database reset.
  Equivalent to: mix ecto.reset

  1. Drops all tables
  2. Runs all migrations
  3. Runs seeds

  Warning: This is irreversible! Make sure you have backups.
  """
  def reset do
    IO.puts("=== HARD RESET: Dropping all tables ===")
    drop_all()

    IO.puts("\n=== Running migrations ===")
    migrate()

    IO.puts("\n=== Running seeds ===")
    seed()

    IO.puts("\n=== Reset complete! ===")
  end

  @doc """
  Clears all data and re-seeds. Keeps the schema intact.
  Safer alternative to reset/0.

  1. Truncates all tables (keeps schema)
  2. Runs seeds
  """
  def reseed do
    IO.puts("=== Truncating all tables ===")
    truncate_all()

    IO.puts("\n=== Running seeds ===")
    seed()

    IO.puts("\n=== Reseed complete! ===")
  end

  defp get_all_tables(repo) do
    query = """
    SELECT tablename FROM pg_tables
    WHERE schemaname = 'public'
    AND tablename != 'schema_migrations'
    """

    %{rows: rows} = Ecto.Adapters.SQL.query!(repo, query)
    Enum.map(rows, fn [table] -> table end)
  end
end
