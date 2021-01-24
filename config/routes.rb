Rails.application.routes.draw do
  resources :users, only: [:index, :create, :destroy]
  root to: 'users#index'
end
