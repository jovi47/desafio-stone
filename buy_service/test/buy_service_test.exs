defmodule BuyServiceTest do
  use ExUnit.Case
  doctest BuyService

  test "greets the world" do
    assert BuyService.hello() == :world
  end
end
