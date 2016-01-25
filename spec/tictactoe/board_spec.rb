require 'spec_helper'

describe Board do 
	let(:board) { Board.new }

	describe '#place_piece' do 
		it 'places an X into first space' do 
			board.place_piece(1, "X")
			expect(board.spaces[1]).to eql('X')
		end
	end

	describe '#space_available?' do 
		it 'returns true if space is empty' do 
			expect(board.space_available?(0)).to be_truthy
		end

		it 'returns false if space is occupied' do 
			board.spaces[0] = 'X'
			expect(board.space_available?(0)).to be_falsy
		end
	end

	describe '#valid_move?(space)' do 
		it 'rejects non integers' do 
			expect(board.valid_move?('K')).to be_falsy
		end

		it 'checks if space is taken' do 
			board.spaces[0] = 'X'
			expect(board.valid_move?(0)).to be_falsy
		end
	end

	describe '#available_spaces' do 
		it 'returns array of open spaces' do 
			board.spaces[0]="X"
			board.spaces[1]="O"
			board.spaces[2]="X"			
			board.spaces[3]="O"
			expect(board.available_spaces).to eql([4, 5, 6, 7, 8])
		end
	end
	describe '#winning_combo' do
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
			expect(board.winning_combo).to eql([0, 1, 2])
		end
		# OXO
		# OXO
		# XOX
		it 'returns false if there is no winning combination' do 
			board.spaces=['O', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'X']
			expect(board.winning_combo).to be_falsy
		end
		it 'returns false if the winning combination is all nil' do
			(0..8).each do |index|
				board.spaces[index] = nil
			end
			expect(board.winning_combo).to be_falsy
		end
	end
	describe '#tie' do 
		it 'returns true if all spaces full' do 
			# since winning combo is checked first in execution, 
			# it just needs to return a tie when the board is full
			allow(board).to receive(:available_spaces) {[]}
			expect(board.tie?).to be_truthy
		end
		it 'returns false when there are still spaces available' do 
			allow(board).to receive(:available_spaces).and_return([0])
			expect(board.tie?).to be_falsy
		end
	end
	#================fiddling with these now==========================


end
