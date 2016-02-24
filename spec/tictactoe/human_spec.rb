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

	describe '#move(board)' do 
		it 'places validpiece on board' do 
			allow_any_instance_of(Kernel).to receive(:gets).and_return('2')
			board.spaces = ['J', 'S', nil, nil, nil, nil, nil, 'J', 'S']
			new_board    = ['J', 'S', 'J', nil, nil, nil, nil, 'J', 'S']
			human.move(board)
			expect(board.spaces).to eq(new_board)
		end
		it 'rejects an invalid move' do 
			allow_any_instance_of(Kernel).to receive(:gets).and_return('1', '2')
			allow(ui).to receive(:invalid_input)
			board.spaces = ['J', 'S', nil, nil, nil, nil, nil, 'J', 'S']
			human.move(board)
			expect(ui).to have_received(:invalid_input)
		end
	end


end