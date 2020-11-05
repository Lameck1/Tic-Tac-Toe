#!/usr/bin/env ruby

require_relative '../lib/game_player'
require_relative '../lib/game_board'

def display_instructions
  puts 'This is a tic-tac-toe game'
  puts 'Press the Enter key to start the game'
  gets
end

def draw(board)
  puts "|#{board[0]} | #{board[1]} | #{board[2]}|"
  puts '---+--------'
  puts "|#{board[3]} | #{board[4]} | #{board[5]}|"
  puts '---+--------'
  puts "|#{board[6]} | #{board[7]} | #{board[8]}|"
end

def user_name
  print 'Enter the name of first player: '
  name1 = gets.chomp
  print 'Enter the name of second player: '
  name2 = gets.chomp
  puts "#{name1} will be using 'X' and #{name2} will be using 'O'"
  [name1, name2]
end

def get_user_input(turn, name1, name2)
  if turn == 'player_a'
    print "#{name1.upcase}, please enter your position: "
  else
    print "#{name2.upcase}, please enter your position: "
  end
  gets.chomp
end

def validate_input(board, position)
  until board.valid_move?(position)
    puts 'InputError: Please enter select the cell between 1 and 9: ' unless position.to_i.between?(1, 9)
    puts 'InputError: Please select cell that is not taken (refer to cell labels)' if board.position_taken?(position)
    print 'Please enter the value again: '
    position = gets.chomp
  end
  position
end

display_instructions
name1, name2 = user_name
player_a = Player.new(name1, 'X')
player_b = Player.new(name2, 'O')
board = Board.new
loop_counter = 1
loop do
  draw(board.board)
  player_turn = board.turn(loop_counter)
  position = get_user_input(player_turn, name1, name2)
  validated_position = validate_input(board, position)
  board.update(validated_position, player_turn, player_a.character, player_b.character)
  break if board.win? || board.tied?

  loop_counter += 1
end
puts("#{name1} is a winner")
puts('It is a tie')
