Rails.application.routes.draw do
  devise_for :users
  root to: "diaries#index"
  resources :users 
  resources :diaries 
  resources :communities, only: :index
end
