defmodule BusiApi.Directory.Producto do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :integer, []}

  schema "productos" do
    field :descripcion, :string
    field :nombre, :string
    field :precio_unidad, :integer

    timestamps()
  end

  @doc false
  def changeset(producto, attrs) do
    producto
    |> cast(attrs, [:id, :nombre, :descripcion, :precio_unidad])
    |> validate_required([:id, :nombre, :descripcion, :precio_unidad])
  end
end
