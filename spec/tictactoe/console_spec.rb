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
		let(:board) { Board.new }

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




end



