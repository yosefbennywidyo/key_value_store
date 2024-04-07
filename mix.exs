defmodule KeyValueStore.MixProject do
  use Mix.Project

  # Configuration for the Mix project
  def project do
    [
      app: :key_value_store,               # Name of the application
      version: "0.1.0",                    # Version of the application
      elixir: "~> 1.16",                   # Required Elixir version
      start_permanent: Mix.env() == :prod, # Whether to start the application permanently in production environment
      deps: deps()                         # Dependencies of the project
    ]
  end

  # Application configuration
  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :ssl],     # Extra applications needed for this application
      application: [KeyValueStore.Application] # Main application module
    ]
  end

  # Dependency configuration
  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:redix, "~> 0.8.0"}   # Dependency on the Redix library for Redis interaction
    ]
  end
end
