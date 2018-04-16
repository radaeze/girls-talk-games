class SearchesController < ApplicationController
    def new
     @search = Search.new
    end
    
    def create
        search = GiantBomb::Search.new().query(params[:search][:games]).resources('game').limit(50).fields('id').fetch 
        games_details = Array.new()
        search.each.with_index {|val, index| games_details << val["id"]}
        @search = Search.new
        games_details.each do |i| 
            game = GiantBomb::Game.detail(i)
            @game = Game.new
            @game.name = game.name
            @game.description = game.deck
            @game.image = game.image["medium_url"]
            @game = Game.find_by_name(@game.name) unless @game.save
            @search.games << @game
        end
        @search.save
        redirect_to @search
    end
    
    def show
        @search = Search.find(params[:id])
    end
    
    def index
        @search = Search.find(params[:id])
    end
   
   def find
       
   end 
end