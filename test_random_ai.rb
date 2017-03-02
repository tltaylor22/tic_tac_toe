require 'minitest/autorun'
require_relative 'random_ai.rb'

class TestRandomAIFunction < Minitest::Test

	def test_create_new_player
		random_ai_player = Random_AI.new('X')
		assert_equal('X', random_ai_player.marker)
	end

	def test_return_available_position
		random_ai_player = Random_AI.new('X')
		assert_equal(0, random_ai_player.get_move(['', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']))
	end

	def test_return_available_position_true
		random_ai_player = Random_AI.new('X')
		assert_equal(true, [0, 1, 2].include?(random_ai_player.get_move(['', '', '', 'X', 'X', 'X', 'X', 'X', 'X'])))
	end

end