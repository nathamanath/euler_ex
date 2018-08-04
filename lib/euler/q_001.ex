defmodule Euler.Q001 do
  @moduledoc """
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we
  get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all the
  multiples of 3 or 5 below 1000.
  """

  @doc """
  get sum of natural numbers below `max` that are multiples of 3 or 5

  ## Examples

    iex> Euler.Q001.run 10
    23

    iex> Euler.Q001.run 1000
    233168

  """
  @spec run(integer) :: integer
  def run(max), do: sum_multiples(1, 0, max)

  defp sum_multiples(max, sum, max), do: sum

  defp sum_multiples(i, sum, max) when rem(i, 3) == 0 or rem(i, 5) == 0,
    do: sum_multiples(i + 1, sum + i, max)

  defp sum_multiples(i, sum, max), do: sum_multiples(i + 1, sum, max)
end
