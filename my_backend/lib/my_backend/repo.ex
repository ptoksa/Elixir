defmodule MyBackend.Repo do
  use Ecto.Repo,
    otp_app: :my_backend,
    adapter: Ecto.Adapters.Postgres
end
