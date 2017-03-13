require_relative 'board.rb'
require_relative 'sequential_ai.rb'  
require_relative 'random_ai.rb'
require_relative 'human.rb'
require_relative 'unbeatable_ai.rb'

class Console_Game

	attr_accessor :board, :p1, :p2, :active_player, :move, :player1input, :player2input

	def initialize()
		@p1 = choose_p1
		@p2 = choose_p2
		@board = Board.new
		@active_player = p1
	end

	def intro_ttt
		puts 'Welcome to Tic-Tac-Toe'
	end

	def display_board
		if check_winner == true || board.full_board?
			puts "Game Over"
		else
			puts "It's #{active_player.marker}'s turn."
		end
	 	

		puts " #{board.ttt_board[0]} | #{board.ttt_board[1]} | #{board.ttt_board[2]} "
	 	puts "-----------"
	 	puts " #{board.ttt_board[3]} | #{board.ttt_board[4]} | #{board.ttt_board[5]} "
	 	puts "-----------"
	 	puts " #{board.ttt_board[6]} | #{board.ttt_board[7]} | #{board.ttt_board[8]} "
	 	puts "               "

	end

	def get_move
		@move = active_player.get_move(board.ttt_board)
	end

	def update_position
		marker = active_player.marker
		if board.valid_position?(@move)
			board.update_position(@move, marker)
		else
			puts "Invalid move, please choose again."
			get_move
		end
	end

	def change_player
		if active_player == p1
			@active_player = p2
		else
			@active_player = p1
		end
		# active_player
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
		if board.full_board?
			true
		else
			false
		end
		
	end

	def choose_p1
		puts "Select player X by entering 1-3. Human = 1; Random_Computer = 2; Sequential_Computer = 3; Unbeatable_Computer = 4"
		@player1input = gets.chomp.to_i

			if player1input == 1
				@p1 = Human.new('X')
			elsif player1input == 2
				@p1 = Random_AI.new('X')
			elsif player1input == 3
				@p1 = Sequential_AI.new('X')
			elsif player1input == 4
				@p1 = Unbeatable_AI.new('X')
			else
				puts "Oops, please select 1, 2, 3, or 4."
				choose_p1
			end
	end

	def choose_p2
		puts "Select player O by entering 1-3. Human = 1; Random_Computer = 2; Sequential_Computer= 3"
		@player2input = gets.chomp.to_i

			if player2input == 1
				@p2 = Human.new('O')
			elsif player2input == 2
				@p2 = Random_AI.new('O')
			elsif player2input == 3
				@p2 = Sequential_AI.new('O')
			elsif player2input == 4
				@p2 = Unbeatable_AI.new('O')
			else
				puts "Oops, please select 1, 2, 3, or 4."
				choose_p2
			end
	end
					
					


end