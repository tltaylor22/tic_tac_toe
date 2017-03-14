require 'sinatra'

class TicTacToeApp < Sinatra::Base

	get '/' do
		erb :intro
	end

end