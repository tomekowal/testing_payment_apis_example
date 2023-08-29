defmodule TestingPaymentApisExampleWeb.RefundJSON do
  alias TestingPaymentApisExample.Payments.Refund

  @doc """
  Renders a list of refunds.
  """
  def index(%{refunds: refunds}) do
    %{data: for(refund <- refunds, do: data(refund))}
  end

  @doc """
  Renders a single refund.
  """
  def show(%{refund: refund}) do
    %{data: data(refund)}
  end

  defp data(%Refund{} = refund) do
    %{
      id: refund.id,
      merchant_name: refund.merchant_name,
      merchant_address: refund.merchant_address,
      amount: refund.amount
    }
  end
end
