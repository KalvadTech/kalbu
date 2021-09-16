defmodule KalbuWeb.LockView do
  use KalbuWeb, :view
  alias KalbuWeb.LockView

  def render("index.json", %{locks: locks}) do
    %{data: render_many(locks, LockView, "lock.json")}
  end

  def render("show.json", %{lock: lock}) do
    %{data: render_one(lock, LockView, "lock.json")}
  end

  def render("lock.json", %{lock: lock}) do
    %{
      id: lock.id,
      lock_id: lock.lock_id,
      who: lock.who,
      operation: lock.operation,
      info: lock.info,
      path: lock.path,
      version: lock.version
    }
  end
end
