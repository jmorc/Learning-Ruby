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
      card4 = Card.new(:clubs, :three)
      card5 = Card.new(:clubs, :ace)
      
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
      card5 = Card.new(:clubs, :ace)
      
      hand = Hand.new(deck)
      hand.cards = [card1, card2, card3, card4, card5]
      hand.assess
      
      expect(hand.state) to eq(:one_pair)
    end
    
  end
  
  
end