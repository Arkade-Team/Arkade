Rails.application.routes.draw do
  post '/appointments', to: "appointment#create"
  get '/appointments', to: "appointment#index"
  get '/appointments/graphics/age', to: "appointment#agePerAppointments"

  post '/appointments/:appointment_id/diseases', to: "disease#create"
  get '/diseases', to: "disease#index"

  post '/appointments/:appointment_id/diseases/:disease_id/actions', to: "appointment_action#create"
  get '/actions', to: "appointment_action#index"

  root "home#index"
end
