defmodule BusiApi.Directory.Tienda do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :id, autogenerate: true}
 
  schema "tiendas" do
    field :nombre, :string
    field :ubicacion, :string
    timestamps()
  end

  @doc false
  def changeset(tienda, attrs) do
    tienda
    |> cast(attrs, [:nombre, :ubicacion])
    |> validate_required([:nombre, :ubicacion])
  end
end
