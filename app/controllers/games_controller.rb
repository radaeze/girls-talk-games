class GamesController < ApplicationController
    
    def index
        @game = Game.all.sort_by{ |game| game.name.downcase }
    end
    
    def show
        @game = Game.find(params[:id])
        @reviews = @game.reviews
        @review = @game.reviews.build
    end
    
    def new
        @game = Game.new
    end
    
    def create
        Game.find_by_name(params[:game][:name])
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
