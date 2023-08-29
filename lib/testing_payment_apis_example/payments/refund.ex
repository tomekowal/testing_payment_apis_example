defmodule TestingPaymentApisExample.Payments.Refund do
  use Ecto.Schema
  import Ecto.Changeset

  schema "refunds" do
    field :amount, :integer
    field :merchant_address, :string
    field :merchant_name, :string
    field :authorization_id, :id

    timestamps()
  end

  @doc false
  def changeset(refund, attrs) do
    refund
    |> cast(attrs, [:merchant_name, :merchant_address, :amount])
    |> validate_required([:merchant_name, :merchant_address, :amount])
  end
end
