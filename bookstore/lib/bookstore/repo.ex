defmodule Bookstore.Repo do
  use Ecto.Repo,
    otp_app: :bookstore,
    adapter: Ecto.Adapters.Postgres
  def delete_book(book_id) do
    Repo.delete(YourApp.Book.get!(book_id))
  end
end
