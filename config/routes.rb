Rails.application.routes.draw do
  root 'forms#index'
  get '/create', to: 'forms#new'
  resources :forms, only: [:index, :new, :create]
end
