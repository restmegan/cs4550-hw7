defmodule Events.EventPostsTest do
  use Events.DataCase

  alias Events.EventPosts

  describe "eventposts" do
    alias Events.EventPosts.EventPost

    @valid_attrs %{desc: "some desc", name: "some name"}
    @update_attrs %{desc: "some updated desc", name: "some updated name"}
    @invalid_attrs %{desc: nil, name: nil}

    def event_post_fixture(attrs \\ %{}) do
      {:ok, event_post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> EventPosts.create_event_post()

      event_post
    end

    test "list_eventposts/0 returns all eventposts" do
      event_post = event_post_fixture()
      assert EventPosts.list_eventposts() == [event_post]
    end

    test "get_event_post!/1 returns the event_post with given id" do
      event_post = event_post_fixture()
      assert EventPosts.get_event_post!(event_post.id) == event_post
    end

    test "create_event_post/1 with valid data creates a event_post" do
      assert {:ok, %EventPost{} = event_post} = EventPosts.create_event_post(@valid_attrs)
      assert event_post.desc == "some desc"
      assert event_post.name == "some name"
    end

    test "create_event_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = EventPosts.create_event_post(@invalid_attrs)
    end

    test "update_event_post/2 with valid data updates the event_post" do
      event_post = event_post_fixture()
      assert {:ok, %EventPost{} = event_post} = EventPosts.update_event_post(event_post, @update_attrs)
      assert event_post.desc == "some updated desc"
      assert event_post.name == "some updated name"
    end

    test "update_event_post/2 with invalid data returns error changeset" do
      event_post = event_post_fixture()
      assert {:error, %Ecto.Changeset{}} = EventPosts.update_event_post(event_post, @invalid_attrs)
      assert event_post == EventPosts.get_event_post!(event_post.id)
    end

    test "delete_event_post/1 deletes the event_post" do
      event_post = event_post_fixture()
      assert {:ok, %EventPost{}} = EventPosts.delete_event_post(event_post)
      assert_raise Ecto.NoResultsError, fn -> EventPosts.get_event_post!(event_post.id) end
    end

    test "change_event_post/1 returns a event_post changeset" do
      event_post = event_post_fixture()
      assert %Ecto.Changeset{} = EventPosts.change_event_post(event_post)
    end
  end
end
