require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

cards = CardGenerator.new('cards.txt').cards
deck = Deck.new(cards)
round = Round.new(deck)

def start(round)
  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "-"*50
  card_num = 1
  round.deck.cards.each do |card|
    puts "This is card number #{card_num} out of #{round.deck.count}."
    puts "Question: #{card.question}"
    guess = gets.chomp
    turn = round.take_turn(guess)
    puts turn.feedback
    card_num += 1
  end
  puts "-"*6 + " Game over! " + "-"*6
  puts "You had #{round.number_correct} correct guesses out of #{round.deck.cards.count} for a total score of #{round.percent_correct.round(0)}%."
  round.category_tallies.keys.each do |category|
    puts "#{String(category)} - #{round.percent_correct_by_category(category).round(0)}% correct"
  end
end

start(round)
