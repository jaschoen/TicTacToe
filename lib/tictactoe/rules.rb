class Rules

  TICTACTOE_WINS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def self.size
    3
  end

  def winning_combo(board)
    combo = TICTACTOE_WINS.each do |combo|
      if board.spaces[combo[0]] == board.spaces[combo[1]] && 
         board.spaces[combo[1]] == board.spaces[combo[2]]
         return combo unless board.spaces[combo[0]].nil?
      end
    end
    false
  end

  def winner(board)
    combo = winning_combo(board)
    combo ? board.spaces[combo[0]] : false
  end

  def tie?(board)
    board.available_spaces.empty? && !winner(board)
  end

end