defmodule ZKRegistryTest do
  use ExUnit.Case
  doctest ZKRegistry

  test "greets the world" do
    assert ZKRegistry.hello() == :world
  end
end
