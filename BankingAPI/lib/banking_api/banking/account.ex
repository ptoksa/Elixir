defmodule BankingApi.Banking.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @derive {Jason.Encoder, only: [:id, :name, :balance, :bank, :inserted_at, :updated_at]}
  schema "accounts" do
    field :balance, :decimal
    field :bank, :string
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:name, :balance, :bank])
    |> validate_required([:name, :balance, :bank])
  end
end
