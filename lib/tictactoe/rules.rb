class Rules


 TICTACTOE_WINS = [
    # Horizontal wins:
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    # Vertical wins:
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    # Diagonal wins:
    [0, 4, 8], [2, 4, 6]
  ]

  # Return winning combo if are all the same, and not nil, else return false
  def winning_combo(board)
    combo = TICTACTOE_WINS.each do |combo|
      if board.spaces[combo[0]] == board.spaces[combo[1]] && 
         board.spaces[combo[1]] == board.spaces[combo[2]]
         return combo unless board.spaces[combo[0]].nil?
      end
    end
    false
  end
  # If there is a winning combination, return the piece of the winner if not return false
  def winner(board)
    combo = winning_combo(board)
    combo ? board.spaces[combo[0]] : false
  end
  # returns true if game is all spaces have been played and no winner
  def tie?(board)
    board.available_spaces.empty? && !winner(board)
  end

end