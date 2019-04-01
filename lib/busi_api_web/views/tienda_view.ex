defmodule BusiApiWeb.TiendaView do
  use BusiApiWeb, :view
  alias BusiApiWeb.TiendaView

  def render("index.json", %{tiendas: tiendas}) do
    %{data: render_many(tiendas, TiendaView, "tienda.json")}
  end

  def render("show.json", %{tienda: tienda}) do
    %{data: render_one(tienda, TiendaView, "tienda.json")}
  end

  def render("tienda.json", %{tienda: tienda}) do
    %{
      id: tienda.id,
      nombre: tienda.nombre,
      ubicacion: tienda.ubicacion}
  end
end
