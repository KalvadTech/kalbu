defmodule Kalbu.TerraformTest do
  use Kalbu.DataCase

  alias Kalbu.Terraform

  describe "states" do
    alias Kalbu.Terraform.State

    import Kalbu.TerraformFixtures

    @invalid_attrs %{state: nil}

    test "list_states/0 returns all states" do
      state = state_fixture()
      assert Terraform.list_states() == [state]
    end

    test "get_state!/1 returns the state with given id" do
      state = state_fixture()
      assert Terraform.get_state!(state.id) == state
    end

    test "create_state/1 with valid data creates a state" do
      valid_attrs = %{state: "some state"}

      assert {:ok, %State{} = state} = Terraform.create_state(valid_attrs)
      assert state.state == "some state"
    end

    test "create_state/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Terraform.create_state(@invalid_attrs)
    end

    test "update_state/2 with valid data updates the state" do
      state = state_fixture()
      update_attrs = %{state: "some updated state"}

      assert {:ok, %State{} = state} = Terraform.update_state(state, update_attrs)
      assert state.state == "some updated state"
    end

    test "update_state/2 with invalid data returns error changeset" do
      state = state_fixture()
      assert {:error, %Ecto.Changeset{}} = Terraform.update_state(state, @invalid_attrs)
      assert state == Terraform.get_state!(state.id)
    end

    test "delete_state/1 deletes the state" do
      state = state_fixture()
      assert {:ok, %State{}} = Terraform.delete_state(state)
      assert_raise Ecto.NoResultsError, fn -> Terraform.get_state!(state.id) end
    end

    test "change_state/1 returns a state changeset" do
      state = state_fixture()
      assert %Ecto.Changeset{} = Terraform.change_state(state)
    end
  end

  describe "locks" do
    alias Kalbu.Terraform.Lock

    import Kalbu.TerraformFixtures

    @invalid_attrs %{info: nil, lock_id: nil, operation: nil, path: nil, version: nil, who: nil}

    test "list_locks/0 returns all locks" do
      lock = lock_fixture()
      assert Terraform.list_locks() == [lock]
    end

    test "get_lock!/1 returns the lock with given id" do
      lock = lock_fixture()
      assert Terraform.get_lock!(lock.id) == lock
    end

    test "create_lock/1 with valid data creates a lock" do
      valid_attrs = %{
        info: "some info",
        lock_id: "some lock_id",
        operation: "some operation",
        path: "some path",
        version: "some version",
        who: "some who"
      }

      assert {:ok, %Lock{} = lock} = Terraform.create_lock(valid_attrs)
      assert lock.info == "some info"
      assert lock.lock_id == "some lock_id"
      assert lock.operation == "some operation"
      assert lock.path == "some path"
      assert lock.version == "some version"
      assert lock.who == "some who"
    end

    test "create_lock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Terraform.create_lock(@invalid_attrs)
    end

    test "update_lock/2 with valid data updates the lock" do
      lock = lock_fixture()

      update_attrs = %{
        info: "some updated info",
        lock_id: "some updated lock_id",
        operation: "some updated operation",
        path: "some updated path",
        version: "some updated version",
        who: "some updated who"
      }

      assert {:ok, %Lock{} = lock} = Terraform.update_lock(lock, update_attrs)
      assert lock.info == "some updated info"
      assert lock.lock_id == "some updated lock_id"
      assert lock.operation == "some updated operation"
      assert lock.path == "some updated path"
      assert lock.version == "some updated version"
      assert lock.who == "some updated who"
    end

    test "update_lock/2 with invalid data returns error changeset" do
      lock = lock_fixture()
      assert {:error, %Ecto.Changeset{}} = Terraform.update_lock(lock, @invalid_attrs)
      assert lock == Terraform.get_lock!(lock.id)
    end

    test "delete_lock/1 deletes the lock" do
      lock = lock_fixture()
      assert {:ok, %Lock{}} = Terraform.delete_lock(lock)
      assert_raise Ecto.NoResultsError, fn -> Terraform.get_lock!(lock.id) end
    end

    test "change_lock/1 returns a lock changeset" do
      lock = lock_fixture()
      assert %Ecto.Changeset{} = Terraform.change_lock(lock)
    end
  end

  describe "projects" do
    alias Kalbu.Terraform.Project

    import Kalbu.TerraformFixtures

    @invalid_attrs %{password: nil, username: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Terraform.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Terraform.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{password: "some password", username: "some username"}

      assert {:ok, %Project{} = project} = Terraform.create_project(valid_attrs)
      assert project.password == "some password"
      assert project.username == "some username"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Terraform.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{password: "some updated password", username: "some updated username"}

      assert {:ok, %Project{} = project} = Terraform.update_project(project, update_attrs)
      assert project.password == "some updated password"
      assert project.username == "some updated username"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Terraform.update_project(project, @invalid_attrs)
      assert project == Terraform.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Terraform.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Terraform.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Terraform.change_project(project)
    end
  end
end
