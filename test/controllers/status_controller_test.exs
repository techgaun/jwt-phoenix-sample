defmodule JwtPhoenix.StatusControllerTest do
  use JwtPhoenix.ConnCase

  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, status_path(conn, :index)
    assert json_response(conn, 401)["errors"] == %{"detail" => "unauthorized"}
  end
end
