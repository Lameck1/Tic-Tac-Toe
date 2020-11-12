require '../lib/game_player'
require '../lib/game_board'
require '../lib/game'

describe Player do
  let(:player) { Player.new('Misori', 'X') }
  describe 'attributes' do
    it 'initializes the player' do
      expect(player.name).to eq('Misori')
    end

    it 'allows assigning of player character' do
      expect(player.character).to eq('X')
    end
  end
end

describe Board do
  let(:position) { '5' }
  let(:player1) { Player.new('Misori', 'X') }
  let(:player2) { Player.new('Lameck', 'O') }
  let(:current_player) { player1 }
  let(:board_array) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
  describe 'attributes' do
    it 'initializes the board' do
      expect(subject.board).to match_array(board_array)
    end
  end
  describe '#draw' do
    it 'draws the board' do
      board = "|1 | 2 | 3|\n---+---+---\n|4 | 5 | 6|\n---+---+---\n|7 | 8 | 9|\n"
      expect { subject.draw }.to output(board).to_stdout
    end
  end

  describe '#valid_move?' do
    it 'returns true if move is a value between (1..9) and !position_taken?' do
      expect(subject.valid_move?(position)).to eq(true)
    end

    it 'returns false if position_taken?' do
      first_move = '5'
      subject.update(first_move, current_player)
      next_move = '5'
      expect(subject.valid_move?(next_move)).not_to eq(true)
    end

    it 'returns false if move is not between (1..9)' do
      move_value = '11'
      expect(subject.valid_move?(move_value)).not_to eq(true)
    end
  end

  describe '#position_taken?' do
    it 'returns true if player selects a cell with a String value' do
      subject.update(position, current_player)
      expect(subject.position_taken?(position)).to eq(true)
    end

    it 'returns false if player selects a cell with an Integer value' do
      new_position = '6'
      expect(subject.position_taken?(new_position)).not_to eq(true)
    end
  end
end
