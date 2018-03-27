class GamesController < ApplicationController
    
    def show
        @game = Game.find(params[:id])
    end
    
    def new
        @game = Game.new
    end
    
    def create
        search = GiantBomb::Search.new().query(params[:game][:name]).resources('game').limit(1).fields('id').fetch
        game = GiantBomb::Game.detail(search[0]["id"])
        @game = Game.new
        @game.name = game.name
        @game.description = game.deck
        @game.image = game.image["medium_url"]
        @game = Game.find_by_name(@game.name) unless @game.save
        redirect_to @game
    end
end
