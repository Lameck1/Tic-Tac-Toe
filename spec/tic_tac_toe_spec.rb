require './lib/game_player'
require './lib/game_board'
require './lib/game'

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

  describe '#update' do
    it "updates the board with current_player's character" do
      subject.update(position, current_player)
      expect(subject.board).to match_array([1, 2, 3, 4, 'X', 6, 7, 8, 9])
    end
  end

  describe '#switch_players' do
    it 'sets current_player to next player' do
      next_player = subject.switch_player(player1, player2, current_player)
      expect(next_player).to eq player2
    end
  end

  describe '#win?' do
    it "returns true if a current_player's input completes a win combination" do
      subject.update('1', current_player)
      subject.update('5', current_player)
      subject.update('9', current_player)
      expect(subject.win?).to eq(true)
    end

    it "returns false if a current_player's input won't complete a win combination" do
      subject.update('1', current_player)
      subject.update('5', current_player)
      subject.update('4', current_player)
      expect(subject.win?).not_to eq(true)
    end
  end

  describe '#tied?' do
    it 'returns true if all cell values are strings but with no win combination' do
      subject.update('1', player1)
      subject.update('9', player2)
      subject.update('4', player1)
      subject.update('7', player2)
      subject.update('5', player1)
      subject.update('6', player2)
      subject.update('3', player1)
      subject.update('2', player2)
      subject.update('8', player1)
      expect(subject.tied?).to eq(true)
    end

    it 'returns false if all cell values are strings but with a win combination' do
      subject.update('1', player1)
      subject.update('2', player2)
      subject.update('5', player1)
      subject.update('7', player2)
      subject.update('9', player1)
      subject.update('3', player2)
      subject.update('2', player1)
      subject.update('8', player2)
      subject.update('4', player1)
      expect(subject.tied?).not_to eq(true)
    end
  end
end
describe Game do
  let(:player_a) { Player.new('Misori', 'X') }
  let(:player_b) { Player.new('Lameck', 'O') }
  let(:current_player) { player_a }
  let(:board) { Board.new }
  let(:position) { '5' }
  describe '#display_banner' do
    it 'displays the banner' do
      banner = "###############\nTIC - TAC - TOE\n###############\n"
      expect { subject.display_banner }.to output(banner).to_stdout
    end
  end

  describe '#display_instructions' do
    it 'instructs the user on how to start or quit game' do
      instruction = "Press the any key to start the game or q to quit the game\n"
      expect { subject.display_instructions }.to output(instruction).to_stdout
    end
  end

  describe '#valid_name?' do
    it 'returns true if user enters a valid name' do
      name = 'Lameck'
      expect(subject.valid_name?(name)).to eq('Lameck')
    end

    it 'returns false if player enters !valid_name?' do
      name = ' Lameck '
      expect(subject.valid_name?(name)).not_to eq('Lameck')
    end
  end

  describe '#display_detail(player_a, player_b)' do
    it 'displays players details' do
      details = /^Player 1: #{player_a.name} | Player 2: #{player_b.name}&/
      expect { subject.display_detail(player_a, player_b) }.to output(details).to_stdout
    end
  end

  describe '#an_outcome?' do
    it 'notifies players of a win' do
      board.update('1', current_player)
      board.update('5', current_player)
      board.update('9', current_player)
      winner = /#{current_player.name} is the WINNER!!!!/
      expect { subject.an_outcome?(board, player_a, player_b, current_player) }.to output(winner).to_stdout
    end

    it 'notifiest players of a draw' do
      board.update('1', player_a)
      board.update('9', player_b)
      board.update('4', player_a)
      board.update('7', player_b)
      board.update('5', player_a)
      board.update('6', player_b)
      board.update('3', player_a)
      board.update('2', player_b)
      board.update('8', player_a)
      alert = /Looks like it is a Tie!!/
      expect { subject.an_outcome?(board, player_a, player_b, current_player) }.to output(alert).to_stdout
    end
  end
end
