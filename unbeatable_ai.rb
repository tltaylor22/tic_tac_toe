class Unbeatable_AI

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

def get_move(ttt_board)

		move = 50

		if get_win(ttt_board) <= 8
			move = get_win(ttt_board)

		elsif block(ttt_board) <= 8
			move = block(ttt_board)

		elsif check_fork(ttt_board) <= 8
			move = check_fork(ttt_board)

		elsif block_fork(ttt_board) <= 8
			move = block_fork(ttt_board)

		elsif take_center(ttt_board) <= 8
			move = take_center(ttt_board)

		elsif opposite_corner(ttt_board) <= 8
			move = opposite_corner(ttt_board)

		elsif empty_corner(ttt_board) <= 8
			move = empty_corner(ttt_board)

		else empty_side(ttt_board)
			move = empty_side(ttt_board)
		end

		move

	end

	def get_win(ttt_board)
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

		move = 10
		
		board_position.each_with_index do |val, pos|

			if val.count(marker) == 2 && val.count(' ') == 1
				results = val.index(' ')
				move = win_array[pos][results]
			else
				move
			end
		end
		move
	end			

	def block(ttt_board)

		opponent = 'X'

		if marker == 'X'
			opponent = 'O'
		else
			opponent = 'X'
		end

		board_position = [
			[ttt_board[0], ttt_board[1], ttt_board[2]],
			[ttt_board[3], ttt_board[4], ttt_board[5]],
			[ttt_board[6], ttt_board[7], ttt_board[8]],
			[ttt_board[0], ttt_board[3], ttt_board[6]],
			[ttt_board[1], ttt_board[4], ttt_board[7]],
			[ttt_board[2], ttt_board[5], ttt_board[8]],
			[ttt_board[0], ttt_board[4], ttt_board[8]],
			[ttt_board[2], ttt_board[4], ttt_board[6]]
			
		]

		win_array = [
			[0, 1, 2],
			[3, 4, 5],
			[6, 7, 8],
			[0, 3, 6],
			[1, 4, 7],
			[2, 5, 8],
			[0, 4, 8],
			[2, 4, 6]
		]

		move = 10

		board_position.each_with_index do |val, pos|

			if
				val.count(opponent) == 2 && val.count(' ') == 1
				results = val.index(' ')
				move = win_array[pos][results]
			else
				move
			end
		end
		move

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
		# p conditional_array
		if conditional_array.detect { |match| conditional_array.count(match) > 1 } == nil
			move = 10
		else
			move = conditional_array.detect { |match| conditional_array.count(match) > 1 }
		end
		move
	end

	def block_fork(ttt_board)
		
		opponent = 'X'
		if marker == 'X'
			opponent = 'O'
		else
			opponent = 'X'
		end

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

		# fork_line = []
		fork_spot = []
		i = []
		
		fork_combinations.each_with_index do |forking_line, index|
			if forking_line.count(opponent) == 1 && forking_line.count(" ") == 2
				# fork_line = forking_line
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
		# p conditional_array
		if conditional_array.detect { |match| conditional_array.count(match) > 1 } == nil
			move = 10
		else
			move = conditional_array.detect { |match| conditional_array.count(match) > 1 }
		end
		move
	end

	def take_center(ttt_board)
		if ttt_board[4] == " "
			move = 4
		else
			move = 10
		end
	end

	def opposite_corner(ttt_board)

		# Re-using opponent too much, can probably initialize this.

		opponent = 'X'

		if marker == 'X'
			opponent = 'O'
		else
			opponent = 'X'
		end

		if ttt_board[0] == opponent && ttt_board[8] == " "
			move = 8

		elsif ttt_board[2] == opponent && ttt_board[6] == " "
			move = 6

		elsif ttt_board[6] == opponent && ttt_board[2] == " "
			move = 2

		elsif ttt_board[8] == opponent && ttt_board[0] == " "
			move = 0

		else
			move = 10
		end

	end

	def empty_corner(ttt_board)

		corners = [0,2,6,8]
		empty = []

		corners.each do |pos|
			if ttt_board[pos] == ' '
				empty << pos
			end
		end

		if empty.length > 0
			move = empty.shift # shift takes the first element in an array
		else
			move = 10
		end
		move

	end

	def empty_side(ttt_board)

		sides = [1,3,5,7]
		empty = []

		sides.each do |pos|
			if ttt_board[pos] == ' '
				empty << pos
			end
		end

		if empty.length > 0
			move = empty.shift
		else
			move = 10
		end
		move

	end

end