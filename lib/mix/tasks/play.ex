defmodule Mix.Tasks.Play do
  use Mix.Task

  def run(_) do
    PlayingPoker.start_play
  end
end
