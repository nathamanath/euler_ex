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
  Count possible routes across of `n` by `n` grid moving right or down only.

  * start at point [{0, 0}]
  * make all possible moves ([{0, 0}, {0, 1}], [{0, 0}, {1, 0}])
  * possible moves are x+1, or y+1, x and y must be < n
  * count routs to {n, n}

  ## Examples

    iex> Euler.Q015.run 2
    6

  """
  @spec run(integer) :: integer
  def run(n) do
    step(n, [{0, 0}])
  end

  @doc """
  recurse around an `n` by `n` grid, finding routes from {0, 0} to {n, n}
  """
  @spec step(integer, [{integer, integer}]) :: integer
  def step(n, [{n, n} | _rest]), do: 1
  def step(n, [{x, y} | _rest] = steps) do
    step(n, [{x+1, y+1} | steps])
  end

end
