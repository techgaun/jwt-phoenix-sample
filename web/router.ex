defmodule JwtPhoenix.Router do
  use JwtPhoenix.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", JwtPhoenix do
    pipe_through :api
  end
end
