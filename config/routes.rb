Rails.application.routes.draw do
  devise_for :users
  root to: "diaries#index"
  resources :users 
  resources :diaries do
   collection do
    get 'community'
   end
  end
end
