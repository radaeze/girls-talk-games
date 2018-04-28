class SessionsController < ApplicationController

  #skip_before_action :set_current_user  


  def find
    user = User.find_by(email: params[:session][:email].downcase) 
     if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
     else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
     end
    
  end
  
  def create
     user = User.from_omniauth(request.env["omniauth.auth"])
     session[:user_id] = user.id
     reset_session
     redirect_to user
  end 
  
  

  def destroy
     log_out
     redirect_to root_url
  end 
  
    
end
