Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'news_items/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'news_items#index'
end
