Rails.application.routes.draw do
  resources :categories do
    resources :payments
  end

  root 'home#index'
  devise_for :users
  resources :users, only: [:index, :show]
end