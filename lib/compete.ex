defmodule PlayingPoker.Compete do
  alias PlayingPoker.Hand
  import PlayingPoker.Hand.Rank

  def compete(two_hands) do
    two_hands
    |> rank_both_hands
    |> decide_game
  end

  def rank_both_hands({hand_1, hand_2}) do
    {rank(hand_1), rank(hand_2)}
  end

  def decide_game({hand_1, hand_2}) do
    cond do
      hand_1.rank.score < hand_2.rank.score ->
        IO.puts "Black wins! - #{Hand.humanize_call(hand_1.rank.call)}"
        { %{hand_1 | final_score: :win},
          %{hand_2 | final_score: :lose} }
      hand_1.rank.score > hand_2.rank.score ->
        IO.puts "White wins! - #{Hand.humanize_call(hand_2.rank.call)}"
        { %{hand_1 | final_score: :lose},
          %{hand_2 | final_score: :win} }
      true ->
        IO.puts "(Equal rank!: #{Hand.humanize_call(hand_1.rank.call)})"
        resolve_game({hand_1, hand_2})
    end
  end

  # straight flush
  def resolve_game({hand_1 = %{rank: %{score: 1}}, hand_2}), do: high_card_rule({hand_1, hand_2}, 4)
  # four of a kind
  def resolve_game({hand_1 = %{rank: %{score: 2}}, hand_2}), do: compare_sets({hand_1, hand_2})
  # full house
  def resolve_game({hand_1 = %{rank: %{score: 3}}, hand_2}), do: compare_sets({hand_1, hand_2})
  # flush
  def resolve_game({hand_1 = %{rank: %{score: 4}}, hand_2}), do: high_card_rule({hand_1, hand_2}, 4)
  # straight
  def resolve_game({hand_1 = %{rank: %{score: 5}}, hand_2}), do: high_card_rule({hand_1, hand_2}, 4)
  # three of a_kind
  def resolve_game({hand_1 = %{rank: %{score: 6}}, hand_2}), do: compare_sets({hand_1, hand_2})
  # two pairs
  def resolve_game({hand_1 = %{rank: %{score: 7}}, hand_2}), do: compare_sets({hand_1, hand_2})
  # pair
  def resolve_game({hand_1 = %{rank: %{score: 8}}, hand_2}), do: compare_sets({hand_1, hand_2})
  # high card
  def resolve_game({hand_1 = %{rank: %{score: 9}}, hand_2}), do: high_card_rule({hand_1, hand_2}, 4)

  def compare_sets({hand_1, hand_2}) do
    cond do
      hand_1.first_set_value  > hand_2.first_set_value  ->
        set = if hand_1.rank.score == 7, do: "first set", else: "set"
        IO.puts "Black wins - #{set} value: #{Hand.humanize_value(hand_1.first_set_value)}"
        { %{hand_1 | final_score: :win},
          %{hand_2 | final_score: :lose} }
      hand_2.first_set_value  > hand_1.first_set_value  ->
        set = if hand_1.rank.score == 7, do: "first set", else: "set"
        IO.puts "White wins - #{set} value: #{Hand.humanize_value(hand_2.first_set_value)}"
        { %{hand_1 | final_score: :lose},
          %{hand_2 | final_score: :win} }
      hand_1.second_set_value > hand_2.second_set_value ->
        IO.puts "Black wins - second set value: #{Hand.humanize_value(hand_1.second_set_value)}"
        { %{hand_1 | final_score: :win},
          %{hand_2 | final_score: :lose} }
      hand_2.second_set_value > hand_1.second_set_value ->
        IO.puts "White wins - second set value: #{Hand.humanize_value(hand_2.second_set_value)}"
        { %{hand_1 | final_score: :lose},
          %{hand_2 | final_score: :win} }
      true                                              ->
        high_card_rule({hand_1, hand_2}, 4)
    end
  end

  def high_card_rule(two_hands, -1), do: tie(two_hands)
  def high_card_rule({hand_1, hand_2}, position) do
    card_1 = Enum.at(hand_1.cards, position)
    card_2 = Enum.at(hand_2.cards, position)

    cond do
      card_1.value > card_2.value ->
        IO.puts "Black wins - high card: #{Hand.humanize_value(card_1.value)}"
        { %{hand_1 | final_score: :win, high_card_value: card_1.value},
          %{hand_2 | final_score: :lose} }
      card_2.value > card_1.value ->
        IO.puts "White wins - high card: #{Hand.humanize_value(card_2.value)}"
        { %{hand_1 | final_score: :lose},
          %{hand_2 | final_score: :win, high_card_value: card_2.value} }
      true                        ->
        high_card_rule({hand_1, hand_2}, position - 1)
    end
  end

  def tie({hand_1, hand_2}) do
    IO.puts "Tie"
    { %{hand_1 | final_score: :tie},
      %{hand_2 | final_score: :tie} }
  end

end
