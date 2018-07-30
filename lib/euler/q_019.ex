defmodule Euler.Q019 do
  @moduledoc """
  You are given the following information, but you may prefer to do some
  research for yourself.

  * 1 Jan 1900 was a Monday.
  * Thirty days has September,
  * April, June and November.
  * All the rest have thirty-one,
  * Saving February alone,
  * Which has twenty-eight, rain or shine.
  * And on leap years, twenty-nine.
  * A leap year occurs on any year evenly divisible by 4, but not on a century
    unless it is divisible by 400.

  How many Sundays fell on the first of the month during the twentieth century
  (1 Jan 1901 to 31 Dec 2000)?
  """

  @reference_monday {1900, 01, 01}

  @doc """
  Count how many sundays between 2 dates.

  work out starting day of week
  jump to start ofnext month
  is it sunday?
  repeat
  """
  @spec count_sundays_native({integer, integer}, {integer, integer}) :: integer
  def count_sundays_native({from_year, from_month}, {to_year, to_month}) do
    {:ok, from} = Date.from_erl({from_year, from_month, 01})
    {:ok, to} = Date.from_erl({to_year, to_month, 01})
    start_day = Date.day_of_week(from)

    do_count_sundays_native(from, to, start_day, 0)
  end

  defp do_count_sundays_native(current, to, _day, sundays) when current == to, do: sundays

  defp do_count_sundays_native(current, to, _day, sundays) do
    next = Date.add(current, Date.days_in_month(current))
    day = Date.day_of_week(next)

    do_count_sundays_native(next, to, day, sundays + day_offset(day))
  end

  @doc """
  same again but with my own implementation of date functions
  """
  @spec count_sundays({integer, integer}, {integer, integer}) :: integer
  def count_sundays(from, to) do
    from = Tuple.append(from, 01)
    day = day_of_week(from)

    do_count_sundays(from, Tuple.append(to, 01), day, 0)
  end

  defp do_count_sundays(current, to, _day, sundays) when current == to, do: sundays

  defp do_count_sundays({y, m, _d} = current, to, day, sundays) do
    offset = days_in_month(m, y)
    next = add_days(current, offset)
    day = cycle_days(day, offset)

    do_count_sundays(next, to, day, sundays + day_offset(day))
  end

  # number of sundays to add to total
  defp day_offset(6), do: 1
  defp day_offset(_), do: 0

  @doc """
  add offset to day of week. say what day you would land on
  """
  @spec cycle_days(integer, integer) :: integer
  def cycle_days(day, offset), do: rem(day + offset, 7)

  @doc """
  What day is it by date

  0 == monday
  6 == sunday
  """
  @spec day_of_week({integer, integer, integer}) :: atom
  def day_of_week(date) do
    date_diff(@reference_monday, date)
    |> rem(7)
  end

  @doc """
  difference between 2 dates in days
  not very fast...
  """
  @spec date_diff({integer, integer, integer}, {integer, integer, integer}) :: integer
  def date_diff(a, b), do: do_date_diff(a, b, 0)

  # add days 1 at a time, count how many
  defp do_date_diff(a, a, diff), do: diff
  defp do_date_diff(a, b, diff), do: do_date_diff(add_days(a, 1), b, diff + 1)

  @doc """
  Add days to a date
  """
  @spec add_days({integer, integer, integer}, integer) :: {integer, integer, integer}
  def add_days({y, m, _d} = date, days) do
    do_add_days(date, days, days_in_month(m, y))
  end

  defp do_add_days(date, 0, _max_days), do: date

  defp do_add_days({_y, _m, d} = date, days, max_days) when d + days > max_days do
    {year, month, _days} = new_date = add_month(date)
    do_add_days(new_date, d + days - max_days, days_in_month(month, year))
  end

  defp do_add_days({y, m, d}, days, _max_days) do
    do_add_days({y, m, d + days}, 0, days_in_month(m, y))
  end

  # Add a month to a year
  defp add_month({y, 12, _d}), do: {y + 1, 1, 0}
  defp add_month({y, m, _d}), do: {y, m + 1, 0}

  @doc """
  Get days in month by month number and year
  """
  @spec days_in_month(integer, integer) :: integer
  def days_in_month(2, year), do: do_feb_days(leap_year?(year))
  def days_in_month(4, _year), do: 30
  def days_in_month(6, _year), do: 30
  def days_in_month(9, _year), do: 30
  def days_in_month(11, _year), do: 30
  def days_in_month(_month, _year), do: 31

  # Days in feb if leap year or not
  defp do_feb_days(true), do: 29
  defp do_feb_days(false), do: 28

  @doc """
  Is it a leap year or not?
  """
  @spec leap_year?(integer) :: boolean
  def leap_year?(year) when rem(year, 100) != 0 and rem(year, 4) == 0, do: true
  def leap_year?(year) when rem(year, 400) == 0, do: true
  def leap_year?(_year), do: false
end
