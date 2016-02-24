class Minmax

	attr_reader :best_choice, :ui, :player_token, :opponent_token, :rules

  def initialize(ui, opponent_token, player_token, rules)
    @ui             = ui
    @player_token   = player_token
    @opponent_token = opponent_token
    @rules          = rules
  end

  def move(board)
    minmax(board, player_token)
    board.place_piece(best_choice, player_token)
  end

  def game_over?(board)
    rules.winner(board) || rules.tie?(board)
  end

  def switch(piece)
    piece == player_token ? opponent_token : player_token
  end

  def score(board)
    if rules.winner(board) == player_token
      return 10
    elsif rules.winner(board) == @opponent_token
      return -10
    end
    0
  end

  def best_move(piece, scores)
    if piece == @player_token
      scores.max_by { |key, value| value }
    else
      scores.min_by { |key, value| value }
    end
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


end