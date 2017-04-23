defmodule Euler.Four do
  @moduledoc """
  A palindromic number reads the same both ways. The largest palindrome made
  from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  """

  def run(min, max), do: four(min, min, min, max, 0)

  def four(_a, max, _min, max, palindrome), do: palindrome

  def four(max, b, min, max, palindrome) do
    new_min = min + 1 # 'cause a + b == b + a... less iterations to test
    check_and_go(max * b, palindrome, [new_min, b + 1, new_min, max])
  end

  def four(a, b, min, max, palindrome) do
    check_and_go(a * b, palindrome, [a + 1, b, min, max])
  end

  defp check_and_go(subject, palindrome, [a, b, min, max]) do
    case subject > palindrome and is_palindrome?(subject) do
      true -> four(a, b, min, max, subject)
      _ -> four(a, b, min, max, palindrome)
    end
  end

  defp is_palindrome?(i) when is_number(i), do: is_palindrome?(to_charlist(i))
  defp is_palindrome?(i), do: i == Enum.reverse(i)

end
