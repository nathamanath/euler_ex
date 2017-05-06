defmodule Euler.Q015 do
  @moduledoc """
  Starting in the top left corner of a 2×2 grid, and only being able to move to
  the right and down, there are exactly 6 routes to the bottom right corner.

  →→↓↓
  →↓→↓
  →↓↓→
  ↓→→↓
  ↓→↓→
  ↓↓→→

  How many such routes are there through a 20×20 grid?
  """

  @doc """
  Find possible routes out of n x n grid
  """
  @spec run(integer) :: integer
  def run(n) do
    1
  end

end
