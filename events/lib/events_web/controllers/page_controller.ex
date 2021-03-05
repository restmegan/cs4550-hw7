defmodule EventsWeb.PageController do
  use EventsWeb, :controller

  def index(conn, _params) do
    eventposts = EventPosts.list_eventposts()
    render(conn, "index.html", eventposts: eventposts)
  end
end
