defmodule Euler.SevenTest do
  use ExUnit.Case

  alias Euler.Seven

  test "sixth prime" do
    assert Seven.run(6) == 13
  end

  test "10,001 prime" do
    assert Seven.run(10_001) == 104743
  end

end
