defmodule Ethylpad.Repo do
  use Ecto.Repo,
    otp_app: :ethylpad,
    adapter: Ecto.Adapters.Postgres
end
