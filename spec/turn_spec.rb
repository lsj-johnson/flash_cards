require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before  :each do
    @card_1 = Card.new('What is the capital of Alaksa?', 'Juneau', :Geography)
    @turn_1 = Turn.new('Juneau', @card_1)
    @card_2 = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
    @turn_2 = Turn.new('Saturn', @card_2)
  end

  it 'exists' do
    expect(@turn_1).to be_a(Turn)
  end

  it 'has a guess' do
    expect(@turn_1.guess).to eq('Juneau')
  end

  it 'it is correct' do
    expect(@turn_1.correct?).to eq(true)
  end

  it 'provides proper feedback when correct' do
    expect(@turn_1.feedback).to eq('Correct!')
  end

  it 'exists' do
    expect(@turn_2).to be_instance_of(Turn)
  end

  it 'has a guess' do
    expect(@turn_2.guess).to eq('Saturn')
  end

  it 'it is incorrect' do
    expect(@turn_2.correct?).to eq(false)
  end

  it 'displays proper feeback when incorrect' do
    expect(@turn_2.feedback).to eq('Incorrect.')
  end
end
