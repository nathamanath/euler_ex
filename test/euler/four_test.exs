defmodule Euler.FourTest do
  use ExUnit.Case

  alias Euler.Four

  test "largest palindrome from product of two 2-digit numbers" do
    assert Four.run(10, 100) == 9009
  end

  test "largest palindrome from product of two 3-digit numbers" do
    assert Four.run(100, 1000) == 906609
  end

end
