class GamesController < ApplicationController
    
    def index
        @games = Game.paginate(:page => params[:page], :per_page => 10).order('name ASC')
    end
    
    def show
        @game = Game.find(params[:id])
    end
    
    def new
        @game = Game.new
    end
    
    def create
        
    end
    
    def upvote
        @game = Game.find(params[:id])
        @game.upvote_by current_user
        redirect_to @game
    end
    
    def downvote
        @game = Game.find(params[:id])
        @game.downvote_by current_user
        redirect_to @game
    end
    
    
end
