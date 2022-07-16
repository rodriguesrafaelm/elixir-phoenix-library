defmodule BibliotecaPhoenix.Biblioteca do
  @moduledoc """
  The Biblioteca context.
  """

  import Ecto.Query, warn: false
  alias BibliotecaPhoenix.Repo

  alias BibliotecaPhoenix.Biblioteca.Livro

  @doc """
  Returns the list of livros.

  ## Examples

      iex> list_livros()
      [%Livro{}, ...]

  """
  def list_livros do
    Repo.all(Livro)
  end

  @doc """
  Gets a single livro.

  Raises `Ecto.NoResultsError` if the Livro does not exist.

  ## Examples

      iex> get_livro!(123)
      %Livro{}

      iex> get_livro!(456)
      ** (Ecto.NoResultsError)

  """
  def get_livro!(id), do: Repo.get!(Livro, id)

  @doc """
  Creates a livro.

  ## Examples

      iex> create_livro(%{field: value})
      {:ok, %Livro{}}

      iex> create_livro(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_livro(attrs \\ %{}) do
    %Livro{}
    |> Livro.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a livro.

  ## Examples

      iex> update_livro(livro, %{field: new_value})
      {:ok, %Livro{}}

      iex> update_livro(livro, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_livro(%Livro{} = livro, attrs) do
    livro
    |> Livro.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a livro.

  ## Examples

      iex> delete_livro(livro)
      {:ok, %Livro{}}

      iex> delete_livro(livro)
      {:error, %Ecto.Changeset{}}

  """
  def delete_livro(%Livro{} = livro) do
    Repo.delete(livro)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking livro changes.

  ## Examples

      iex> change_livro(livro)
      %Ecto.Changeset{data: %Livro{}}

  """
  def change_livro(%Livro{} = livro, attrs \\ %{}) do
    Livro.changeset(livro, attrs)
  end
end
