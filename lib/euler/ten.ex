defmodule Euler.Ten do
  @moduledoc """
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  """

  # OPTIMIZE: works but is too slow
  # http://www.bytehood.com/sieve-of-eratosthenes-finding-all-primes-below-a-limit-n/47/
  #
  # * Create list of all numbers from 2 to N.
  # * Let p initially equal to 2. The first prime.
  # * Strike all multiples of p from the list less than or equal to N.
  # * Find the next number after p, that’s not yet crossed out on the list. This is the next prime.
  # * Repeat step 3 and 4 for the new p, unless p2 is greater than N.
  # * Numbers not crossed out on the list are primes below the limit N.

  def run(n), do: ten(n, 2, [])

  def ten(n, n, primes), do: Enum.reduce(primes, fn(n, acc) -> n + acc end)

  def ten(n, i, primes) do
    case is_prime?(i, primes) do
      true -> ten(n, i+1, [i | primes])
      _ -> ten(n, i+1, primes)
    end
  end

end
