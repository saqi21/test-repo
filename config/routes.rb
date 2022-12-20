Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, only: [:edit,:update]
  devise_for :users
  put "users/file_upload", to: "users#file_upload"
  get 'users/verify', to: 'users#verificationModuel'
  get "users/:id", to:"users#show"
end
