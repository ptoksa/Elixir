defmodule BankingApiWeb.ErrorView do
  use BankingApiWeb, :html

  def render("404.json", _assigns) do
    %{
      error: "Not Found",
      message: "The resource you requested could not be found."
    }
  end

  def render("500.json", _assigns) do
    %{
      error: "Internal Server Error",
      message: "Something went wrong on the server."
    }
  end
end
