require 'minitest/autorun'
require_relative 'unbeatable_ai.rb'

class TestUnbeatableFunction < Minitest::Test

	def test_new_player_X
		player = Unbeatable_AI.new('X')
		assert_equal('X', player.marker)
	end

	def test_go_for_win
		player = Unbeatable_AI.new('X')
		assert_equal(2, player.get_win(['X', 'X', ' ', ' ', ' ', ' ', 'O', ' ', 'O']))
	end

	def test_go_for_win_345
		player = Unbeatable_AI.new('X')
		assert_equal(4, player.get_win([' ', ' ', ' ', 'X', ' ', 'X', ' ', ' ', ' ']))
	end

	def test_go_for_win_678
		player = Unbeatable_AI.new('X')
		assert_equal(8, player.get_win([' ', ' ', ' ', ' ', ' ', ' ', 'X', 'X', ' ']))
	end

	def test_go_for_win_246
		player = Unbeatable_AI.new('X')
		assert_equal(6, player.get_win([' ', ' ', 'X', ' ', 'X', ' ', ' ', ' ', ' ']))
	end

	def test_go_for_win_246_O
		player = Unbeatable_AI.new('O')
		assert_equal(6, player.get_win([' ', ' ', 'O', ' ', 'O', ' ', ' ', ' ', ' ']))
	end

	def test_go_for_win_678_O
		player = Unbeatable_AI.new('O')
		assert_equal(8, player.get_win([' ', ' ', ' ', ' ', ' ', ' ', 'O', 'O', ' ']))
	end

	#BLOCK TESTS

	def test_for_block_O_win
		player = Unbeatable_AI.new('X')
		assert_equal(1, player.block(['O', ' ', 'O', 'X', ' ', ' ', ' ', ' ', ' ']))	
	end

	def test_for_block_O_win_345
		player = Unbeatable_AI.new('X')
		assert_equal(4, player.block([' ', ' ', 'X', 'O', ' ', 'O', ' ', ' ', ' ']))	
	end

	def test_for_block_O_win_678
		player = Unbeatable_AI.new('X')
		assert_equal(7, player.block([' ', ' ', 'X', ' ', ' ', ' ', 'O', ' ', 'O']))	
	end

	def test_for_block_X_win_678
		player = Unbeatable_AI.new('O')
		assert_equal(7, player.block([' ', ' ', 'O', ' ', ' ', ' ', 'X', ' ', 'X']))	
	end

	def test_for_block_X_win_246
		player = Unbeatable_AI.new('O')
		assert_equal(6, player.block(['X', ' ', 'X', ' ', 'X', 'O', ' ', 'X', 'O']))	
	end

	def test_no_block_no_win
		player = Unbeatable_AI.new('O')
		assert_equal(10, player.block(['X', ' ', ' ', ' ', ' ', 'O', ' ', ' ', ' ']))	
	end
	
	# fork test
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

	# test block fork
	def test_X_blocks_fork
		player = Unbeatable_AI.new('X')
		assert_equal(4, player.block_fork(['O', 'X', ' ', 'X', ' ', ' ', 'O', ' ', ' ']))
	end

	#center test
	def test_X_takes_center
		player = Unbeatable_AI.new("X")
		assert_equal(4, player.take_center([" ", " ", " ", " ", " ", " ", " ", " ", " "]))
	end	

	#opposite corner test
	def test_X_takes_8_when_O1
		player = Unbeatable_AI.new("X")
		assert_equal(8, player.opposite_corner(["O", " ", " ", " ", " ", " ", " ", " ", " "]))
	end

	#empty corner test
	def test_O_takes_first_empty_corner
		player = Unbeatable_AI.new("O")
		assert_equal(0, player.empty_corner([" ", " ", "X", " ", "O", " ", "X", "O", "X"]))
	end

	#side test
	def test_O_takes_top_side
		player = Unbeatable_AI.new("O")
		assert_equal(1, player.empty_side(["X", " ", "X", " ", "O", " ", " ", "O", "X"]))
	end

	#test get move final
	def test_X_takes_center_empty
		player = Unbeatable_AI.new("X")
		assert_equal(4, player.get_move([" ", " ", " ", " ", " ", " ", " ", " ", " "]))
	end

end

