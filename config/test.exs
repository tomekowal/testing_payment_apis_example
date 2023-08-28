import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :testing_payment_apis_example, TestingPaymentApisExample.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "testing_payment_apis_example_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :testing_payment_apis_example, TestingPaymentApisExampleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "tG4pV8APpokxE26qb2/miUZ1F5Ex9gag+jIGL08nxXF30lgWUaBUmefvveFn0c+s",
  server: false

# In test we don't send emails.
config :testing_payment_apis_example, TestingPaymentApisExample.Mailer,
  adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
