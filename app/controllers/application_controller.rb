class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    
   
  include SessionsHelper
  
  #before_filter :set_current_user
  
  protected # prevents method from being invoked by a route
  def set_current_user
     # raise @current_user.inspect
     # raise session[:user_id].inspect  
    begin
      @current_user ||=  User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      logger.info 'User could not be authenticated due to deleted user account.'
      @current_user = nil
      session[:user_id] = nil
    end
  end
  
  def authorize
    redirect_to root_path, alert: "Please Login" if session[:user_id].nil?     
  end
  
  private
          # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
