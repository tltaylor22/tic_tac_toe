class Board

	attr_accessor :ttt_board

	def initialize
		@ttt_board = Array.new(9, '') # an instance variable that can be used at every instance throughout this class
	end

	def update_position(position, marker)
		ttt_board[position] = marker
	end

	def valid_position?(position)
		if ttt_board[position] == ''
			true
		else
			false
		end
	end

	def valid_input?(input)
		if input.match(/[XxOo]/)
			true
		else
			false
		end
	end

	def full_board?()
		if ttt_board.include?('') #if there is an empty string/position false, if not true
			false
		else
			true
		end
	end

	def winner?(marker) # 2D array of winning combinations
	win_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3,6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
	results = false # set results to false by default 
		win_array.each do |win| #iterates through outer array and then over each inner array.
			row = 0 # set a counter
			win.each do |pos| 
				if ttt_board[pos] == marker # uses the index of each inner array element to index a position on the board.
					row += 1 # if there is a match it adds to the counter "row"
					if row == 3 # if row equals 3 results gets set to true because all 3 in a set matched.
						results = true
					end # nested loops. iterates over outer array and then iterates over each inner array. Count is reset to 0 for every inner array item because it is outside the inner loop.
				end
			end
		end
		results # calls the results which is false by default. Only true if a set of the three combos matches.
	end					

end