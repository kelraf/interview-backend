use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :systemdev, SystemdevWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :systemdev, Systemdev.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "Kelraf@11746",
  database: "systemdev_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
