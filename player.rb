# frozen_string_literal: true

require_relative 'hand'

class Player
  attr_reader :name, :hand
  attr_accessor :money

  def initialize(name)
    @name = name
    @money = 100
    @hand = Hand.new
  end

  def take_card(deck)
    @hand.add_card(deck.deal_card)
  end

  def show_hand
    show_hand = @hand.cards.map { |card| "[#{card.value}#{card.suit}]" }
    show_hand.join(', ')
  end
end
