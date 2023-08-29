defmodule TestingPaymentApisExampleWeb.CaptureJSON do
  alias TestingPaymentApisExample.Payments.Capture

  @doc """
  Renders a list of captures.
  """
  def index(%{captures: captures}) do
    %{data: for(capture <- captures, do: data(capture))}
  end

  @doc """
  Renders a single capture.
  """
  def show(%{capture: capture}) do
    %{data: data(capture)}
  end

  defp data(%Capture{} = capture) do
    %{
      id: capture.id,
      merchant_name: capture.merchant_name,
      merchant_address: capture.merchant_address,
      amount: capture.amount
    }
  end
end
