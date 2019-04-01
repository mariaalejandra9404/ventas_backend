defmodule BusiApi.Directory do
  @moduledoc """
  The Directory context.
  """

  import Ecto.Query, warn: false
  alias BusiApi.Repo

  alias BusiApi.Directory.Business

  @doc """
  Returns the list of businesses.

  ## Examples

      iex> list_businesses()
      [%Business{}, ...]

  """
  def list_businesses do
    Repo.all(Business)
  end

  @doc """
  Gets a single business.

  Raises `Ecto.NoResultsError` if the Business does not exist.

  ## Examples

      iex> get_business!(123)
      %Business{}

      iex> get_business!(456)
      ** (Ecto.NoResultsError)

  """
  def get_business!(id), do: Repo.get!(Business, id)

  @doc """
  Creates a business.

  ## Examples

      iex> create_business(%{field: value})
      {:ok, %Business{}}

      iex> create_business(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_business(attrs \\ %{}) do
    %Business{}
    |> Business.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a business.

  ## Examples

      iex> update_business(business, %{field: new_value})
      {:ok, %Business{}}

      iex> update_business(business, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_business(%Business{} = business, attrs) do
    business
    |> Business.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Business.

  ## Examples

      iex> delete_business(business)
      {:ok, %Business{}}

      iex> delete_business(business)
      {:error, %Ecto.Changeset{}}

  """
  def delete_business(%Business{} = business) do
    Repo.delete(business)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking business changes.

  ## Examples

      iex> change_business(business)
      %Ecto.Changeset{source: %Business{}}

  """
  def change_business(%Business{} = business) do
    Business.changeset(business, %{})
  end

  alias BusiApi.Directory.Tienda

  @doc """
  Returns the list of tiendas.

  ## Examples

      iex> list_tiendas()
      [%Tienda{}, ...]

  """
  def list_tiendas do
    Repo.all(Tienda)
  end

  @doc """
  Gets a single tienda.

  Raises `Ecto.NoResultsError` if the Tienda does not exist.

  ## Examples

      iex> get_tienda!(123)
      %Tienda{}

      iex> get_tienda!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tienda!(id), do: Repo.get!(Tienda, id)

  @doc """
  Creates a tienda.

  ## Examples

      iex> create_tienda(%{field: value})
      {:ok, %Tienda{}}

      iex> create_tienda(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tienda(attrs \\ %{}) do
    %Tienda{}
    |> Tienda.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tienda.

  ## Examples

      iex> update_tienda(tienda, %{field: new_value})
      {:ok, %Tienda{}}

      iex> update_tienda(tienda, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tienda(%Tienda{} = tienda, attrs) do
    tienda
    |> Tienda.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tienda.

  ## Examples

      iex> delete_tienda(tienda)
      {:ok, %Tienda{}}

      iex> delete_tienda(tienda)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tienda(%Tienda{} = tienda) do
    Repo.delete(tienda)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tienda changes.

  ## Examples

      iex> change_tienda(tienda)
      %Ecto.Changeset{source: %Tienda{}}

  """
  def change_tienda(%Tienda{} = tienda) do
    Tienda.changeset(tienda, %{})
  end

  alias BusiApi.Directory.Producto

  @doc """
  Returns the list of productos.

  ## Examples

      iex> list_productos()
      [%Producto{}, ...]

  """
  def list_productos do
    Repo.all(Producto)
  end

  @doc """
  Gets a single producto.

  Raises `Ecto.NoResultsError` if the Producto does not exist.

  ## Examples

      iex> get_producto!(123)
      %Producto{}

      iex> get_producto!(456)
      ** (Ecto.NoResultsError)

  """
  def get_producto!(id), do: Repo.get!(Producto, id)

  @doc """
  Creates a producto.

  ## Examples

      iex> create_producto(%{field: value})
      {:ok, %Producto{}}

      iex> create_producto(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_producto(attrs \\ %{}) do
    %Producto{}
    |> Producto.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a producto.

  ## Examples

      iex> update_producto(producto, %{field: new_value})
      {:ok, %Producto{}}

      iex> update_producto(producto, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_producto(%Producto{} = producto, attrs) do
    producto
    |> Producto.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Producto.

  ## Examples

      iex> delete_producto(producto)
      {:ok, %Producto{}}

      iex> delete_producto(producto)
      {:error, %Ecto.Changeset{}}

  """
  def delete_producto(%Producto{} = producto) do
    Repo.delete(producto)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking producto changes.

  ## Examples

      iex> change_producto(producto)
      %Ecto.Changeset{source: %Producto{}}

  """
  def change_producto(%Producto{} = producto) do
    Producto.changeset(producto, %{})
  end

  alias BusiApi.Directory.Venta

  @doc """
  Returns the list of ventas.

  ## Examples

      iex> list_ventas()
      [%Venta{}, ...]

  """
  def list_ventas do
    Repo.all(Venta)
  end

  @doc """
  Gets a single venta.

  Raises `Ecto.NoResultsError` if the Venta does not exist.

  ## Examples

      iex> get_venta!(123)
      %Venta{}

      iex> get_venta!(456)
      ** (Ecto.NoResultsError)

  """
  def get_venta!(id), do: Repo.get!(Venta, id)

  @doc """
  Creates a venta.

  ## Examples

      iex> create_venta(%{field: value})
      {:ok, %Venta{}}

      iex> create_venta(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_venta(attrs \\ %{}) do
    %Venta{}
    |> Venta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a venta.

  ## Examples

      iex> update_venta(venta, %{field: new_value})
      {:ok, %Venta{}}

      iex> update_venta(venta, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_venta(%Venta{} = venta, attrs) do
    venta
    |> Venta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Venta.

  ## Examples

      iex> delete_venta(venta)
      {:ok, %Venta{}}

      iex> delete_venta(venta)
      {:error, %Ecto.Changeset{}}

  """
  def delete_venta(%Venta{} = venta) do
    Repo.delete(venta)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking venta changes.

  ## Examples

      iex> change_venta(venta)
      %Ecto.Changeset{source: %Venta{}}

  """
  def change_venta(%Venta{} = venta) do
    Venta.changeset(venta, %{})
  end

  alias BusiApi.Directory.ProductoVenta

  @doc """
  Returns the list of productoventa.

  ## Examples

      iex> list_productoventa()
      [%ProductoVenta{}, ...]

  """
  def list_productoventa do
    Repo.all(ProductoVenta)
  end

  @doc """
  Gets a single producto_venta.

  Raises `Ecto.NoResultsError` if the Producto venta does not exist.

  ## Examples

      iex> get_producto_venta!(123)
      %ProductoVenta{}

      iex> get_producto_venta!(456)
      ** (Ecto.NoResultsError)

  """
  def get_producto_venta!(id), do: Repo.get!(ProductoVenta, id)

  @doc """
  Creates a producto_venta.

  ## Examples

      iex> create_producto_venta(%{field: value})
      {:ok, %ProductoVenta{}}

      iex> create_producto_venta(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_producto_venta(attrs \\ %{}) do
    %ProductoVenta{}
    |> ProductoVenta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a producto_venta.

  ## Examples

      iex> update_producto_venta(producto_venta, %{field: new_value})
      {:ok, %ProductoVenta{}}

      iex> update_producto_venta(producto_venta, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_producto_venta(%ProductoVenta{} = producto_venta, attrs) do
    producto_venta
    |> ProductoVenta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ProductoVenta.

  ## Examples

      iex> delete_producto_venta(producto_venta)
      {:ok, %ProductoVenta{}}

      iex> delete_producto_venta(producto_venta)
      {:error, %Ecto.Changeset{}}

  """
  def delete_producto_venta(%ProductoVenta{} = producto_venta) do
    Repo.delete(producto_venta)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking producto_venta changes.

  ## Examples

      iex> change_producto_venta(producto_venta)
      %Ecto.Changeset{source: %ProductoVenta{}}

  """
  def change_producto_venta(%ProductoVenta{} = producto_venta) do
    ProductoVenta.changeset(producto_venta, %{})
  end
end
