defmodule BusiApi.Repo.Migrations.CreateVentas do
  use Ecto.Migration

  def change do
    create table(:ventas, primary_key: false) do
      add :id, :integer, primary_key: true
      add :fecha, :date
      add :valor, :integer
      add :tienda_id, references(:tiendas, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:ventas, [:tienda_id])
  end
end
