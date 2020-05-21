Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy,:show]
  resources :users, only: [:new, :create, :destroy,:show]
  # resources :posts
end
