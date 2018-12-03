defmodule EdgeCaseGamesTest do
  use ExUnit.Case

  alias PlayingPoker.Card
  alias PlayingPoker.Hand
  import PlayingPoker.Compete

  # Hogere rank wint altijd.
  test "competing: one direct win by rank" do
    cards_black = [
      %Card{suit: 'C', value: 7},
      %Card{suit: 'D', value: 7},
      %Card{suit: 'C', value: 8},
      %Card{suit: 'C', value: 8},
      %Card{suit: 'C', value: 12}
    ]
    cards_white = [
      %Card{suit: 'D', value: 5},
      %Card{suit: 'C', value: 6},
      %Card{suit: 'D', value: 6},
      %Card{suit: 'D', value: 12},
      %Card{suit: 'D', value: 13}
    ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :win
    assert final_score_white == :lose
  end

  # TODO: Alle edge cases.

  # Een winnaar uit de hoogste kaart.
  test "competing: two straight flushes" do
    cards_black = [
      %Card{suit: 'C', value: 2},
      %Card{suit: 'C', value: 3},
      %Card{suit: 'C', value: 4},
      %Card{suit: 'C', value: 5},
      %Card{suit: 'C', value: 6}
    ]
    cards_white = [
      %Card{suit: 'D', value: 3},
      %Card{suit: 'D', value: 4},
      %Card{suit: 'D', value: 5},
      %Card{suit: 'D', value: 6},
      %Card{suit: 'D', value: 7}
    ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :lose
    assert final_score_white == :win
  end

  # Een tie met een straight flush (kans nagenoeg nul, maar ok).
  test "competing: two straight flushes to a tie" do
    cards_black = [
      %Card{suit: 'C', value: 3},
      %Card{suit: 'C', value: 4},
      %Card{suit: 'C', value: 5},
      %Card{suit: 'C', value: 6},
      %Card{suit: 'C', value: 7}
    ]
    cards_white = [
      %Card{suit: 'D', value: 3},
      %Card{suit: 'D', value: 4},
      %Card{suit: 'D', value: 5},
      %Card{suit: 'D', value: 6},
      %Card{suit: 'D', value: 7}
    ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :tie
    assert final_score_white == :tie
  end

  # Direct een winnaar uit de hoogste 4.
  test "competing: two four of a kinds" do
    cards_black = [
      %Card{suit: 'C', value: 4},
      %Card{suit: 'D', value: 4},
      %Card{suit: 'H', value: 4},
      %Card{suit: 'S', value: 4},
      %Card{suit: 'C', value: 12}
     ]
     cards_white = [
      %Card{suit: 'C', value: 8},
      %Card{suit: 'D', value: 8},
      %Card{suit: 'H', value: 8},
      %Card{suit: 'S', value: 8},
      %Card{suit: 'D', value: 12}
     ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :lose
    assert final_score_white == :win
  end

  # Direct een winnaar uit de hoogste 3.
  test "competing: two full houses" do
    cards_black = [
      %Card{suit: 'C', value: 6},
      %Card{suit: 'D', value: 6},
      %Card{suit: 'H', value: 6},
      %Card{suit: 'S', value: 13},
      %Card{suit: 'C', value: 13}
     ]
     cards_white = [
      %Card{suit: 'C', value: 4},
      %Card{suit: 'D', value: 4},
      %Card{suit: 'H', value: 12},
      %Card{suit: 'S', value: 12},
      %Card{suit: 'C', value: 12}
     ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :lose
    assert final_score_white == :win
  end

  # Een winnaar uit de hoogste kaart.
  test "competing: two flushes" do
    cards_black = [
      %Card{suit: 'C', value: 2},
      %Card{suit: 'C', value: 6},
      %Card{suit: 'C', value: 8},
      %Card{suit: 'C', value: 9},
      %Card{suit: 'C', value: 12}
     ]
     cards_white = [
      %Card{suit: 'D', value: 5},
      %Card{suit: 'D', value: 6},
      %Card{suit: 'D', value: 8},
      %Card{suit: 'D', value: 9},
      %Card{suit: 'D', value: 12}
     ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :lose
    assert final_score_white == :win
  end

  # Een winnaar uit de hoogste kaart.
  test "competing: two straights" do
    cards_black = [
      %Card{suit: 'C', value: 10},
      %Card{suit: 'D', value: 11},
      %Card{suit: 'H', value: 12},
      %Card{suit: 'S', value: 13},
      %Card{suit: 'C', value: 14}
     ]
     cards_white = [
      %Card{suit: 'C', value: 9},
      %Card{suit: 'D', value: 10},
      %Card{suit: 'H', value: 11},
      %Card{suit: 'S', value: 12},
      %Card{suit: 'C', value: 13}
     ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :win
    assert final_score_white == :lose
  end

  # Direct een winnaar uit de hoogste 3.
  test "competing: two three of a kinds" do
    cards_black = [
      %Card{suit: 'C', value: 4},
      %Card{suit: 'D', value: 4},
      %Card{suit: 'H', value: 4},
      %Card{suit: 'S', value: 12},
      %Card{suit: 'C', value: 13}
    ]
    cards_white = [
      %Card{suit: 'C', value: 5},
      %Card{suit: 'D', value: 5},
      %Card{suit: 'H', value: 5},
      %Card{suit: 'S', value: 10},
      %Card{suit: 'C', value: 11}
    ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :lose
    assert final_score_white == :win
  end

  # Een winnaar uit de eerste set.
  test "competing: two two pairs first set wins" do
    cards_black = [
      %Card{suit: 'C', value: 2},
      %Card{suit: 'D', value: 2},
      %Card{suit: 'H', value: 8},
      %Card{suit: 'S', value: 8},
      %Card{suit: 'C', value: 12}
    ]
    cards_white = [
      %Card{suit: 'C', value: 2},
      %Card{suit: 'D', value: 2},
      %Card{suit: 'H', value: 6},
      %Card{suit: 'S', value: 6},
      %Card{suit: 'D', value: 12}
    ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :win
    assert final_score_white == :lose
  end

  # Een winnaar uit de tweede set.
  test "competing: two two pairs second set wins" do
    cards_black = [
      %Card{suit: 'C', value: 2},
      %Card{suit: 'D', value: 2},
      %Card{suit: 'H', value: 8},
      %Card{suit: 'S', value: 8},
      %Card{suit: 'C', value: 12}
    ]
    cards_white = [
      %Card{suit: 'C', value: 3},
      %Card{suit: 'D', value: 3},
      %Card{suit: 'H', value: 8},
      %Card{suit: 'S', value: 8},
      %Card{suit: 'D', value: 12}
    ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :lose
    assert final_score_white == :win
  end

  # Een winnaar uit de hoogste kaart.
  test "competing: two two pairs win by remaining high card" do
    cards_black = [
      %Card{suit: 'C', value: 2},
      %Card{suit: 'D', value: 2},
      %Card{suit: 'H', value: 8},
      %Card{suit: 'S', value: 8},
      %Card{suit: 'C', value: 13}
    ]
    cards_white = [
      %Card{suit: 'C', value: 2},
      %Card{suit: 'D', value: 2},
      %Card{suit: 'H', value: 8},
      %Card{suit: 'S', value: 8},
      %Card{suit: 'D', value: 12}
    ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :win
    assert final_score_white == :lose
  end

  # Een tie met two pairs (extreem case, maximale flow door programma).
  test "competing: two two pairs to a tie" do
    cards_black = [
      %Card{suit: 'C', value: 2},
      %Card{suit: 'D', value: 2},
      %Card{suit: 'H', value: 8},
      %Card{suit: 'S', value: 8},
      %Card{suit: 'C', value: 14}
    ]
    cards_white = [
      %Card{suit: 'C', value: 2},
      %Card{suit: 'D', value: 2},
      %Card{suit: 'H', value: 8},
      %Card{suit: 'S', value: 8},
      %Card{suit: 'D', value: 14}
    ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :tie
    assert final_score_white == :tie
  end

  # Een winnaar uit een van de pairs.
  test "competing: two pairs" do
    cards_black = [
      %Card{suit: 'C', value: 4},
      %Card{suit: 'D', value: 4},
      %Card{suit: 'H', value: 8},
      %Card{suit: 'S', value: 9},
      %Card{suit: 'C', value: 14}
    ]
    cards_white = [
      %Card{suit: 'C', value: 5},
      %Card{suit: 'D', value: 5},
      %Card{suit: 'S', value: 8},
      %Card{suit: 'C', value: 9},
      %Card{suit: 'D', value: 14}
    ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :lose
    assert final_score_white == :win
  end

  # Een tie uit twee pairs.
  test "competing: two pairs to a tie" do
    cards_black = [
      %Card{suit: 'C', value: 5},
      %Card{suit: 'D', value: 5},
      %Card{suit: 'H', value: 8},
      %Card{suit: 'S', value: 9},
      %Card{suit: 'C', value: 14}
    ]
    cards_white = [
      %Card{suit: 'D', value: 5},
      %Card{suit: 'H', value: 5},
      %Card{suit: 'S', value: 8},
      %Card{suit: 'C', value: 9},
      %Card{suit: 'H', value: 14}
    ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :tie
    assert final_score_white == :tie
  end

  # Een winnaar uit high cards.
  test "competing: two high cards" do
    cards_black = [
      %Card{suit: 'C', value: 2},
      %Card{suit: 'D', value: 3},
      %Card{suit: 'H', value: 6},
      %Card{suit: 'S', value: 8},
      %Card{suit: 'C', value: 9}
    ]
    cards_white = [
      %Card{suit: 'C', value: 2},
      %Card{suit: 'D', value: 3},
      %Card{suit: 'H', value: 7},
      %Card{suit: 'S', value: 8},
      %Card{suit: 'C', value: 9}
    ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :lose
    assert final_score_white == :win
  end

  # Een tie uit high cards.
  test "competing: two high cards to a tie" do
    cards_black = [
      %Card{suit: 'C', value: 6},
      %Card{suit: 'D', value: 7},
      %Card{suit: 'H', value: 8},
      %Card{suit: 'S', value: 9},
      %Card{suit: 'C', value: 11}
    ]
    cards_white = [
      %Card{suit: 'D', value: 6},
      %Card{suit: 'H', value: 7},
      %Card{suit: 'S', value: 8},
      %Card{suit: 'C', value: 9},
      %Card{suit: 'D', value: 11}
    ]
    black = %Hand{cards: cards_black}
    white = %Hand{cards: cards_white}
    {%{final_score: final_score_black}, %{final_score: final_score_white}} = compete({black, white})
    assert final_score_black == :tie
    assert final_score_white == :tie
  end
end
