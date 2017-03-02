require_relative 'board.rb'
require_relative 'random_ai.rb'
require_relative 'sequential_ai.rb'

class Console_Game

	attr_accessor :board, :p1, :p2

	def initialize(p1, p2)
		@p1 = p1
		@p2 = p2
		@board = Board.new
	end

	def intro_ttt
		puts 'Welcome to Tic Tac Toe'
	end
	
end