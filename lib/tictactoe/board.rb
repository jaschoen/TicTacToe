class Board
	attr_accessor :spaces
  
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


  def initialize_dup(other)
    super(other)
    @spaces = other.spaces.dup
  end

end





