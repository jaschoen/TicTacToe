class Board
	attr_accessor :spaces, :size
  
	def initialize(size)
		@spaces = Array.new(size**2)
		@size   = size
	end

	def place_piece(space, piece)
		spaces[space] = piece
	end

	def space_available?(space)
		spaces[space] == nil
	end

	def valid_move?(space)
		(0..(size**2-1)).include?(space) && space_available?(space) 
	end

	def available_spaces
		open = []
		(0..(size**2-1)).each do |space|
			open << space if space_available?(space)
		end
		open
	end

  def initialize_dup(board)
    @spaces = board.spaces.dup
  end

end





