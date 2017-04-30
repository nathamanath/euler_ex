defmodule Euler.Utils.Prime do
  @doc """
  Infinite stream of prime numbers.
  Aim is to generate primes as fast as possible.

  ## Examples

    iex> Euler.Utils.Prime.sequence |> Enum.take(4) |> Enum.to_list
    [2, 3, 5, 7]

  """
  @spec sequence() :: Enumerable.t
  def sequence do
    Stream.iterate(2, &sequence_step/1)
    |> Stream.filter(&is_prime/1)
  end

  # skip evens > 2... none of them are prime
  defp sequence_step(i) when i == 2, do: i + 1
  defp sequence_step(i), do: i + 2

  # TODO: learn more about streams...
  # TODO: how to cache primes and use in test?, and does that speed things up?

  @doc """
  Is a number prime or not?
  https://en.wikipedia.org/wiki/Primality_test#Pseudocode

  ## Examples

    iex> Euler.Utils.Prime.is_prime(1_000_000)
    false

    iex> Euler.Utils.Prime.is_prime(7919)
    true

  """
  @spec is_prime(number) :: boolean
  def is_prime(n) when n <= 1, do: false
  def is_prime(n) when n <= 3, do: true
  def is_prime(n) when rem(n, 2) == 0 or rem(n, 3) == 0, do: false
  def is_prime(n), do: do_is_prime(n, 5)

  defp do_is_prime(n, i) when i * i > n, do: true
  defp do_is_prime(n, i) when rem(n, i) == 0 or rem(n, i + 2) == 0, do: false
  defp do_is_prime(n, i), do: do_is_prime(n, i + 6)

end
