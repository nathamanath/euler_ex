defmodule Euler.Nine do
  @moduledoc """
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
  a2 + b2 = c2

  For example, 32 + 42 = 9 + 16 = 25 = 52.

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.
  """

  def run(n), do: nine(n, 1, 1, 1)

  @doc """
  find Pythagorean triplet for which `a` + `b` + `c` = `n`
  """
  def nine(_n, a, b, c) when a*a + b*b == c*c and a + b + c == 1000, do: a*b*c
  def nine(n, c, c, c), do: nine(n, 1, 1, c + 1)
  def nine(n, b, b, c), do: nine(n, 1, b + 1, c)
  def nine(n, a, b, c), do: nine(n, a + 1, b, c)

end
