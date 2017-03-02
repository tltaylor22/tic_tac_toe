require_relative 'board.rb'
require_relative 'random_ai.rb'
require_relative 'sequential_ai.rb'

class Console_Game

	attr_accessor :board, :p1, :p2, :active_player

	def initialize(p1, p2)
		@p1 = p1
		@p2 = p2
		@board = Board.new
		@active_player = p2
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
	 	puts '          '
	 	puts ''
	end

	def get_move
		active_player.get_move(board.ttt_board)
	end

	def update_position
		move = get_move
		marker = active_player.marker
		board.update_position(move, marker)
	end

	def change_player
		if active_player == p2
			@active_player = p1
		else
			@active_player = p2
		end
		active_player
	end

	def check_winner
		if board.winner?(active_player.marker)
			true
		else
			false
		end
	end

	def check_tie
		if board.full_board?()
			true
		else
			false
		end

	end


end