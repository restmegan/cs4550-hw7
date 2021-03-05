defmodule Events.EventPosts do
  @moduledoc """
  The EventPosts context.
  """

  import Ecto.Query, warn: false
  alias Events.Repo

  alias Events.EventPosts.EventPost

  @doc """
  Returns the list of eventposts.

  ## Examples

      iex> list_eventposts()
      [%EventPost{}, ...]

  """
  def list_eventposts do
    Repo.all(EventPost)
  end

  @doc """
  Gets a single event_post.

  Raises `Ecto.NoResultsError` if the Event post does not exist.

  ## Examples

      iex> get_event_post!(123)
      %EventPost{}

      iex> get_event_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event_post!(id), do: Repo.get!(EventPost, id)

  @doc """
  Creates a event_post.

  ## Examples

      iex> create_event_post(%{field: value})
      {:ok, %EventPost{}}

      iex> create_event_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event_post(attrs \\ %{}) do
    %EventPost{}
    |> EventPost.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event_post.

  ## Examples

      iex> update_event_post(event_post, %{field: new_value})
      {:ok, %EventPost{}}

      iex> update_event_post(event_post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event_post(%EventPost{} = event_post, attrs) do
    event_post
    |> EventPost.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a event_post.

  ## Examples

      iex> delete_event_post(event_post)
      {:ok, %EventPost{}}

      iex> delete_event_post(event_post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event_post(%EventPost{} = event_post) do
    Repo.delete(event_post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event_post changes.

  ## Examples

      iex> change_event_post(event_post)
      %Ecto.Changeset{data: %EventPost{}}

  """
  def change_event_post(%EventPost{} = event_post, attrs \\ %{}) do
    EventPost.changeset(event_post, attrs)
  end
end
