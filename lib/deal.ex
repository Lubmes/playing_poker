defmodule PlayingPoker.Deal do
  alias PlayingPoker.Deck
  alias PlayingPoker.Hand

  def two_hands do
    deck = Deck.all()
    draw_ten_random_cards = &(Enum.take_random(&1, 10))
    split_into_two_hands = &(Enum.split(&1, 5))

    {cards_black, cards_white} = deck
                                 |> draw_ten_random_cards.()
                                 |> split_into_two_hands.()

    cards_black = cards_black |> sort_by_value
    cards_white = cards_white |> sort_by_value

    IO.puts ""
    IO.puts "Black:"
    cards_black |> display_cards
    IO.puts "White:"
    cards_white |> display_cards

    hand_black = %Hand{cards: cards_black}
    hand_white = %Hand{cards: cards_white}
    {hand_black, hand_white}
  end

  defp sort_by_value(cards) do
    Enum.sort_by(cards, &(&1.value))
  end

  defp display_cards(cards) do
    cards
    |> Enum.map(&Hand.humanize_card/1)
    |> Enum.join(" ")
    |> IO.puts
  end


end
