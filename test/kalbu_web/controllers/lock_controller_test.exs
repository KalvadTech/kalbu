defmodule KalbuWeb.LockControllerTest do
  use KalbuWeb.ConnCase

  import Kalbu.TerraformFixtures

  alias Kalbu.Terraform.Lock

  @create_attrs %{
    info: "some info",
    lock_id: "some lock_id",
    operation: "some operation",
    path: "some path",
    version: "some version",
    who: "some who"
  }
  @update_attrs %{
    info: "some updated info",
    lock_id: "some updated lock_id",
    operation: "some updated operation",
    path: "some updated path",
    version: "some updated version",
    who: "some updated who"
  }
  @invalid_attrs %{info: nil, lock_id: nil, operation: nil, path: nil, version: nil, who: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all locks", %{conn: conn} do
      conn = get(conn, Routes.lock_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create lock" do
    test "renders lock when data is valid", %{conn: conn} do
      conn = post(conn, Routes.lock_path(conn, :create), lock: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.lock_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "info" => "some info",
               "lock_id" => "some lock_id",
               "operation" => "some operation",
               "path" => "some path",
               "version" => "some version",
               "who" => "some who"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.lock_path(conn, :create), lock: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update lock" do
    setup [:create_lock]

    test "renders lock when data is valid", %{conn: conn, lock: %Lock{id: id} = lock} do
      conn = put(conn, Routes.lock_path(conn, :update, lock), lock: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.lock_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "info" => "some updated info",
               "lock_id" => "some updated lock_id",
               "operation" => "some updated operation",
               "path" => "some updated path",
               "version" => "some updated version",
               "who" => "some updated who"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, lock: lock} do
      conn = put(conn, Routes.lock_path(conn, :update, lock), lock: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete lock" do
    setup [:create_lock]

    test "deletes chosen lock", %{conn: conn, lock: lock} do
      conn = delete(conn, Routes.lock_path(conn, :delete, lock))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.lock_path(conn, :show, lock))
      end
    end
  end

  defp create_lock(_) do
    lock = lock_fixture()
    %{lock: lock}
  end
end
