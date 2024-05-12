defmodule Bookstore.BooksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bookstore.Books` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        author: "some author",
        title: "some title"
      })
      |> Bookstore.Books.create_book()

    book
  end
end
