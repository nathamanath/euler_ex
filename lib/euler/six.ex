defmodule Euler.Six do
  @moduledoc """
  The sum of the squares of the first ten natural numbers is,
  12 + 22 + ... + 102 = 385

  The square of the sum of the first ten natural numbers is,
  (1 + 2 + ... + 10)2 = 552 = 3025

  Hence the difference between the sum of the squares of the first ten natural
  numbers and the square of the sum is 3025 − 385 = 2640.

  Find the difference between the sum of the squares of the first one hundred
  natural numbers and the square of the sum.
  """

  @doc """
  diff sum of the squares of the first `n` natural numbers and square of the sum

  summation of natural numbers
  `Sn = n(n+1)/2`

  summation of square of natural numbers
  `Sn2 = n(n+1)(2n+1)/6`
  """
  def run(n) do
    sn = (n * (n + 1) / 2)
    sn2 = n * (n + 1) * (2 * n + 1) / 6

    :math.pow(sn, 2) - sn2
  end

end
