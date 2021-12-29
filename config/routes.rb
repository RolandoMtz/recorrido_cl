Rails.application.routes.draw do
  get 'availability_details/obten_disponibilidad'
  get 'availability_detail/obten_disponibilidad'
  get '/availabilities', to: "availabilities#index"
  post 'semanas_por_servicio', to: "availabilities#semanas_por_servicio", as: "semanas_por_servicio"
  post 'ver_disponibilidad', to: "availabilities#obten_disponibilidad"
  resources :contracts
  resources :engineer_availabilities
  root to: 'home#index'
  resources :services
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
