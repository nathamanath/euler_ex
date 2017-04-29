defmodule Euler.Seven do
  @moduledoc """
  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
  that the 6th prime is 13.

  What is the 10 001st prime number?
  """

  alias Euler.Prime

  @doc """
  get nth prime
  """
  def run(n), do: Prime.sequence |> Stream.take(n) |> Enum.to_list |> List.last

end
