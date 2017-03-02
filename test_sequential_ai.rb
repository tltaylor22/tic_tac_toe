require 'minitest/autorun'
require_relative 'sequential_ai.rb'

class TestSequentialAIFunction < Minitest::Test

	def test_create_new_player
		ai_player = Sequential_AI.new('X')
		assert_equal('X', ai_player.marker)
	end

end
