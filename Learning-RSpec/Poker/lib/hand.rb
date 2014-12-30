require 'deck'
require 'debugger'

class Hand

  POKER_HANDS = [:high_card, 
                 :one_pair,
                 :two_pair,
                 :three_of_a_kind,
                 :straight,
                 :flush,
                 :full_house,
                 :four_of_a_kind,
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
    
    if one_pair?
      @state = :one_pair
    end
    
    if two_pair?
      @state = :two_pair
    end
    
    if three_of_a_kind?
      @state = :three_of_a_kind
    end
    
    if four_of_a_kind?
      @state = :four_of_a_kind
    end

    if full_house?
      @state = :full_house
    end  
    
    if straight?
      @state = :straight
    end
    
    if straight_flush?
      @state = :straight_flush
    end
    
  end
   
  def beats?(other_hand)
  end
  
  def flush?
    suit = @cards[0].suit
    @cards.all? { |card| card.suit == suit }
  end
  
  def one_pair?
    counts  = Hash.new(0)
    
    @cards.each do |card|
      counts[card.value] += 1
    end
    
    #debugger
    counts.select! { |h,k| k == 2}
    return true if counts.size == 1
    false
  end
  
  def two_pair?
    counts  = Hash.new(0)
    
    @cards.each do |card|
      counts[card.value] += 1
    end
    
    #debugger
    counts.select! { |h,k| k == 2}
    return true if counts.size == 2
    false
  end
  
  def three_of_a_kind?
    counts  = Hash.new(0)
    
    @cards.each do |card|
      counts[card.value] += 1
    end
    
    #debugger
    counts.select! { |h,k| k == 3}
    return true if counts.size == 1
    false
  end
  
  def full_house?
    one_pair? && three_of_a_kind?
  end
  
  def four_of_a_kind?
    counts  = Hash.new(0)
    
    @cards.each do |card|
      counts[card.value] += 1
    end
    
    #debugger
    counts.select! { |h,k| k == 4}
    return true if counts.size == 1
    false
  end
  
  def straight?
    
    
    sorted = @cards.sort_by {|card| card.poker_value }
    values = sorted.map { |card| card.value }
    if values == [:ace, :ten, :jack, :queen, :king]
      return true
    end
    
    (0...@cards.size - 1).each do |i|
      return false if sorted[i].poker_value + 1 != sorted[i + 1].poker_value
    end
    
    true
  end
  
  def straight_flush?
    straight? && flush?
  end
  
end
  