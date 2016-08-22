defmodule JwtPhoenix.StatusController do
  use JwtPhoenix.Web, :controller

  def index(conn, _params) do
    status = %{
      success: true
    }
    render(conn, "status.json", status: status)
  end
end
