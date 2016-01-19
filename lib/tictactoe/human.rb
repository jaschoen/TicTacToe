class Human
	 attr_reader :ui, :player_token, :opponent_token

  def initialize(ui, player_token, opponent_token)
    @ui             = ui
    @player_token   = player_token
    @opponent_token = opponent_token
  end
  # boolean validation check
  def valid_input?(input, board)
  	return true if (input.nil? == false && 
  									input =~ /\d/ &&
  									board.valid_move?(input.to_i))
  	false
  end
#=======================Needs Specs=====================================
  # Get move, validate, place it on board
  def move(board)
  	check = false
  	until check
  		input = ui.get_move
      valid_input?(input, board) ? check = true : ui.invalid_input
  	end
    	board.place_piece(input.to_i, player_token)
  end
  
end


