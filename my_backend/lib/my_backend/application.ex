defmodule MyBackend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MyBackendWeb.Telemetry,
      MyBackend.Repo,
      {DNSCluster, query: Application.get_env(:my_backend, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MyBackend.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: MyBackend.Finch},
      # Start a worker by calling: MyBackend.Worker.start_link(arg)
      # {MyBackend.Worker, arg},
      # Start to serve requests, typically the last entry
      MyBackendWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MyBackendWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
