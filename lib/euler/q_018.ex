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

  defmodule Num do
    @moduledoc """
    For turning numbers into words
    """
    # Map numbers to strings
    @numbers %{
      1 => %{
        name: "one"
      },
      2 => %{
        name: "two",
        suffixed: "twen"
      },
      3 => %{
        name: "three",
        suffixed: "thir" # thirty thirteen
      },
      4 => %{
        name: "four",
        ty: "for"
      },
      5 => %{
        name: "five",
        suffixed: "fif"
      },
      6 => %{
        name: "six"
      },
      7 => %{
        name: "seven"
      },
      8 => %{
        name: "eight",
        suffixed: "eigh"
      },
      9 => %{
        name: "nine"
      }
    }

    @doc """
    Convert integer to words

    ## Examples
      iex> Euler.Q017.Num.as_words(5)
      "five"

    """
    @spec as_words(integer) :: String.t
    def as_words(i), do: do_as_words(get_units(i), [])

    @spec do_as_words([integer], [String.t]) :: String.t
    defp do_as_words([0, 0, 0, 0], parsed) do
      parsed
      |> Enum.reverse()
      |> Enum.join(" ")
    end

    defp do_as_words([0, 0, 0, units], parsed) do
      do_as_words([0, 0, 0, 0], [@numbers[units][:name] | parsed])
    end

    # teens
    # First the special cases... thank you English
    defp do_as_words([0, 0, 1, 0], parsed), do: do_as_words([0, 0, 0, 0], ["ten" | parsed])
    defp do_as_words([0, 0, 1, 1], parsed), do: do_as_words([0, 0, 0, 0], ["eleven" | parsed])
    defp do_as_words([0, 0, 1, 2], parsed), do: do_as_words([0, 0, 0, 0], ["twelve" | parsed])

    defp do_as_words([0, 0, 1, units], parsed) do
      do_as_words([0, 0, 0, 0], ["#{as_prefix(units, :teen)}teen" | parsed])
    end

    # tens > 1
    defp do_as_words([0, 0, tens, units], parsed) do
      do_as_words([0, 0, 0, units], ["#{as_prefix(tens, :ty)}ty" | parsed])
    end

    # hundreds
    defp do_as_words([0, hundreds, 0, 0], parsed) do
      do_as_words([0, 0, 0, 0], ["#{as_words(hundreds)} hundred" | parsed])
    end

    defp do_as_words([0, hundreds, tens, units], parsed) do
      do_as_words([0, 0, tens, units], ["and", "#{as_words(hundreds)} hundred" | parsed])
    end

    # thousands
    defp do_as_words([thousands, hundreds, tens, units], parsed) do
      do_as_words([0, hundreds, tens, units], ["#{as_words(thousands)} thousand" | parsed])
    end

    @doc """
    Get number as a prefix to a unit suffix

    ## Examples

      iex> Euler.Q017.Num.as_prefix(4, :ty)
      "for"

      iex> Euler.Q017.Num.as_prefix(4, :teen)
      "four"

      iex> Euler.Q017.Num.as_prefix(6, :ty)
      "six"
    """
    @spec as_prefix(integer, integer) :: String.t
    def as_prefix(4, :ty), do: @numbers[4][:ty]

    def as_prefix(i, _context) do
      @numbers[i][:suffixed] || @numbers[i][:name]
    end

    @doc """
    break integer < one million into units

    ## Examples

      iex> Euler.Q017.Num.get_units(1111)
      [1, 1, 1, 1]

    """
    @spec get_units(integer) :: [integer]
    def get_units(i), do: do_get_units(i, 1000, [])

    @spec do_get_units(integer, integer, [integer]) :: [integer]
    defp do_get_units(i, 1, units), do: [i | units] |> Enum.reverse

    defp do_get_units(i, divisor, units) do
      do_get_units(rem(i, divisor), div(divisor, 10), [div(i, divisor) | units])
    end
  end

  @doc """
  Sum of the length of numbers from `range` in words

  ## Examples

    iex> Euler.Q017.run 1..5
    19

  """
  @spec run(Range.t) :: integer
  def run(range) do
    range
    |> Enum.map(&Num.as_words/1)
    |> Enum.map(&String.replace(&1, " ", ""))
    |> Enum.map(&String.length/1)
    |> Enum.reduce(0, &(&1 + &2))
  end

end
