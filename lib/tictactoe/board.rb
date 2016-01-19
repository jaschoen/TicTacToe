class Board
	attr_accessor :spaces
	 TICTACTOE_WINS = [
      # Horizontal wins:
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      # Vertical wins:
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      # Diagonal wins:
      [0, 4, 8], [2, 4, 6]
    ]
  # Initialize with empty array
	def initialize
		@spaces = Array.new(9)
	end
	# Place piece on board
	def place_piece(space, piece)
		spaces[space] = piece
	end
	# Check if space is available
	def space_available?(space)
		spaces[space] == nil
	end
	# Check if move is valid
	def valid_move?(space)
		(0..8).include?(space) && space_available?(space) 
	end
	# return array of available spaces
	def available_spaces
		open = []
		(0..8).each do |space|
			open << space if space_available?(space)
		end
		open
	end





# =======================Needs Specs====================================
	# Return winning combo if are all the same, and not nil, else return false
	def winning_combo
		combo = TICTACTOE_WINS.each do |combo|
			if spaces[combo[0]] == spaces[combo[1]] &&
				 spaces[combo[1]] == spaces[combo[2]]
				 return combo unless spaces[combo[0]].nil?
			end
		end
		false
	end
	# If there is a winning combination, 
	def winner
		combo = winning_combo
		combo ? spaces[combo[0]] : false
	end

	def tie?
		available_spaces.empty?
	end

  def initialize_dup(other)
    super(other)
    @spaces = other.spaces.dup
  end

end





