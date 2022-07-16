defmodule BibliotecaPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :biblioteca_phoenix,
    adapter: Ecto.Adapters.Postgres
end
