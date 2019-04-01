defmodule BusiApi.Directory.ProductoVenta do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :id, autogenerate: true}
  schema "productoventa" do
    field :cantidad, :integer
    field :producto_id, :id
    field :venta_id, :id

    timestamps()
  end

  @doc false
  def changeset(producto_venta, attrs) do
    producto_venta
    |> cast(attrs, [:cantidad, :producto_id,:venta_id])
    |> validate_required([:cantidad, :producto_id,:venta_id])
  end
end
