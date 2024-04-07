defmodule KeyValueStore.Storage do
  @doc """
  High-level interaction with Redis.

  This module provides functions to interact with Redis.
  
  
  Set a value for a given key in the key-value store.

  ## Examples

      iex> KeyValueStore.Storage.set("key", "value")
      :ok
  """

  # Function to set a key-value pair in the storage
  def set(key, value) do
    {:ok, conn} = KeyValueStore.RedisClient.start_link()  # Establish connection to Redis
    KeyValueStore.RedisClient.set(conn, key, value)       # Set key-value pair in Redis
  end

  @doc """
  Get the value for a given key from the key-value store.

  ## Examples

      iex> KeyValueStore.Storage.get("key")
      {:ok, "value"}
      iex> KeyValueStore.Storage.get("invalid")
      {:ok, nil}
  """

  # Function to retrieve the value for a given key from the storage
  def get(key) do
    {:ok, conn} = KeyValueStore.RedisClient.start_link()  # Establish connection to Redis
    KeyValueStore.RedisClient.get(conn, key)              # Get value for the key from Redis
  end
end
