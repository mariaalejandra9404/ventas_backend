defmodule BusiApiWeb.VentaView do
  use BusiApiWeb, :view
  alias BusiApiWeb.VentaView

  def render("index.json", %{ventas: ventas}) do
    %{data: render_many(ventas, VentaView, "venta.json")}
  end

  def render("show.json", %{venta: venta}) do
    %{data: render_one(venta, VentaView, "venta.json")}
  end

  def render("venta.json", %{venta: venta}) do
    %{
      id: venta.id,
      fecha: venta.fecha,
      valor: venta.valor}
  end
end
