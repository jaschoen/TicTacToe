class Board
	attr_accessor :spaces, :size
  
  # Initialize with empty array
	def initialize(size)
		@spaces = Array.new(size**2)
		@size   = size
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
		(0..(size**2-1)).include?(space) && space_available?(space) 
	end
	# return array of available spaces
	def available_spaces
		open = []
		(0..(size**2-1)).each do |space|
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





