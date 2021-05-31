defmodule Lights.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Lights.Repo,
      # Start the Telemetry supervisor
      LightsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Lights.PubSub},
      # Start the Endpoint (http/https)
      LightsWeb.Endpoint
      # Start a worker by calling: Lights.Worker.start_link(arg)
      # {Lights.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Lights.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LightsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
