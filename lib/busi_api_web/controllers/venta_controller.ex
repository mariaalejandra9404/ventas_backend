defmodule BusiApiWeb.VentaController do
  use BusiApiWeb, :controller

  alias BusiApi.Directory
  alias BusiApi.Directory.Venta

  action_fallback BusiApiWeb.FallbackController

  def index(conn, _params) do
    ventas = Directory.list_ventas()
    render(conn, "index.json", ventas: ventas)
  end

  def create(conn, %{"venta" => venta_params}) do
    with {:ok, %Venta{} = venta} <- Directory.create_venta(venta_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", venta_path(conn, :show, venta))
      |> render("show.json", venta: venta)
    end
  end

  def show(conn, %{"id" => id}) do
    venta = Directory.get_venta!(id)
    render(conn, "show.json", venta: venta)
  end

  def update(conn, %{"id" => id, "venta" => venta_params}) do
    venta = Directory.get_venta!(id)

    with {:ok, %Venta{} = venta} <- Directory.update_venta(venta, venta_params) do
      render(conn, "show.json", venta: venta)
    end
  end

  def delete(conn, %{"id" => id}) do
    venta = Directory.get_venta!(id)
    with {:ok, %Venta{}} <- Directory.delete_venta(venta) do
      send_resp(conn, :no_content, "")
    end
  end
end
