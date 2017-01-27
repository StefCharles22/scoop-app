Rails.application.routes.draw do


  # Root route
  get "/"                  => "welcome#home"


  # when my app receives a get request to /users, look in users controller for the #(index, show, etc..)/action
  # Devise user routes
  devise_for :users
  get "/users"            => "users#index", as: "users"
  get "/users/:id"        => "users#show", as: "user"
  get "/add-favorite"     => "users#add_favorite"
  get "/remove-favorite"  => "users#remove_favorite"

  get "/choose-favorites" => "users#choose_favorites_action", as: "choose_favorites_nickname"

  #api routes
  get "/news"             => "welcome#home"
  post "/news"            => "welcome#news"


end
