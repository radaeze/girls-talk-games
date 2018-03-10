Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'

        resources :games
        root :to => redirect('static_pages/home')
end
