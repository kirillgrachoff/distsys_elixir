defmodule Counter.Counter do
  def start(initial_count) do
    spawn_link fn ->
      listen(initial_count)
    end
  end

  def listen(count) do
    receive do
      # Your code goes here
      _ -> listen(count)
    end
  end
end
