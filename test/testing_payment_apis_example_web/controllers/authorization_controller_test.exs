defmodule TestingPaymentApisExampleWeb.AuthorizationControllerTest do
  use TestingPaymentApisExampleWeb.ConnCase

  import TestingPaymentApisExample.PaymentsFixtures

  alias TestingPaymentApisExample.Payments.Authorization

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
    test "lists all authorizations", %{conn: conn} do
      conn = get(conn, ~p"/api/authorizations")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create authorization" do
    test "renders authorization when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/authorizations", authorization: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/authorizations/#{id}")

      assert %{
               "id" => ^id,
               "amount" => 42,
               "merchant_address" => "some merchant_address",
               "merchant_name" => "some merchant_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/authorizations", authorization: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update authorization" do
    setup [:create_authorization]

    test "renders authorization when data is valid", %{conn: conn, authorization: %Authorization{id: id} = authorization} do
      conn = put(conn, ~p"/api/authorizations/#{authorization}", authorization: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/authorizations/#{id}")

      assert %{
               "id" => ^id,
               "amount" => 43,
               "merchant_address" => "some updated merchant_address",
               "merchant_name" => "some updated merchant_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, authorization: authorization} do
      conn = put(conn, ~p"/api/authorizations/#{authorization}", authorization: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete authorization" do
    setup [:create_authorization]

    test "deletes chosen authorization", %{conn: conn, authorization: authorization} do
      conn = delete(conn, ~p"/api/authorizations/#{authorization}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/authorizations/#{authorization}")
      end
    end
  end

  defp create_authorization(_) do
    authorization = authorization_fixture()
    %{authorization: authorization}
  end
end
