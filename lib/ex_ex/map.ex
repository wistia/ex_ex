defmodule ExEx.Map do
  @moduledoc """
  Functions that extend the capabilities of the built-in `Map` module.
  """

  @doc """
  Converts the map's keys from strings to atoms.

  If the keys are already atoms, then they are preserved.

  ## Examples

      iex> ExEx.Map.atomize_keys(%{"foo": "bar", "baz": 123})
      %{foo: "bar", baz: 123}

  """
  def atomize_keys(map) do
    for {key, val} <- map, into: %{} do
      cond do
        is_atom(key) -> {key, val}
        true -> {String.to_atom(key), val}
      end
    end
  end

  @doc """
  Converts the map's keys from atoms to strings.

  If the keys are already strings, then they are preserved.

  ## Examples

      iex> ExEx.Map.stringify_keys(%{foo: "bar", baz: 123})
      %{"foo" => "bar", "baz" => 123}

  """
  def stringify_keys(map) do
    for {key, val} <- map, into: %{} do
      cond do
        is_atom(key) -> {"#{key}", val}
        true -> {key, val}
      end
    end
  end

  @doc """
  Removes keys from the map for which the respective value is `nil`.

  ## Examples

    iex> ExEx.Map.drop_nil_values(%{"foo": nil, "bar": 123})
    %{bar: 123}
  """
  def drop_nil_values(map) do
    map
    |> Enum.reject(fn {_, val} -> is_nil(val) end)
    |> Map.new()
  end

  @doc """
  Sanitizes structs more thoroughly than `Map.from_struct/1`.

  This is intended for use cases when the struct will be serialized and cannot
  contain Ecto syntax such as `#Ecto.Schema.Metadata<:built, "media_metadata">`.
  """
  @ecto_model_fields [:__meta__, :__cardinality__, :__field__, :__owner__]
  def from_struct(struct) do
    struct
    |> Map.from_struct()
    |> Enum.map(fn {key, field} ->
         if is_map(field) and Map.has_key?(field, :__struct__) do
           {key, from_struct(field)}
         else
           {key, field}
         end
       end)
    |> Map.new()
    |> Map.drop(@ecto_model_fields)
  end
end
