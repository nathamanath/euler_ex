defmodule Euler.Q005 do
  @moduledoc """
  2520 is the smallest number that can be divided by each of the numbers from 1
  to 10 without any remainder.

  What is the smallest positive number that is evenly divisible by all of the
  numbers from 1 to 20?
  """

  @doc """
  returns smallest number devisable by 1..`n`

  OPTIMIZE: this one is slow

  Took time off by only trying even valuses of n, and starting at max divisor

  ## Examples

    iex> Euler.Q005.run 2, 10
    2520

    iex> Euler.Q005.run 11, 20
    232792560

  """
  @spec run(integer, integer) :: integer
  def run(min, max), do: five(max, max, min, max)

  # find number divisibale by numbers from max to min
  # start with max, as less numbers will divide by it
  #
  # divisor gets < min if n is divisible by all higher halues of divisor
  # if n / i == 0, try next value of i
  # no match, try next n, and reset i
  #
  # `n` - subject
  # `i` - current value of divisor
  # `max` - max value of divisor
  # `min` - min value of divisor
  defp five(n, i, min, _max) when i < min, do: n
  defp five(n, i, min, max) when rem(n, i) == 0, do: five(n, i - 1, min, max)
  defp five(n, _i, min, max), do: five(n + 2, max, min, max)
end
