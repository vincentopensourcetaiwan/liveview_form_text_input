defmodule LiveviewFormTextInput.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LiveviewFormTextInputWeb.Telemetry,
      LiveviewFormTextInput.Repo,
      {DNSCluster,
       query: Application.get_env(:liveview_form_text_input, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LiveviewFormTextInput.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LiveviewFormTextInput.Finch},
      # Start a worker by calling: LiveviewFormTextInput.Worker.start_link(arg)
      # {LiveviewFormTextInput.Worker, arg},
      # Start to serve requests, typically the last entry
      LiveviewFormTextInputWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveviewFormTextInput.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveviewFormTextInputWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
