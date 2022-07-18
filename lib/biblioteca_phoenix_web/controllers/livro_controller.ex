defmodule BibliotecaPhoenixWeb.LivroController do
  use BibliotecaPhoenixWeb, :controller

  alias BibliotecaPhoenix.Biblioteca
  alias BibliotecaPhoenix.Biblioteca.Livro

  action_fallback BibliotecaPhoenixWeb.FallbackController

  def index(conn, _params) do
    livros = Biblioteca.list_livros()
    render(conn, "index.json", livros: livros)
  end

  def create(conn, %{"titulo" => _titulo, "autor" => _autor} = livro_params) do
    with {:ok, %Livro{} = livro} <- Biblioteca.create_livro(livro_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.livro_path(conn, :show, livro))
      |> render("show.json", livro: livro)
    end
  end

  def show(conn, %{"id" => id}) do
    livro = Biblioteca.get_livro!(id)
    render(conn, "show.json", livro: livro)
  end

  def update(conn, %{"id" => id, "livro" => livro_params}) do
    livro = Biblioteca.get_livro!(id)

    with {:ok, %Livro{} = livro} <- Biblioteca.update_livro(livro, livro_params) do
      render(conn, "show.json", livro: livro)
    end
  end

  def delete(conn, %{"id" => id}) do
    livro = Biblioteca.get_livro!(id)

    with {:ok, %Livro{}} <- Biblioteca.delete_livro(livro) do
      send_resp(conn, :no_content, "")
    end
  end
end
