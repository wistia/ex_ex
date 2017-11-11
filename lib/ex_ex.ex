defmodule ExEx do
  def truthy?(nil), do: false
  def truthy?(false), do: false
  def truthy?(_), do: true
end
