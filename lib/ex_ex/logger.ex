defmodule ExEx.Logger do
  @moduledoc """
  A beefed up Logger module. Will prepend the log with the module, function, and arity
  of the call-site. Also wraps messages in a function (a best practice so these get
  compiled out)

    defmodule MyMod do
      use ExEx.Logger

      def my_function(my_arg) do
        ExEx.Logger.info("hello world")
      end
    end
  """

  defmacro __using__(_ \\ []) do
    quote do
      require Logger
      alias ExEx.Logger
    end
  end

  for level <- [:info, :debug, :warn, :error] do
    defmacro unquote(level)(chardata, metadata \\ []) do
      level = unquote(level)

      quote do
        msg =
          case __ENV__.function do
            {fn_name, arity} -> "#{__MODULE__}.#{fn_name}/#{arity}: #{unquote(chardata)}"
            _ -> "#{__MODULE__}: #{unquote(chardata)}"
          end

        Logger.unquote(level)(fn -> msg end, unquote(metadata))
      end
    end
  end

  defmacro log(level, msg, metadata \\ []) do
    quote do
      case unquote(level) do
        :info -> ExEx.Logger.info(unquote(msg), unquote(metadata))
        :debug -> ExEx.Logger.debug(unquote(msg), unquote(metadata))
        :warn -> ExEx.Logger.warn(unquote(msg), unquote(metadata))
        :error -> ExEx.Logger.error(unquote(msg), unquote(metadata))
      end
    end
  end

  defdelegate metadata(args), to: Logger
  defdelegate metadata, to: Logger
end
