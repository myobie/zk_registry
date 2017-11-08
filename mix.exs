defmodule ZKRegistry.Mixfile do
  use Mix.Project

  def project do
    [
      app: :zk_registry,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ZKRegistry.Application, []}
    ]
  end

  defp deps do
    [
      {:zookeeper, github: "vishnevskiy/zookeeper-elixir"},
    ]
  end
end
