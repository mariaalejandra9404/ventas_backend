defmodule BusiApiWeb.Router do
  use BusiApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BusiApiWeb do
    pipe_through :api
    resources "/businesses", BusinessController, except: [:new, :edit]	
    resources "/tiendas", TiendaController, except: [:new, :edit]
    resources "/productos", ProductoController, except: [:new, :edit]
    resources "/ventas", VentaController, except: [:new, :edit]
    resources "/producto_venta", ProductoVentaController, except: [:new, :edit]
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", BusiApiWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end	
end
