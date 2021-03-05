defmodule EventsWeb.EventPostControllerTest do
  use EventsWeb.ConnCase

  alias Events.EventPosts

  @create_attrs %{desc: "some desc", name: "some name"}
  @update_attrs %{desc: "some updated desc", name: "some updated name"}
  @invalid_attrs %{desc: nil, name: nil}

  def fixture(:event_post) do
    {:ok, event_post} = EventPosts.create_event_post(@create_attrs)
    event_post
  end

  describe "index" do
    test "lists all eventposts", %{conn: conn} do
      conn = get(conn, Routes.event_post_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Eventposts"
    end
  end

  describe "new event_post" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.event_post_path(conn, :new))
      assert html_response(conn, 200) =~ "New Event post"
    end
  end

  describe "create event_post" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.event_post_path(conn, :create), event_post: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.event_post_path(conn, :show, id)

      conn = get(conn, Routes.event_post_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Event post"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.event_post_path(conn, :create), event_post: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Event post"
    end
  end

  describe "edit event_post" do
    setup [:create_event_post]

    test "renders form for editing chosen event_post", %{conn: conn, event_post: event_post} do
      conn = get(conn, Routes.event_post_path(conn, :edit, event_post))
      assert html_response(conn, 200) =~ "Edit Event post"
    end
  end

  describe "update event_post" do
    setup [:create_event_post]

    test "redirects when data is valid", %{conn: conn, event_post: event_post} do
      conn = put(conn, Routes.event_post_path(conn, :update, event_post), event_post: @update_attrs)
      assert redirected_to(conn) == Routes.event_post_path(conn, :show, event_post)

      conn = get(conn, Routes.event_post_path(conn, :show, event_post))
      assert html_response(conn, 200) =~ "some updated desc"
    end

    test "renders errors when data is invalid", %{conn: conn, event_post: event_post} do
      conn = put(conn, Routes.event_post_path(conn, :update, event_post), event_post: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Event post"
    end
  end

  describe "delete event_post" do
    setup [:create_event_post]

    test "deletes chosen event_post", %{conn: conn, event_post: event_post} do
      conn = delete(conn, Routes.event_post_path(conn, :delete, event_post))
      assert redirected_to(conn) == Routes.event_post_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.event_post_path(conn, :show, event_post))
      end
    end
  end

  defp create_event_post(_) do
    event_post = fixture(:event_post)
    %{event_post: event_post}
  end
end
