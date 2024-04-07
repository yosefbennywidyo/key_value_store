defmodule KeyValueStore.StorageTest do
  use ExUnit.Case

  test "sets and gets key/value pair" do
    assert KeyValueStore.Storage.set("foo", "bar") == :ok
    assert KeyValueStore.Storage.get("foo") == {:ok, "bar"}
  end

  test "get invalid key return nil" do
    assert KeyValueStore.Storage.get("invalid_foo") == {:ok, nil}
  end
end
