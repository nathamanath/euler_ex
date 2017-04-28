defmodule Euler.Ten do
  @moduledoc """
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  """

  @doc """
  Get sum of prime numbers < `n`

  ## Examples

    iex> Euler.Ten.run(10)
    17

    iex> Euler.Ten.run(2_000_000)
    142913828922

  """
  @spec run(number) :: integer
  def run(number), do: number |> sive |> Enum.reduce(fn(i, acc) -> i + acc end)

  @doc """
  Eratosthenes sive algorithm - Find prime numbers under `number`

  * Create list of all numbers from 2 to N.
  * Let p initially equal to 2. The first prime.
  * Strike all multiples of p from the list less than or equal to N.
  * Find the next number after p, that’s not yet crossed out on the list. This
  ..is the next prime.
  * Repeat step 3 and 4 for the new p, unless p2 is greater than N.
  * Numbers not crossed out on the list are primes below the limit N.

  OPTIMIZE: too slow... try not to make a list each time

  ## Examples

    iex> Euler.Ten.sive(10)
    [2, 3, 5, 7]

  """
  @spec sive(number) :: list
  def sive(number), do: do_sive(Enum.to_list(2..number), 2, number)

  defp do_sive(list, p, n) when p > n, do: list

  defp do_sive(list, p, n) do
    do_sive(Enum.reject(list, fn(x) -> x > p and rem(x, p) == 0 end), p + 1, n)
  end

end
