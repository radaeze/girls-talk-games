Rails.application.routes.draw do
        resources :games
        root :to => redirect('/home')
end
