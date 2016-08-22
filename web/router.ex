defmodule JwtPhoenix.Router do
  use JwtPhoenix.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Joken.Plug,
      verify: &JwtPhoenix.JWTHelpers.verify/0,
      on_error: &JwtPhoenix.JWTHelpers.error/2
  end

  scope "/api", JwtPhoenix do
    pipe_through :api

    get "/status", StatusController, :index
  end
end
