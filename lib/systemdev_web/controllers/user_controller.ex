defmodule SystemdevWeb.UserController do
  use SystemdevWeb, :controller

  alias Systemdev.Accounts
  alias Systemdev.Accounts.User
  alias Systemdev.Auth

  action_fallback SystemdevWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def login(conn, %{"user" => user_params}) do
    success_login = Auth.login(user_params);

    case success_login do
      {:ok, user, token} ->
        IO.inspect conn
        json(conn, %{token: token})
      {:error, msg} ->
        conn
        |> json(%{message: msg})
    end

  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
