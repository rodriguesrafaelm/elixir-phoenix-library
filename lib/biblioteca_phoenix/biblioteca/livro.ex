defmodule BibliotecaPhoenix.Biblioteca.Livro do
  use Ecto.Schema
  import Ecto.Changeset

  schema "livros" do
    field :autor, :string
    field :titulo, :string

    timestamps()
  end

  @doc false
  def changeset(livro, attrs) do
    livro
    |> cast(attrs, [:titulo, :autor])
    |> validate_required([:titulo, :autor])
  end
end
