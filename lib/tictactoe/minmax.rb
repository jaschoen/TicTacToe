require_relative 'board'
# require_relative 'player'


class Minmax

	attr_reader :best_choice, :ui, :piece, :player_token, :opponent_token



#========================Needs Specs=======================================
  def initialize(piece, ui, player_token, opponent_token)
    @piece, @ui     = piece, ui
    @opponent       = switch(piece)
    @player_token   = player_token
    @opponent_token = opponent_token

  end

	def move(board)
		minmax(board, piece)
		board.place_piece(best_choice, piece)
	end

	def minmax(board, current_player)
		return score(board) if game_over?(board)

		scores = {}

		board.available_spaces.each do |space|
			potential_board = board.dup
			potential_board.place_piece(space, current_player)

			scores[space] = minmax(potential_board, switch(current_player))
		end

		@best_choice, best_score = best_move(current_player, scores)
		best_score
	end

	def game_over?(board)
		board.winner || board.tie?
	end

  def best_move(piece, scores)
    if piece == @piece
      scores.max_by { |k, v| v }
    else
      scores.min_by { |k, v| v }
    end
  end

  def score(board)
    if board.winner == piece
      return 10
    elsif board.winner == @opponent
      return -10
    end
    0
  end

	def switch(piece)
		piece == 'X' ? 'O' : 'X'
	end
end