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
		game = params[:game_select]
		erb :pickgame, locals: {intro: intro, name: name}
	end

	post '/pickgame' do
		intro = params[:intro]
		name = params[:name_input]
		game = params[:game_select]
		redirect '/game1?name=' + name
	end

	get '/game1' do
	end
end