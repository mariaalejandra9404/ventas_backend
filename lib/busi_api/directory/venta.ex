defmodule BusiApi.Directory.Venta do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :id, autogenerate: true}

  schema "ventas" do
    field :fecha, :date
    field :valor, :integer
    field :tienda_id, :id

    timestamps()
  end

  @doc false
  def changeset(venta, attrs) do
    venta
    |> cast(attrs, [:fecha, :valor, :tienda_id])
    |> validate_required([:fecha, :valor, :tienda_id])
  end
end
