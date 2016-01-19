require_relative 'board'
# require_relative 'player'


class Minmax

	attr_reader :best_choice, :ui, :player_token, :opponent_token



#========================Needs Specs=======================================
  def initialize(ui, opponent_token, player_token)
    @ui             = ui
    @player_token   = player_token
    @opponent_token = opponent_token
  end

  # Get best move and place piece
	def move(board)
		minmax(board, player_token)
		board.place_piece(best_choice, player_token)
	end
	# This is the tricky part
	def minmax(board, current_player)
		# If the game is over, return the highest score
		return score(board) if game_over?(board)
		# Hash to hold scores of possible moves
		scores = {}
		# Duplicate board, place piece in each space, set scores hash to next level of min max
		board.available_spaces.each do |space|
			potential_board = board.dup
			potential_board.place_piece(space, current_player)
			scores[space] = minmax(potential_board, switch(current_player))
		end

		@best_choice, best_score = best_move(current_player, scores)
		best_score
	end
	# Checks if game is over
	def game_over?(board)
		board.winner || board.tie?
	end
	# Takes current piece, scores hash, returns min or max value depending on who's turn it is
  def best_move(piece, scores)
    if piece == @player_token
      scores.max_by { |key, value| value }
    else
      scores.min_by { |key, value| value }
    end
  end
  # Final score, 10 for win, -10 for loss, 0 for tie
  def score(board)
    if board.winner == player_token
      return 10
    elsif board.winner == @opponent_token
      return -10
    end
    0
  end
  #switches active player token
	def switch(piece)
		piece == player_token ? opponent_token : player_token
	end
end