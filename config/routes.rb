Rails.application.routes.draw do
  devise_for :users
  root to: "diaries#index"
  resources :users 
  resources :diaries do
    resources :comments, only: :create
   collection do
    get 'community'
    get 'search'
   end
  end
end
