Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => 'home#about',as: :home
  resources :books
  devise_for :users
  resources :users, only: [:show,:index,:update, :edit]
end