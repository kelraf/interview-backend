defmodule SystemdevWeb.Router do
  use SystemdevWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :jwt_auth do
    plug(Systemdev.Guardian.AuthPipeline)
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SystemdevWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", SystemdevWeb do
    pipe_through :api

    resources "/users", UserController, except: [:index]
    post "/users/login", UserController, :login

  end

  scope "/api", SystemdevWeb do
    pipe_through [:api, :jwt_auth]

    get "/users", UserController, :index
  end

end
