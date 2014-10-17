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
    
    
  end
  
  
end