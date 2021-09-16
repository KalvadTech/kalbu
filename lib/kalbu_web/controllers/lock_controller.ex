defmodule KalbuWeb.LockController do
  use KalbuWeb, :controller

  alias Kalbu.Terraform
  alias Kalbu.Terraform.Lock

  action_fallback KalbuWeb.FallbackController

  def index(conn, _params) do
    locks = Terraform.list_locks()
    render(conn, "index.json", locks: locks)
  end

  def create(conn, %{"lock" => lock_params}) do
    with {:ok, %Lock{} = lock} <- Terraform.create_lock(lock_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.lock_path(conn, :show, lock))
      |> render("show.json", lock: lock)
    end
  end

  def show(conn, %{"id" => id}) do
    lock = Terraform.get_lock!(id)
    render(conn, "show.json", lock: lock)
  end

  def update(conn, %{"id" => id, "lock" => lock_params}) do
    lock = Terraform.get_lock!(id)

    with {:ok, %Lock{} = lock} <- Terraform.update_lock(lock, lock_params) do
      render(conn, "show.json", lock: lock)
    end
  end

  def delete(conn, %{"id" => id}) do
    lock = Terraform.get_lock!(id)

    with {:ok, %Lock{}} <- Terraform.delete_lock(lock) do
      send_resp(conn, :no_content, "")
    end
  end
end
