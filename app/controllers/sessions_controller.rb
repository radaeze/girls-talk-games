class SessionsController < ApplicationController
skip_before_action :verify_authenticity_token     
#skip_before_filter :set_current_user, :authorize, :only => [:new, :find, :create, :destroy]
    
  def new
    # user wants to log in 
    # render sessions/new.html.haml 
    # we don't use this route, instead see _header.html.haml 
  end 
  
  def find    
    #raise params.to_yaml 
  
    #raise params[:user][:name].inspect
  
   
   
      user= User.find_by(email: params[:email]) 
     


    # user.authenticate calls bcrypt to check if email and passwrd match a db entry
    if user && user.authenticate(params[:password])
      # after we log in a user, we set their id, because we need it for before_filter
      session[:user_id] = user.id
      @current_user ||=  User.find(session[:user_id]) 
    
      
      #session[:provider] = nil   
      #flash[:notice] = "Welcome, #{user.username}!" 
      
      # session[:provider] = nil   
      # flash[:success] = "You are now logged in!"
      
      redirect_to root_url, notice: 'Logged in!' 
    else
      flash[:alert] = "Invalid Login Credentials." 
      redirect_to home_path
    end 

  end  
  

  
  def destroy
    session.delete(:user_id)
    @current_user = nil
    # flash[:alert] = 'Logged out successfully.'
    redirect_to root_path
  end
  
    
end
