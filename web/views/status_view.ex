defmodule JwtPhoenix.StatusView do
  use JwtPhoenix.Web, :view

  def render("status.json", %{status: status}) do
    status
  end
end
