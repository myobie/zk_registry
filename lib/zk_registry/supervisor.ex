defmodule ZKRegistry.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link __MODULE__, [], name: __MODULE__
  end

  def init(_) do
    case Application.fetch_env(:zk_registry, :host) do
      {:ok, host} ->
        supervise_children(host)
      _ ->
        raise "Must set `config :zk_registry, host: \"127.0.0.1:2181\"` in your config/{env}.exs"
    end
  end

  defp supervise_children(host) do
    children = [
      worker(Zookeeper.Client, [host, [stop_on_disconnect: true, name: :zk_registry_connection]], []),
      worker(ZKRegistry.Server, [], [])
    ]

    supervise children, strategy: :rest_for_one
  end
end
