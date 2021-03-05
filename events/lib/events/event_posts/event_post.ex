defmodule Events.EventPosts.EventPost do
  use Ecto.Schema
  import Ecto.Changeset

  schema "eventposts" do
    field :desc, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(event_post, attrs) do
    event_post
    |> cast(attrs, [:name, :desc])
    |> validate_required([:name, :desc])
  end
end
