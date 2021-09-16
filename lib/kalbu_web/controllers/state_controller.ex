defmodule KalbuWeb.StateController do
  use KalbuWeb, :controller

  alias Kalbu.Terraform
  alias Kalbu.Terraform.State

  action_fallback KalbuWeb.FallbackController

  def index(conn, _params) do
    states = Terraform.list_states()
    render(conn, "index.json", states: states)
  end

  def create(conn, %{"state" => state_params}) do
    with {:ok, %State{} = state} <- Terraform.create_state(state_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.state_path(conn, :show, state))
      |> render("show.json", state: state)
    end
  end

  def show(conn, %{"id" => id}) do
    state = Terraform.get_state!(id)
    render(conn, "show.json", state: state)
  end

  def update(conn, %{"id" => id, "state" => state_params}) do
    state = Terraform.get_state!(id)

    with {:ok, %State{} = state} <- Terraform.update_state(state, state_params) do
      render(conn, "show.json", state: state)
    end
  end

  def delete(conn, %{"id" => id}) do
    state = Terraform.get_state!(id)

    with {:ok, %State{}} <- Terraform.delete_state(state) do
      send_resp(conn, :no_content, "")
    end
  end
end
