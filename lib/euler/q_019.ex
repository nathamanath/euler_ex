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

  @reference_monday ~D[1900-01-01]

  @doc """
  Count how many sundays between 2 dates.

  work out starting day of week
  jump to start ofnext month
  is it sunday?
  repeat
  """
  def count_sundays({from_year, from_month}, {to_year, to_month}) do
    {:ok, from} = Date.from_erl({from_year, from_month, 01})
    {:ok, to} = Date.from_erl({to_year, to_month, 01})

    start_day = Date.day_of_week(from)

    do_count_sundays(from, to, start_day, 0)
  end

  defp do_count_sundays(current, to, day, sundays) when current == to, do: sundays

  defp do_count_sundays(current, to, 1, sundays) do
    # TODO: Log out start of each month between from and to

    next = Date.add(current, Date.days_in_month(current))
    day = Date.day_of_week(next)

    do_count_sundays(next, to, day, sundays + 1)
  end

  defp do_count_sundays(current, to, day, sundays) do
    # TODO: Log out start of each month between from and to

    next = Date.add(current, Date.days_in_month(current))
    day = Date.day_of_week(next)

    do_count_sundays(next, to, day, sundays)
  end

  @doc """
  What day is it by date

  0 == monday
  6 == sunday
  """
  @spec day_of_week(Date.t()) :: atom
  def day_of_week(date) do
    Date.diff(date, @reference_monday)
    |> abs()
    |> rem(7)
  end

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
