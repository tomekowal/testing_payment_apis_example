defmodule TestingPaymentApisExampleWeb.RefundControllerTest do
  use TestingPaymentApisExampleWeb.ConnCase

  import TestingPaymentApisExample.PaymentsFixtures

  alias TestingPaymentApisExample.Payments.Refund

  @create_attrs %{
    amount: 42,
    merchant_address: "some merchant_address",
    merchant_name: "some merchant_name"
  }
  @update_attrs %{
    amount: 43,
    merchant_address: "some updated merchant_address",
    merchant_name: "some updated merchant_name"
  }
  @invalid_attrs %{amount: nil, merchant_address: nil, merchant_name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all refunds", %{conn: conn} do
      conn = get(conn, ~p"/api/refunds")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create refund" do
    test "renders refund when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/refunds", refund: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/refunds/#{id}")

      assert %{
               "id" => ^id,
               "amount" => 42,
               "merchant_address" => "some merchant_address",
               "merchant_name" => "some merchant_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/refunds", refund: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update refund" do
    setup [:create_refund]

    test "renders refund when data is valid", %{conn: conn, refund: %Refund{id: id} = refund} do
      conn = put(conn, ~p"/api/refunds/#{refund}", refund: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/refunds/#{id}")

      assert %{
               "id" => ^id,
               "amount" => 43,
               "merchant_address" => "some updated merchant_address",
               "merchant_name" => "some updated merchant_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, refund: refund} do
      conn = put(conn, ~p"/api/refunds/#{refund}", refund: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete refund" do
    setup [:create_refund]

    test "deletes chosen refund", %{conn: conn, refund: refund} do
      conn = delete(conn, ~p"/api/refunds/#{refund}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/refunds/#{refund}")
      end
    end
  end

  defp create_refund(_) do
    refund = refund_fixture()
    %{refund: refund}
  end
end
