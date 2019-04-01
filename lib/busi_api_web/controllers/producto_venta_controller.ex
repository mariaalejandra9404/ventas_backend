defmodule BusiApiWeb.ProductoVentaController do
  use BusiApiWeb, :controller

  alias BusiApi.Directory
  alias BusiApi.Directory.ProductoVenta

  action_fallback BusiApiWeb.FallbackController

  def index(conn, _params) do
    productoventa = Directory.list_productoventa()
    render(conn, "index.json", productoventa: productoventa)
  end

  def create(conn, %{"producto_venta" => producto_venta_params}) do
    with {:ok, %ProductoVenta{} = producto_venta} <- Directory.create_producto_venta(producto_venta_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", producto_venta_path(conn, :show, producto_venta))
      |> render("show.json", producto_venta: producto_venta)
    end
  end

  def show(conn, %{"id" => id}) do
    producto_venta = Directory.get_producto_venta!(id)
    render(conn, "show.json", producto_venta: producto_venta)
  end

  def update(conn, %{"id" => id, "producto_venta" => producto_venta_params}) do
    producto_venta = Directory.get_producto_venta!(id)

    with {:ok, %ProductoVenta{} = producto_venta} <- Directory.update_producto_venta(producto_venta, producto_venta_params) do
      render(conn, "show.json", producto_venta: producto_venta)
    end
  end

  def delete(conn, %{"id" => id}) do
    producto_venta = Directory.get_producto_venta!(id)
    with {:ok, %ProductoVenta{}} <- Directory.delete_producto_venta(producto_venta) do
      send_resp(conn, :no_content, "")
    end
  end
end
