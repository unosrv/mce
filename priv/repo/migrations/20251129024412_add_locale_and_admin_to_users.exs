defmodule Mce.Repo.Migrations.AddLocaleAndAdminToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :locale, :string, default: "ko"
      add :is_admin, :boolean, default: false
    end

    create index(:users, [:is_admin], where: "is_admin = TRUE")
  end
end
