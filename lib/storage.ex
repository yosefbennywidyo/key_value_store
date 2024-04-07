defmodule KeyValueStore.Storage do
  # Function to set a key-value pair in the storage
  def set(key, value) do
    {:ok, conn} = KeyValueStore.RedisClient.start_link()  # Establish connection to Redis
    KeyValueStore.RedisClient.set(conn, key, value)       # Set key-value pair in Redis
  end

  # Function to retrieve the value for a given key from the storage
  def get(key) do
    {:ok, conn} = KeyValueStore.RedisClient.start_link()  # Establish connection to Redis
    KeyValueStore.RedisClient.get(conn, key)              # Get value for the key from Redis
  end
end
