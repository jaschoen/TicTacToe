require 'spec_helper'

describe Human do 
	
	let(:board) {Board.new}
	let(:ui)    {Console.new}
	let(:human) {Human.new('X', ui, "J", "S")}

	describe '#move(board)' do 
		# board.spaces[0] = 'X'
		it 'should prompt user for input' do 
			pending 'how do I check a chomp statement?'
			expect {human.move}.to output("Where would you like to move?\n").to_stdout
		end
		# it 'should place the piece on the board' do 
			# pending 'how do I fake input?' 
			# allow(die).to receive(:roll) { 3 }
			# human.move(board)
			# expect(board.spaces[0]).to eql('X')
		# end 
	end

	describe '#valid_input?' do 
		it 'should return false if input is empty' do 
			input = nil
			expect(human.valid_input?(input, board)).to be_falsy
		end
		it 'should return false if move is not valid move' do 
			board.spaces = ['X', 'X', nil, nil, nil, nil, nil, 'O', 'O']
			input = "0"
			expect(human.valid_input?(input, board)).to be_falsy
		end
		it 'should return true if move is valid' do 
			board.spaces = ['X', 'X', nil, nil, nil, nil, nil, 'O', 'O']
			input = "2"
			expect(human.valid_input?(input, board)).to be_truthy			
		end
	end


end