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

end
