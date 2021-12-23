Rails.application.routes.draw do
  get '/availabilities', to: "availabilities#index"
  resources :contracts
  resources :engineer_availabilities
  root to: 'home#index'
  resources :services
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
