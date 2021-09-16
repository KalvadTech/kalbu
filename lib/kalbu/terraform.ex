defmodule Kalbu.Terraform do
  @moduledoc """
  The Terraform context.
  """

  import Ecto.Query, warn: false
  alias Kalbu.Repo

  alias Kalbu.Terraform.State

  @doc """
  Returns the list of states.

  ## Examples

      iex> list_states()
      [%State{}, ...]

  """
  def list_states do
    Repo.all(State)
  end

  @doc """
  Gets a single state.

  Raises `Ecto.NoResultsError` if the State does not exist.

  ## Examples

      iex> get_state!(123)
      %State{}

      iex> get_state!(456)
      ** (Ecto.NoResultsError)

  """
  def get_state!(id), do: Repo.get!(State, id)

  @doc """
  Creates a state.

  ## Examples

      iex> create_state(%{field: value})
      {:ok, %State{}}

      iex> create_state(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_state(attrs \\ %{}) do
    %State{}
    |> State.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a state.

  ## Examples

      iex> update_state(state, %{field: new_value})
      {:ok, %State{}}

      iex> update_state(state, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_state(%State{} = state, attrs) do
    state
    |> State.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a state.

  ## Examples

      iex> delete_state(state)
      {:ok, %State{}}

      iex> delete_state(state)
      {:error, %Ecto.Changeset{}}

  """
  def delete_state(%State{} = state) do
    Repo.delete(state)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking state changes.

  ## Examples

      iex> change_state(state)
      %Ecto.Changeset{data: %State{}}

  """
  def change_state(%State{} = state, attrs \\ %{}) do
    State.changeset(state, attrs)
  end

  alias Kalbu.Terraform.Lock

  @doc """
  Returns the list of locks.

  ## Examples

      iex> list_locks()
      [%Lock{}, ...]

  """
  def list_locks do
    Repo.all(Lock)
  end

  @doc """
  Gets a single lock.

  Raises `Ecto.NoResultsError` if the Lock does not exist.

  ## Examples

      iex> get_lock!(123)
      %Lock{}

      iex> get_lock!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lock!(id), do: Repo.get!(Lock, id)

  @doc """
  Creates a lock.

  ## Examples

      iex> create_lock(%{field: value})
      {:ok, %Lock{}}

      iex> create_lock(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lock(attrs \\ %{}) do
    %Lock{}
    |> Lock.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lock.

  ## Examples

      iex> update_lock(lock, %{field: new_value})
      {:ok, %Lock{}}

      iex> update_lock(lock, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lock(%Lock{} = lock, attrs) do
    lock
    |> Lock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a lock.

  ## Examples

      iex> delete_lock(lock)
      {:ok, %Lock{}}

      iex> delete_lock(lock)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lock(%Lock{} = lock) do
    Repo.delete(lock)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lock changes.

  ## Examples

      iex> change_lock(lock)
      %Ecto.Changeset{data: %Lock{}}

  """
  def change_lock(%Lock{} = lock, attrs \\ %{}) do
    Lock.changeset(lock, attrs)
  end

  alias Kalbu.Terraform.Project

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{data: %Project{}}

  """
  def change_project(%Project{} = project, attrs \\ %{}) do
    Project.changeset(project, attrs)
  end
end
