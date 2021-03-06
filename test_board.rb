require 'minitest/autorun'
require_relative 'board.rb'

class TestTicTacToeFunction < Minitest::Test

	def test_new_board
		board = Board.new
		assert_equal(Array.new(9, ' '), board.ttt_board) # we have created an array with 9 empty strings, 
	end

	def test_update_first_position
		board = Board.new
		board.update_position(0, 'X')
		assert_equal(['X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], board.ttt_board)
	end

	def test_first_position_x_and_second_0
		board = Board.new
		board.update_position(0, 'X')
		board.update_position(1, '0')
		assert_equal(['X', '0', ' ', ' ', ' ', ' ', ' ', ' ', ' '], board.ttt_board)
	end
	
	def test_update_partial_board_at_last_position
		board = Board.new
		board.ttt_board = ['X', '0', ' ', '0', ' ', ' ', ' ', ' ', ' ']
		board.update_position(8, 'X')
		assert_equal(['X', '0', ' ', '0', ' ', ' ', ' ', ' ', 'X'], board.ttt_board)
	end

	def test_check_if_position_is_available
		board = Board.new
		board.ttt_board = ['X', '0', ' ', '0', ' ', ' ', ' ', ' ', ' ']
		assert_equal(true, board.valid_position?(6)) # board.'anything' gives you access to the Board class
		assert_equal(false, board.valid_position?(0))
		assert_equal(false, board.valid_position?(15))
		assert_equal(true, board.valid_position?(-3)) # this is the third from the last position so it is open
	end

	def test_for_full_board_false
		board = Board.new
		board.ttt_board = ['X', '0', 'X', '0', 'X', 'O', 'X', ' ', 'X']
		assert_equal(false, board.full_board?)
	end

	def test_for_full_board_true
		board = Board.new
		board.ttt_board = ['X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X']
		assert_equal(true, board.full_board?)
	end
# left here in class
	def test_valid_input
		board = Board.new
		assert_equal(false, board.valid_input?('m'))
		assert_equal(true, board.valid_input?('x'))
		assert_equal(true, board.valid_input?('O'))
		assert_equal(false, board.valid_input?(' '))
		assert_equal(false, board.valid_input?('@'))
		assert_equal(true, board.valid_input?('X'))
	end
		def test_winner_at_pos_012_with_X
		board = Board.new
		marker = 'X'
		board.ttt_board = ['X', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'X']
		assert_equal(true, board.winner?(marker))
	end

	def test_winner_at_pos_048_with_x
		board = Board.new
		marker = 'x'
		board.ttt_board = ['x', 'x', 'o', 'o', 'x', 'x', 'o', 'o', 'x']
		assert_equal(true, board.winner?(marker))
	end

	def test_no_winner
		board = Board.new
		marker = 'o'
		board.ttt_board = ['x', 'o', 'x', 'o', 'o', 'x', 'o', 'x', 'o']
		assert_equal(false, board.winner?(marker))
	end
	

end