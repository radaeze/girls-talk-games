class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]  
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
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
    if verify_recaptcha(model: @user) && @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Girls Talk Games!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user
    if verify_recaptcha(model: @user) && @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  private

    def user_params

      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :username, :bio, :picture)

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
   
   def admin_user
      redirect_to(root_url) unless current_user.admin?
   end
   
end
