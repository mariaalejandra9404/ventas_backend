defmodule BusiApi.Repo.Migrations.CreateTiendas do
  use Ecto.Migration

  def change do
    create table(:tiendas, primary_key: false) do
      add :id, :integer, primary_key: true
      add :nombre, :string
      add :ubicacion, :text

      timestamps()
    end

  end
end
