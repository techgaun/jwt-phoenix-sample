# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :jwt_phoenix,
  ecto_repos: [JwtPhoenix.Repo]

# Configures the endpoint
config :jwt_phoenix, JwtPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MDjl+F63TtZwcQoL1fiX5hfrrOgFw2COu/TbILPLXXxpxNZaRb263ky5UxRaw+Hx",
  render_errors: [view: JwtPhoenix.ErrorView, accepts: ~w(json)],
  pubsub: [name: JwtPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :jwt_phoenix, :auth0,
  app_baseurl: System.get_env("AUTH0_BASEURL"),
  client_id: System.get_env("AUTH0_CLIENT_ID"),
  client_secret: "AUTH0_CLIENT_SECRET"
    |> System.get_env
    |> Kernel.||("")
    |> Base.url_decode64
    |> elem(1)

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
