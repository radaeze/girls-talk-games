Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users 
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#find'
  delete '/logout',  to: 'sessions#destroy'
  get  'auth/:provider/callback', to: 'sessions#create'
  get  'auth/failure', to: 'sessions#failure'
  resources :sessions 
  resources :posts,          only: [:create, :destroy]
  resources :games do
    resources :reviews
  end
  

  mount Thredded::Engine => '/forum'
        
        

       
end
