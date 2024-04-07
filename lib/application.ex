defmodule KeyValueStore.Application do
  use Application

  # Callback function to start the application
  def start(_type, _args) do
    children = [
      # Start the RedisClient as a child process
      {KeyValueStore.RedisClient, []},
      # Add other children of your supervision tree here
    ]

    # Configuration options for the supervisor
    opts = [strategy: :one_for_one, name: KeyValueStore.Supervisor]
    
    # Start the supervisor with the specified children and options
    Supervisor.start_link(children, opts)
  end
end
