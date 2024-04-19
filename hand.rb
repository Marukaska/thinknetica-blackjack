# frozen_string_literal: true

require_relative 'card'

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def score
    score = 0
    @cards.each { |card| score += card.cost }
    count = @cards.count { |card| card.value == 'Т' }
    score -= 10 if count > 0 && score > 21
    score -= 10 if count >= 2 && score > 21
    score
  end

  def clear
    @cards.clear
  end
end
