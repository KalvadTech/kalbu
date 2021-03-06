defmodule KalbuWeb.StateControllerTest do
  use KalbuWeb.ConnCase

  import Kalbu.TerraformFixtures

  alias Kalbu.Terraform.State

  @create_attrs %{
    state: "some state"
  }
  @update_attrs %{
    state: "some updated state"
  }
  @invalid_attrs %{state: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all states", %{conn: conn} do
      conn = get(conn, Routes.state_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create state" do
    test "renders state when data is valid", %{conn: conn} do
      conn = post(conn, Routes.state_path(conn, :create), state: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.state_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "state" => "some state"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.state_path(conn, :create), state: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update state" do
    setup [:create_state]

    test "renders state when data is valid", %{conn: conn, state: %State{id: id} = state} do
      conn = put(conn, Routes.state_path(conn, :update, state), state: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.state_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "state" => "some updated state"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, state: state} do
      conn = put(conn, Routes.state_path(conn, :update, state), state: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete state" do
    setup [:create_state]

    test "deletes chosen state", %{conn: conn, state: state} do
      conn = delete(conn, Routes.state_path(conn, :delete, state))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.state_path(conn, :show, state))
      end
    end
  end

  defp create_state(_) do
    state = state_fixture()
    %{state: state}
  end
end
