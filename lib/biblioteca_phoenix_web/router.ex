defmodule BibliotecaPhoenixWeb.Router do
  use BibliotecaPhoenixWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/livros", BibliotecaPhoenixWeb do
    pipe_through :api

    resources "/", LivroController, only: [:index, :show]

  end
end
