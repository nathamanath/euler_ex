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
  Maths solution: http://mathforum.org/advanced/robertd/manhattan.html

  If you view routes as a tree, you get this:

            1
          1   1
        1   2   1
     1    3   3   1
  1    4    6   4   1

  The number of paths are the central binomial coefficients. Central meaning they
  fall along the center line of Pascal's triangle

  and because maths, `(2n)! / n!^2` gives us central binomial coefficient for an
  nxn grid.

  Problem with this approach is it dosent scale for large values of n... n==100
  for example causes an integer overflow. My less smart solution below can handle
  this.

  ## Examples

    iex> Euler.Q015.run 2
    6

  """
  @spec run(integer) :: integer
  def run(n), do: round primorial(2*n) / :math.pow(primorial(n), 2)

  # primorial: product of numbers 1..n
  @spec primorial(integer) :: integer
  defp primorial(n), do: Enum.reduce(1..n, 1, &(&1 * &2))

  @doc """
  My initial solution. Works for larger values of n, but takes longer about it.

  Route to each point is sum of point to left and point above
  eg: (n = 2)

  1 1 1
  1 2 3
  1 3 6

  1, Generate grid of routes for nxn
  2, get number in bottom right

  ## Examples

    iex> Euler.Q015.run_initial 2
    6

    # cant do this with the other method
    iex> Euler.Q015.run_initial 100
    90548514656103281165404177077484163874504589675413336841320

  """
  @spec run_initial(integer) :: integer
  def run_initial(n) do
    grid_routes(n)
    |> Enum.at(n)
    |> Enum.at(n)
  end

  @doc """
  ## Examples

    # iex> Euler.Q015.grid_routes 2
    # [[1, 1, 1], [1, 2, 3], [1, 3, 6]]

    iex> Euler.Q015.grid_routes 4
    [[1, 1, 1, 1, 1], [1, 2, 3, 4, 5], [1, 3, 6, 10, 15], [1, 4, 10, 20, 35], [1, 5, 15, 35, 70]]

    # iex> Euler.Q015.grid_routes 8
    # [[1, 1, 1], [1, 2, 3], [1, 3, 6]]
  """
  def grid_routes(n), do: do_grid_routes(n, 0, 0, [])

  # end of last col
  defp do_grid_routes(n, row, _col, rows) when row > n do
    rows
    |> Enum.reverse
    |> Enum.chunk(n+1)
  end

  # end of row
  defp do_grid_routes(n, row, col, rows) when col > n do
    do_grid_routes(n, row + 1, 0, rows)
  end

  # row 0 any column
  defp do_grid_routes(n, 0, col, rows), do: do_grid_routes(n, 0, col + 1, [1 | rows])

  # col 0 any row
  defp do_grid_routes(n, row, 0, rows), do: do_grid_routes(n, row, 1, [1 | rows])

  defp do_grid_routes(n, row, col, [last | _] = rows) do
    # reconstruct matrix from rows vector
    above = rows
      |> Enum.reverse
      |> Enum.chunk(n+1)
      |> Enum.at(row-1)
      |> Enum.at(col)

    do_grid_routes(n, row, col + 1, [above + last | rows])
  end


end
