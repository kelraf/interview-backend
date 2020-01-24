# Systemdev

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000/user) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Endpoints
 * To create a user: http://localhost:4000/user [POST]
 * To login: http://localhost:4000/user/login [POST]
 * Protected Endpoint http://localhost:4000/user [GET]