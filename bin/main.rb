#!/usr/bin/env ruby

require_relative '../lib/game_player'
require_relative '../lib/game_board'
require_relative '../lib/game'
require 'pry'



begin
  game = Game.new
  game.display_instructions
  user_input = gets.chomp
  abort if user_input.downcase == 'q'

  loop do   
    name1, name2 = game.user_name
    player_a = Player.new(name1, 'X', :red)
    player_b = Player.new(name2, 'O', :blue)
    board = Board.new
    current_player = player_a
    game.play(board, current_player, player_a, player_b)

    puts "Press any key to restart the game or q to quit".colorize(:orange)
    user_input = gets.chomp
    abort if user_input.downcase == 'q'   
  end
end

