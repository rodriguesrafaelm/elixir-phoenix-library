defmodule BibliotecaPhoenix.BibliotecaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BibliotecaPhoenix.Biblioteca` context.
  """

  @doc """
  Generate a livro.
  """
  def livro_fixture(attrs \\ %{}) do
    {:ok, livro} =
      attrs
      |> Enum.into(%{
        autor: "some autor",
        titulo: "some titulo"
      })
      |> BibliotecaPhoenix.Biblioteca.create_livro()

    livro
  end
end
