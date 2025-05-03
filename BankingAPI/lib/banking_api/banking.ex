defmodule BankingApi.Banking do
  @moduledoc """
  The Banking context.
  """

  import Ecto.Query, warn: false
  alias BankingApi.Repo

  alias BankingApi.Banking.Account

  @doc """
  Returns the list of accounts.

  ## Examples

      iex> list_accounts()
      [%Account{}, ...]
  """
  def list_accounts do
    Repo.all(Account)
  end

  @doc """
  Gets a single account by ID.

  Returns `nil` if the account does not exist.

  ## Examples

      iex> get_account("some-uuid")
      %Account{}

      iex> get_account("non-existent-id")
      nil
  """
  def get_account(id), do: Repo.get(Account, id)

  @doc """
  Gets a single account by ID.

  Raises `Ecto.NoResultsError` if the account does not exist.

  ## Examples

      iex> get_account!("some-uuid")
      %Account{}

      iex> get_account!("non-existent-id")
      ** (Ecto.NoResultsError)
  """
  def get_account!(id), do: Repo.get!(Account, id)

  @doc """
  Creates an account.

  ## Examples

      iex> create_account(%{name: "Alice", balance: 1000, bank: "Elixir Bank"})
      {:ok, %Account{}}

      iex> create_account(%{bad: "data"})
      {:error, %Ecto.Changeset{}}
  """
  def create_account(attrs \\ %{}) do
    %Account{}
    |> Account.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates an account.

  ## Examples

      iex> update_account(account, %{balance: 1500})
      {:ok, %Account{}}

      iex> update_account(account, %{bad: "data"})
      {:error, %Ecto.Changeset{}}
  """
  def update_account(%Account{} = account, attrs) do
    account
    |> Account.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes an account.

  ## Examples

      iex> delete_account(account)
      {:ok, %Account{}}
  """
  def delete_account(%Account{} = account) do
    Repo.delete(account)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking account changes.

  ## Examples

      iex> change_account(account)
      %Ecto.Changeset{data: %Account{}}
  """
  def change_account(%Account{} = account, attrs \\ %{}) do
    Account.changeset(account, attrs)
  end
end
