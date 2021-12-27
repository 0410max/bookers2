Rails.application.routes.draw do
  devise_for :users
  resources :homes,only: [:top]
  root to: "homes#top"
  get "about" => "homes#about"
  resources :books
  resources :users, only: [:show,:index,:update, :edit]
end
