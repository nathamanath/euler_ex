defmodule Euler.TwoTest do
  use ExUnit.Case

  import Euler.Two

  test "sum of fibonacci numbers < 4000000" do
    assert run() == 4613732
  end

end
