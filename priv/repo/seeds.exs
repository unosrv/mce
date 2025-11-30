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

# Create default admin user
alias Mce.{Accounts, Repo}

admin_email = "admin@anysite.com"

case Accounts.get_user_by_email(admin_email) do
  nil ->
    IO.puts("\nCreating default admin user...")

    # Register the admin user
    {:ok, user} =
      Accounts.register_user(%{
        email: admin_email,
        password: "AdminPassword123!",
        nickname: "Admin"
      })

    # Set is_admin and confirm the account
    user
    |> Ecto.Changeset.change(%{is_admin: true, confirmed_at: DateTime.utc_now(:second)})
    |> Repo.update!()

    IO.puts("Admin user created: #{admin_email}")

  existing_user ->
    IO.puts("\nAdmin user already exists: #{admin_email}")

    # Ensure admin is confirmed and has admin flag
    if !existing_user.is_admin or is_nil(existing_user.confirmed_at) do
      existing_user
      |> Ecto.Changeset.change(%{is_admin: true, confirmed_at: DateTime.utc_now(:second)})
      |> Repo.update!()

      IO.puts("Admin user updated with admin privileges and confirmed")
    end
end

IO.puts("\nAll seeds loaded successfully!")
