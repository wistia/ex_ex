defmodule ExEx.File do
  @moduledoc """
  TODO
  """

  @doc """
  Recursively list files in `path`
  """
  def ls_r(path \\ ".") do
    cond do
      File.regular?(path) ->
        [path]

      File.dir?(path) ->
        File.ls!(path)
        |> Enum.map(&Path.join(path, &1))
        |> Enum.map(&ls_r/1)
        |> Enum.concat()

      true ->
        []
    end
  end

  @doc """
  Determine whether a file exists and is non-empty
  """
  def non_empty?(path) do
    with true <- File.exists?(path),
         {:ok, %{size: size}} <- File.stat(path),
         true <- size > 0 do
      true
    else
      _ -> false
    end
  end
end
