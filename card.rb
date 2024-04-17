# frozen_string_literal: true

class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def cost
    return 10 if %w[В Д К].include?(@value)
    return 11 if @value == "Т"
    @value.to_i
  end
end