#!/usr/bin/env ruby

require_relative '../lib/game_player'
require_relative '../lib/game_board'

def display_banner
  puts "
████████╗██╗░█████╗░░░░░░░████████╗░█████╗░░█████╗░░░░░░░████████╗░█████╗░███████╗
╚══██╔══╝██║██╔══██╗░░░░░░╚══██╔══╝██╔══██╗██╔══██╗░░░░░░╚══██╔══╝██╔══██╗██╔════╝
░░░██║░░░██║██║░░╚═╝█████╗░░░██║░░░███████║██║░░╚═╝█████╗░░░██║░░░██║░░██║█████╗░░
░░░██║░░░██║██║░░██╗╚════╝░░░██║░░░██╔══██║██║░░██╗╚════╝░░░██║░░░██║░░██║██╔══╝░░
░░░██║░░░██║╚█████╔╝░░░░░░░░░██║░░░██║░░██║╚█████╔╝░░░░░░░░░██║░░░╚█████╔╝███████╗
░░░╚═╝░░░╚═╝░╚════╝░░░░░░░░░░╚═╝░░░╚═╝░░╚═╝░╚════╝░░░░░░░░░░╚═╝░░░░╚════╝░╚══════╝
    ".colorize(:red)
end

def display_instructions
  system('clear')
  display_banner
  puts 'Press the any key to start the game or q to quit the game'.colorize(:orange)
end

def draw_board(board)
  puts "|#{board[0]} | #{board[1]} | #{board[2]}|"
  puts '---+--------'
  puts "|#{board[3]} | #{board[4]} | #{board[5]}|"
  puts '---+--------'
  puts "|#{board[6]} | #{board[7]} | #{board[8]}|"
end

def valid_name?(name)
  loop do
    break unless name.strip == ''

    print "Name can't be blank, please enter the name again: "
    name = gets.chomp
  end
  name
end

def user_name
  print 'Enter the name of first player: '
  name1 = gets.chomp
  name1 = valid_name?(name1)
  print 'Enter the name of second player: '
  name2 = gets.chomp
  name2 = valid_name?(name2)
  puts "#{name1} will be using 'X' and #{name2} will be using 'O'"
  [name1.upcase, name2.upcase]
end

def get_user_input(current_player)
  print "#{current_player.name}, please pick your position:  "
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

def display_detail(player_a, player_b)
  system('clear')
  display_banner
  print "Player 1: #{player_a.name} | Player 2: #{player_b.name}"
  puts ' '
end

display_instructions
user_input = gets.chomp
abort if user_input.downcase == 'q'
loop do
  name1, name2 = user_name
  player_a = Player.new(name1, 'X', :red)
  player_b = Player.new(name2, 'O', :blue)
  board = Board.new
  current_player = player_a
  loop do
    display_detail(player_a, player_b)
    draw_board(board.board)
    position = get_user_input(current_player)
    validated_position = validate_input(board, position)
    board.update(validated_position, current_player)
    system('clear')
    if board.win?
      display_detail(player_a, player_b)
      draw_board(board.board)
      puts "#{current_player.name} is the WINNER!!!!".colorize(:yellow)
      break
    elsif board.tied?
      draw_board(board.board)
      puts 'Looks like it is a Tie!!'.colorize(:green)
      break
    end
    current_player = board.switch_player(player_a, player_b, current_player)
  end

  puts 'Press any key to restart the game or q to quit'.colorize(:orange)
  user_input = gets.chomp
  abort if user_input.downcase == 'q'
end
