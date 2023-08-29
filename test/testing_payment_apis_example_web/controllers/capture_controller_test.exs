defmodule TestingPaymentApisExampleWeb.CaptureControllerTest do
  use TestingPaymentApisExampleWeb.ConnCase

  import TestingPaymentApisExample.PaymentsFixtures

  alias TestingPaymentApisExample.Payments.Capture

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
    test "lists all captures", %{conn: conn} do
      conn = get(conn, ~p"/api/captures")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create capture" do
    test "renders capture when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/captures", capture: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/captures/#{id}")

      assert %{
               "id" => ^id,
               "amount" => 42,
               "merchant_address" => "some merchant_address",
               "merchant_name" => "some merchant_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/captures", capture: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update capture" do
    setup [:create_capture]

    test "renders capture when data is valid", %{conn: conn, capture: %Capture{id: id} = capture} do
      conn = put(conn, ~p"/api/captures/#{capture}", capture: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/captures/#{id}")

      assert %{
               "id" => ^id,
               "amount" => 43,
               "merchant_address" => "some updated merchant_address",
               "merchant_name" => "some updated merchant_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, capture: capture} do
      conn = put(conn, ~p"/api/captures/#{capture}", capture: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete capture" do
    setup [:create_capture]

    test "deletes chosen capture", %{conn: conn, capture: capture} do
      conn = delete(conn, ~p"/api/captures/#{capture}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/captures/#{capture}")
      end
    end
  end

  defp create_capture(_) do
    capture = capture_fixture()
    %{capture: capture}
  end
end
