defmodule BusiApi.Repo.Migrations.CreateProductoventa do
  use Ecto.Migration

  def change do
    create table(:productoventa, primary_key: false) do
      add :id, :integer, primary_key: true
      add :cantidad, :integer
      add :producto_id, references(:productos, on_delete: :nothing)
      add :venta_id, references(:ventas, on_delete: :nothing)

      timestamps()
    end

    create index(:productoventa, [:producto_id])
    create index(:productoventa, [:venta_id])
  end
end
