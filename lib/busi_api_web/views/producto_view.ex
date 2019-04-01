defmodule BusiApiWeb.ProductoView do
  use BusiApiWeb, :view
  alias BusiApiWeb.ProductoView

  def render("index.json", %{productos: productos}) do
    %{data: render_many(productos, ProductoView, "producto.json")}
  end

  def render("show.json", %{producto: producto}) do
    %{data: render_one(producto, ProductoView, "producto.json")}
  end

  def render("producto.json", %{producto: producto}) do
    %{
      id: producto.id,
      nombre: producto.nombre,
      descripcion: producto.descripcion,
      precio_unidad: producto.precio_unidad}
  end
end
