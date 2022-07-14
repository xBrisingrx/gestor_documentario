Rails.application.routes.draw do
  root 'main#index'
  get 'main/index'
  
  resources :companies, only: [:index, :new, :create, :edit, :update]
  post '/companies/disable'

  resources :people
end
