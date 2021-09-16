defmodule Kalbu.Repo.Migrations.CreateStates do
  use Ecto.Migration

  def change do
    create table(:states, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :state, :string

      timestamps()
    end
  end
end
