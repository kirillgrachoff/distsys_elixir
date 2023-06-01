defmodule Counter.CounterTest do
  use ExUnit.Case

  @tag timeout: 1_000
  test "assert shutdown" do
    pid = Counter.Counter.start(5)
    send pid, :shutdown
    assert true
  end

  @tag timeout: 1_000
  test "assert add" do
    pid = Counter.Counter.start(10)
    send pid, :inc
    send pid, {self(), :val}
    receive do
      {:val, value} ->
        assert value == 11
    end
  end
end
