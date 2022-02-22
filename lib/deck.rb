
class Deck
  attr_reader     :cards

  def initialize(cards = [])
    @cards        = cards
  end

  def count
    cards.length
  end

  def cards_in_category(a_category)
    category_cards = []
    cards.each do |card|
      if card.category == a_category
        category_cards.append(card)
    category_cards
  end
