defmodule BankingApi.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :balance, :decimal
      add :bank, :string

      timestamps(type: :utc_datetime)
    end
  end
end
