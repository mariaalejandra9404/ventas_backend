defmodule BusiApiWeb.ProductoController do
  use BusiApiWeb, :controller

  alias BusiApi.Directory
  alias BusiApi.Directory.Producto

  action_fallback BusiApiWeb.FallbackController

  def index(conn, _params) do
    productos = Directory.list_productos()
    render(conn, "index.json", productos: productos)
  end

  def create(conn, %{"producto" => producto_params}) do
    with {:ok, %Producto{} = producto} <- Directory.create_producto(producto_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", producto_path(conn, :show, producto))
      |> render("show.json", producto: producto)
    end
  end

  def show(conn, %{"id" => id}) do
    producto = Directory.get_producto!(id)
    render(conn, "show.json", producto: producto)
  end

  def update(conn, %{"id" => id, "producto" => producto_params}) do
    producto = Directory.get_producto!(id)

    with {:ok, %Producto{} = producto} <- Directory.update_producto(producto, producto_params) do
      render(conn, "show.json", producto: producto)
    end
  end

  def delete(conn, %{"id" => id}) do
    producto = Directory.get_producto!(id)
    with {:ok, %Producto{}} <- Directory.delete_producto(producto) do
      send_resp(conn, :no_content, "")
    end
  end
end
