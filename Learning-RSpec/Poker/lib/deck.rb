require_relative 'card'

class Deck
  attr_accessor :cards
  
  def initialize
    @cards = [] 
    
    fill_deck
  end
  
  def fill_deck
    Card.suits.each do |suit|
      Card.values.each do |value|
        @cards << Card.new(suit,value)
      end
    end
  end
  
  def deal(n = 1)
    hand = []
    hand + @cards.shift(n)
  end
  
  def take(cards)
    @cards += cards
    raise StandardError if @cards.count > 52
  end
  
  def shuffle!
    @cards.shuffle!
  end
  
end