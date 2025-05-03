# lib/banking_api_web/controllers/page_controller.ex
defmodule BankingApiWeb.PageController do
  use BankingApiWeb, :controller

  def index(conn, _params) do
    json(conn, %{message: "Welcome to Banking API"})
  end
end
