defmodule Euler.Q022 do
  @moduledoc """
  Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
  containing over five-thousand first names, begin by sorting it into
  alphabetical order. Then working out the alphabetical value for each name,
  multiply this value by its alphabetical position in the list to obtain a name
  score.

  For example, when the list is sorted into alphabetical order, COLIN, which is
  worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN
  would obtain a score of 938 × 53 = 49714.

  What is the total of all the name scores in the file?
  """

  @alphabet String.split("ABCDEFGHIJKLMNOPQRSTUVWXYZ", "")

  @doc """
  Solve for file at `path`.
  Parses file, sends result to `total_scores/1`
  """
  @spec run(String.t()) :: number
  def run(path) do
    File.read!(path)
    |> String.split(",")
    |> Stream.map(&String.replace(&1, ~s("), ""))
    |> Enum.sort()
    |> total_scores()
  end

  @doc """
  Get total score for file of names

  ## Examples
    iex> Euler.Q022.total_scores(["COLIN"])
    53
  """
  @spec total_scores(Enum.t()) :: number
  def total_scores(names) do
    names
    |> Stream.with_index()
    |> Stream.map(&offset_index/1)
    |> Stream.map(&score_name/1)
    |> Enum.reduce(&(&1 + &2))
  end

  @doc """
  Score for a name

  ## Examples

    iex> Euler.Q022.score_name({"COLIN", 1})
    53

    iex> Euler.Q022.score_name({"COLIN", 938})
    49714
  """
  @spec score_name(String.t()) :: number
  def score_name({name, index}) do
    name
    |> String.split("")
    |> Stream.map(&score_char/1)
    |> Enum.reduce(&(&1 + &2))
    |> times_index(index)
  end

  defp times_index(score, index), do: score * index

  defp score_char(char), do: Enum.find_index(alphabet(), &(&1 == char))

  defp alphabet, do: @alphabet

  defp offset_index({word, index}), do: {word, index + 1}
end
