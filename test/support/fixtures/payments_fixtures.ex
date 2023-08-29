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

  @doc """
  Generate a capture.
  """
  def capture_fixture(attrs \\ %{}) do
    {:ok, capture} =
      attrs
      |> Enum.into(%{
        amount: 42,
        merchant_address: "some merchant_address",
        merchant_name: "some merchant_name"
      })
      |> TestingPaymentApisExample.Payments.create_capture()

    capture
  end

  @doc """
  Generate a refund.
  """
  def refund_fixture(attrs \\ %{}) do
    {:ok, refund} =
      attrs
      |> Enum.into(%{
        amount: 42,
        merchant_address: "some merchant_address",
        merchant_name: "some merchant_name"
      })
      |> TestingPaymentApisExample.Payments.create_refund()

    refund
  end
end
