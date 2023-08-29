defmodule TestingPaymentApisExample.Repo.Migrations.CreateRefunds do
  use Ecto.Migration

  def change do
    create table(:refunds) do
      add :merchant_name, :string
      add :merchant_address, :string
      add :amount, :integer
      add :authorization_id, references(:authorizations, on_delete: :nothing)

      timestamps()
    end

    create index(:refunds, [:authorization_id])
  end
end
