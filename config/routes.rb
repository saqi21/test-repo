Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users, only: [:edit,:update,:show]
  # put "users/file_upload", to: "users#file_upload"
  get 'users/verify', to: 'users#verificationModuel'
end
