defmodule BusiApi.Directory.Venta do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :integer, []}

  schema "ventas" do
    field :fecha, :date
    field :valor, :integer
    field :tienda_id, :id

    timestamps()
  end

  @doc false
  def changeset(venta, attrs) do
    venta
    |> cast(attrs, [:id, :fecha, :valor])
    |> validate_required([:id, :fecha, :valor])
  end
end
