require 'spec_helper'

describe Human do 
	
	let(:board) {Board.new(3)}
	let(:ui)    {Console.new}
	let(:human) {Human.new(ui, "J", "S")}

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