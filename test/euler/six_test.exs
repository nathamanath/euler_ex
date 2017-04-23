defmodule Euler.SixTest do
  use ExUnit.Case

  alias Euler.Six

  test "diff the sum of the squares of the first 10 natural numbers and the square of the sum" do
    assert Six.run(10) == 2640
  end

  test "diff the sum of the squares of the first 100 natural numbers and the square of the sum" do
    assert Six.run(100) == 25164150
  end

end
