defmodule Euler.Utils do
  @moduledoc """
  Utility functions for solving project euler puzzels
  """

  @doc """
  Test if number is prime
  check if each prime <= sqrt(n) is a factor of n

  `n` - number to test
  `primes` - list of primes < sqrt n
  """
  def is_prime?(n, primes), do: is_prime?(n, :math.sqrt(n), Enum.reverse(primes))

  def is_prime?(_n, _sqrt_n, []), do: true
  def is_prime?(_n, sqrt_n, [last | _rest]) when last > sqrt_n, do: true

  def is_prime?(n, _sqrt_n, [prime | _rest]) when rem(n, prime) == 0, do: false

  def is_prime?(n, sqrt_n, [_prime | rest]), do: is_prime?(n, sqrt_n, rest)

end
