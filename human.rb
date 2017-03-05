require_relative 'console_game.rb'

class Human

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

# I have to initially show the board to the player to know position and pass through the current board after each move
	# def get_move(update_position)
	# 	board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
	# 	display_board(board)
	# 	puts 'Enter 0-8 to choose your square'
	# 	move = gets.chomp.to_i # "gets" player input  "chomps" off the newline and converts input to an integer
	# end

	def get_move(update_position)
		puts 'Enter 0-8 to choose your square'
		puts " 0 | 1 | 2 "
		puts "-----------"
		puts " 3 | 4 | 5 "
		puts "-----------"
		puts " 6 | 7 | 8 "

		move = gets.chomp.to_i # "gets" player input  "chomps" off the newline and converts input to an integer
	end

end