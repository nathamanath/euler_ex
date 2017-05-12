defmodule Euler.Q017 do
  @moduledoc """
  If the numbers 1 to 5 are written out in words: one, two, three, four, five,
  then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

  If all the numbers from 1 to 1000 (one thousand) inclusive were written out in
  words, how many letters would be used?

  NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
  forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
  letters. The use of "and" when writing out numbers is in compliance with
  British usage.
  """

  @number_map [{1, "one"}, {2, "two"}, {3, "three"}, {4, "four"}, {5, "five"}]

  @doc """
  Sum of the length of numbers from `range` in words

  ## Examples

    iex> Euler.Q017.run 1..5
    19

    iex> Euler.Q017.run 1..1000
    19

  """
  def run(range) do
    range
    |> Enum.map(&number_to_words/1)
    |> Enum.map(&String.length/1)
    |> Enum.reduce(0, &(&1 + &2))
  end

  # TODO: numbers > 5
  defp number_to_words(number) do
    {_key, word} = @number_map |> Enum.find(fn({k, v}) -> k == number end)
    word
  end

end
