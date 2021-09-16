defmodule Kalbu.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :username, :string
      add :password, :string

      timestamps()
    end
  end
end
