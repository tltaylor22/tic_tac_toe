class Board

	attr_accessor :ttt_board

	def initialize
		@ttt_board = Array.new(9, '') # an instance variable that can be used at every instance throughout this class
	end

	def update_position(position, marker)
		ttt_board[position] = marker
	end


end