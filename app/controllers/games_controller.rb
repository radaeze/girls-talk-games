class GamesController < ApplicationController
    
    def index
        @games = Game.paginate(:page => params[:page], :per_page => 10).order('name ASC')
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
        
    end
end
