defmodule Euler.NineTest do
  use ExUnit.Case

  alias Euler.Nine

  test "product of pythagorean triplet where a + b + c == 1000" do
    assert Nine.run(1000) == 31875000
  end

end
