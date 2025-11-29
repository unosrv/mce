# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Mce.Repo.insert!(%Mce.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Load seed data files
seeds_path = Path.join(__DIR__, "seeds")

# IPCC Emission Factors (required for calculations)
Code.require_file("ipcc_emission_factors.exs", seeds_path)

# Feed Presets (reference data for each country)
Code.require_file("feed_presets.exs", seeds_path)

IO.puts("\nAll seeds loaded successfully!")
