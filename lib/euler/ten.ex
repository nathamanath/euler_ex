defmodule Euler.Ten do
  @moduledoc """
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  """

  defmodule Prime do
    @doc """
    Infinate stream of primes

    ## Examples

      iex> Euler.Ten.Prime.sequence |> Enum.take_while(&(&1 < 10))
      [2, 3, 5, 7]

    """
    def sequence do
      Stream.iterate(2, &sequence_step&1)
      |> Stream.filter(&is_prime/1)
    end

    # skip evens > 2... none of them are prime
    defp sequence_step(i) when i == 2, do: i + 1
    defp sequence_step(i), do: i + 2

    # TODO: how to cache primes and use in test?
    # TODO: does that speed things up?

    def is_prime(2), do: true
    def is_prime(n) when n < 2 or rem(n, 2) == 0, do: false
    def is_prime(n), do: is_prime(n, 3)

    defp is_prime(n, k) when n < k*k, do: true
    defp is_prime(n, k) when rem(n, k) == 0, do: false
    defp is_prime(n, k), do: is_prime(n, k+2)
  end

  @doc """
  Get sum of prime numbers < `n`

  ## Examples

    iex> Euler.Ten.run(10)
    17

    iex> Euler.Ten.run(2_000_000)
    142913828922

  """
  @spec run(number) :: integer
  def run(number) do
    Prime.sequence
    |> Enum.take_while(fn(x) -> x < number end)
    |> Enum.reduce(fn(i, acc) -> i + acc end)
  end

end
