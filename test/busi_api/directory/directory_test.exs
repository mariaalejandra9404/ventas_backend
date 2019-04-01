defmodule BusiApi.DirectoryTest do
  use BusiApi.DataCase

  alias BusiApi.Directory

  describe "businesses" do
    alias BusiApi.Directory.Business

    @valid_attrs %{description: "some description", name: "some name", tag: "some tag"}
    @update_attrs %{description: "some updated description", name: "some updated name", tag: "some updated tag"}
    @invalid_attrs %{description: nil, name: nil, tag: nil}

    def business_fixture(attrs \\ %{}) do
      {:ok, business} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_business()

      business
    end

    test "list_businesses/0 returns all businesses" do
      business = business_fixture()
      assert Directory.list_businesses() == [business]
    end

    test "get_business!/1 returns the business with given id" do
      business = business_fixture()
      assert Directory.get_business!(business.id) == business
    end

    test "create_business/1 with valid data creates a business" do
      assert {:ok, %Business{} = business} = Directory.create_business(@valid_attrs)
      assert business.description == "some description"
      assert business.name == "some name"
      assert business.tag == "some tag"
    end

    test "create_business/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_business(@invalid_attrs)
    end

    test "update_business/2 with valid data updates the business" do
      business = business_fixture()
      assert {:ok, business} = Directory.update_business(business, @update_attrs)
      assert %Business{} = business
      assert business.description == "some updated description"
      assert business.name == "some updated name"
      assert business.tag == "some updated tag"
    end

    test "update_business/2 with invalid data returns error changeset" do
      business = business_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_business(business, @invalid_attrs)
      assert business == Directory.get_business!(business.id)
    end

    test "delete_business/1 deletes the business" do
      business = business_fixture()
      assert {:ok, %Business{}} = Directory.delete_business(business)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_business!(business.id) end
    end

    test "change_business/1 returns a business changeset" do
      business = business_fixture()
      assert %Ecto.Changeset{} = Directory.change_business(business)
    end
  end

  describe "tiendas" do
    alias BusiApi.Directory.Tienda

    @valid_attrs %{id: 42, nombre: "some nombre", ubicacion: "some ubicacion"}
    @update_attrs %{id: 43, nombre: "some updated nombre", ubicacion: "some updated ubicacion"}
    @invalid_attrs %{id: nil, nombre: nil, ubicacion: nil}

    def tienda_fixture(attrs \\ %{}) do
      {:ok, tienda} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_tienda()

      tienda
    end

    test "list_tiendas/0 returns all tiendas" do
      tienda = tienda_fixture()
      assert Directory.list_tiendas() == [tienda]
    end

    test "get_tienda!/1 returns the tienda with given id" do
      tienda = tienda_fixture()
      assert Directory.get_tienda!(tienda.id) == tienda
    end

    test "create_tienda/1 with valid data creates a tienda" do
      assert {:ok, %Tienda{} = tienda} = Directory.create_tienda(@valid_attrs)
      assert tienda.id == 42
      assert tienda.nombre == "some nombre"
      assert tienda.ubicacion == "some ubicacion"
    end

    test "create_tienda/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_tienda(@invalid_attrs)
    end

    test "update_tienda/2 with valid data updates the tienda" do
      tienda = tienda_fixture()
      assert {:ok, tienda} = Directory.update_tienda(tienda, @update_attrs)
      assert %Tienda{} = tienda
      assert tienda.id == 43
      assert tienda.nombre == "some updated nombre"
      assert tienda.ubicacion == "some updated ubicacion"
    end

    test "update_tienda/2 with invalid data returns error changeset" do
      tienda = tienda_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_tienda(tienda, @invalid_attrs)
      assert tienda == Directory.get_tienda!(tienda.id)
    end

    test "delete_tienda/1 deletes the tienda" do
      tienda = tienda_fixture()
      assert {:ok, %Tienda{}} = Directory.delete_tienda(tienda)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_tienda!(tienda.id) end
    end

    test "change_tienda/1 returns a tienda changeset" do
      tienda = tienda_fixture()
      assert %Ecto.Changeset{} = Directory.change_tienda(tienda)
    end
  end

  describe "productos" do
    alias BusiApi.Directory.Producto

    @valid_attrs %{descripcion: "some descripcion", id: 42, nombre: "some nombre", precio_unidad: 42}
    @update_attrs %{descripcion: "some updated descripcion", id: 43, nombre: "some updated nombre", precio_unidad: 43}
    @invalid_attrs %{descripcion: nil, id: nil, nombre: nil, precio_unidad: nil}

    def producto_fixture(attrs \\ %{}) do
      {:ok, producto} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_producto()

      producto
    end

    test "list_productos/0 returns all productos" do
      producto = producto_fixture()
      assert Directory.list_productos() == [producto]
    end

    test "get_producto!/1 returns the producto with given id" do
      producto = producto_fixture()
      assert Directory.get_producto!(producto.id) == producto
    end

    test "create_producto/1 with valid data creates a producto" do
      assert {:ok, %Producto{} = producto} = Directory.create_producto(@valid_attrs)
      assert producto.descripcion == "some descripcion"
      assert producto.id == 42
      assert producto.nombre == "some nombre"
      assert producto.precio_unidad == 42
    end

    test "create_producto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_producto(@invalid_attrs)
    end

    test "update_producto/2 with valid data updates the producto" do
      producto = producto_fixture()
      assert {:ok, producto} = Directory.update_producto(producto, @update_attrs)
      assert %Producto{} = producto
      assert producto.descripcion == "some updated descripcion"
      assert producto.id == 43
      assert producto.nombre == "some updated nombre"
      assert producto.precio_unidad == 43
    end

    test "update_producto/2 with invalid data returns error changeset" do
      producto = producto_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_producto(producto, @invalid_attrs)
      assert producto == Directory.get_producto!(producto.id)
    end

    test "delete_producto/1 deletes the producto" do
      producto = producto_fixture()
      assert {:ok, %Producto{}} = Directory.delete_producto(producto)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_producto!(producto.id) end
    end

    test "change_producto/1 returns a producto changeset" do
      producto = producto_fixture()
      assert %Ecto.Changeset{} = Directory.change_producto(producto)
    end
  end

  describe "ventas" do
    alias BusiApi.Directory.Venta

    @valid_attrs %{fecha: ~D[2010-04-17], id: 42, valor: 42}
    @update_attrs %{fecha: ~D[2011-05-18], id: 43, valor: 43}
    @invalid_attrs %{fecha: nil, id: nil, valor: nil}

    def venta_fixture(attrs \\ %{}) do
      {:ok, venta} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_venta()

      venta
    end

    test "list_ventas/0 returns all ventas" do
      venta = venta_fixture()
      assert Directory.list_ventas() == [venta]
    end

    test "get_venta!/1 returns the venta with given id" do
      venta = venta_fixture()
      assert Directory.get_venta!(venta.id) == venta
    end

    test "create_venta/1 with valid data creates a venta" do
      assert {:ok, %Venta{} = venta} = Directory.create_venta(@valid_attrs)
      assert venta.fecha == ~D[2010-04-17]
      assert venta.id == 42
      assert venta.valor == 42
    end

    test "create_venta/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_venta(@invalid_attrs)
    end

    test "update_venta/2 with valid data updates the venta" do
      venta = venta_fixture()
      assert {:ok, venta} = Directory.update_venta(venta, @update_attrs)
      assert %Venta{} = venta
      assert venta.fecha == ~D[2011-05-18]
      assert venta.id == 43
      assert venta.valor == 43
    end

    test "update_venta/2 with invalid data returns error changeset" do
      venta = venta_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_venta(venta, @invalid_attrs)
      assert venta == Directory.get_venta!(venta.id)
    end

    test "delete_venta/1 deletes the venta" do
      venta = venta_fixture()
      assert {:ok, %Venta{}} = Directory.delete_venta(venta)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_venta!(venta.id) end
    end

    test "change_venta/1 returns a venta changeset" do
      venta = venta_fixture()
      assert %Ecto.Changeset{} = Directory.change_venta(venta)
    end
  end

  describe "productoventa" do
    alias BusiApi.Directory.ProductoVenta

    @valid_attrs %{cantidad: 42, id: 42}
    @update_attrs %{cantidad: 43, id: 43}
    @invalid_attrs %{cantidad: nil, id: nil}

    def producto_venta_fixture(attrs \\ %{}) do
      {:ok, producto_venta} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_producto_venta()

      producto_venta
    end

    test "list_productoventa/0 returns all productoventa" do
      producto_venta = producto_venta_fixture()
      assert Directory.list_productoventa() == [producto_venta]
    end

    test "get_producto_venta!/1 returns the producto_venta with given id" do
      producto_venta = producto_venta_fixture()
      assert Directory.get_producto_venta!(producto_venta.id) == producto_venta
    end

    test "create_producto_venta/1 with valid data creates a producto_venta" do
      assert {:ok, %ProductoVenta{} = producto_venta} = Directory.create_producto_venta(@valid_attrs)
      assert producto_venta.cantidad == 42
      assert producto_venta.id == 42
    end

    test "create_producto_venta/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_producto_venta(@invalid_attrs)
    end

    test "update_producto_venta/2 with valid data updates the producto_venta" do
      producto_venta = producto_venta_fixture()
      assert {:ok, producto_venta} = Directory.update_producto_venta(producto_venta, @update_attrs)
      assert %ProductoVenta{} = producto_venta
      assert producto_venta.cantidad == 43
      assert producto_venta.id == 43
    end

    test "update_producto_venta/2 with invalid data returns error changeset" do
      producto_venta = producto_venta_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_producto_venta(producto_venta, @invalid_attrs)
      assert producto_venta == Directory.get_producto_venta!(producto_venta.id)
    end

    test "delete_producto_venta/1 deletes the producto_venta" do
      producto_venta = producto_venta_fixture()
      assert {:ok, %ProductoVenta{}} = Directory.delete_producto_venta(producto_venta)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_producto_venta!(producto_venta.id) end
    end

    test "change_producto_venta/1 returns a producto_venta changeset" do
      producto_venta = producto_venta_fixture()
      assert %Ecto.Changeset{} = Directory.change_producto_venta(producto_venta)
    end
  end
end
