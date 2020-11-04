class Board
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def draw
    puts "|#{board[0]} | #{board[1]} | #{board[2]}|"
    puts '-----------'
    puts "|#{board[3]} | #{board[4]} | #{board[5]}|"
    puts '-----------'
    puts "|#{board[6]} | #{board[7]} | #{board[8]}|"
  end

  def valid_move?(_position)
    nil
  end

  def update(_input)
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
