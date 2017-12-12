defmodule ExEx.Enum do
  @moduledoc """
  TODO
  """

  @doc """
  Returns a list where each item is the result of invoking
  `fun` on each corresponding item of `enumerable` in parallel.

  For maps, the function expects a key-value tuple.

  ## Examples
      iex> ExEx.Enum.parallel_map([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]
  """
  @type t :: Enumerable.t()
  @type element :: any
  @spec parallel_map(t, (element -> t)) :: list
  def parallel_map(enumerable, fun) do
    Enum.map(enumerable, &Task.async(fn -> fun.(&1) end))
    |> Enum.map(&Task.await/1)
  end

  def has_key?(enum, key) when is_map(enum), do: Map.has_key?(enum, key)
  def has_key?(enum, key) when is_list(enum), do: Keyword.has_key?(enum, key)
end
