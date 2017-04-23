defmodule Euler.FiveTest do
  use ExUnit.Case

  alias Euler.Five

  test "smallest number that can be divided by each of the numbers from 1 to 10" do
    assert Five.run(2, 10) == 2520
  end

  test "smallest number that can be divided by each of the numbers from 1 to 20" do
    assert Five.run(11, 20) == 232792560
  end

end
