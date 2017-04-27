defmodule Euler.Nine do
  @moduledoc """
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
  a2 + b2 = c2

  For example, 32 + 42 = 9 + 16 = 25 = 52.

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.
  """

  def run(n), do: nine(n, 1, 2, n - 3)

  @doc """
  find Pythagorean triplet for which `a` + `b` + `c` = `n`

  only tries combos where `a + b + c == 1000`
  and where `c > b > a`
  """
  def nine(_n, a, b, c) when a*a + b*b == c*c, do: a*b*c
  def nine(n, a, b, c) when a+1 >= b-1, do: nine(n, 1, n-c, c-1)
  def nine(n, a, b, c), do: nine(n, a+1, b-1 , c)

end
