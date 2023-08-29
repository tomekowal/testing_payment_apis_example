defmodule TestingPaymentApisExample.Payments.Authorization do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authorizations" do
    field :amount, :integer
    field :merchant_address, :string
    field :merchant_name, :string

    timestamps()
  end

  @doc false
  def changeset(authorization, attrs) do
    authorization
    |> cast(attrs, [:merchant_name, :merchant_address, :amount])
    |> validate_required([:merchant_name, :merchant_address, :amount])
  end
end
