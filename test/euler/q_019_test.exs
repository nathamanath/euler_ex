defmodule Euler.Q019Test do
  use ExUnit.Case

  alias Euler.Q019

  describe "count_sundays/2" do
    test "it counts the sundays on first of month between dates" do
      assert Q019.count_sundays({1901, 01}, {2000, 12}) == 171
    end
  end

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
    assert Q019.day_of_week({2018, 07, 27}) == 5
    assert Q019.day_of_week({2017, 12, 01}) == 5
  end

  describe "add_days/2" do
    test "adds days to a date" do
      assert Q019.add_days({2018, 01, 30}, 1) == {2018, 01, 31}
      assert Q019.add_days({2018, 01, 31}, 1) == {2018, 02, 01}
      assert Q019.add_days({2018, 12, 31}, 1) == {2019, 01, 01}
      assert Q019.add_days({2018, 01, 01}, 59) == {2018, 03, 01}
      assert Q019.add_days({2018, 01, 01}, 365) == {2019, 01, 01}
      assert Q019.add_days({2020, 01, 01}, 366) == {2021, 01, 01}
    end
  end

  describe "date_diff/2" do
    test "knows days between 2 dates" do
      assert Q019.date_diff({2018, 07, 29}, {2018, 07, 29}) == 0
      assert Q019.date_diff({2018, 07, 27}, {2018, 07, 28}) == 1
      assert Q019.date_diff({2018, 06, 30}, {2018, 07, 02}) == 2
      assert Q019.date_diff({2018, 01, 01}, {2019, 01, 01}) == 365
      assert Q019.date_diff({2020, 01, 01}, {2021, 01, 01}) == 366
    end
  end
end
