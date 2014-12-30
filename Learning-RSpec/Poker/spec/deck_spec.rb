require 'deck'

describe 'Deck' do
  let(:deck) {Deck.new}

  context 'setup' do
    it 'keeps its cards in an Array' do
      #expect an array on @deck
      expect(deck.cards).to be_instance_of(Array)
    end
  
    it 'all cards are actually cards' do
      expect(deck.cards.all? { |x| x.is_a?(Card) } ).to be true
    end
    
    it 'starts with 52 cards' do 
      expect(deck.cards.count).to eq(52)
    end
  end
  
  context '#Deal and #Take' do

    ##deal should return a card 
    ##take should receive a card and add it to @cards
    #check for the number cards of deck decreases
    it 'deals an array' do
      hand = deck.deal
      expect(hand).to be_instance_of(Array)
    end 
    
    it 'deals one card' do
      hand = deck.deal
      expect(hand.all?{ |c| c.is_a?(Card) }).to be true
    end
    
    it 'deals multiple cards' do
      hand = deck.deal(5)
      expect(hand.all?{ |c| c.is_a?(Card) }).to be true
    end
    
    it 'dealing decreases deck size' do
      hand = deck.deal(5)
      expect(deck.cards.count).to eq(47) 
    end
    
    it 'takes an Array of cards and adds it to the deck' do
      cards = deck.deal(5)
      deck.take(cards)
      expect(deck.cards.count).to eq(52)
    end
    
    it 'raises an error if it takes more than 52 cards' do
      cards = [5, 3, 4]
      expect {deck.take(cards)}.to raise_error
    end
  end
  
  describe 'Shuffle' do
    it 'shuffles its deck' do
      old_deck = Deck.new
      new_deck = Deck.new
      new_deck.shuffle!
      expect(new_deck.cards).to_not eq(old_deck.cards)
    end
  end
end