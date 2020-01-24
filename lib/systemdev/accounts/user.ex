defmodule Systemdev.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> password_hash
  end

  def password_hash(changeset) do
    case get_field(changeset, :password) do
      nil ->
        changeset
      password ->
        put_change(changeset, :password, Comeonin.Bcrypt.hashpwsalt(password))
    end
  end
end
