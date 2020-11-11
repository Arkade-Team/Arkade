Rails.application.routes.draw do
  resources :hospitals
  post '/appointments', to: "appointment#create"
  get '/appointments', to: "appointment#index"
  get '/appointments/graphics/age', to: "appointment#agePerAppointments"

  post '/appointments/:appointment_id/diseases', to: "disease#create"
  get '/diseases', to: "disease#index"

  post '/appointments/:appointment_id/diseases/:disease_id/actions', to: "appointment_action#create"
  get '/actions', to: "appointment_action#index"

  post '/appointments/:appointment_id/diseases/:disease_id/actions', to: "appointment_action#create"
  
  get '/hospitals/:hospital/appointments', to: "hospitals#appointments"

  root "home#index"
end
