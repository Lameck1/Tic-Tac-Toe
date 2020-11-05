require_relative './colorize-0.8.1/lib/colorize'
class Board
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def draw
    puts "|#{@board[0]} | #{@board[1]} | #{@board[2]}|"
    puts '---+--------'
    puts "|#{@board[3]} | #{@board[4]} | #{@board[5]}|"
    puts '---+--------'
    puts "|#{@board[6]} | #{@board[7]} | #{@board[8]}|"
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && !position_taken?(position)
  end

  def position_taken?(position)
    @board[position.to_i - 1].is_a?(String)
  end

  def update(_position, _player_turn, _player_a_c, _player_b_c)
    nil
  end

  def turn(count)
    count.even? ? 'player_b' : 'player_a'
  end

  def win?
    nil
  end

  def tied?
    nil
  end
end
