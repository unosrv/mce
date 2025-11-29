defmodule Mce.Repo.Migrations.CreateFarms do
  use Ecto.Migration

  def change do
    create table(:farms) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :name, :string, null: false
      add :country, :string, size: 2, null: false

      # Address fields (flexible for different countries)
      add :address_line1, :string, size: 500
      add :address_line2, :string, size: 500
      add :city, :string
      add :state_province, :string
      add :postal_code, :string, size: 20

      # Korean-specific (from juso.go.kr)
      add :road_address, :string, size: 500
      add :jibun_address, :string, size: 500
      add :building_name, :string

      # Coordinates (from Google Maps or juso.go.kr)
      add :latitude, :decimal, precision: 10, scale: 8
      add :longitude, :decimal, precision: 11, scale: 8

      # Fiscal year configuration
      add :fiscal_year_start_month, :integer, default: 1
      add :fiscal_year_start_day, :integer, default: 1

      # Branding (for PDF reports)
      add :logo_path, :string, size: 500

      timestamps(type: :utc_datetime)
    end

    create index(:farms, [:user_id])
    create index(:farms, [:country])
  end
end
