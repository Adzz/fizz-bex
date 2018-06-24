defmodule FizzBexTest do
  use ExUnit.Case
  doctest FizzBex

  test "greets the world" do
    assert FizzBex.hello() == :world
  end
end
