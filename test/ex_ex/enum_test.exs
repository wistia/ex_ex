defmodule ExEx.EnumTest do
  use ExUnit.Case, async: true

  describe "has_key?/2" do
    test "maps" do
      assert ExEx.Enum.has_key?(%{hello: :world}, :hello)
      refute ExEx.Enum.has_key?(%{hello: :world}, :bye)
    end

    test "keywords" do
      assert ExEx.Enum.has_key?([hello: :world], :hello)
      refute ExEx.Enum.has_key?([hello: :world], :bye)
    end
  end
end
