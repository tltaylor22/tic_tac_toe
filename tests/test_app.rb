require 'minitest/autorun'
require 'rack/test'
require_relative '../app.rb'

class TestApp < Minitest::Test
	include Rack::Test::Methods

	def app
		TicTacToeApp
	end

	def test_lets_play_on_entry_page
		get '/'
		assert(last_response.ok?)
		assert(last_response.body.include?("Let's Play"))
		assert(last_response.body.include?(src="https://static3.scirra.net/images/newstore/products/2063/splash.png"))
	end

	def test_post_to_intro_page
		post '/intro'
		follow_redirect!
		assert(last_response.body.include?('type="submit"'))
		assert(last_response.ok?)
	end

	def test_name_page
		get '/'
		assert(last_response.ok?)
		assert(last_response.body.include?('class="subhead">Awesome, what is your name?'))
		assert(last_response.body.include?('<form class="center" action="/name" method="post">'))
		assert(last_response.body.include?('<input type="text" name="name_input">'))
		assert(last_response.body.include?("<input type='submit' value='submit'>"))
	end

	def test_post_to_name
		post '/name', name_input: 'Tim'
		follow_redirect!
		assert(last_response.body.include?('Tim'))
		assert(last_response.ok?)
	end


end