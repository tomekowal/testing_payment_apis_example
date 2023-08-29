defmodule TestingPaymentApisExampleWeb.RefundController do
  use TestingPaymentApisExampleWeb, :controller

  alias TestingPaymentApisExample.Payments
  alias TestingPaymentApisExample.Payments.Refund

  action_fallback TestingPaymentApisExampleWeb.FallbackController

  def index(conn, _params) do
    refunds = Payments.list_refunds()
    render(conn, :index, refunds: refunds)
  end

  def create(conn, %{"refund" => refund_params}) do
    with {:ok, %Refund{} = refund} <- Payments.create_refund(refund_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/refunds/#{refund}")
      |> render(:show, refund: refund)
    end
  end

  def show(conn, %{"id" => id}) do
    refund = Payments.get_refund!(id)
    render(conn, :show, refund: refund)
  end

  def update(conn, %{"id" => id, "refund" => refund_params}) do
    refund = Payments.get_refund!(id)

    with {:ok, %Refund{} = refund} <- Payments.update_refund(refund, refund_params) do
      render(conn, :show, refund: refund)
    end
  end

  def delete(conn, %{"id" => id}) do
    refund = Payments.get_refund!(id)

    with {:ok, %Refund{}} <- Payments.delete_refund(refund) do
      send_resp(conn, :no_content, "")
    end
  end
end
