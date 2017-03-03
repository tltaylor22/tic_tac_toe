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
# take a look at ur check_winner function in the _console.rb. We were only passing in the active player but it needs to check both players for a win. So instead of only passing in the active player, doing an if and an elsif statement for both the player 1 marker and player 2 marker fixed my problem. 
	def check_winner
		if board.winner?(p1.marker)
			true
		elsif board.winner?(p2.marker)
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