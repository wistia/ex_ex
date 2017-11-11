defmodule ExEx.Mix.Config do
  @moduledoc """
  TODO
  """

  @doc """
  Used for adding `{:system, MY_VAR}` style support to values defined in
  a Mix.Config. This function will lookup these values from System if of
  the proper format, otherwise it will simply return the value. This
  makes it so your application code doesn't need to care where the config
  comes from
  """
  def unpack(_, opts \\ [coerce: false])
  def unpack({:system, env}, coerce: true), do: maybe_coerce_env(System.get_env(env))
  def unpack({:system, env}, coerce: false), do: System.get_env(env)
  def unpack(other, _), do: other

  defp maybe_coerce_env(val) when is_binary(val) do
    case Integer.parse(val) do
      {int, ""} -> int
      _ -> val
    end
  end

  defp maybe_coerce_env(val), do: val
end
