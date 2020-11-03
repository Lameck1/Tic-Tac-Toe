#!/usr/bin/env ruby

def display_instructions
  puts 'This is a tic-tac-toe game'
  puts 'Press the Enter key to start the game'
  puts 'Player 1 is "X" and Player 2 is "O"'
  puts
end

board = [1,2,3,4,5,6,7,8,9]

def dispaly_board(board)
  puts "|#{board[0]} | #{board[1]} | #{board[2]}|"
  puts "-----------"
  puts "|#{board[3]} | #{board[4]} | #{board[5]}|"
  puts '-----------'
  puts "|#{board[6]} | #{board[7]} | #{board[8]}|"
end

def get_user_input
  loop until gets
end


display_instructions
dispaly_board(board)
get_user_input
