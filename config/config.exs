# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :systemdev,
  ecto_repos: [Systemdev.Repo]

# Configures the endpoint
config :systemdev, SystemdevWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gNOvvePm2KW7XvLmV+VGQCXZrj5xl/Wxlb51H1a7bur5z+ovE9azoUKJ86dc/djI",
  render_errors: [view: SystemdevWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Systemdev.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :systemdev, Systemdev.Guardian,
  issuer: "systemdev",
  secret_key: "HzJarFbzFPce/GBP+0uIwPaz9uobGlZOBDzXro5jtvstNfVA+aFnYJulYmIiq5jT"

config :cors_plug,
  max_age: 86400,
  methods: ["GET", "POST", "PUT", "DELETE"]

config :systemdev, Systemdev.Mailer,
  # adapter: Bamboo.LocalAdapter
  adapter: Bamboo.SendgridAdapter,
  api_key: "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"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
