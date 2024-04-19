# frozen_string_literal: true

module TextHelper
  TEXT_UI = {
    welcome: {
      heading: 'Добро пожаловать в игру Blackjack!',
      action: 'Укажите ваше имя: '
    },
    start_game: {
      heading: 'Ставка 10$ c обоих сторон, дилер раздает карты',
      method: {
        name: 'score_print',
        arg: 'conclude_game'
      }
    },
    player_turn: {
      heading: 'Ход игрока, укажите какое действие хотите совершить:',
      list: ['1. Добавить карту', '2. Пропустить ход', '3. Открыть карты'],
      action: 'Ваш выбор: '
    },
    continue_game:
      {
        heading: 'Продолжить игру?',
        list: ['1. Да', '2. Нет'],
        action: 'Ваш выбор: '
      },
    player_win: {
      heading: 'Поздравляю! Игрок победил, добавили на счет 20$!',
      method: {
        name: 'score_print',
        arg: 'end_game'
      }
    },
    dealer_win: {
      heading: 'К сожалению победил дилер, сыграйте еще!',
      method: {
        name: 'score_print',
        arg: 'end_game'
      }
    },
    draw_game: {
      heading: 'Ничья! Вернули на счет дилеру и игроку 10$!',
      method: {
        name: 'score_print',
        arg: 'end_game'
      }
    }
  }.freeze
end
