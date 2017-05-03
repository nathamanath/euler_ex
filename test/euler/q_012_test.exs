defmodule Euler.Q012Test do
  use ExUnit.Case

  alias Euler.Q012

  doctest Q012

  test "Find the first triangle number to have > n divisors" do
    assert Q012.run(1) == 3
    assert Q012.run(2) == 6
    assert Q012.run(3) == 6
    assert Q012.run(4) == 28
    assert Q012.run(5) == 28

    # assert Q012.run(500) == 76576500
  end
end
