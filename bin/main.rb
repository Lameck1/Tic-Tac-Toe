#!/usr/bin/env ruby

require_relative '../lib/game_player'
require_relative '../lib/game_board'

def display_instructions
  puts 'This is a tic-tac-toe game'
  puts 'Press the Enter key to start the game'
  puts 'Player 1 is "X" and Player 2 is "O"'
  puts
end

def get_name
  print "Enter the of player 1: "
  name1 = gets.chomp
  print "Enter the name of second player: "
  name2 = gets.chomp
  puts "#{name1} will be using 'X' and #{name2} will be using 'O'"
  return name1, name2
end

def get_user_input(turn, name1, name2)
  if turn == "player_a"
    print "#{name1}, please enter your position: "
    position = gets.chomp
  else
    print "#{name2}, please enter your position"
    position = gets.chomp
  end
  position
end


display_instructions
name1, name2 = get_name
count = 1
9.times do
  board = Board.new
  board.draw
  position = get_user_input(board.turn(count), name1, name2)
  board.update(position)
  break if board.win? || board.tied?
 count += 1 
end
puts("#{name1} is a winner")
puts("It is a tie")
