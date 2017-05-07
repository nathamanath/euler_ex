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

  it seems that: number of routes to cell is sum of adjacent cells routes

  OPTIMIZE: http://mathforum.org/advanced/robertd/manhattan.html

  ## Examples

    iex> Euler.Q015.run 2, 2
    6

    iex> Euler.Q015.run 20, 20
    137846528820

  """
  @spec run(integer, integer) :: integer
  def run(w, h) do
    all_routes(w, h)
    |> Enum.at(h)
    |> Enum.at(w)
  end

  def all_routes(w, h) do
    do_all_routes(w, h, 0, [])
  end

  defp do_all_routes(_w, h, row, routes) when row > h do
    Enum.reverse routes
  end

  defp do_all_routes(w, h, row, []) do
    do_all_routes(w, h, row+1, [row_routes(w, [], [])])
  end

  defp do_all_routes(w, h, row, [previous | _rest] = routes) do
    do_all_routes(w, h, row+1, [row_routes(w, previous, []) | routes])
  end

  @doc """
  get routes to each point in row

  ## Examples

    iex> Euler.Q015.row_routes 2, [], []
    [1, 1, 1]

    iex> Euler.Q015.row_routes 2, [1, 1, 1], []
    [1, 2, 3]

    iex> Euler.Q015.row_routes 2, [1, 2, 3], []
    [1, 3, 6]

  """
  @spec row_routes(integer, [integer], [integer]) :: [[integer]]
  def row_routes(w, _previous, row) when length(row) > w, do: Enum.reverse row

  # start of row... always 1
  def row_routes(w, previous, []), do: row_routes(w, previous, [1])

  # work out others based on previous row and previous member of current row
  def row_routes(w, previous, [last | _] = row) do
    above = Enum.at(previous, length(row), 0)
    row_routes(w, previous, [last + above | row])
  end

end
