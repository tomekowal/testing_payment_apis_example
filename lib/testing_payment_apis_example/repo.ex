defmodule TestingPaymentApisExample.Repo do
  use Ecto.Repo,
    otp_app: :testing_payment_apis_example,
    adapter: Ecto.Adapters.Postgres
end
