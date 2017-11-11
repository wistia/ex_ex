defmodule ExEx.Dbg do
  @doc """
  A remsh friendly wrapper for tracing function calls
  """
  def trace(mod \\ :_, fun \\ :_, arity \\ :_, match_spec_name \\ :caller_trace, flags \\ [:c]) do
    # Register a tracer handler
    # :io.format must be used or else trace messages will go to
    # stdio on the primary node in a remsh session
    :dbg.tracer(:process, {fn (msg, _memo) -> :io.format("~p\n", [msg]) end, []})

    # Decide the trace format
    #
    # From the erlang docs:
    #
    #   Exception trace sets a trace which will show function names,
    #   parameters, return values and exceptions thrown from
    #   functions. Caller traces display function names, parameters
    #   and information about which function called it.
    match_spec =
      case match_spec_name do
        :caller_trace -> :c
        :exception_trace -> :x
        :caller_exception_trace -> :cx
      end

    # Decide which functions to trace
    :dbg.tpl(mod, fun, arity, match_spec)

    # Decide which processes/ports to trace
    # See erlang docs for more flag values
    :dbg.p(:processes, flags)
  end

  @doc """
  Stop tracing
  """
  def stop, do: :dbg.stop_clear
end
