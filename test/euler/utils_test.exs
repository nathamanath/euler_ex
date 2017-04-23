defmodule Euler.UtilsTest do
  use ExUnit.Case

  import Euler.Utils

  test "knows a prime when it sees one" do
    assert is_prime?(11, [7, 5, 3, 2])
  end

  test "knows a not prime" do
    refute is_prime?(10, [7, 5, 3, 2])
  end
end
