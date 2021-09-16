defmodule Kalbu.Repo do
  use Ecto.Repo,
    otp_app: :kalbu,
    adapter: Ecto.Adapters.Postgres
end
