defmodule KeyValueStore.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KeyValueStoreWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:key_value_store, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: KeyValueStore.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: KeyValueStore.Finch},
      # Start a worker by calling: KeyValueStore.Worker.start_link(arg)
      # {KeyValueStore.Worker, arg},
      # Start to serve requests, typically the last entry
      KeyValueStoreWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KeyValueStore.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KeyValueStoreWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
