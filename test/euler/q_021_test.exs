defmodule Euler.Q021Test do
  use ExUnit.Case
  use ExUnitProperties

  alias Euler.Q021

  setup do
    number_generator =
      ExUnitProperties.gen all i <- StreamData.positive_integer() do
        i + 1
      end

    {:ok, [number_generator: number_generator]}
  end

  describe "sum_amicable_numbers_under/1" do
    property "returns an integer" do
      check all(n <- StreamData.positive_integer()) do
        assert is_integer(Q021.sum_amicable_numbers_under(n))
        assert Q021.sum_amicable_numbers_under(n) >= 0
      end
    end

    test "sums amicable numbers < n" do
      assert Q021.sum_amicable_numbers_under(285) == 504
      assert Q021.sum_amicable_numbers_under(10_000) == 31_626
    end
  end

  describe "proper_divisors/1" do
    property "prime numbers have none, others have > 0", %{number_generator: number_generator} do
      check all(i <- number_generator) do
        case Euler.Utils.Prime.is_prime(i) do
          true -> assert length(Q021.proper_divisors(i)) == 1
          false -> assert length(Q021.proper_divisors(i)) > 1
        end
      end
    end

    test "knows the divisors of n" do
      assert Q021.proper_divisors(284) == [1, 2, 4, 71, 142]
      assert Q021.proper_divisors(220) == [1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110]
    end
  end

  describe "d/1" do
    test "sums divisors of n" do
      assert Q021.d(220) == 284
    end
  end
end
