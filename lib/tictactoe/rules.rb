class Rules

  # TICTACTOE_WINS = [
  #   # Horizontal wins:
  #   [0, 1, 2], [3, 4, 5], [6, 7, 8],
  #   # Vertical wins:
  #   [0, 3, 6], [1, 4, 7], [2, 5, 8],
  #   # Diagonal wins:
  #   [0, 4, 8], [2, 4, 6]
  # ]

    TICTACTOE_WINS = [
    # Horizontal wins:
    [0, 1, 2, 3],   [4, 5, 6, 7],  [8, 9, 10, 11], [12, 13, 14, 15],
    # Vertical wins:
    [0, 4, 8, 12],  [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15],
    # Diagonal wins:
    [0, 5, 10, 15], [3, 6, 9, 12]
  ]
  # 0  1  2  3  
  # 4  5  6  7
  # 8  9  10 11
  # 12 13 14 15
  

  # def possible_wins(size)
  #   horizontal_wins_array = []
  #   all_hoz_wins = []
  #   size.times do |i|
  #     (((i-1)*size)..(i*(size-i))).each do |n|
  #       horizontal_wins_array << n
  #     end
  #     all_hoz_wins << horizontal_wins_array
  #   end
  #   all_hoz_wins
  # end



    # 0*size..1*size -1
    # 1xsize..2*size -1
    # 2xsize..3*size -1

  def self.size
    4
  end

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