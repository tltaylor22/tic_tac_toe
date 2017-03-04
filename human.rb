require_relative 'console_game.rb'

class Human

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

# I have to initially show the board to the player to know position and pass through the current board after each move
	def get_move()
		board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
		display_board(board)
		print 'Enter 0-8 to choose your square'
		move = gets.chomp.to_i
	end

end