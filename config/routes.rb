Rails.application.routes.draw do
  root to: 'users#edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users ,only:[:edit ,:update]
  devise_for :users
  get "users/:id", to:"users#show"
end