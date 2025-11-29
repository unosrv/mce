defmodule Mce.Repo.Migrations.AddNicknameToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :nickname, :string
    end

    create index(:users, [:nickname])
  end
end
