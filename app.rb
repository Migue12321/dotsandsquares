require 'sinatra'
require './lib/user'
require './lib/Game'
require './lib/Bienvenida'
set :public_folder, File.dirname(__FILE__) + '/static'


class App < Sinatra::Base
  
    $game = Game.new()

    get '/' do
      bienvenida=Bienvenida.new()
      bienvenida.addTitle("Dots and squares")
      bienvenida.addBottonName("START NEW GAME")
      @bottonName= bienvenida.getBottonName()
      @title = bienvenida.getTitle()
      erb :bienvenida
    end
    post '/players' do
      erb :numerojugadores
    end
    get '/players' do
      erb :numerojugadores
    end
    
    post '/game-settings' do
      erb :gameSettings
    end

    get '/game-settings' do
      erb :gameSettings
    end

    post '/game-settings-3' do
      erb :gameSettings3players
    end

    get '/game-settings-3' do
      erb :gameSettings3players
    end
    post '/game-settings-4' do
      erb :gameSettings4players
    end

    get '/game-settings-4' do
      erb :gameSettings4players
    end

    post '/game' do
        @size=params[:size].to_i 
        $game.reset()
        $game.initGame(@size,@size)
        @qp=params[:qp].to_i 
        puts @qp
        if @qp == 2
          @username1=params[:username1].to_s 
          @color1=params[:color1].to_s
          $game.addUser(@username1,@color1)
          @username2=params[:username2].to_s 
          @color2=params[:color2].to_s 
          $game.addUser(@username2,@color2)
        elsif @qp == 3
          @username1=params[:username1].to_s 
          @color1=params[:color1].to_s 
          $game.addUser(@username1,@color1)
          @username2=params[:username2].to_s 
          @color2=params[:color2].to_s 
          $game.addUser(@username2,@color2)
          @username3=params[:username3].to_s 
          @color3=params[:color3].to_s 
          $game.addUser(@username3,@color3)
        elsif @qp == 4
          @username1=params[:username1].to_s 
          @color1=params[:color1].to_s 
          $game.addUser(@username1,@color1)
          @username2=params[:username2].to_s 
          @color2=params[:color2].to_s 
          $game.addUser(@username2,@color2)
          @username3=params[:username3].to_s 
          @color3=params[:color3].to_s 
          $game.addUser(@username3,@color3)
          @username4=params[:username4].to_s 
          @color4=params[:color4].to_s 
          $game.addUser(@username4,@color4)
        end
        @users = $game.getPlayers()
        erb :game
    end    

    post '/game/point' do
      @posX=params[:posX].to_i 
      @posY=params[:posY].to_i 
      @orientation=params[:or]
      $game.dotsAndBoxes(@posX,@posY,@orientation)
    end

    get '/game/point' do   
      puts $game.gameOver()
      @us = $game.getPlayers()
      @users = '['
      @us.each do |user|
        @users = @users + '{ "username":"' + user.getUsername + '", "score":' + user.getScore().to_s + ', "turno":' + $game.getTurno().to_s + '},'
      end
      @users = @users[0..-2] + ']'
      content_type :json
      @users
    end

    run! if app_file == $0;
end