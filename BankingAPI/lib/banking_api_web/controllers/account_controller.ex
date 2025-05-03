defmodule BankingApiWeb.AccountController do
  use BankingApiWeb, :controller

  alias BankingApi.Banking
  alias BankingApi.Banking.Account

  action_fallback BankingApiWeb.FallbackController

  def index(conn, _params) do
    accounts = Banking.list_accounts()
    render(conn, :index, accounts: accounts)
  end

  def show(conn, %{"id" => id}) do
    case Banking.get_account(id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> render(BankingApiWeb.ErrorView, "404.json")

      account -> 
        conn
        |> put_status(:ok)
        |> render("show.json", account: account)
    end
  end

  def create(conn, %{"account" => account_params}) do
    case Banking.create_account(account_params) do
      {:ok, %Account{} = account} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", ~p"/api/accounts/#{account.id}")
        |> render("show.json", account: account)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> put_view(BankingApiWeb.ChangesetView)
        |> render("error.json", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "account" => account_params}) do
    case Banking.get_account(id) do
      nil ->
        send_resp(conn, 404, "Not found")

      account ->
        case Banking.update_account(account, account_params) do
          {:ok, updated_account} ->
            render(conn, "show.json", account: updated_account)

          {:error, changeset} ->
            conn
            |> put_status(:unprocessable_entity)
            |> put_view(BankingApiWeb.ChangesetView)
            |> render("error.json", changeset: changeset)
        end
    end
  end

  def delete(conn, %{"id" => id}) do
    case Banking.get_account(id) do
      nil ->
        send_resp(conn, 404, "Not found")

      account ->
        {:ok, _deleted} = Banking.delete_account(account)
        send_resp(conn, :no_content, "")
    end
  end
end
