Rails.application.routes.draw do
  resources :actions
  post '/appointments', to: "appointment#create"
  get '/appointments', to: "appointment#index"
  get '/appointments/graphics/age', to: "appointment#agePerAppointments"

  post '/appointments/:appointment_id/diseases', to: "disease#create"
  get '/diseases', to: "disease#index"

  post '/appointments/:appointment_id/actions', to: "action#create"
  get '/actions', to: "action#index"

  root "home#index"
end
