# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_reader :cards

  SUITS = %w[♠️ ♥️ ♦️ ♣️]
  VALUES = %w[2 3 4 5 6 7 8 9 10 В Д К Т]

  def initialize
    @cards = []
    SUITS.each do |suit|
      VALUES.each { |value| @cards << Card.new(suit, value) }
    end
    shuffle!
  end

  def shuffle!
    @cards.shuffle!
  end

  def deal_card
    @cards.pop
  end
end