defmodule Euler.Q016 do
  @moduledoc """
  2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

  What is the sum of the digits of the number 2^1000?
  """

  @doc """
  sum of didgits of `n` to the power of `power`

  ## Examples

    iex> Euler.Q016.run(2, 15)
    26

    iex> Euler.Q016.run(2, 1000)
    1366

  """
  @spec run(integer, integer) :: integer
  def run(n, power) do
    :math.pow(n, power)
    |> round() # float as scientific notation to integer
    |> Integer.to_string()
    |> String.splitter("", trim: true)
    |> Enum.reduce(0, &(String.to_integer(&1) + &2))
  end
end
