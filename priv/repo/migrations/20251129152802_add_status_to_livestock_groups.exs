defmodule Mce.Repo.Migrations.AddStatusToLivestockGroups do
  use Ecto.Migration

  def change do
    alter table(:livestock_groups) do
      add :status, :string, default: "draft"
      add :wizard_step, :string, default: "basic_info"
    end

    # Create index for filtering by status
    create index(:livestock_groups, [:status])

    # Update existing records to be "complete"
    execute "UPDATE livestock_groups SET status = 'complete', wizard_step = 'complete'"
  end
end
