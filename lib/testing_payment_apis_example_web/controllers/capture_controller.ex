defmodule TestingPaymentApisExampleWeb.CaptureController do
  use TestingPaymentApisExampleWeb, :controller

  alias TestingPaymentApisExample.Payments
  alias TestingPaymentApisExample.Payments.Capture

  action_fallback TestingPaymentApisExampleWeb.FallbackController

  def index(conn, _params) do
    captures = Payments.list_captures()
    render(conn, :index, captures: captures)
  end

  def create(conn, %{"capture" => capture_params}) do
    with {:ok, %Capture{} = capture} <- Payments.create_capture(capture_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/captures/#{capture}")
      |> render(:show, capture: capture)
    end
  end

  def show(conn, %{"id" => id}) do
    capture = Payments.get_capture!(id)
    render(conn, :show, capture: capture)
  end

  def update(conn, %{"id" => id, "capture" => capture_params}) do
    capture = Payments.get_capture!(id)

    with {:ok, %Capture{} = capture} <- Payments.update_capture(capture, capture_params) do
      render(conn, :show, capture: capture)
    end
  end

  def delete(conn, %{"id" => id}) do
    capture = Payments.get_capture!(id)

    with {:ok, %Capture{}} <- Payments.delete_capture(capture) do
      send_resp(conn, :no_content, "")
    end
  end
end
