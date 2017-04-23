defmodule Euler.One do
  @moduledoc """
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we
  get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all the
  multiples of 3 or 5 below 1000.
  """

  @doc """
  get sum of primes below `max`
  """
  def run(max), do: one(1, 0, max)

  def one(max, sum, max), do: sum
  def one(i, sum, max) when rem(i, 3) == 0 or rem(i, 5) == 0, do: one(i + 1, sum + i, max)
  def one(i, sum, max), do: one(i + 1, sum, max)

end
