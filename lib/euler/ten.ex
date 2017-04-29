defmodule Euler.Ten do
  @moduledoc """
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  """

  alias Euler.Prime

  @doc """
  Get sum of prime numbers < `n`

  ## Examples

    iex> Euler.Ten.run(10)
    17

    iex> Euler.Ten.run(2_000_000)
    142913828922

  """
  @spec run(number) :: integer
  def run(n) do
    Prime.sequence
    |> Enum.take_while(&(&1 < n))
    |> Enum.reduce(&(&1 + &2))
  end

end
