defmodule Euler.EightTest do
  use ExUnit.Case

  alias Euler.Eight

  test "largest product of 4 adjacent offers" do
    assert Eight.run(4) == 5832
  end

  test "largest product of 13 adjacent offers" do
    assert Eight.run(13) == 23514624000
  end
end
