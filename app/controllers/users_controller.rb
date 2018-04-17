class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]  
  before_action :correct_user,   only: [:edit, :update]
  
  def index
    #@users = User.all
    @users = User.paginate(page: params[:page])
  end  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Girls Talk Games!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end


  private

    def user_params
<<<<<<< HEAD
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :username, :bio)
=======
      params.require(:user).permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation, :username, :bio, :picture)
>>>>>>> 3b7d29c5c00d66c561129e484fa7bf6b670d53e2
    end
    
        # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
   def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
   end
   
end
