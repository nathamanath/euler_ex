defmodule Euler.TenTest do
  use ExUnit.Case

  alias Euler.Ten

  test "sum of the primes below 10" do
    assert Ten.run(10) == 17
  end

  test "sum of the primes below 2_000_000" do
    assert Ten.run(2_000_000) == 142913828922
  end

end
