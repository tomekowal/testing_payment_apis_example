defmodule TestingPaymentApisExample.Repo.Migrations.CreateAuthorizations do
  use Ecto.Migration

  def change do
    create table(:authorizations) do
      add :merchant_name, :string
      add :merchant_address, :string
      add :amount, :integer

      timestamps()
    end
  end
end
