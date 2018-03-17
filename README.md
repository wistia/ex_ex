# ex_ex

A collection of functions that extend the capabilities of Elixir's standard library modules.

## Installation

```elixir
def deps do
  [{:ex_ex, github: "wistia/ex_ex"}]
end
```

## What's In Here?

Lots of stuff. Here's a list of what `ex_ex` provides:

* `ExEx.truthy?` - Adds `nil` handling for booleans
* `ExEx.Timer.measure_ms` - Used for benchmarking code in milliseconds
* `ExEx.Range.clamp` - Forces a value into a range
* `ExEx.Process.flush_mailbox` - Make sure that all previous messages in the processes mailbox have been handled
* `ExEx.Map.atomize_keys` - Turn all the keys into atoms
* `ExEx.Map.stringify_keys` - Turn all the keys into strings
* `ExEx.Map.drop_nil_values` - Remove every key that has `nil` for a value
* `ExEx.Map.from_struct` - Like `Map.from_struct` but also drops Ecto fields
* `ExEx.Logger` - A super-powered `Logger` that ensures log messages are wrapped in functions. Adds labels as to where the `Logger` was called from
* `ExEx.File.ls_r` - Recursively list files in a directory
* `ExEx.File.non_empty?` - Make sure a file exists and has any data in it
* `ExEx.ExUnit.defp_testable` - Works like `defp` except in `Mix.env == :test` where it works like `def` so you can test private functions
* `ExEx.Enum.parallel_map` - Like `Enum.map` but wraps each call in a `Task`
* `ExEx.Enum.has_key?` - When you don't care whether something is a `Map` or a `Keyword`; you just want to know if it has some key
* `ExEx.Dbg` - A user-friendly wrapper of Erlang's `:dbg`
* `ExEx.Task.Repeating` - A `Task` that does something in a loop at some interval
* `ExEx.Config.unpack` - Useful for handling `{:system, "ENV_VAR"}` style configuration and options in your `config.exs`
