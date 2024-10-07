defmodule JokesWeb.Router do
  use JokesWeb, :router

  # Define pipelines for browser and API
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {JokesWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Scope for web routes
  scope "/", JokesWeb do
    pipe_through :browser

    live "/", JokeLive

    # Ensure the JokeController is correctly defined
    get "/joke", JokeController, :index
  end

  # API scope for jokes
  scope "/api", JokesWeb do
    pipe_through :api

    # Ensure ApiController actions are implemented correctly
    get "/jokes", ApiController, :list_jokes
    get "/jokes/:id", ApiController, :get_joke!
    post "/jokes", ApiController, :create_joke
    put "/jokes/:id", ApiController, :update_joke
    delete "/jokes/:id", ApiController, :delete_joke
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:jokes, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: JokesWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
