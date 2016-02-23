class Console
	
	def welcome
		puts "Welcome to Tic-tac-toe!"
	end

	def invalid_input
		puts "Invalid input.. please try again."
	end
	# Convert open board spaces to array, print to STDOUT resulting formatted board
	def print_board(board)
		formatted_board = []
		size = Rules.size
		(0..(size**2-1)).each do |space|
			if board.spaces[space].nil?
				formatted_board << space 
			else
				formatted_board << board.spaces[space]
			end
		end
		# puts " #{formatted_board[0]} | #{formatted_board[1]} | #{formatted_board[2] } "
		# puts "==========="
		# puts " #{formatted_board[3]} | #{formatted_board[4]} | #{formatted_board[5] } "
		# puts "==========="
		# puts " #{formatted_board[6]} | #{formatted_board[7]} | #{formatted_board[8] } "

		string_board = ""
		i = 0
		(size**2).times do 
			string_board << " #{formatted_board[i]} "
			if i == 0
				string_board << "|"
				i +=1
				next
			elsif i + 1 == size**2
				next					
			elsif (i+1) % size == 0 
			 string_board << "\n" + "===="*(size-1)+"===" + "\n" 
			 i +=1
			else
			 string_board << "|"
			 i += 1
			end
			
		end
		puts string_board
	end




	# Print who's turn it is
	def turn(player)	
		puts "\nPlayer's turn\n" if player.instance_of? Human
		puts "\nComputers's turn\n" if player.instance_of? Minmax
	end
	# Print tie game and exit
	def tie
		puts "Tie game, how boring."
		abort
	end
	# Unbeatable, so only computer victory output possible
	def won(player)
		puts "Skynet wins! Sorry, Meat-bag."
		abort
	end
	# Prompt player for move
	def get_move
		puts "Where would you like to move?"
		gets.chomp
	end
#====================Needs Specs====================================
	# Prompt and return who goes first
	def who_goes_first
		puts "Who would you like to go first?"
		puts "1 for you, 2 for the computer\n"
		input = gets.chomp
		invalid_input unless input == "1" || input == "2"
		who_goes_first unless input == "1" || input == "2"
		input
	end
	# Prompt and return player token
	def player_token
		puts "What symbol would you like to use as your token (1 character please)"
		input = gets.chomp
		invalid_input unless input.length == 1
		player_token unless input.length == 1
		input
	end
	# Prompt and return computer token
	def computer_token
		puts "What symbol would you like to use as the computer token (1 character please)"
		input = gets.chomp
		invalid_input unless input.length == 1
		player_token unless input.length == 1
		input
	end	


end
