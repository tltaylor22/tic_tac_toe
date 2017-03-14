require 'sinatra'

class TicTacToeApp < Sinatra::Base

	get '/' do
		erb :intro
	end

	post '/intro' do
		yes = params[:yes_select]
		redirect '/name?'
	end

	get '/name' do
		intro = params[:intro]
		name = params[:name_input]
		erb :name, locals: {intro: intro}
	end

	post '/name' do
		intro = params[:intro]
		name = params[:name_input]
		redirect '/pickgame?name=' + name 
	end

	get '/pickgame' do
		intro = params[:intro]
		name = params[:name]
		game = params[:game_input]
		erb :pickgame, locals: {intro: intro, name: name}
	end
end