Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'news_items#index'

  resources :news_items, only: [:index, :show]
  resources :congregations, only: [:index, :show]
  resources :clergymen, only: [:index, :show]
  resources :qnas, only: [:index, :show, :create]
end
