# frozen_string_literal: true

require_relative 'card'
require_relative 'deck'

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
    ace_rule = @cards.find { |card| card.value == "Т" }
    score -= 10 if ace_rule && score > 21
    score
  end

  def clear
    @cards.clear
  end
end
