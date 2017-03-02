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

	def display_board
		puts " #{board.ttt_board[0]} | #{board.ttt_board[1]} | #{board.ttt_board[2]} "
	 	puts "--------"
	 	puts " #{board.ttt_board[3]} | #{board.ttt_board[4]} | #{board.ttt_board[5]} "
	 	puts "--------"
	 	puts " #{board.ttt_board[6]} | #{board.ttt_board[7]} | #{board.ttt_board[8]} "
	end


end