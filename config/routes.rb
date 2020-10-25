Rails.application.routes.draw do
  devise_for :users
  root to: "diaries#community"
  resources :users 
  resources :diaries do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
     get 'community'
     get 'search'
    end
  end
end
