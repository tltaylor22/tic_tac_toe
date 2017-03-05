	def update_position
		move = get_move
		marker = active_player.marker
		board.update_position(move, marker)
	end

	def get_move(update_position)
		board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
		display_board(board)
		puts 'Enter 0-8 to choose your square'
		move = gets.chomp.to_i # "gets" player input  "chomps" off the newline and converts input to an integer
	end