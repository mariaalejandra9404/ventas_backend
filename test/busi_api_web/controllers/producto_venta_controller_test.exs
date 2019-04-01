defmodule BusiApiWeb.ProductoVentaControllerTest do
  use BusiApiWeb.ConnCase

  alias BusiApi.Directory
  alias BusiApi.Directory.ProductoVenta

  @create_attrs %{cantidad: 42, id: 42}
  @update_attrs %{cantidad: 43, id: 43}
  @invalid_attrs %{cantidad: nil, id: nil}

  def fixture(:producto_venta) do
    {:ok, producto_venta} = Directory.create_producto_venta(@create_attrs)
    producto_venta
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all productoventa", %{conn: conn} do
      conn = get conn, producto_venta_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create producto_venta" do
    test "renders producto_venta when data is valid", %{conn: conn} do
      conn = post conn, producto_venta_path(conn, :create), producto_venta: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, producto_venta_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "cantidad" => 42,
        "id" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, producto_venta_path(conn, :create), producto_venta: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update producto_venta" do
    setup [:create_producto_venta]

    test "renders producto_venta when data is valid", %{conn: conn, producto_venta: %ProductoVenta{id: id} = producto_venta} do
      conn = put conn, producto_venta_path(conn, :update, producto_venta), producto_venta: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, producto_venta_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "cantidad" => 43,
        "id" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, producto_venta: producto_venta} do
      conn = put conn, producto_venta_path(conn, :update, producto_venta), producto_venta: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete producto_venta" do
    setup [:create_producto_venta]

    test "deletes chosen producto_venta", %{conn: conn, producto_venta: producto_venta} do
      conn = delete conn, producto_venta_path(conn, :delete, producto_venta)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, producto_venta_path(conn, :show, producto_venta)
      end
    end
  end

  defp create_producto_venta(_) do
    producto_venta = fixture(:producto_venta)
    {:ok, producto_venta: producto_venta}
  end
end
