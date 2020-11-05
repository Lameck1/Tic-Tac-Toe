class Board
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def valid_move?(_position)
    nil
  end

  def position_taken?(_position)
    nil
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
