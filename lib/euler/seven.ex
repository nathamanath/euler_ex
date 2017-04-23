defmodule Euler.Seven do
  @moduledoc """
  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
  that the 6th prime is 13.

  What is the 10 001st prime number?
  """

  import Euler.Utils, only: [is_prime?: 2]

  @doc """
  get nth prime
  """
  def run(n), do: seven(3, n, [2])

  def seven(_i, n, [prime | _rest] = primes) when length(primes) == n, do: prime

  @doc """
  `i` - counter
  `n` - find `n`th prime
  `primes` - list of known primes
  """
  def seven(i, n, primes) do
    new_i = i + 2 # only odds

    case is_prime?(i, primes) do
      true -> seven(new_i, n, [i | primes])
      _ -> seven(new_i, n, primes)
    end
  end

end
