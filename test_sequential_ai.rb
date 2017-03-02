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

end
