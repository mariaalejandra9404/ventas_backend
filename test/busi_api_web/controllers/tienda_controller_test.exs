defmodule BusiApiWeb.TiendaControllerTest do
  use BusiApiWeb.ConnCase

  alias BusiApi.Directory
  alias BusiApi.Directory.Tienda

  @create_attrs %{id: 42, nombre: "some nombre", ubicacion: "some ubicacion"}
  @update_attrs %{id: 43, nombre: "some updated nombre", ubicacion: "some updated ubicacion"}
  @invalid_attrs %{id: nil, nombre: nil, ubicacion: nil}

  def fixture(:tienda) do
    {:ok, tienda} = Directory.create_tienda(@create_attrs)
    tienda
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tiendas", %{conn: conn} do
      conn = get conn, tienda_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create tienda" do
    test "renders tienda when data is valid", %{conn: conn} do
      conn = post conn, tienda_path(conn, :create), tienda: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, tienda_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "id" => 42,
        "nombre" => "some nombre",
        "ubicacion" => "some ubicacion"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, tienda_path(conn, :create), tienda: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update tienda" do
    setup [:create_tienda]

    test "renders tienda when data is valid", %{conn: conn, tienda: %Tienda{id: id} = tienda} do
      conn = put conn, tienda_path(conn, :update, tienda), tienda: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, tienda_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "id" => 43,
        "nombre" => "some updated nombre",
        "ubicacion" => "some updated ubicacion"}
    end

    test "renders errors when data is invalid", %{conn: conn, tienda: tienda} do
      conn = put conn, tienda_path(conn, :update, tienda), tienda: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete tienda" do
    setup [:create_tienda]

    test "deletes chosen tienda", %{conn: conn, tienda: tienda} do
      conn = delete conn, tienda_path(conn, :delete, tienda)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, tienda_path(conn, :show, tienda)
      end
    end
  end

  defp create_tienda(_) do
    tienda = fixture(:tienda)
    {:ok, tienda: tienda}
  end
end
