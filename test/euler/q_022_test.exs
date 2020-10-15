defmodule Euler.Q022Test do
  use ExUnit.Case
  use ExUnitProperties

  alias Euler.Q022

  doctest Q022

  test "run/1" do
    assert Euler.Q022.run("priv/p022_names.txt") == 871_198_282
  end
end
