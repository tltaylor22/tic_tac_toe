require 'sinatra'
require 'rubygems'
require_relative 'board.rb'
require_relative 'random_ai.rb'
require_relative 'sequential_ai.rb'
require_relative 'human.rb'
require_relative 'unbeatable_ai.rb'

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
		erb :name, locals: {intro: intro} # OR is it: locals: => {intro: intro}???
	end

	post '/name' do
		intro = params[:intro]
		name = params[:name_input]
		redirect '/pickopp?name=' + name 
	end

	get '/pickopp' do
		intro = params[:intro]
		name = params[:name]
		opp = params[:opp_select]
		erb :pickopp, locals: {intro: intro, name: name}
	end

	post '/pickopp' do
		intro = params[:intro]
		name = params[:name_input]
		easy = params[:random_ai]
		medium = params[:sequential_ai]
		unbeatable = params[:unbeatable_ai]
		human = params[:human]
		redirect '/game1?name=' + name
	end

	get '/game1' do
		intro = params[:intro]
		name = params[:name]
		game = params[:game_select]
		erb :pickopp, locals: {intro: intro, name: name, game_select: game}
	end

end
