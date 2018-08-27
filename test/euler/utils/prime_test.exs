defmodule Euler.PrimeTest do
  use ExUnit.Case
  use ExUnitProperties

  alias Euler.Utils.Prime

  doctest Euler.Utils.Prime

  describe "sequence/0" do
    property "streams primes" do
      check all(n <- StreamData.positive_integer()) do
        result =
          Prime.sequence()
          |> Enum.at(n)
          |> Prime.is_prime()

        assert result
      end
    end
  end
end
