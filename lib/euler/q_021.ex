defmodule Euler.Q021 do
  @moduledoc """
  Let d(n) be defined as the sum of proper divisors of n (numbers less than n
  which divide evenly into n).
  If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and
  each of a and b are called amicable numbers.

  For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
  55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
  71 and 142; so d(284) = 220.

  Evaluate the sum of all the amicable numbers under 10000.
  """

  @doc """
  get sum of amicable numbers < n
  """
  @spec sum_amicable_numbers_under(integer) :: integer
  def sum_amicable_numbers_under(n) do
    (n - 1)..1
    |> Stream.map(&{&1, d(&1)})
    |> Stream.reject(fn {n, sum} -> n == sum end)
    |> Stream.filter(fn {n, sum} -> d(sum) == n end)
    |> Stream.map(fn {n, _sum} -> n end)
    |> Enum.reduce(0, &(&1 + &2))
  end

  @doc """
  get numbers less than n which divide evenly into n
  """
  @spec proper_divisors(integer) :: [integer]
  def proper_divisors(1), do: []

  def proper_divisors(n) do
    do_proper_divisors(n, 1, :math.sqrt(n))
    |> Enum.sort()
  end

  # when i > sqrt n there will be no more matches
  # if it goes into sqrt n it goes into n
  defp do_proper_divisors(n, i, sqrt) when i > sqrt, do: []

  defp do_proper_divisors(n, i, sqrt) when rem(n, i) > 0 do
    do_proper_divisors(n, i + 1, sqrt)
  end

  defp do_proper_divisors(n, i, sqrt) when i * i == n do
    [i | do_proper_divisors(n, i + 1, sqrt)]
  end

  # guard to avoid adding n to list of divisors (n / 1 == n)
  # i and n/i are divisors
  defp do_proper_divisors(n, i, sqrt) when i > 1 do
    [i, div(n, i) | do_proper_divisors(n, i + 1, sqrt)]
  end

  defp do_proper_divisors(n, i, sqrt) do
    [i | do_proper_divisors(n, i + 1, sqrt)]
  end

  @doc """
  sum a list of integers
  """
  @spec d([integer]) :: integer
  def d(i) do
    i
    |> proper_divisors()
    |> Enum.reduce(0, &(&1 + &2))
  end
end
