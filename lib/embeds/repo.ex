defmodule Embeds.Repo do
  use Ecto.Repo,
    otp_app: :embeds,
    adapter: Ecto.Adapters.Postgres
end
