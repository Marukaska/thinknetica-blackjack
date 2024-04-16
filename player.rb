# frozen_string_literal: true

class Player
  def initialize(name)
    @name = name
    @money = 100
    @hand = Hand.new
  end

  def take_card
    # добавить карту в "руку"
  end
end
