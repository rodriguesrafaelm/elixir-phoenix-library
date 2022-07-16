defmodule BibliotecaPhoenix.Repo.Migrations.CreateLivros do
  use Ecto.Migration

  def change do
    create table(:livros) do
      add :titulo, :string
      add :autor, :string

      timestamps()
    end
  end
end
