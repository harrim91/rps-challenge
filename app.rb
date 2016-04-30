require 'sinatra/base'
require './lib/game'

class RockPaperScissors < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/names' do
      Game.create params[:player_name]
      redirect '/select-weapon'
  end

  before do
    @game = Game.last
  end

  get '/select-weapon' do
    erb :select_weapon
  end

  post '/play' do
    @game.player_move = params["move"]
    @game.set_opponent_move
    redirect '/results'
  end

  get '/results' do
    erb :results
  end

  # start the server if ruby files executed directly
  run! if app_file == $0
end