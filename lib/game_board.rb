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

  def update(position, current_player)
    @board[position.to_i - 1] = current_player.character
  end

  def switch_player(player1, player2, current_player)
    current_player == player1 ? player2 : player1
  end

  def win?
    win_combinations = [
      [@board[0], @board[1], @board[2]],
      [@board[3], @board[4], @board[5]],
      [@board[6], @board[7], @board[8]],
      [@board[0], @board[3], @board[6]],
      [@board[1], @board[4], @board[7]],
      [@board[2], @board[5], @board[8]],
      [@board[0], @board[4], @board[8]],
      [@board[2], @board[4], @board[6]]
    ]
    win_combinations.any? do |combination|
      combination.all? { |cells| cells == 'X'.red } || combination.all? { |cells| cells == 'O'.blue }
    end
  end

  def tied?
    @board.all?(String)
  end
end
