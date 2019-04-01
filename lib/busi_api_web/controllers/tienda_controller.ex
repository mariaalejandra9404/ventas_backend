defmodule BusiApiWeb.TiendaController do
  use BusiApiWeb, :controller

  alias BusiApi.Directory
  alias BusiApi.Directory.Tienda

  action_fallback BusiApiWeb.FallbackController

  def index(conn, _params) do
    tiendas = Directory.list_tiendas()
    render(conn, "index.json", tiendas: tiendas)
  end

  def create(conn, %{"tienda" => tienda_params}) do
    with {:ok, %Tienda{} = tienda} <- Directory.create_tienda(tienda_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", tienda_path(conn, :show, tienda))
      |> render("show.json", tienda: tienda)
    end
  end

  def show(conn, %{"id" => id}) do
    tienda = Directory.get_tienda!(id)
    render(conn, "show.json", tienda: tienda)
  end

  def update(conn, %{"id" => id, "tienda" => tienda_params}) do
    tienda = Directory.get_tienda!(id)

    with {:ok, %Tienda{} = tienda} <- Directory.update_tienda(tienda, tienda_params) do
      render(conn, "show.json", tienda: tienda)
    end
  end

  def delete(conn, %{"id" => id}) do
    tienda = Directory.get_tienda!(id)
    with {:ok, %Tienda{}} <- Directory.delete_tienda(tienda) do
      send_resp(conn, :no_content, "")
    end
  end
end
