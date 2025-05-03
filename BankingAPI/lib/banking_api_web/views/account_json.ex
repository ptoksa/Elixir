defmodule BankingApiWeb.AccountJSON do
  def index(%{accounts: accounts}) do
    %{data: Enum.map(accounts, &account_json/1)}
  end

  def show(%{account: account}) do
    %{data: account_json(account)}
  end

  defp account_json(account) do
    %{
      id: account.id,
      name: account.name,
      bank: account.bank,
      balance: account.balance,
      inserted_at: account.inserted_at,
      updated_at: account.updated_at
    }
  end
end
