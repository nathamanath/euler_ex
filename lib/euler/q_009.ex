defmodule Euler.Q009 do
  @moduledoc """
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
  a2 + b2 = c2

  For example, 32 + 42 = 9 + 16 = 25 = 52.

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.
  """

  @doc """
  Find Pythagorean triplet for which `a` + `b` + `c` = `n`

  ## Examples

    iex> Euler.Q009.run 1000
    31875000

  """
  @spec run(integer) :: integer
  def run(n), do: triplet(n, 1, 2, n - 3)

  # Still brute force, but only tries combos where `a + b + c == 1000`,  and
  # where `c > b > a`
  defp triplet(_n, a, b, c) when a*a + b*b == c*c, do: a*b*c
  defp triplet(n, a, b, c) when a+1 >= b-1, do: triplet(n, 1, n-c, c-1)
  defp triplet(n, a, b, c), do: triplet(n, a+1, b-1 , c)

end
