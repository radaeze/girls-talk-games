module SessionsHelper
 def logged_in?
    !session[:user_uid].nil?
 end    
end
