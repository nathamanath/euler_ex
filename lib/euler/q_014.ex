defmodule Euler.Q014 do
  @moduledoc """
  The following iterative sequence is defined for the set of positive integers:

  n → n/2 (n is even)
  n → 3n + 1 (n is odd)

  Using the rule above and starting with 13, we generate the following sequence:
  13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

  It can be seen that this sequence (starting at 13 and finishing at 1) contains
  10 terms. Although it has not been proved yet (Collatz Problem), it is thought
  that all starting numbers finish at 1.

  Which starting number, under one million, produces the longest chain?

  NOTE: Once the chain starts the terms are allowed to go above one million.
  """

  @doc """
  Stream solutions for each integer < `n`, find value of n with longest sequence

  ## Examples

    iex> Euler.Q014.run 20
    13

  """
  @spec run(integer) :: integer
  def run(n) do
    1
  end

  @doc """
  Collatz Problem sequence starting at `n`
  TODO: stream this
  """
  @spec collatz(integer) :: [integer]
  def collatz(n) do
    do_collatz(n, [n])
  end

  defp do_collatz(n, [1, _rest] = sequence), do: sequence
  defp do_collatz(n, sequence) when rem(n, 2) == 0, do: do_collatz(n, [n/2 | sequence])
  defp do_collatz(n, sequence), do: do_collatz(n, [3*n + 1 | sequence])

end
