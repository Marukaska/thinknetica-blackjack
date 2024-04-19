# frozen_string_literal: true

require_relative 'card'
require_relative 'dealer'
require_relative 'deck'
require_relative 'hand'
require_relative 'player'
require_relative 'text_helper'

class TextUI
  include TextHelper

  def initialize
    @dealer = Dealer.new
  end

  def introduction
    print_module(:welcome)
    name = gets.chop.capitalize
    @player = Player.new(name)
  end

  def start
    introduction
    preparing_game
  end

  def print_module(arg)
    text_menu = TEXT_UI[arg]
    puts '-------------------------------------------'
    puts text_menu[:heading] if text_menu.key?(:heading)
    send(text_menu[:method][:name], text_menu[:method][:arg]) if text_menu.key?(:method)
    puts text_menu[:list] if text_menu.key?(:list)
    print text_menu[:action] if text_menu.key?(:action)
  end

  def preparing_game
    @deck = Deck.new
    2.times { @player.take_card(@deck) }
    2.times { @dealer.take_card(@deck) }
    @player.money -= 10
    @dealer.money -= 10
    print_module(:start_game)
    player_turn
  end

  def player_win
    @dealer.hand.score > 21 || (@player.hand.score > @dealer.hand.score && @player.hand.score <= 21)
  end

  def dealer_win
    @player.hand.score > 21 || (@dealer.hand.score > @player.hand.score && @dealer.hand.score <= 21)
  end

  def conclude_game
    if player_win
      @player.money += 20
      print_module(:player_win)
    elsif dealer_win
      @dealer.money += 20
      print_module(:dealer_win)
    else
      @player.money += 10
      @dealer.money += 10
      print_module(:draw_game)
    end
    re_game
  end

  def score_print(args)
    dealer_hand = if args == 'conclude_game'
                    '[ ** ], [ ** ].'
                  else
                    "#{@dealer.show_hand} - общий счет #{@dealer.hand.score}."
                  end
    puts "У дилера - #{dealer_hand} В банке: #{@dealer.money}$"
    puts "У игрока - #{@player.show_hand} - общий счет #{@player.hand.score}. В банке: #{@player.money}$"
  end

  def player_turn
    print_module(:player_turn)
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

  def clear_hand
    @player.hand.clear
    @dealer.hand.clear
  end

  def re_game
    if @player.money.zero? || @dealer.money.zero?
      puts 'Игра закончилась, один из банков пуст'
    else
      print_module(:continue_game)
      case gets.chop.to_i
      when 1
        clear_hand
        preparing_game
      when 2
        Kernel.exit
      end
    end
  end
end

game = TextUI.new
game.start
