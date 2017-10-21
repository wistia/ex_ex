defmodule ExEx.Timer do
  @moduledoc """
  Functions that extend the capabilities of Erlang's :timer.
  """

  @doc """
  Measures the running time (in milliseconds) of a lambda

  ## Examples

      iex> Timer.measure(fn -> Process.sleep(1000); :return_code end)
      {1001.226, :return_code}
  """
  def measure_ms(function) do
    {time, result} =
      function
      |> :timer.tc()

    {time |> Kernel./(1_000), result}
  end
end
