Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'forms#index'
  get '/create', to: 'forms#new'
  resources :forms, only: [:index, :new, :create]
end
