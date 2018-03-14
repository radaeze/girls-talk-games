Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  
  get 'signup_or_login' => 'users#signup_or_login'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'login' => 'sessions#new', as: 'loginuser'
  post 'login' => 'sessions#find', as: 'finduser'
  get 'logout' => 'sessions#destroy'
  resources :users 
        
        
  root :to => redirect('static_pages/home')
       
end
