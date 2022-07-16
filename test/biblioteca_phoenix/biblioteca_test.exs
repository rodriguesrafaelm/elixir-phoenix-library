defmodule BibliotecaPhoenix.BibliotecaTest do
  use BibliotecaPhoenix.DataCase

  alias BibliotecaPhoenix.Biblioteca

  describe "livros" do
    alias BibliotecaPhoenix.Biblioteca.Livro

    import BibliotecaPhoenix.BibliotecaFixtures

    @invalid_attrs %{autor: nil, titulo: nil}

    test "list_livros/0 returns all livros" do
      livro = livro_fixture()
      assert Biblioteca.list_livros() == [livro]
    end

    test "get_livro!/1 returns the livro with given id" do
      livro = livro_fixture()
      assert Biblioteca.get_livro!(livro.id) == livro
    end

    test "create_livro/1 with valid data creates a livro" do
      valid_attrs = %{autor: "some autor", titulo: "some titulo"}

      assert {:ok, %Livro{} = livro} = Biblioteca.create_livro(valid_attrs)
      assert livro.autor == "some autor"
      assert livro.titulo == "some titulo"
    end

    test "create_livro/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Biblioteca.create_livro(@invalid_attrs)
    end

    test "update_livro/2 with valid data updates the livro" do
      livro = livro_fixture()
      update_attrs = %{autor: "some updated autor", titulo: "some updated titulo"}

      assert {:ok, %Livro{} = livro} = Biblioteca.update_livro(livro, update_attrs)
      assert livro.autor == "some updated autor"
      assert livro.titulo == "some updated titulo"
    end

    test "update_livro/2 with invalid data returns error changeset" do
      livro = livro_fixture()
      assert {:error, %Ecto.Changeset{}} = Biblioteca.update_livro(livro, @invalid_attrs)
      assert livro == Biblioteca.get_livro!(livro.id)
    end

    test "delete_livro/1 deletes the livro" do
      livro = livro_fixture()
      assert {:ok, %Livro{}} = Biblioteca.delete_livro(livro)
      assert_raise Ecto.NoResultsError, fn -> Biblioteca.get_livro!(livro.id) end
    end

    test "change_livro/1 returns a livro changeset" do
      livro = livro_fixture()
      assert %Ecto.Changeset{} = Biblioteca.change_livro(livro)
    end
  end
end
