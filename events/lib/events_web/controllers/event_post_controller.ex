defmodule EventsWeb.EventPostController do
  use EventsWeb, :controller

  alias Events.EventPosts
  alias Events.EventPosts.EventPost

  def index(conn, _params) do
    eventposts = EventPosts.list_eventposts()
    render(conn, "index.html", eventposts: eventposts)
  end

  def new(conn, _params) do
    changeset = EventPosts.change_event_post(%EventPost{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"event_post" => event_post_params}) do
    case EventPosts.create_event_post(event_post_params) do
      {:ok, event_post} ->
        conn
        |> put_flash(:info, "Event post created successfully.")
        |> redirect(to: Routes.event_post_path(conn, :show, event_post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    event_post = EventPosts.get_event_post!(id)
    render(conn, "show.html", event_post: event_post)
  end

  def edit(conn, %{"id" => id}) do
    event_post = EventPosts.get_event_post!(id)
    changeset = EventPosts.change_event_post(event_post)
    render(conn, "edit.html", event_post: event_post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "event_post" => event_post_params}) do
    event_post = EventPosts.get_event_post!(id)

    case EventPosts.update_event_post(event_post, event_post_params) do
      {:ok, event_post} ->
        conn
        |> put_flash(:info, "Event post updated successfully.")
        |> redirect(to: Routes.event_post_path(conn, :show, event_post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", event_post: event_post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    event_post = EventPosts.get_event_post!(id)
    {:ok, _event_post} = EventPosts.delete_event_post(event_post)

    conn
    |> put_flash(:info, "Event post deleted successfully.")
    |> redirect(to: Routes.event_post_path(conn, :index))
  end
end
