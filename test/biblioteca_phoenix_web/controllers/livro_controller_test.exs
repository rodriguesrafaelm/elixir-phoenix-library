defmodule BibliotecaPhoenixWeb.LivroControllerTest do
  use BibliotecaPhoenixWeb.ConnCase

  import BibliotecaPhoenix.BibliotecaFixtures

  alias BibliotecaPhoenix.Biblioteca.Livro

  @create_attrs %{
    autor: "some autor",
    titulo: "some titulo"
  }
  @update_attrs %{
    autor: "some updated autor",
    titulo: "some updated titulo"
  }
  @invalid_attrs %{autor: nil, titulo: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all livros", %{conn: conn} do
      conn = get(conn, Routes.livro_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create livro" do
    test "renders livro when data is valid", %{conn: conn} do
      conn = post(conn, Routes.livro_path(conn, :create), livro: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.livro_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "autor" => "some autor",
               "titulo" => "some titulo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.livro_path(conn, :create), livro: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update livro" do
    setup [:create_livro]

    test "renders livro when data is valid", %{conn: conn, livro: %Livro{id: id} = livro} do
      conn = put(conn, Routes.livro_path(conn, :update, livro), livro: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.livro_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "autor" => "some updated autor",
               "titulo" => "some updated titulo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, livro: livro} do
      conn = put(conn, Routes.livro_path(conn, :update, livro), livro: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete livro" do
    setup [:create_livro]

    test "deletes chosen livro", %{conn: conn, livro: livro} do
      conn = delete(conn, Routes.livro_path(conn, :delete, livro))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.livro_path(conn, :show, livro))
      end
    end
  end

  defp create_livro(_) do
    livro = livro_fixture()
    %{livro: livro}
  end
end
