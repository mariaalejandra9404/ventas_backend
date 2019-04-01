defmodule BusiApiWeb.ProductoVentaView do
  use BusiApiWeb, :view
  alias BusiApiWeb.ProductoVentaView

  def render("index.json", %{productoventa: productoventa}) do
    %{data: render_many(productoventa, ProductoVentaView, "producto_venta.json")}
  end

  def render("show.json", %{producto_venta: producto_venta}) do
    %{data: render_one(producto_venta, ProductoVentaView, "producto_venta.json")}
  end

  def render("producto_venta.json", %{producto_venta: producto_venta}) do
    %{cantidad: producto_venta.cantidad}
  end
end
