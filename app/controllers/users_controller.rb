class UsersController < ApplicationController
    
def new  # get /signup
      @user = User.new
end

    def show  #show profile of another user, for current user see myprofile#show
        @user = User.find_by username: params[:id].downcase # look up user by unique username
        unless (@current_user.id != @user.id)
          redirect_to myprofile_path
        end
        # else
        # will render app/views/users/show.html.haml
    end

    def create  # post /signup
      @user = User.new user_params
        if @user.save
          session[:user_id] = @user.id
          #raise session[:user_id].to_yaml
          flash[:success] = "Thank you for signing up."
          redirect_to home_path
        else
          flash[:alert] = "Could not sign up!"
          render 'new'
        end
    end
    
     def edit

      # raise params
      @user = User.find_by first_name: params[:id].downcase

      if @user != @current_user
        flash[:alert] = 'Please log in to edit your profile.'
        return redirect_to root_path
      end
     end

    def update

      #raise user_params.to_yaml
      @user = User.find_by first_name: params[:id].downcase
      #if @user.update_attributes(params[:user])
      if @user.update_attributes profile_params

        # flash[:success] = "Profile updated."
        return redirect_to user_path(@user)
      else
        Rails.logger.info(@user.errors.messages.inspect)
        flash[:alert] = "Update was unsuccessful."
        redirect_to edit_user_path
      end
    end 
    
    def signup_or_login
    @user = User.new
    end
    
    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params

      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
