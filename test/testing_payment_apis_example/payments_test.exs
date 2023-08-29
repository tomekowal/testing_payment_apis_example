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
end
