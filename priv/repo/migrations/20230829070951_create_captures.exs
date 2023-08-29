defmodule TestingPaymentApisExample.Repo.Migrations.CreateCaptures do
  use Ecto.Migration

  def change do
    create table(:captures) do
      add :merchant_name, :string
      add :merchant_address, :string
      add :amount, :integer
      add :authorization_id, references(:authorizations, on_delete: :nothing)

      timestamps()
    end

    create index(:captures, [:authorization_id])
  end
end
