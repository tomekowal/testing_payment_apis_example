defmodule TestingPaymentApisExampleWeb.AuthorizationJSON do
  alias TestingPaymentApisExample.Payments.Authorization

  @doc """
  Renders a list of authorizations.
  """
  def index(%{authorizations: authorizations}) do
    %{data: for(authorization <- authorizations, do: data(authorization))}
  end

  @doc """
  Renders a single authorization.
  """
  def show(%{authorization: authorization}) do
    %{data: data(authorization)}
  end

  defp data(%Authorization{} = authorization) do
    %{
      id: authorization.id,
      merchant_name: authorization.merchant_name,
      merchant_address: authorization.merchant_address,
      amount: authorization.amount
    }
  end
end
