defmodule Embeds.Repo.Migrations.CreateNicknamesEmbed do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :nicknames, {:array, :map}
    end
  end
end
