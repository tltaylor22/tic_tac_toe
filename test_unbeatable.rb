require 'minitest/autorun'
require_relative 'unbeatable.rb'

class TestUnbeatableFunction < Minitest::Test

	def test_new_player_X
		player = Unbeatable.new('X')
		assert_equal('X', player.marker)
		
	end

end

