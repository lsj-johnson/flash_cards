require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do
  before  :each do
    @filename = 'cards.txt'
    @card_1 = Card.new('What is 5 + 5?', '10', :STEM)
    @card_2 = Card.new("What is Rachel's favorite animal?", 'red panda', :TuringStaff)
    @card_3 = Card.new("What is Mike's middle name?", 'nobody knows', :TuringStaff)
    @card_4 = Card.new("What cardboard cutout lives at Turing?", 'Justin Bieber', :PopCulture)
    @cards = [@card_1, @card_2, @card_3, @card_4]
  end

  it 'has a file' do
    expect(@filename).to eq('cards.txt')
  end

  it 'read text to cards' do
    expect(CardGenerator.new(@filename).cards).to eq(@cards)
  end
end
