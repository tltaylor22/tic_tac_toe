require 'minitest/autorun'
require_relative 'board.rb'

class TestTicTacToe < Minitest::Test

	def test_new_board
		board = Board.new
		assert_equal(Array.new(9, ''), board.ttt_board) # we have created an array with 9 empty strings, 
	end

	def test_update_first_position
		board = Board.new
		board.update_position(0, 'X')
		assert_equal(['X', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_first_x_and_second_0
		board = Board.new
		board.update_position(0, 'X')
		board.update_position(1, '0')
		assert_equal(['X', '0', '', '', '', '', '', '', ''], board.ttt_board)
	end

end