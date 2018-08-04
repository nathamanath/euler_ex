defmodule Euler.Q004 do
  @moduledoc """
  A palindromic number reads the same both ways. The largest palindrome made
  from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  """

  @doc """
  get top palindromic number between min and max

  ## Examples

    iex> Euler.Q004.run 10, 100
    9009

    iex> Euler.Q004.run 100, 1000
    906609

  """
  @spec run(integer, integer) :: integer
  def run(min, max), do: top_palindrome(min, min, min, max, 0)

  defp top_palindrome(_a, max, _min, max, palindrome), do: palindrome

  # when a == max increase min 'cause a + b == b + a... less iterations to test
  defp top_palindrome(max, b, min, max, palindrome) do
    new_min = min + 1
    check_and_go(max * b, palindrome, [new_min, b + 1, new_min, max])
  end

  defp top_palindrome(a, b, min, max, palindrome) do
    check_and_go(a * b, palindrome, [a + 1, b, min, max])
  end

  defp check_and_go(subject, palindrome, [a, b, min, max]) do
    case subject > palindrome and is_palindrome?(subject) do
      true -> top_palindrome(a, b, min, max, subject)
      _ -> top_palindrome(a, b, min, max, palindrome)
    end
  end

  defp is_palindrome?(i) when is_number(i), do: is_palindrome?(to_charlist(i))
  defp is_palindrome?(i), do: i == Enum.reverse(i)
end
