Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get "/signup" => "users#new"
  post "/users" => "users#create" 
  get "/signin" => "sessions#new"
  get "/signout"=> "session#destroy", via: [:delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
