defmodule PlayingPoker.Hand.Rank do
  defstruct score: nil,
            call: nil

  def rank(hand) do
    hand_values = Enum.map(hand.cards, &(&1.value))
    [lowest, _, _, _, _] = hand_values
    straight = [lowest, lowest + 1, lowest + 2, lowest + 3, lowest + 4]

    hand_suits = Enum.map(hand.cards, &(&1.suit))
    flush = case hand_suits do
      [a, a, a, a, a] -> true
      _               -> false
    end

    case hand_values do
      ###
      ^straight when flush  -> %{hand | rank: %{score: 1, call: :straight_flush}}
      ###
      [_, a, a, a, a]       -> %{hand | rank: %{score: 2, call: :four_of_a_kind},   first_set_value: a}
      [a, a, a, a, _]       -> %{hand | rank: %{score: 2, call: :four_of_a_kind},   first_set_value: a}
      ###
      [b, b, a, a, a]       -> %{hand | rank: %{score: 3, call: :full_house},       first_set_value: a }
      [a, a, a, b, b]       -> %{hand | rank: %{score: 3, call: :full_house},       first_set_value: a }
      ###
      _ when flush          -> %{hand | rank: %{score: 4, call: :flush}}
      ###
      ^straight             -> %{hand | rank: %{score: 5, call: :straight}}
      ###
      [_, _, a, a, a]       -> %{hand | rank: %{score: 6, call: :three_of_a_kind},  first_set_value: a}
      [_, a, a, a, _]       -> %{hand | rank: %{score: 6, call: :three_of_a_kind},  first_set_value: a}
      [a, a, a, _, _]       -> %{hand | rank: %{score: 6, call: :three_of_a_kind},  first_set_value: a}
      ###
      [_, b, b, a, a]       -> %{hand | rank: %{score: 7, call: :two_pairs},        first_set_value: a,
                                                                                    second_set_value: b}
      [b, b, _, a, a]       -> %{hand | rank: %{score: 7, call: :two_pairs},        first_set_value: a,
                                                                                    second_set_value: b}
      [b, b, a, a, _]       -> %{hand | rank: %{score: 7, call: :two_pairs},        first_set_value: a,
                                                                                    second_set_value: b}
      ###
      [_, _, _, a, a]       -> %{hand | rank: %{score: 8, call: :pair},             first_set_value: a}
      [_, _, a, a, _]       -> %{hand | rank: %{score: 8, call: :pair},             first_set_value: a}
      [_, a, a, _, _]       -> %{hand | rank: %{score: 8, call: :pair},             first_set_value: a}
      [a, a, _, _, _]       -> %{hand | rank: %{score: 8, call: :pair},             first_set_value: a}
      ###
      _                     -> %{hand | rank: %{score: 9, call: :high_card}}
    end
  end

end
