defmodule Systemdev.Auth do
    alias Systemdev.Accounts
    alias Systemdev.Accounts.User

    alias  Systemdev.Guardian

    alias Systemdev.Repo

    def get_user_by_email(email) do
        user = Repo.get_by User, email: email
        case user do
            nil -> 
                {:error, "User Does not exist"}
            _ ->
                {:ok, user}
        end
    end

    def password_verify(response, login_password) do
        case response do
            {:ok, user} ->
                if Comeonin.Bcrypt.checkpw login_password, user.password do
                    {:ok, user}
                else 
                    {:error, "Invalid Password"}
                end
            {:error, msg} ->
                {:error, msg}
        end
    end

    def login(%{"email" => email, "password" => login_password}) do
        login_results = email 
            |> get_user_by_email
            |> password_verify(login_password)

        case login_results do
            {:ok, user} ->
                
                case Guardian.encode_and_sign user do
                    {:ok, token, _claims} ->
                        {:ok, user, token}
                    {:error, msg} ->
                        {:error, msg}
                end

            {:error, msg} ->
                login_results
        end
    end
end