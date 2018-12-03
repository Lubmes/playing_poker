defmodule PlayingPoker.Hand do
  alias PlayingPoker.Hand.Rank

  defstruct cards: [],
            rank: %Rank{},
            first_set_value: nil,
            second_set_value: nil,
            high_card_value: nil,
            final_score: :undecided # :win, :lose, :tie

  def humanize_card(card) do
    {suit, value} = {card.suit, card.value}
    "#{humanize_value(value)}#{suit}"
  end

  def humanize_call(call) do
    Atom.to_string(call) |> String.replace("_", " ")
  end

  def humanize_value(value) do
    case value do
      14 -> 'A'
      13 -> 'K'
      12 -> 'Q'
      11 -> 'J'
      10 -> 'T'
      _ -> Integer.to_string(value)
    end
  end

end
