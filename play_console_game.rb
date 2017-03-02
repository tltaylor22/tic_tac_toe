require_relative 'console_game.rb'

p1 = Sequential_AI.new('X')
p2 = Random_AI.new('O')

game = Console_Game.new(p1, p2)

game.intro_ttt

game.get_move

game.update_position

game.display_board

game.change_player

game.get_move

game.update_position

game.display_board

until game.check_winner || game.check_tie

	game.display_board
	game.get_move
	game.update_position
	game.change_player
end


