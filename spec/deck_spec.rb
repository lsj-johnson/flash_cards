require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  before  :each do
    @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?', 'Mars', :STEM)
    @card_3 = Card.new('Describe in words the exact direction that is 697.5°
      clockwise from due north?', 'North north west', :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  it 'has cards' do
    expect(@deck.cards).to eq(@cards)
  end

  it 'has card deck length' do
    expect(@deck.count).to eq 3
  end

  it 'has cards in category example 1' do
    expect(@deck.cards_in_category(:STEM)).to eq [@card_2, @card_3]
  end

  it 'has cards in category example 2' do
    expect(@deck.cards_in_category(:Geography)).to eq [@card_1]
  end

  it 'has cards in category example 3' do
    expect(@deck.cards_in_category("Pop Culture")).to eq []
  end
end