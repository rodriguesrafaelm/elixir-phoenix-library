defmodule BibliotecaPhoenixWeb.LivroView do
  use BibliotecaPhoenixWeb, :view
  alias BibliotecaPhoenixWeb.LivroView

  def render("index.json", %{livros: livros}) do
    %{data: render_many(livros, LivroView, "livro.json")}
  end

  def render("show.json", %{livro: livro}) do
    %{data: render_one(livro, LivroView, "livro.json")}
  end

  def render("livro.json", %{livro: livro}) do
    %{
      id: livro.id,
      titulo: livro.titulo,
      autor: livro.autor
    }
  end
end
