defmodule Kalbu.Repo.Migrations.CreateLocks do
  use Ecto.Migration

  def change do
    create table(:locks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :lock_id, :string
      add :who, :string
      add :operation, :string
      add :info, :string
      add :path, :string
      add :version, :string

      timestamps()
    end
  end
end
