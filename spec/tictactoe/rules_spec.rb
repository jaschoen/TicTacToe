require 'spec_helper'

describe Rules do 
  let(:rules) { Rules.new }
  let(:board) { Board.new(3) }

  describe '#winning_combo(board)' do
       TICTACTOE_WINS = [
      # Horizontal wins:
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      # Vertical wins:
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      # Diagonal wins:
      [0, 4, 8], [2, 4, 6]
      ]
    it 'returns the winning combination if there is one' do 
      board.spaces[0]='X'
      board.spaces[1]='X'
      board.spaces[2]='X'
      expect(rules.winning_combo(board)).to eql([0, 1, 2])
    end

    it 'returns false if there is no winning combination' do 
      board.spaces=['O', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'X']
      expect(rules.winning_combo(board)).to be_falsy
    end
    it 'returns false if the winning combination is all nil' do
      (0..8).each do |index|
        board.spaces[index] = nil
      end
      expect(rules.winning_combo(board)).to be_falsy
    end
  end
  describe '#tie' do 
    it 'returns true if all spaces full' do 
      # since winning combo is checked first in execution, 
      # it just needs to return a tie when the board is full
      allow(board).to receive(:available_spaces) {[]}
      expect(rules.tie?(board)).to be_truthy
    end
    it 'returns false when there are still spaces available' do 
      allow(board).to receive(:available_spaces).and_return([0])
      expect(rules.tie?(board)).to be_falsy
    end
  end
  describe '#self.size' do
    it 'returns size of board, 3' do 
      expect(Rules.size).to eq(3)
    end
  end

end
