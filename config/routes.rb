Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'welcome#index'
  get '/title_form', to: 'forms#new'
  get 'welcome/index'
  get 'welcome/contact'
  get 'welcome/donate'
  resources :forms, only: [:index, :new, :create]
end
