defmodule BankingApiWeb do
  # Define static asset paths (used by Plug.Static)
  def static_paths, do: ~w(assets fonts images favicon.ico robots.txt)

  # Use this macro for router modules
  def router do
    quote do
      use Phoenix.Router, helpers: false

      import Plug.Conn
      import Phoenix.Controller
    end
  end

  # Use this macro for controller modules
  def controller do
    quote do
      use Phoenix.Controller,
        formats: [:html, :json],
        layouts: [html: BankingApiWeb.Layouts]

      import Plug.Conn
      import BankingApiWeb.Gettext
      alias BankingApiWeb.Router.Helpers, as: Routes
      
      use Phoenix.VerifiedRoutes,
      	endpoint: BankingApiWeb.Endpoint,
      	router: BankingApiWeb.Router,
      	statics: BankingApiWeb.static_paths()
    end
  end

  # Use this macro for HTML rendering (replaces old :view)
  def html do
    quote do
      use Phoenix.Component

      import Phoenix.Controller,
        only: [get_csrf_token: 0, view_module: 1, view_template: 1]

      import Phoenix.HTML
      import BankingApiWeb.Gettext
      alias BankingApiWeb.Router.Helpers, as: Routes

      use Phoenix.VerifiedRoutes,
        endpoint: BankingApiWeb.Endpoint,
        router: BankingApiWeb.Router,
        statics: BankingApiWeb.static_paths()
    end
  end

  # Use this macro for channels
  def channel do
    quote do
      use Phoenix.Channel
      import BankingApiWeb.Gettext
    end
  end

  # Dispatch based on which context is used
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
