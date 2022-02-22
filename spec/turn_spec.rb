require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new('What is the capital of Alaksa?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new('What is the capital of Alaksa?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn.guess).to eq('Juneau')
  end

  it 'it is correct' do
    card = Card.new('What is the capital of Alaksa?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn.correct?).to eq(true)
  end

  it 'provides proper feedback when correct' do
    card = Card.new('What is the capital of Alaksa?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn.feedback).to eq('Correct!')
  end

  it 'exists' do
    card = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
    turn = Turn.new('Saturn', card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
    turn = Turn.new('Saturn', card)

    expect(turn.guess).to eq('Saturn')
  end

  it 'it is incorrect' do
    card = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
    turn = Turn.new('Saturn', card)

    expect(turn.correct?).to eq(false)
  end

  it 'displays proper feeback when incorrect' do
    card = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
    turn = Turn.new('Saturn', card)

    expect(turn.feedback).to eq('Incorrect.')
  end
end
