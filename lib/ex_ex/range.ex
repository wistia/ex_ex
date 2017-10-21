defmodule ExEx.Range do
  @doc """
  Bounds a value to the given range
  """
  def clamp(%Range{first: first}, n) when n < first, do: first
  def clamp(%Range{last: last}, n) when n > last, do: last
  def clamp(_, n), do: n
end
