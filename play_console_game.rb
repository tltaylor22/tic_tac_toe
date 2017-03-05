require_relative 'console_game.rb' # this file will combine all the classes/functions and launch the game.

# p1 = Sequential_AI.new('X')
# p2 = Random_AI.new('O')
p1 = Human.new('X')
p2 = Human.new('O')

game = Console_Game.new(p1, p2)

game.intro_ttt

# game.get_move

# game.update_position

# game.display_board

# game.change_player

# game.get_move

# game.update_position

# game.display_board

until game.check_tie || game.check_winner
	game.change_player
	game.get_move
	game.update_position
	game.display_board
	
end

if game.check_winner
	puts "#{game.active_player.marker} WINS!"
else
	puts "Cat game!"

end

	game.display_board
