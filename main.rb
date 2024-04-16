# frozen_string_literal: true

class TextUI
  def initialize
    @dealer = Dealer.new
  end

  def introduction
    # запрашиваем имя игрока
    # создаем переменную @player из класса Player
    # запускаем игру start
  end

  def start
    loop do
      # создаем новую колоду Deck.new
      # мешаем колоду
      # выдаем карты
    end
  end

  def player_turn
    # ход игрока
  end

  def dealer_turn
    # ход дилера
  end

  def re_game
    # считаем итог
    # предлагаем перезапустить
  end
end