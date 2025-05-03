defmodule BankingApiWeb.Router do
  use BankingApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BankingApiWeb do
    pipe_through :api

    get "/", PageController, :index
  end

  scope "/api", BankingApiWeb do
    pipe_through :api

    get "/accounts", AccountController, :index
    get "/accounts/:id/balance", AccountController, :balance
    get "/accounts/:id", AccountController, :show
    post "/accounts", AccountController, :create
    put "/accounts/:id", AccountController, :update
    delete "/accounts/:id", AccountController, :delete
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:banking_api, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: BankingApiWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
