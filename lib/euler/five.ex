defmodule Euler.Five do
  @moduledoc """
  2520 is the smallest number that can be divided by each of the numbers from 1
  to 10 without any remainder.

  What is the smallest positive number that is evenly divisible by all of the
  numbers from 1 to 20?
  """

  @doc """
  returns smallest number devisable by 1..`n`
  """
  def run(min, max) do
    five(max, min, min, max)
  end

  @doc """
  `n` - subject
  `i` - current value of divisor
  `max` - max value of divisor
  """
  def five(n, max, _min, max), do: n

  def five(n, i, min, max) when rem(n, i) == 0, do: five(n, i + 1, min, max)
  def five(n, _i, min, max), do: five(n + 1, min, min, max)
end
