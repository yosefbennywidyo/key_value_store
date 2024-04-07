defmodule KeyValueStoreTest do
  use ExUnit.Case
  doctest KeyValueStore

  test "set key/value pair" do
    assert KeyValueStore.Storage.set("key", "value") == :ok
  end

  test "get exist key return value" do
    assert KeyValueStore.Storage.get("key") == {:ok, "value"}
  end

  test "get invalid key return nil" do
    assert KeyValueStore.Storage.get("invalid") == {:ok, nil}
  end
end