class Random_AI

	attr_reader :marker # a reader attribute to read marker

	def initialize(marker)
		@marker = marker # the @ symbol is an instance variable that can be used anywhere within the instance of the class
	end

	def get_move(board)
		board.each_index.select{ |empty| board[empty]==''}.sample

	end
 


end