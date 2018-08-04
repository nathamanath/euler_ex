defmodule Euler.Q020 do
  @moduledoc """
  n! means n × (n − 1) × ... × 3 × 2 × 1

  For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
  and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

  Find the sum of the digits in the number 100!
  """

  @doc """
  Work out n!
  cast to string
  split it
  past to integers
  return sum

  ## Examples

    iex> Euler.Q020.sum_didgets(10)
    27

  """
  @spec sum_didgets(integer) :: integer
  def sum_didgets(n) do
    n
    |> exp()
    |> Integer.to_string()
    |> String.split("", trim: true)
    |> Enum.reduce(0, &(String.to_integer(&1) + &2))
  end

  @doc """
  n!
  """
  @spec exp(integer) :: integer
  def exp(n), do: do_exp(n, 1)

  defp do_exp(0, acc), do: acc
  defp do_exp(n, acc), do: do_exp(n - 1, acc * n)
end
