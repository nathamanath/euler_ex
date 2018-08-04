defmodule Euler.Q020Test do
  use ExUnit.Case

  alias Euler.Q020

  doctest Euler.Q020

  describe "sum_didgets" do
    test "sums didgits of n!" do
      assert Q020.sum_didgets(100) == 648
    end
  end

  describe "exp/1" do
    test "knows &1!" do
      assert Q020.exp(10) == 3_628_800
    end
  end
end
