defmodule BankingApi.BankClient do
  use GenServer

  @doc """
  Starts the bank client.
  """
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  @impl true
  def init(state), do: {:ok, state}

  @doc """
  Simulates retrieving a balance from an external bank.
  """
  def get_balance(account_id) do
    GenServer.call(__MODULE__, {:get_balance, account_id})
  end

  @impl true
  def handle_call({:get_balance, _id}, _from, state) do
    {:reply, Decimal.new("1234.56"), state}
  end
end
