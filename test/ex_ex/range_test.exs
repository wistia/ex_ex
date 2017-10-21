defmodule ExEx.RangeTest do
  use ExUnit.Case, async: true

  describe "clamp/2" do
    test "retains values in the range" do
      assert 2 == ExEx.Range.clamp(0..3, 2)
    end

    test "retains floats in the range" do
      assert 2.5 == ExEx.Range.clamp(0..3, 2.5)
    end

    test "bounds values below the min" do
      assert 1 == ExEx.Range.clamp(1..3, 0)
    end

    test "bounds values above the max" do
      assert 3 == ExEx.Range.clamp(1..3, 4)
    end
  end
end
