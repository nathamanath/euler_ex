defmodule Euler.Q015Test do
  use ExUnit.Case

  alias Euler.Q015

  doctest Q015

  test "makes a grid of route counts" do
    assert Q015.grid_routes(4) == [
             [1, 1, 1, 1, 1],
             [1, 2, 3, 4, 5],
             [1, 3, 6, 10, 15],
             [1, 4, 10, 20, 35],
             [1, 5, 15, 35, 70]
           ]
  end
end
