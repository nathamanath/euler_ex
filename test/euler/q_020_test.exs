defmodule Euler.Q020Test do
  use ExUnit.Case, async: true
  use ExUnitProperties

  alias Euler.Q020

  doctest Euler.Q020

  describe "sum_factoral_didgets/1" do
    test "sums didgits of n!" do
      assert Q020.sum_factoral_didgets(100) == 648
    end

    property "returns a positive number" do
      check all(n <- StreamData.integer(0..1000)) do
        assert Q020.sum_factoral_didgets(n) >= 0
      end
    end
  end

  describe "exp/1" do
    test "knows &1!" do
      assert Q020.exp(10) == 3_628_800
    end

    property "n! is >= n" do
      check all(n <- StreamData.integer(0..1000)) do
        assert Q020.exp(n) >= n
      end
    end
  end
end
