defmodule Embeds.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :age, :integer

    embeds_many :nicknames, Nicknames, on_replace: :delete do
      field :nickname, :string
    end

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
    |> cast_embed(:nicknames,
      with: &nickname_changeset/2,
      sort_param: :nicknames_sort,
      drop_param: :nicknames_drop
    )
  end

  def nickname_changeset(nickname, attrs \\ %{}) do
    nickname
    |> cast(attrs, [:nickname])
    |> validate_required([:nickname])
  end
end
