defmodule ExEx.Process do
  @moduledoc """
  TODO
  """

  @doc """
  Sends a diagnostic message to a process. By waiting for this message to
  send and return we ensure that we've flushed any waiting messages in the
  process's mailbox. This is usually a better alternative to polling or
  sleeping
  """
  def flush_mailbox(pid, timeout \\ 5000) do
    :sys.get_status(pid, timeout)
  end
end
