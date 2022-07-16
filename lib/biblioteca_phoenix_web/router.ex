defmodule BibliotecaPhoenixWeb.Router do
  use BibliotecaPhoenixWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/biblioteca", BibliotecaPhoenixWeb do
    pipe_through :api

    resources "/livros", LivroController, except: [:new, :edit]

  end
end
