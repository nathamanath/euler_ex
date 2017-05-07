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
  Find integer `i` < `n` which has longest Collatz sequence

  * Stream tuples {i, solution_length}
  * take while i < n
  * get i for max length

  ## Examples

    iex> Euler.Q014.run 13
    9

  """
  @spec run(integer) :: integer
  def run(n) do
    {result, _length} = Stream.iterate(1, &(&1 + 1))
      |> Stream.map(&({&1, &1 |> collatz |> length}))
      |> Stream.take_while(fn({i, _length}) -> i < n end)
      |> Enum.max_by(fn({_i, length}) -> length end)

    result
  end

  @doc """
  Collatz conjecture starting at `n`

  ## Examples

    iex> Euler.Q014.collatz 13
    [13, 40, 20, 10, 5, 16, 8, 4, 2, 1]

  """
  @spec collatz(integer) :: [integer]
  def collatz(n), do: do_collatz([n])

  defp do_collatz([1 | _] = sequence), do: Enum.reverse sequence
  defp do_collatz([n | _] = sequence) when rem(n, 2) == 0 do
    do_collatz [div(n, 2) | sequence]
  end
  defp do_collatz([n | _] = sequence), do: do_collatz([3*n + 1 | sequence])

end
