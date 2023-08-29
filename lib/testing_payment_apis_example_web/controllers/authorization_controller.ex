defmodule TestingPaymentApisExampleWeb.AuthorizationController do
  use TestingPaymentApisExampleWeb, :controller

  alias TestingPaymentApisExample.Payments
  alias TestingPaymentApisExample.Payments.Authorization

  action_fallback TestingPaymentApisExampleWeb.FallbackController

  def index(conn, _params) do
    authorizations = Payments.list_authorizations()
    render(conn, :index, authorizations: authorizations)
  end

  def create(conn, %{"authorization" => authorization_params}) do
    with {:ok, %Authorization{} = authorization} <- Payments.create_authorization(authorization_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/authorizations/#{authorization}")
      |> render(:show, authorization: authorization)
    end
  end

  def show(conn, %{"id" => id}) do
    authorization = Payments.get_authorization!(id)
    render(conn, :show, authorization: authorization)
  end

  def update(conn, %{"id" => id, "authorization" => authorization_params}) do
    authorization = Payments.get_authorization!(id)

    with {:ok, %Authorization{} = authorization} <- Payments.update_authorization(authorization, authorization_params) do
      render(conn, :show, authorization: authorization)
    end
  end

  def delete(conn, %{"id" => id}) do
    authorization = Payments.get_authorization!(id)

    with {:ok, %Authorization{}} <- Payments.delete_authorization(authorization) do
      send_resp(conn, :no_content, "")
    end
  end
end
