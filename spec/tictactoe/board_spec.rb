require 'spec_helper'

describe Board do 
	let(:board) { Board.new(3) }

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

	describe '#initialize_dup(board)' do 
		it 'duplicates spaces as well when board is duped' do 
			board.spaces = [0, 1, 2, 3, 4, 5, 6, 7, 8]
			new_board = board.dup
			expect(new_board.spaces).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
		end
	end

	


end
