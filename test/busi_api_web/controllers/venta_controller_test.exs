defmodule BusiApiWeb.VentaControllerTest do
  use BusiApiWeb.ConnCase

  alias BusiApi.Directory
  alias BusiApi.Directory.Venta

  @create_attrs %{fecha: ~D[2010-04-17], id: 42, valor: 42}
  @update_attrs %{fecha: ~D[2011-05-18], id: 43, valor: 43}
  @invalid_attrs %{fecha: nil, id: nil, valor: nil}

  def fixture(:venta) do
    {:ok, venta} = Directory.create_venta(@create_attrs)
    venta
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all ventas", %{conn: conn} do
      conn = get conn, venta_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create venta" do
    test "renders venta when data is valid", %{conn: conn} do
      conn = post conn, venta_path(conn, :create), venta: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, venta_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "fecha" => ~D[2010-04-17],
        "id" => 42,
        "valor" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, venta_path(conn, :create), venta: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update venta" do
    setup [:create_venta]

    test "renders venta when data is valid", %{conn: conn, venta: %Venta{id: id} = venta} do
      conn = put conn, venta_path(conn, :update, venta), venta: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, venta_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "fecha" => ~D[2011-05-18],
        "id" => 43,
        "valor" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, venta: venta} do
      conn = put conn, venta_path(conn, :update, venta), venta: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete venta" do
    setup [:create_venta]

    test "deletes chosen venta", %{conn: conn, venta: venta} do
      conn = delete conn, venta_path(conn, :delete, venta)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, venta_path(conn, :show, venta)
      end
    end
  end

  defp create_venta(_) do
    venta = fixture(:venta)
    {:ok, venta: venta}
  end
end
