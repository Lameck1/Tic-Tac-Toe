#!/usr/bin/env ruby

require_relative '../lib/game_player'
require_relative '../lib/game_board'

def display_instructions
  puts 'This is a tic-tac-toe game'
  puts 'Press the Enter key to start the game'
  puts 'Player 1 is "X" and Player 2 is "O"'
  puts
end

def get_user_input(board)
  print "\n#{@current_player}, please pick your position: "
  position = gets.chomp

  until board.valid_move?(position)
    (puts "\nPosition taken \"#{@current_player}\", try again: ")
    position = gets.chomp
  end
  position
end

loop do
  board = Board.new
  display_instructions
  board.draw
  position = get_user_input(board)
  board.update(position)
  break if win? || tied?
end
