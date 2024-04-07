defmodule KeyValueStore do
  @moduledoc """
  A simple key-value store module.

  This module provides a convenient interface for interacting with a key-value store, backed by Redis. It exposes functions to set and retrieve key-value pairs.

  To use this module, make sure you have Redis installed and running on your system.

  ## Examples

  ### Using KeyValueStore.Storage:

      iex> KeyValueStore.Storage.set("key", "value")
      :ok

      iex> KeyValueStore.Storage.get("key")
      {:ok, "value"}

  For more details on key-value operations, see `KeyValueStore.Storage` module.

  ### Using KeyValueStore.RedisClient:

  Establish a connection to Redis:

      iex> {:ok, _conn} = KeyValueStore.RedisClient.start_link()

  Set a key-value pair:

      iex> {:ok, conn} = KeyValueStore.RedisClient.start_link()
      iex> KeyValueStore.RedisClient.set(conn, "key", "value")
      :ok

  Retrieve a value for a key:

      iex> {:ok, conn} = KeyValueStore.RedisClient.start_link()
      iex> KeyValueStore.RedisClient.get(conn, "key")
      {:ok, "value"}

  For low-level interaction with Redis, see `KeyValueStore.RedisClient` module.
  """
end
