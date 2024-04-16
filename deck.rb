# frozen_string_literal: true

class Deck
  SUITS = %w[♠️ ♥️ ♦️ ♣️]
  VALUES = %w[2 3 4 5 6 7 8 10 9 В Д К Т]

  def initialize
    @cards = [] #создаем колоду из объектов класса Card
  end

  def shuffle!
    #мешаем карты
  end

  def deal_card
    #выдаем карту
  end
end