defmodule ExEx.LoggerTest do
  import ExUnit.CaptureLog
  use ExEx.Logger
  use ExUnit.Case, async: true

  describe "info" do
    test "it contains the module name" do
      binary = capture_log(fn -> ExEx.Logger.info("hello world") end)
      assert binary =~ "#{__MODULE__}"
    end

    test "it contains the function name and arity" do
      binary = capture_log(fn -> ExEx.Logger.info("hello world") end)
      {fn_name, arity} = __ENV__.function
      assert binary =~ "#{fn_name}/#{arity}"
    end
  end

  describe "debug" do
    test "it contains the module name" do
      binary = capture_log(fn -> ExEx.Logger.debug("hello world") end)
      assert binary =~ "#{__MODULE__}"
    end

    test "it contains the function name and arity" do
      binary = capture_log(fn -> ExEx.Logger.debug("hello world") end)
      {fn_name, arity} = __ENV__.function
      assert binary =~ "#{fn_name}/#{arity}"
    end
  end

  describe "warn" do
    test "it contains the module name" do
      binary = capture_log(fn -> ExEx.Logger.warn("hello world") end)
      assert binary =~ "#{__MODULE__}"
    end

    test "it contains the function name and arity" do
      binary = capture_log(fn -> ExEx.Logger.warn("hello world") end)
      {fn_name, arity} = __ENV__.function
      assert binary =~ "#{fn_name}/#{arity}"
    end
  end

  describe "error" do
    test "it contains the module name" do
      binary = capture_log(fn -> ExEx.Logger.error("hello world") end)
      assert binary =~ "#{__MODULE__}"
    end

    test "it contains the function name and arity" do
      binary = capture_log(fn -> ExEx.Logger.error("hello world") end)
      {fn_name, arity} = __ENV__.function
      assert binary =~ "#{fn_name}/#{arity}"
    end
  end
end
