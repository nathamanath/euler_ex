defmodule Euler.Q019Test do
  use ExUnit.Case

  alias Euler.Q019

  describe "days_in_month/2" do
    test "knows some leap years" do
      assert Q019.days_in_month(2, 2018) == 28
      assert Q019.days_in_month(2, 1600) == 29
    end
  end

  describe "leap_year?" do
    test "knows a leap year" do
      assert Q019.leap_year?(2020)
      assert Q019.leap_year?(1600)
      refute Q019.leap_year?(2018)
      refute Q019.leap_year?(2100)
    end
  end

  describe "day_of_week/1" do
    assert Q019.day_of_week(~D[2018-07-27]) == :fri
    assert Q019.day_of_week(~D[2017-12-01]) == :fri
  end
end
