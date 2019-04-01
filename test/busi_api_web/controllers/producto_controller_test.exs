defmodule BusiApiWeb.ProductoControllerTest do
  use BusiApiWeb.ConnCase

  alias BusiApi.Directory
  alias BusiApi.Directory.Producto

  @create_attrs %{descripcion: "some descripcion", id: 42, nombre: "some nombre", precio_unidad: 42}
  @update_attrs %{descripcion: "some updated descripcion", id: 43, nombre: "some updated nombre", precio_unidad: 43}
  @invalid_attrs %{descripcion: nil, id: nil, nombre: nil, precio_unidad: nil}

  def fixture(:producto) do
    {:ok, producto} = Directory.create_producto(@create_attrs)
    producto
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all productos", %{conn: conn} do
      conn = get conn, producto_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create producto" do
    test "renders producto when data is valid", %{conn: conn} do
      conn = post conn, producto_path(conn, :create), producto: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, producto_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "descripcion" => "some descripcion",
        "id" => 42,
        "nombre" => "some nombre",
        "precio_unidad" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, producto_path(conn, :create), producto: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update producto" do
    setup [:create_producto]

    test "renders producto when data is valid", %{conn: conn, producto: %Producto{id: id} = producto} do
      conn = put conn, producto_path(conn, :update, producto), producto: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, producto_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "descripcion" => "some updated descripcion",
        "id" => 43,
        "nombre" => "some updated nombre",
        "precio_unidad" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, producto: producto} do
      conn = put conn, producto_path(conn, :update, producto), producto: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete producto" do
    setup [:create_producto]

    test "deletes chosen producto", %{conn: conn, producto: producto} do
      conn = delete conn, producto_path(conn, :delete, producto)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, producto_path(conn, :show, producto)
      end
    end
  end

  defp create_producto(_) do
    producto = fixture(:producto)
    {:ok, producto: producto}
  end
end
