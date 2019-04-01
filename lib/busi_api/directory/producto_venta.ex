defmodule BusiApi.Directory.ProductoVenta do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :integer, []}
  schema "productoventa" do
    field :cantidad, :integer
    field :producto_id, :id
    field :venta_id, :id

    timestamps()
  end

  @doc false
  def changeset(producto_venta, attrs) do
    producto_venta
    |> cast(attrs, [:id, :cantidad])
    |> validate_required([:id, :cantidad])
  end
end
