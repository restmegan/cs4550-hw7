defmodule Events.Repo.Migrations.CreateEventposts do
  use Ecto.Migration

  def change do
    create table(:eventposts) do
      add :name, :string, null: false
      add :date, :string, null: false, default: ""
      add :desc, :text, null: false

      timestamps()
    end

  end
end
