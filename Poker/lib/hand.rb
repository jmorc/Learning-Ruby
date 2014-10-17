require 'deck'

class Hand

  POKER_HANDS = [:high_card, 
                 :one_pair,
                 :two_pair,
                 :three_of_a_kind,
                 :straight,
                 :flush,
                 :full_house,
                 :straight_flush]
              
  attr_accessor :cards
  attr_reader :state
  
  def initialize(deck)
    @deck = deck
    @cards = @deck.deal(5)
    @state = :high_card
  end
  
  def return(idx = 0)
    if idx.is_a?(Integer)
      @deck.cards << @cards.delete_at(idx)
    else
      cards_to_remove = []
      idx.each do |i|
        cards_to_remove << @cards[i]
      end
      
      cards_to_remove.each do |card|
        @deck.cards << @cards.delete(card)
      end
    end
  end
  
  
  def assess
    if flush?
      @state = :flush
    end    
  end
  
  def beats?(other_hand)
  end
  
  def flush?
    suit = @cards[0].suit
    @cards.all? { |card| card.suit == suit }
  end
  
end