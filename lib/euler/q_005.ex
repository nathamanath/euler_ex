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

  ## Examples

    iex> Euler.Q005.run 2, 10
    2520

    iex> Euler.Q005.run 11, 20
    232792560

  """
  @spec run(integer, integer) :: integer
  def run(min, max) do
    five(max, min, min, max)
  end


  # `n` - subject
  # `i` - current value of divisor
  # `max` - max value of divisor
  defp five(n, max, _min, max), do: n

  defp five(n, i, min, max) when rem(n, i) == 0, do: five(n, i + 1, min, max)
  defp five(2, _i, min, max), do: five(3 + 1, min, min, max)
  defp five(n, _i, min, max), do: five(n + 2, min, min, max)

end

# make list of potential divisors descending
# filter out divisors which are factors of other divisors



# 10
# 9
# 8
# 7
# 6

# 20
# 19
# 18
# 17
# 16
# 15
# 14
# 13
# 12
# 11


# start n = head of list

# is it even?
# does head fit?
# if yes, all divisors which are factors of head go

# if head no fit, increment n to next even #, reset divisor list
