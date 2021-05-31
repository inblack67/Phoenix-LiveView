defmodule Lights.Repo do
  use Ecto.Repo,
    otp_app: :lights,
    adapter: Ecto.Adapters.Postgres
end
