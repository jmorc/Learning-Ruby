require 'hand'

describe 'Hand Class' do
  
  context 'Setup' do
    let(:deck){ Deck.new }
    let(:hand){ Hand.new(deck)}
    
    before(:each) do
      deck.shuffle!
    end
    
    it 'starts with 5 cards' do
      expect(hand.cards.count).to eq(5)
    end
  end
    
  context 'Returning cards' do
    let(:deck){ Deck.new }
    let(:hand){ Hand.new(deck)}
    
    before(:each) do
      deck.shuffle!
    end
    
    it 'returns cards to the deck, and hand count decreases' do
      hand.return
      expect(hand.cards.size < 5).to be true
    end
    
    it 'returns a certain card of the array' do 
      card1 = Card.new(:clubs, :four)
      card2 = Card.new(:clubs, :three)
      
      my_cards = Hand.new(deck)
      my_cards.cards = [card1, card2]
      
      my_cards.return(1)
      expect(my_cards.cards).to eq([card1])
    end
    
    it 'returns multiple cards' do
      card1 = Card.new(:clubs, :four)
      card2 = Card.new(:clubs, :three)
      card3 = Card.new(:hearts, :ace)
      
      my_cards = Hand.new(deck)
      my_cards.cards = [card1, card2, card3]
      
      my_cards.return([0,2])
      
      expect(my_cards.cards).to eq([card2])
      
    end
    
  end
  
  context 'Assessing cards' do
    let(:deck){ Deck.new }
    
    it 'recognizes a flush' do
      card1 = Card.new(:clubs, :four)
      card2 = Card.new(:clubs, :three)
      card3 = Card.new(:clubs, :ace)
      card4 = Card.new(:clubs, :king)
      card5 = Card.new(:clubs, :five)
      
      hand = Hand.new(deck)
      hand.cards = [card1, card2, card3, card4, card5]
      hand.assess
      
      expect(hand.state).to eq(:flush)
    end
    
    it 'recognizes one pair' do
      card1 = Card.new(:clubs, :four)
      card2 = Card.new(:spades, :four)
      card3 = Card.new(:clubs, :ace)
      card4 = Card.new(:clubs, :three)
      card5 = Card.new(:clubs, :five)
      
      hand = Hand.new(deck)
      hand.cards = [card1, card2, card3, card4, card5]
      hand.assess
      
      expect(hand.state).to eq(:one_pair)
    end
    
    it 'recognizes two pairs' do
      card1 = Card.new(:clubs, :four)
      card2 = Card.new(:spades, :four)
      card3 = Card.new(:clubs, :ace)
      card4 = Card.new(:clubs, :three)
      card5 = Card.new(:clubs, :ace)
      
      hand = Hand.new(deck)
      hand.cards = [card1, card2, card3, card4, card5]
      hand.assess
      
      expect(hand.state).to eq(:two_pair)
    end
    
    it 'recognizes three of a kind' do
      card1 = Card.new(:clubs, :four)
      card2 = Card.new(:spades, :four)
      card3 = Card.new(:hearts, :four)
      card4 = Card.new(:clubs, :three)
      card5 = Card.new(:clubs, :ace)
      
      hand = Hand.new(deck)
      hand.cards = [card1, card2, card3, card4, card5]
      hand.assess
      
      expect(hand.state).to eq(:three_of_a_kind)
    end
    
    it 'recognizes four of a kind' do
      card1 = Card.new(:clubs, :four)
      card2 = Card.new(:spades, :four)
      card3 = Card.new(:hearts, :four)
      card4 = Card.new(:diamonds, :four)
      card5 = Card.new(:clubs, :ace)
      
      hand = Hand.new(deck)
      hand.cards = [card1, card2, card3, card4, card5]
      hand.assess
      
      expect(hand.state).to eq(:four_of_a_kind)
    end
    
    it 'recognizes a full house' do
      card1 = Card.new(:clubs, :four)
      card2 = Card.new(:spades, :four)
      card3 = Card.new(:hearts, :four)
      card4 = Card.new(:diamonds, :three)
      card5 = Card.new(:clubs, :three)
      
      hand = Hand.new(deck)
      hand.cards = [card1, card2, card3, card4, card5]
      hand.assess
      
      expect(hand.state).to eq(:full_house)
    end
    
    it 'recognizes a straight without ending ace' do
      card1 = Card.new(:clubs, :two)
      card2 = Card.new(:spades, :three)
      card3 = Card.new(:hearts, :four)
      card4 = Card.new(:diamonds, :five)
      card5 = Card.new(:clubs, :six)
      
      hand = Hand.new(deck)
      hand.cards = [card1, card2, card3, card4, card5]
      hand.assess
      
      expect(hand.state).to eq(:straight)
    end

    it 'recognizes a straight ending with ace' do
      card1 = Card.new(:clubs, :ten)
      card2 = Card.new(:spades, :king)
      card3 = Card.new(:hearts, :queen)
      card4 = Card.new(:diamonds, :jack)
      card5 = Card.new(:clubs, :ace)
      
      hand = Hand.new(deck)
      hand.cards = [card1, card2, card3, card4, card5]
      hand.assess
      
      expect(hand.state).to eq(:straight)
    end
    
    it 'recognizes a straight flush' do
      card1 = Card.new(:clubs, :two)
      card2 = Card.new(:clubs, :three)
      card3 = Card.new(:clubs, :four)
      card4 = Card.new(:clubs, :five)
      card5 = Card.new(:clubs, :six)
 
      hand = Hand.new(deck)
      hand.cards = [card1, card2, card3, card4, card5]
      hand.assess
      
      expect(hand.state).to eq(:straight_flush)     
    end 
    
  end
  
  # context 'Beating hands' do
#     let(:deck) { Deck.new }
#
#     it 'Recognizes losing hand' do
#       hand1 = Hand.new(deck)
#
#       hand1.b
#     end
#   end
end