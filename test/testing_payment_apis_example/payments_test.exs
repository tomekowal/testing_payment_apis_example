defmodule TestingPaymentApisExample.PaymentsTest do
  use TestingPaymentApisExample.DataCase

  alias TestingPaymentApisExample.Payments

  describe "authorizations" do
    alias TestingPaymentApisExample.Payments.Authorization

    import TestingPaymentApisExample.PaymentsFixtures

    @invalid_attrs %{amount: nil, merchant_address: nil, merchant_name: nil}

    test "list_authorizations/0 returns all authorizations" do
      authorization = authorization_fixture()
      assert Payments.list_authorizations() == [authorization]
    end

    test "get_authorization!/1 returns the authorization with given id" do
      authorization = authorization_fixture()
      assert Payments.get_authorization!(authorization.id) == authorization
    end

    test "create_authorization/1 with valid data creates a authorization" do
      valid_attrs = %{amount: 42, merchant_address: "some merchant_address", merchant_name: "some merchant_name"}

      assert {:ok, %Authorization{} = authorization} = Payments.create_authorization(valid_attrs)
      assert authorization.amount == 42
      assert authorization.merchant_address == "some merchant_address"
      assert authorization.merchant_name == "some merchant_name"
    end

    test "create_authorization/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payments.create_authorization(@invalid_attrs)
    end

    test "update_authorization/2 with valid data updates the authorization" do
      authorization = authorization_fixture()
      update_attrs = %{amount: 43, merchant_address: "some updated merchant_address", merchant_name: "some updated merchant_name"}

      assert {:ok, %Authorization{} = authorization} = Payments.update_authorization(authorization, update_attrs)
      assert authorization.amount == 43
      assert authorization.merchant_address == "some updated merchant_address"
      assert authorization.merchant_name == "some updated merchant_name"
    end

    test "update_authorization/2 with invalid data returns error changeset" do
      authorization = authorization_fixture()
      assert {:error, %Ecto.Changeset{}} = Payments.update_authorization(authorization, @invalid_attrs)
      assert authorization == Payments.get_authorization!(authorization.id)
    end

    test "delete_authorization/1 deletes the authorization" do
      authorization = authorization_fixture()
      assert {:ok, %Authorization{}} = Payments.delete_authorization(authorization)
      assert_raise Ecto.NoResultsError, fn -> Payments.get_authorization!(authorization.id) end
    end

    test "change_authorization/1 returns a authorization changeset" do
      authorization = authorization_fixture()
      assert %Ecto.Changeset{} = Payments.change_authorization(authorization)
    end
  end

  describe "captures" do
    alias TestingPaymentApisExample.Payments.Capture

    import TestingPaymentApisExample.PaymentsFixtures

    @invalid_attrs %{amount: nil, merchant_address: nil, merchant_name: nil}

    test "list_captures/0 returns all captures" do
      capture = capture_fixture()
      assert Payments.list_captures() == [capture]
    end

    test "get_capture!/1 returns the capture with given id" do
      capture = capture_fixture()
      assert Payments.get_capture!(capture.id) == capture
    end

    test "create_capture/1 with valid data creates a capture" do
      valid_attrs = %{amount: 42, merchant_address: "some merchant_address", merchant_name: "some merchant_name"}

      assert {:ok, %Capture{} = capture} = Payments.create_capture(valid_attrs)
      assert capture.amount == 42
      assert capture.merchant_address == "some merchant_address"
      assert capture.merchant_name == "some merchant_name"
    end

    test "create_capture/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payments.create_capture(@invalid_attrs)
    end

    test "update_capture/2 with valid data updates the capture" do
      capture = capture_fixture()
      update_attrs = %{amount: 43, merchant_address: "some updated merchant_address", merchant_name: "some updated merchant_name"}

      assert {:ok, %Capture{} = capture} = Payments.update_capture(capture, update_attrs)
      assert capture.amount == 43
      assert capture.merchant_address == "some updated merchant_address"
      assert capture.merchant_name == "some updated merchant_name"
    end

    test "update_capture/2 with invalid data returns error changeset" do
      capture = capture_fixture()
      assert {:error, %Ecto.Changeset{}} = Payments.update_capture(capture, @invalid_attrs)
      assert capture == Payments.get_capture!(capture.id)
    end

    test "delete_capture/1 deletes the capture" do
      capture = capture_fixture()
      assert {:ok, %Capture{}} = Payments.delete_capture(capture)
      assert_raise Ecto.NoResultsError, fn -> Payments.get_capture!(capture.id) end
    end

    test "change_capture/1 returns a capture changeset" do
      capture = capture_fixture()
      assert %Ecto.Changeset{} = Payments.change_capture(capture)
    end
  end

  describe "refunds" do
    alias TestingPaymentApisExample.Payments.Refund

    import TestingPaymentApisExample.PaymentsFixtures

    @invalid_attrs %{amount: nil, merchant_address: nil, merchant_name: nil}

    test "list_refunds/0 returns all refunds" do
      refund = refund_fixture()
      assert Payments.list_refunds() == [refund]
    end

    test "get_refund!/1 returns the refund with given id" do
      refund = refund_fixture()
      assert Payments.get_refund!(refund.id) == refund
    end

    test "create_refund/1 with valid data creates a refund" do
      valid_attrs = %{amount: 42, merchant_address: "some merchant_address", merchant_name: "some merchant_name"}

      assert {:ok, %Refund{} = refund} = Payments.create_refund(valid_attrs)
      assert refund.amount == 42
      assert refund.merchant_address == "some merchant_address"
      assert refund.merchant_name == "some merchant_name"
    end

    test "create_refund/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payments.create_refund(@invalid_attrs)
    end

    test "update_refund/2 with valid data updates the refund" do
      refund = refund_fixture()
      update_attrs = %{amount: 43, merchant_address: "some updated merchant_address", merchant_name: "some updated merchant_name"}

      assert {:ok, %Refund{} = refund} = Payments.update_refund(refund, update_attrs)
      assert refund.amount == 43
      assert refund.merchant_address == "some updated merchant_address"
      assert refund.merchant_name == "some updated merchant_name"
    end

    test "update_refund/2 with invalid data returns error changeset" do
      refund = refund_fixture()
      assert {:error, %Ecto.Changeset{}} = Payments.update_refund(refund, @invalid_attrs)
      assert refund == Payments.get_refund!(refund.id)
    end

    test "delete_refund/1 deletes the refund" do
      refund = refund_fixture()
      assert {:ok, %Refund{}} = Payments.delete_refund(refund)
      assert_raise Ecto.NoResultsError, fn -> Payments.get_refund!(refund.id) end
    end

    test "change_refund/1 returns a refund changeset" do
      refund = refund_fixture()
      assert %Ecto.Changeset{} = Payments.change_refund(refund)
    end
  end
end
