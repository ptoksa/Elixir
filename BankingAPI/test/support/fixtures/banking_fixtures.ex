defmodule BankingApi.BankingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BankingApi.Banking` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        balance: "120.5",
        bank: "some bank",
        name: "some name"
      })
      |> BankingApi.Banking.create_account()

    account
  end
end
