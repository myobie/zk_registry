defmodule ZKRegistry.Application do
  use Application

  def start(_type, _args) do
    ZKRegistry.Supervisor.start_link()
  end
end
