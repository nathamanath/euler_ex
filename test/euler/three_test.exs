defmodule Euler.ThreeTest do
  use ExUnit.Case

  alias Euler.Three

  test "highest prime factor of 13195" do
    assert Three.run(13195) == 29
  end

  test "highest prime factor of 600851475143" do
    assert Three.run(600851475143) == 6857
  end

end
