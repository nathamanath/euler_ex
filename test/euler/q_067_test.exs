defmodule Euler.Q067Test do
  use ExUnit.Case

  alias Euler.Q067

  doctest Q067

  describe "best_route/1" do
    test "it knows the best route through a triangle" do
      triangle = Q067.parse_file("priv/p067_triangle.txt")

      assert Q067.best_route(triangle) == 7273
    end
  end
end
