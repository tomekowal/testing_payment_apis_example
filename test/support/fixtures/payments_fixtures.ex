defmodule TestingPaymentApisExample.PaymentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TestingPaymentApisExample.Payments` context.
  """

  @doc """
  Generate a authorization.
  """
  def authorization_fixture(attrs \\ %{}) do
    {:ok, authorization} =
      attrs
      |> Enum.into(%{
        amount: 42,
        merchant_address: "some merchant_address",
        merchant_name: "some merchant_name"
      })
      |> TestingPaymentApisExample.Payments.create_authorization()

    authorization
  end
end
