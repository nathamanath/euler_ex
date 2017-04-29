defmodule Euler.Q003 do
  @moduledoc """
  The prime factors of 13195 are 5, 7, 13 and 29.
  What is the largest prime factor of the number 600851475143?
  """

  @doc """
  get highest prime factor of `n`

  ## Examples

    iex> Euler.Q003.run 13195
    29

    iex> Euler.Q003.run 600851475143
    6857

  """
  @spec run(integer) :: integer
  def run(n), do: top_factor(n, 2, [])

  # get prime factors of `n`
  #
  # * if `i` is a factor of `n`
  # * next prime factor goes into `n / i`
  # * once `n` == 1, we have the top factor
  #
  # `i` is always prime when `rem(n, i) == 0`
  # `n` is not prime until `n == i`
  #
  # 600851475143 / 71 = 8462696833.0
  # 8462696833 / 839 = 10086647.0
  # 10086647 / 1471 = 6857.0
  # 6857 / 6857 = 1.0
  #
  # https://en.wikipedia.org/wiki/Integer_factorization
  #
  # brute force aproach ran in ~30s, this way takes ~0.5s
  defp top_factor(1, _i, [top | _rest]), do: top

  defp top_factor(n, i, factors) when rem(n, i) == 0 do
    top_factor(div(n, i), i, [i | factors])
  end

  # skip all values of i which are not factors of n
  # 2 and odds as 2 goes into all evens
  defp top_factor(n, 2, factors), do: top_factor(n, 3, factors)
  defp top_factor(n, i, factors), do: top_factor(n, i + 2, factors)

end
