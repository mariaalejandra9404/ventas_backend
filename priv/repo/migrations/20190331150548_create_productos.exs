defmodule BusiApi.Repo.Migrations.CreateProductos do
  use Ecto.Migration

  def change do
    create table(:productos, primary_key: false) do
      add :id, :integer, primary_key: true
      add :nombre, :string
      add :descripcion, :string
      add :precio_unidad, :integer

      timestamps()
    end

  end
end
