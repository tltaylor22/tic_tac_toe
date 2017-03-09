class Unbeatable_AI

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(ttt_board)
		win_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
		
		board_position = [
			[ttt_board[0], ttt_board[1],ttt_board[2]],
			[ttt_board[3], ttt_board[4],ttt_board[5]],
			[ttt_board[6], ttt_board[7],ttt_board[8]],
			[ttt_board[0], ttt_board[3],ttt_board[6]],
			[ttt_board[1], ttt_board[4],ttt_board[7]],
			[ttt_board[2], ttt_board[5],ttt_board[8]],
			[ttt_board[0], ttt_board[4],ttt_board[8]],
			[ttt_board[2], ttt_board[4],ttt_board[6]]
					]

				marker1 = 'X'
				marker2 = 'O'
					# allows the if conditional pass to the elsif conditional starting on line 40
					if marker == marker1
						opponent = marker2
					else
						opponent = marker1
					end

			results = ttt_board.index(' ')

			#win_combo is the iteration through the array of winning arrays. index is the actual index position of the winning array ex. [1][1] would be the second array and the second position in that array based on 0,1,2 counting with arrays.
			board_position.each_with_index do |win_combo, index| 
				
				# p win_combo

				# looking for 2 markers of the same and 1 empty index	
				if win_combo.count(marker) == 2 && win_combo.count(' ') == 1 
					win_pos = win_combo.index(' ')
					results = win_array[index][win_pos]
				elsif win_combo.count(opponent) == 2 && win_combo.count(' ') == 1
					win_pos = win_combo.index(' ')
					results = win_array[index][win_pos]
				else
					results
				end

			end
			results
		end

		def initialize(marker)
		@marker = marker
	end

	def check_fork(ttt_board)
		fork_positions = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
		
		fork_combinations = [
			[ttt_board[0], ttt_board[1],ttt_board[2]],
			[ttt_board[3], ttt_board[4],ttt_board[5]],
			[ttt_board[6], ttt_board[7],ttt_board[8]],
			[ttt_board[0], ttt_board[3],ttt_board[6]],
			[ttt_board[1], ttt_board[4],ttt_board[7]],
			[ttt_board[2], ttt_board[5],ttt_board[8]],
			[ttt_board[0], ttt_board[4],ttt_board[8]],
			[ttt_board[2], ttt_board[4],ttt_board[6]]
					]

		fork_line = []
		fork_spot = []
		i = []
		
		fork_combinations.each_with_index do |forking_line, index|
			if forking_line.count(marker) == 1 && forking_line.count(" ") == 2
				fork_line = forking_line
				i.push(index)
			end
		end

		i.each do |index|
			fork_spot.push(fork_positions[index]) # or fork_spot << fork_position[index]
		end

		fork_spot = fork_spot.flatten.sort

		conditional_array = []
		fork_spot.each do |spot|
			if ttt_board[spot] == " "
				conditional_array.push(spot)
			end
		end
		p conditional_array
		if conditional_array.detect { |match| conditional_array.count(match) > 1 } == nil
			move = 10
		else
			move = conditional_array.detect { |match| conditional_array.count(match) > 1 }
		end
		move
	end
end