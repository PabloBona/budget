Rails.application.routes.draw do
  resources :categories do
    resources :payments
  end

  root 'home#index'
  resources :users
  devise_for :users
end