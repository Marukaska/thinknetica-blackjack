# frozen_string_literal: true

require_relative 'card'
require_relative 'dealer'
require_relative 'deck'
require_relative 'hand'
require_relative 'player'

class TextUI
  def initialize
    @dealer = Dealer.new
  end

  def introduction
    print 'Добро пожаловать в игру Blackjack! Представьтесь: '
    name = gets.chop.capitalize
    @player = Player.new(name)
  end

  def start
    introduction
    preparing_game
  end

  def preparing_game
    @deck = Deck.new
    2.times { @player.take_card(@deck) }
    2.times { @dealer.take_card(@deck) }
    @player.money -= 10
    @dealer.money -= 10
    player_turn
  end

  def conclude_game
    player_score = @player.hand.score
    dealer_score = @dealer.hand.score

    if player_score > 21
      puts 'Игрок проиграл! Дилер выигрывает.'
      @dealer.money += 20
    elsif dealer_score > 21
      puts 'Дилер проиграл! Игрок выигрывает.'
      @player.money += 20
    elsif player_score > dealer_score
      puts 'Игрок выигрывает!'
      @player.money += 20
    elsif dealer_score > player_score
      puts 'Дилер выигрывает!'
      @dealer.money += 20
    else
      puts 'Ничья'
      @player.money += 10
      @dealer.money += 10
    end

    score_print
    re_game
  end

  def score_print
    puts "У дилера - #{@dealer.show_hand} - общий счет #{@dealer.hand.score}. В банке: #{@dealer.money}$"
    puts "У игрока - #{@player.show_hand} - общий счет #{@player.hand.score}. В банке: #{@player.money}$"
  end

  def player_turn
    score_print
    puts <<~TEXT
      Укажите какое действие хотите совершить:
      1. Добавить карту
      2. Пропустить ход
      3. Открыть карты
    TEXT
    print "\nВаш выбор: "
    case gets.chop.to_i
    when 1
      @player.take_card(@deck)
      dealer_turn
    when 2
      dealer_turn
    when 3
      conclude_game
    end
  end

  def dealer_turn
    @dealer.take_card(@deck) if @dealer.hand.score < 17
    conclude_game
  end

  def re_game
    puts <<~TEXT
      Продолжить игру:
      1. Да
      2. Нет
    TEXT
    print "\nВаш выбор: "
    case gets.chop.to_i
    when 1
      @player.hand.clear
      @dealer.hand.clear
      preparing_game
    when 2
      Kernel.exit
    end
  end
end

game = TextUI.new
game.start
