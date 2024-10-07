defmodule Bookstore.Repo do
  use Ecto.Repo,
    otp_app: :bookstore,
    adapter: Ecto.Adapters.Postgres

  def delete_book(book_id) do
    Bookstore.Repo.delete(Bookstore.Books.Book.get!(book_id))  # Use the full module name for Repo and Book
  end
end
