Shouter::Application.routes.draw do
  resources :users, only: [:new, :create]
  resources :shouts
  get "sign_in" => "sessions#new"
  post "sign_in" => "sessions#create"
    
end
