defmodule Kalbu.Terraform.Lock do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "locks" do
    field :info, :string
    field :lock_id, :string
    field :operation, :string
    field :path, :string
    field :version, :string
    field :who, :string

    timestamps()
  end

  @doc false
  def changeset(lock, attrs) do
    lock
    |> cast(attrs, [:lock_id, :who, :operation, :info, :path, :version])
    |> validate_required([:lock_id, :who, :operation, :info, :path, :version])
  end
end
