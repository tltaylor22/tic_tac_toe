require_relative 'console_game.rb'

game = Console_Game.new(Random_AI.new('X'), Random_AI.new('O'))
game.intro_ttt