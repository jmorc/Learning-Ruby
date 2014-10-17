require 'deck'

class Hand
  attr_reader :cards
  
  def initialize(deck)
    @deck = deck
    @cards = @deck.deal(5)
  end
  
end