defmodule Euler.Three do
  @moduledoc """
  The prime factors of 13195 are 5, 7, 13 and 29.
  What is the largest prime factor of the number 600851475143?
  """

  import Euler.Utils, only: [is_prime?: 2]

  @doc """
  get highest prime factor of `n`
  """
  def run(n) do
    # start on 3 as 2 is not the answer and makes update to i slightly easier
    three(n, :math.sqrt(n), 3, [2], 0)
  end

  @doc """
  `n` - subject
  `rt_n` - sqrt(n)
  `i` - current integer
  `primes` - list of found primes in descending order
  `last_factor` - hoghest known prime factor of `n`

  each int < sqrt n
  check int is prime
  if so check int is factor of n
  keep last found factor
  """
  def three(_n, rt_n, i, _primes, last_factor) when i >= rt_n, do: last_factor

  def three(n, rt_n, i, primes, last_factor) do
    new_i = i + 2

    # PLaying with with
    # TODO: refactor
    with true <- is_prime?(i, primes),
      true <- is_factor(n, i) do
        three(n, rt_n, new_i, [i | primes], i)
    else
      :not_factor -> three(n, rt_n, new_i, [i | primes], last_factor)
      _ -> three(n, rt_n, new_i, primes, last_factor)
    end

  end

  defp is_factor(n, i) when rem(n, i) == 0, do: true
  defp is_factor(_n, _i), do: :not_factor

end
