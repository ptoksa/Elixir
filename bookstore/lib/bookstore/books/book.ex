defmodule Bookstore.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bookstore.Repo

  schema "books" do
    field :author, :string
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author])
    |> validate_required([:title, :author])
  end

  # Add the get!/1 function to fetch a book by ID
  def get!(book_id) do
    Repo.get!(Bookstore.Books.Book, book_id)
  end
end
