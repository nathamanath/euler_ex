defmodule Euler.Q017Test do
  use ExUnit.Case

  alias Euler.Q017
  alias Euler.Q017.Num

  doctest Q017

  test "char count in range of numbers" do
    assert Q017.run(10..19) == 70
    assert Q017.run(20..99) == 748
    assert Q017.run(100..999) == 20_259
  end

  defmodule NumTest do
    use ExUnit.Case

    alias Euler.Q017.Num

    doctest Num

    test "number to words" do
      assert Num.as_words(10) == "ten"

      assert Num.as_words(20) == "twenty"
      assert Num.as_words(25) == "twenty five"

      assert Num.as_words(100) == "one hundred"
      assert Num.as_words(110) == "one hundred and ten"

      assert Num.as_words(1000) == "one thousand"
      assert Num.as_words(1100) == "one thousand one hundred"

      assert Num.as_words(4) == "four"
      assert Num.as_words(14) == "fourteen"
      assert Num.as_words(40) == "forty"
    end

  end
end
