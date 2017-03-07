require_relative 'console_game.rb'

class Human

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

def get_move(update_position)
		puts 'Enter 1-9 to choose your square'
		puts " 1 | 2 | 3 "
		puts "-----------"
		puts " 4 | 5 | 6 "
		puts "-----------"
		puts " 7 | 8 | 9 "

		move = gets.chomp.to_i - 1 # "gets" player input  "chomps" off the newline, converts input to an integer, and subtracts 1 to align the 1-9 board with the 0-8 array.
	end

end