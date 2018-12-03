defmodule PlayingPoker.Deck do
  alias PlayingPoker.Card

  def all, do: [
    # clubs
    %Card{suit: 'C', value: 2},
    %Card{suit: 'C', value: 3},
    %Card{suit: 'C', value: 4},
    %Card{suit: 'C', value: 5},
    %Card{suit: 'C', value: 6},
    %Card{suit: 'C', value: 7},
    %Card{suit: 'C', value: 8},
    %Card{suit: 'C', value: 9},
    %Card{suit: 'C', value: 10},
    %Card{suit: 'C', value: 11},
    %Card{suit: 'C', value: 12},
    %Card{suit: 'C', value: 13},
    %Card{suit: 'C', value: 14},
    # diamonds
    %Card{suit: 'D', value: 2},
    %Card{suit: 'D', value: 3},
    %Card{suit: 'D', value: 4},
    %Card{suit: 'D', value: 5},
    %Card{suit: 'D', value: 6},
    %Card{suit: 'D', value: 7},
    %Card{suit: 'D', value: 8},
    %Card{suit: 'D', value: 9},
    %Card{suit: 'D', value: 10},
    %Card{suit: 'D', value: 11},
    %Card{suit: 'D', value: 12},
    %Card{suit: 'D', value: 13},
    %Card{suit: 'D', value: 14},
    # hearts
    %Card{suit: 'H', value: 2},
    %Card{suit: 'H', value: 3},
    %Card{suit: 'H', value: 4},
    %Card{suit: 'H', value: 5},
    %Card{suit: 'H', value: 6},
    %Card{suit: 'H', value: 7},
    %Card{suit: 'H', value: 8},
    %Card{suit: 'H', value: 9},
    %Card{suit: 'H', value: 10},
    %Card{suit: 'H', value: 11},
    %Card{suit: 'H', value: 12},
    %Card{suit: 'H', value: 13},
    %Card{suit: 'H', value: 14},
    # spades
    %Card{suit: 'S', value: 2},
    %Card{suit: 'S', value: 3},
    %Card{suit: 'S', value: 4},
    %Card{suit: 'S', value: 5},
    %Card{suit: 'S', value: 6},
    %Card{suit: 'S', value: 7},
    %Card{suit: 'S', value: 8},
    %Card{suit: 'S', value: 9},
    %Card{suit: 'S', value: 10},
    %Card{suit: 'S', value: 11},
    %Card{suit: 'S', value: 12},
    %Card{suit: 'S', value: 13},
    %Card{suit: 'S', value: 14},
  ]
end