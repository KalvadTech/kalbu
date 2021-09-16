defmodule Kalbu.TerraformFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kalbu.Terraform` context.
  """

  @doc """
  Generate a state.
  """
  def state_fixture(attrs \\ %{}) do
    {:ok, state} =
      attrs
      |> Enum.into(%{
        state: "some state"
      })
      |> Kalbu.Terraform.create_state()

    state
  end

  @doc """
  Generate a lock.
  """
  def lock_fixture(attrs \\ %{}) do
    {:ok, lock} =
      attrs
      |> Enum.into(%{
        info: "some info",
        lock_id: "some lock_id",
        operation: "some operation",
        path: "some path",
        version: "some version",
        who: "some who"
      })
      |> Kalbu.Terraform.create_lock()

    lock
  end

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        password: "some password",
        username: "some username"
      })
      |> Kalbu.Terraform.create_project()

    project
  end
end
