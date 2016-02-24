require 'spec_helper'

describe Console do 
	let(:console) { Console.new }
	
	describe '#welcome' do 
		it 'sends a welcome message' do 
			expect {console.welcome}.to output("Welcome to Tic-tac-toe!\n").to_stdout
		end
	end

	describe '#invalid_input' do 
		it 'tells user to try again' do 
			expect {console.invalid_input}.to output("Invalid input.. please try again.\n").to_stdout
		end
	end

	describe '#print_board' do 
		let(:board) { Board.new(3) }

		context 'when board is empty' do
			it 'prints a blank board' do 
				blank_board = " 0 | 1 | 2 \n" +
							        "===========\n" +
							        " 3 | 4 | 5 \n" +
							        "===========\n" +
							        " 6 | 7 | 8 \n" 

				expect {console.print_board(board)}.to output(blank_board).to_stdout
			end
		end

		context 'when board is half full' do 
			it 'prints the half full board' do
				board.spaces[0] = 'X'
				board.spaces[2] = 'X'
				board.spaces[7] = 'X'
				board.spaces[1] = 'O'
				board.spaces[4] = 'O'
				half_board =  " X | O | X \n" +
							        "===========\n" +
							        " 3 | O | 5 \n" +
							        "===========\n" +
							        " 6 | X | 8 \n"
				expect {console.print_board(board)}.to output(half_board).to_stdout
			end
		end
	end

	describe '#turn' do 
		it 'prints players turn' do 
			player = Human.new(Console.new, "J", "S")
			expect {console.turn(player)}.to output("\nPlayer's turn\n").to_stdout
		end
	end

	describe '#prompt_who_goes_first' do 
		it 'prompts who goes first' do 
			prompt = "Who would you like to go first?\n1 for you, 2 for the computer\n"
			expect {console.prompt_who_goes_first}.to output(prompt).to_stdout
		end
	end
	
	describe '#get_who_goes_first' do 
		it 'returns 1 if you enter 1' do
			allow_any_instance_of(Kernel).to receive(:gets).and_return('1')
			expect(console.get_who_goes_first).to eq('1')
		end
	end

	describe '#prompt_player_token' do
		it 'prompts player for a token' do 
			prompt = "What symbol would you like to use as your token (1 character please)\n"
			allow_any_instance_of(Kernel).to receive(:gets).and_return('1')
			expect {console.prompt_player_token}.to output(prompt).to_stdout
		end
	end
	describe '#prompt_computer_token' do 
		it 'prompts user to input a token' do 
			prompt = "What symbol would you like to use as the computer token (1 character please)\n"
			expect {console.prompt_computer_token}.to output(prompt).to_stdout
		end
	end
	describe '#get_token' do 
		it 'calls invalid input for multi character inputs' do
			allow_any_instance_of(Kernel).to receive(:gets).and_return('XX', 'X')
			allow(console).to receive(:invalid_input)
			console.get_token
			expect(console).to have_received(:invalid_input)
		end
	end

end



