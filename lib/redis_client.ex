defmodule KeyValueStore.RedisClient do
  require Logger  # Import Logger module for logging

  @redis_host Application.compile_env(:key_value_store, Mix.env())[:redis_host]  # Default Redis host
  @redis_port Application.compile_env(:key_value_store, Mix.env())[:redis_port]  # Default Redis port

  # Function to start a connection to Redis
  def start_link do
    Redix.start_link(host: @redis_host, port: @redis_port)
  end

  # Function to set a key-value pair in Redis
  def set(conn, key, value) do
    case Redix.command(conn, ["SET", key, value]) do
      {:ok, "OK"} ->
        :ok
      {:error, reason} ->
        Logger.error("Failed to set key #{key} in Redis: #{reason}")  # Log error if setting key fails
        {:error, reason}
    end
  end

  # Function to retrieve the value for a key from Redis
  def get(conn, key) do
    case Redix.command(conn, ["GET", key]) do
      {:ok, result} ->
        {:ok, result}
      {:error, reason} ->
        Logger.error("Failed to get value for key #{key} from Redis: #{reason}")  # Log error if getting value fails
        {:error, reason}
    end
  end
end
