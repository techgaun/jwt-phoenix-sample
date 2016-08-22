defmodule JwtPhoenix.StatusView do
  use JwtPhoenix.Web, :view

  def render("status.json", %{status: status}) do
    %{id: status.id}
  end
end
