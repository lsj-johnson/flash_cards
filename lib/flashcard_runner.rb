require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and
reports about the surface of which planet?', 'Mars', :STEM)
card_3 = Card.new('Describe in words the exact direction that is 697.5°
clockwise from due north?', 'North north west', :STEM)
card_4 = Card.new('What is the square root of 144?', 12, :Math)
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

def start(round)
  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "-"*50
  card_num = 1
  turn_idx = 0
  round.deck.cards.each do |card|
    puts "This is card number #{card_num} out of #{round.deck.count}."
    puts "Question: #{card.question}"
    guess = gets
    round.take_turn(guess)
    puts round.turns[turn_idx].feedback
    card_num += 1
    turn_idx += 1
  end
  puts "-"*6 + " Game over! " + "-"*6
  puts "You had #{round.number_correct} correct guesses out of #{round.deck.cards.count}."
end

start(round)
