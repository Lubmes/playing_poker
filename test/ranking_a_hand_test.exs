defmodule RankingAHandTest do
  use ExUnit.Case

  alias PlayingPoker.Card
  alias PlayingPoker.Hand
  alias PlayingPoker.Hand.Rank

  test "ranking as a: straight flush" do
    cards = [
      %Card{suit: 'C', value: 6},
      %Card{suit: 'C', value: 7},
      %Card{suit: 'C', value: 8},
      %Card{suit: 'C', value: 9},
      %Card{suit: 'C', value: 10}
    ]
    hand = %Hand{cards: cards}
    %{rank: rank} = Rank.rank(hand)

    assert rank == %{score: 1, call: :straight_flush}
  end
  test "ranking as a: four of a kind" do
    cards = [
      %Card{suit: 'C', value: 5},
      %Card{suit: 'C', value: 6},
      %Card{suit: 'D', value: 6},
      %Card{suit: 'H', value: 6},
      %Card{suit: 'S', value: 6},
    ]
    hand = %Hand{cards: cards}
    %{rank: rank} = Rank.rank(hand)

    assert rank == %{score: 2, call: :four_of_a_kind}
  end
  test "ranking as a: full house" do
    cards = [
      %Card{suit: 'C', value: 5},
      %Card{suit: 'D', value: 5},
      %Card{suit: 'C', value: 6},
      %Card{suit: 'D', value: 6},
      %Card{suit: 'H', value: 6}
    ]
    hand = %Hand{cards: cards}
    %{rank: rank} = Rank.rank(hand)

    assert rank == %{score: 3, call: :full_house}
  end
  test "ranking as a: flush" do
    cards = [
      %Card{suit: 'C', value: 6},
      %Card{suit: 'C', value: 8},
      %Card{suit: 'C', value: 9},
      %Card{suit: 'C', value: 12},
      %Card{suit: 'C', value: 13}
    ]
    hand = %Hand{cards: cards}
    %{rank: rank} = Rank.rank(hand)

    assert rank == %{score: 4, call: :flush}
  end
  test "ranking as a: straight" do
    cards = [
      %Card{suit: 'C', value: 6},
      %Card{suit: 'D', value: 7},
      %Card{suit: 'C', value: 8},
      %Card{suit: 'C', value: 9},
      %Card{suit: 'C', value: 10}
    ]
    hand = %Hand{cards: cards}
    %{rank: rank} = Rank.rank(hand)

    assert rank == %{score: 5, call: :straight}
  end
  test "ranking as a: three of a kind" do
    cards = [
      %Card{suit: 'C', value: 5},
      %Card{suit: 'C', value: 6},
      %Card{suit: 'D', value: 6},
      %Card{suit: 'H', value: 6},
      %Card{suit: 'C', value: 7}
    ]
    hand = %Hand{cards: cards}
    %{rank: rank} = Rank.rank(hand)

    assert rank == %{score: 6, call: :three_of_a_kind}
  end
  test "ranking as a: two pairs" do
    cards = [
      %Card{suit: 'C', value: 6},
      %Card{suit: 'D', value: 6},
      %Card{suit: 'C', value: 7},
      %Card{suit: 'H', value: 7},
      %Card{suit: 'C', value: 8}
    ]
    hand = %Hand{cards: cards}
    %{rank: rank} = Rank.rank(hand)

    assert rank == %{score: 7, call: :two_pairs}
  end
  test "ranking as a: pair" do
    cards = [
      %Card{suit: 'C', value: 5},
      %Card{suit: 'C', value: 6},
      %Card{suit: 'D', value: 6},
      %Card{suit: 'C', value: 7},
      %Card{suit: 'C', value: 8}
    ]
    hand = %Hand{cards: cards}
    %{rank: rank} = Rank.rank(hand)

    assert rank == %{score: 8, call: :pair}
  end
  test "ranking as a: high card" do
    cards = [
      %Card{suit: 'C', value: 6},
      %Card{suit: 'C', value: 8},
      %Card{suit: 'C', value: 9},
      %Card{suit: 'D', value: 10},
      %Card{suit: 'C', value: 12}
    ]
    hand = %Hand{cards: cards}
    %{rank: rank} = Rank.rank(hand)

    assert rank == %{score: 9, call: :high_card}
  end

end
