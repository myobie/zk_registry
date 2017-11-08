# ZkRegistry

An erlang/elixir process registry stored in zookeeper.

Names are a tuple with an atom type and a binary id. Like `{:task, "123"}`.
Only one process can be started per name.

## Installation

```elixir
def deps do
  [
    {:zk_registry, "~> 0.1.0"}
  ]
end
```

## Configuration

You must provide a host address. This library will connect to zookeeper on boot.

```elixir
config :zk_registry, host: "localhost:2181"
```

## Usage

You can start, stop, and lookup `pid`s using the `:via` syntax:

```elixir
{:ok, pid} = GenServer.start_link SomeServer, [], name: {:via, ZKRegistry, {:task, "123"}}
```
