require_relative 'console_game.rb' # this file will combine all the classes/functions and launch the game.

# p1 = Sequential_AI.new('X') # creating classes for each type of play
# p2 = Random_AI.new('O')
# p1 = Human.new('X')
# p2 = Human.new('O')

game = Console_Game.new

game.intro_ttt

until game.check_tie || game.check_winner
	game.change_player
	game.get_move
	game.update_position
	game.display_board
	
end

if game.check_winner
	puts "#{game.active_player.marker} WINS!"
else
	puts "Cat Game!"

end

	game.display_board
