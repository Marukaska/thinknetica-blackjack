# frozen_string_literal: true

class Player
  def initialize(name)
    @name = name
    @money = 100
    @hand = Hand.new
  end

  def take_card(deck)
    @hand.add_card(deck.deal_card)
  end
end
