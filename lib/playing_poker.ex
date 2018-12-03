defmodule PlayingPoker do

  def start_play do
    PlayingPoker.Deal.two_hands()
    |> PlayingPoker.Compete.compete
  end

end
