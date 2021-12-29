Rails.application.routes.draw do
  get 'availability_details/obten_disponibilidad'
  get 'availability_detail/obten_disponibilidad'
  get '/availabilities', to: "availabilities#index", as: "availabilities"
  post 'semanas_por_servicio', to: "availabilities#semanas_por_servicio", as: "semanas_por_servicio"
  post 'ver_disponibilidad', to: "availabilities#obten_disponibilidad"
  post 'editar_disponibilidad', to: "availability_details#prepara_edicion", as: "prepara_editar_disponibilidad"
  get '/editar_disponibilidad/:id', to: "availability_details#edit", as: "editar_disponibilidad"
  post '/actualiza_disponibilidad', to: "availability_details#update"
  resources :contracts
  resources :engineer_availabilities
  root to: 'home#index'
  resources :services
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
