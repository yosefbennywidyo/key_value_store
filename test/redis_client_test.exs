defmodule KeyValueStore.RedisClientTest do
  use ExUnit.Case, async: true
  require Logger

  setup_all do
    {:ok, conn} = KeyValueStore.RedisClient.start_link()
    {:ok, conn: conn}
  end

  test "sets and gets key/value pair in Redis", %{conn: conn} do
    assert KeyValueStore.RedisClient.set(conn, "test_key", "test_value") == :ok
    assert KeyValueStore.RedisClient.get(conn, "test_key") == {:ok, "test_value"}
  end

  test "returns nil when key not found in Redis", %{conn: conn} do
    assert KeyValueStore.RedisClient.get(conn, "non_existent_key") == {:ok, nil}
  end
end
