require 'minitest/autorun'
require_relative 'unbeatable.rb'

class TestUnbeatableFunction < Minitest::Test

	def test_new_player_X
		player = Unbeatable.new('X')
		assert_equal('X', player.marker)
	end

	def test_win
		player = Unbeatable.new('X')
		assert_equal(2, player.get_move(['X', 'X', '', '', '', '', '', '', '']))
	end

	def test_win_at_8
		player = Unbeatable.new('X')
		assert_equal(8, player.get_move(['', '', '', '', '', '', 'X', 'X', '']))
	end

	def test_win_at_4
		player = Unbeatable.new('X')
		assert_equal(4, player.get_move(['X', '', '', '', '', '', '', '', 'X']))
	end

	def test_no_win_x
		player = Unbeatable.new('X')
		assert_equal(1, player.get_move(['X', '', '', '', '', '', '', '', '']))
	end

	def test_win_at_2
		player = Unbeatable.new('O')
		assert_equal(2, player.get_move(['O', 'O', '', '', '', '', '', 'X', '']))
	end

	def test_block1
		player = Unbeatable.new('X')
		assert_equal(2, player.get_move(['O', 'O', '', '', '', '', '', '', 'X']))
	end

	def test_block2
		player = Unbeatable.new('X')
		assert_equal(8, player.get_move(['O', '', '', '', 'O', '', '', 'X', '']))
	end

	def test_block3
		player = Unbeatable.new('X')
		assert_equal(8, player.get_move(['', '', 'O', '', '', 'O', '', 'X', '']))
	end
end

