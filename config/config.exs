import Config

# Configuration for the application

# Configuration specific to the development environment
config :key_value_store, :dev,
  redis_host: "localhost",
  redis_port: 6379

# Configuration specific to the test environment
config :key_value_store, :test,
  redis_host: "localhost",
  redis_port: 6380

# Configuration specific to the staging environment
config :key_value_store, :staging,
  redis_host: "localhost",
  redis_port: 6381

# Configuration specific to the production environment
config :key_value_store, :production,
  redis_host: "localhost",
  redis_port: 6382
