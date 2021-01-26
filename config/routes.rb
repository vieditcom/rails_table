Rails.application.routes.draw do
  resources :users, only: [:index, :create, :update, :destroy]
  root to: 'users#index'
end
