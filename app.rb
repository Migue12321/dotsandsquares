require 'sinatra'
require './lib/user'
require './lib/Game'
require './lib/Bienvenida'

set :public_folder, File.dirname(__FILE__) + '/static'

class App < Sinatra::Base

    $game = Game.new()
    $size

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
        $size=params[:size].to_i 
        @username=params[:username]
        @color1=params[:color1]
        @username2=params[:username2]
        @color2=params[:color2]
        $game.initGame($size,$size)
        $game.addUser(@username,@color1)
        $game.addUser(@username2,@color2)
        erb :game
    end

    post '/game/point' do
      @posX=params[:posX].to_i 
      @posY=params[:posY].to_i 
      @orientation=params[:or]
      pos2 = 0
      pos1 = ($size*(@posX - 1)) + @posY
      if @orientation == 'U'
        if (pos1-1) % $size != 0
          pos2 = pos1 - 1
          $game.play('D', pos2)
        end
      elsif @orientation == 'D'
        if pos1 % $size != 0
          pos2 = pos1 + 1
          $game.play('U', pos2)
        end
      elsif @orientation == 'L'
        if pos1 > $size
          pos2 = pos1 - $size
          $game.play('R', pos2)
        end
      elsif @orientation == 'R'
        if pos1 < (($size * $size) - $size)
          pos2 = pos1 + $size 
          $game.play('L', pos2)
        end
      end
      result = $game.play(@orientation, pos1)
      if(result != 2)
        $game.changePlayer()
      end
    end

    get '/game/point' do   
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