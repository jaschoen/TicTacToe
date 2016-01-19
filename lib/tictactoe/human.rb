class Human
	 attr_reader :piece, :ui, :player_token, :opponent_token

  def initialize(piece, ui, player_token, opponent_token)
    @piece, @ui, @player_token, @opponent_token = piece, ui, player_token, opponent_token
  end

  def valid_input?(input, board)
  	return true if (input.nil? == false && 
  									input =~ /\d/ &&
  									board.valid_move?(input.to_i))
  	false
  end
#=======================Needs Specs=====================================
  def move(board)
  	check = false
  	until check
  		input = ui.get_move
  		if valid_input?(input, board)
  			check = true 
  		else 
  			ui.invalid_input
  		end
  	end
    	board.place_piece(input.to_i, piece)
  end
  
end


