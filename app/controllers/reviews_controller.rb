class ReviewsController < ApplicationController
    before_action :has_user_and_game, :only => [:new, :create]
    
    protected
    def has_user_and_game
        unless current_user
            flash[:warning] = "You must be logged in to create review"
            redirect_to login_path
        end
        
        unless (@game = Game.where(:id => params[:game_id]))
            flash[:warning] = "Reviews must be for existing game"
            redirect_to user(@current_user)
        end 
    end
    
    public
    def new
        @review = @game.reviews.build
    end
    
    def create
        @game = Game.find(params[:game_id])
        current_user.reviews << @game.reviews.build(review_params)
        redirect_to game_path(@game)
    end
    private
    def review_params
        params.require(:review).permit(:comments, :game_id)
    end 
end