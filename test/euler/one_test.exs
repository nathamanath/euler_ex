defmodule Euler.OneTest do
  use ExUnit.Case

  alias Euler.One

  test "sum of multiples of 3 and 5 < 10" do
    assert One.run(10) == 23
  end

  test "sum of multiples of 3 and 5 < 1000" do
    assert One.run(1000) == 233168
  end

end
