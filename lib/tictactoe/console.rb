class Console
	
	def welcome
		puts "Welcome to Tic-tac-toe!"
	end

	def invalid_input
		puts "Invalid input.. please try again."
	end

	def print_board(board)
		formatted_board = []
		(0..8).each do |space|
			if board.spaces[space].nil?
				formatted_board << space 
			else
				formatted_board << board.spaces[space]
			end
		end

		puts " #{formatted_board[0]} | #{formatted_board[1]} | #{formatted_board[2] } "
		puts "==========="
		puts " #{formatted_board[3]} | #{formatted_board[4]} | #{formatted_board[5] } "
		puts "==========="
		puts " #{formatted_board[6]} | #{formatted_board[7]} | #{formatted_board[8] } "
	end

	def turn(player)	
		puts "\nPlayer's turn\n" if player.instance_of? Human
		puts "\nComputers's turn\n" if player.instance_of? Minmax
	end

	def tie
		puts "Tie game, how boring."
		abort
	end

	def won(player)
		puts "You lose, better luck next time."
		abort
	end

	def get_move
		puts "Where would you like to move?"
		gets.chomp
	end


#====================Needs Specs====================================

	def who_goes_first
		puts "Who would you like to go first?"
		puts "1 for you, 2 for the computer\n"
		input = gets.chomp
		invalid_input unless input == "1" || input == "2"
		who_goes_first unless input == "1" || input == "2"
		input
	end

	def player_token
		puts "What symbol would you like to use as your token (1 character please)"
		input = gets.chomp
		invalid_input unless input.length == 1
		player_token unless input.length == 1
		input
	end

	def computer_token
		puts "What symbol would you like to use as the computer token (1 character please)"
		input = gets.chomp
		invalid_input unless input.length == 1
		player_token unless input.length == 1
		input
	end	


end
