require 'minitest/autorun'
require_relative 'unbeatable_ai.rb'

class TestUnbeatableFunction < Minitest::Test

	def test_new_player_X
		player = Unbeatable_AI.new('X')
		assert_equal('X', player.marker)
	end

	def test_win_at_012_X
		player = Unbeatable_AI.new('X')
		assert_equal(2, player.get_move(['X', 'X', ' ', ' ', ' ', ' ', ' ', ' ', ' ']))
	end

	def test_win_at_678
		player = Unbeatable_AI.new('X')
		assert_equal(8, player.get_move([' ', ' ', ' ', ' ', ' ', ' ', 'X', 'X', ' ']))
	end

	def test_win_at_048
		player = Unbeatable_AI.new('X')
		assert_equal(4, player.get_move(['X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X']))
	end

	def test_no_win_X
		player = Unbeatable_AI.new('X')
		assert_equal(1, player.get_move(['X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']))
	end

	def test_win_at_012_O
		player = Unbeatable_AI.new('O')
		assert_equal(2, player.get_move(['O', 'O', ' ', ' ', ' ', ' ', ' ', 'X', ' ']))
	end

	def test_block1
		player = Unbeatable_AI.new('X')
		assert_equal(2, player.get_move(['O', 'O', ' ', ' ', ' ', ' ', ' ', ' ', 'X']))
	end

	def test_block2
		player = Unbeatable_AI.new('X')
		assert_equal(8, player.get_move(['O', ' ', ' ', ' ', 'O', ' ', ' ', 'X', ' ']))
	end

	def test_block3
		player = Unbeatable_AI.new('X')
		assert_equal(8, player.get_move([' ', ' ', 'O', ' ', ' ', 'O', ' ', 'X', ' ']))
	end

	def test_X_and_O_block
		player = Unbeatable_AI.new('O')
		assert_equal(2, player.get_move(['O', 'O', ' ', ' ', ' ', 'X', ' ', ' ', 'X']))
	end
	
	def test_O_fork_returns_O
		player = Unbeatable_AI.new('O')
		assert_equal(0, player.check_fork([' ', 'O', ' ', ' ', 'O', 'X', ' ', 'X', ' ']))
	end
	
	def test_O_fork_returns_6
		player = Unbeatable_AI.new('O')
		assert_equal(6, player.check_fork([' ', 'X', ' ', ' ', 'O', 'X', ' ', 'O', ' ']))
	end

	def test_O_fork_returns_2
		player = Unbeatable_AI.new('O')
		assert_equal(2, player.check_fork(['X', ' ', ' ', ' ', ' ', ' ', 'O', 'X', 'O']))
	end
end

