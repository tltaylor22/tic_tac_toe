require 'minitest/autorun'
require_relative 'sequential_ai.rb'

class TestSequentialAIFunction < Minitest::Test

	def test_create_new_player
		ai_player = Sequential_AI.new('X')
		assert_equal('X', ai_player.marker)
	end

	def test_return_available_position
		ai_player = Sequential_AI.new('X')
		assert_equal(0, ai_player.get_move(['', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']))
	end

	def test_return_available_position_true
		ai_player = Sequential_AI.new('X')
		assert_equal(true, [0, 1, 2].include?(ai_player.get_move(['', '', '', 'X', 'X', 'X', 'X', 'X', 'X'])))
	end

	def test_return_empty_board_true
		ai_player = Sequential_AI.new('X')
		assert_equal(true, [0, 1, 2, 3, 4, 5, 6, 7, 8].include?(ai_player.get_move(['', '', '', '', '', '', '', '', ''])))
	end

end
