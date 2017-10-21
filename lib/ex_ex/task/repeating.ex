defmodule ExEx.Task.Repeating do
  @moduledoc """
  A Task that calls a function on a given time interval
  """

  require Logger

  def start_link(opts) do
    Task.start_link(fn ->
      initial_delay = opts[:initial_delay] || 0
      Process.sleep(initial_delay)

      do_loop(opts)
    end)
  end

  def do_loop(state) do
    state[:function].()
    Process.sleep(state[:interval])
    do_loop(state)
  end
end
