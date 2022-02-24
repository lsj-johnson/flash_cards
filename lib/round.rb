
class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck             = deck
    @turns            = []
    @cur_card_idx     = 0
    @num_corr         = 0
    @category_tallies = {}
  end

  def current_card
    @deck.cards[@cur_card_idx]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    if @category_tallies[current_card.category] == nil
      @category_tallies[new_turn.card.category] = {correct: 0, incorrect: 0,}
    end
    @turns.append(new_turn)
    @cur_card_idx += 1
    if new_turn.correct?
      @num_corr += 1
      @category_tallies[new_turn.card.category][:correct] += 1
      @category_tallies[new_turn.card.category][:incorrect] += 1
    else
      @category_tallies[new_turn.card.category][:incorrect] += 1
    end
    new_turn
  end

  def number_correct
    @num_corr
  end

  def percent_correct
    @num_corr.fdiv(@turns.count) * 100
  end

  def number_correct_by_category(category)
    @category_tallies[category][:correct]
  end

  def percent_correct_by_category(category)
    @category_tallies[category][:correct].fdiv(
      @category_tallies[category][:incorrect]) * 100
  end
end
