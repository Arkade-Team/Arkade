Rails.application.routes.draw do
  post '/appointments', to: "appointment#create"
  get '/appointments', to: "appointment#index"

  post '/appointments/:appointment_id/diseases', to: "disease#create"
  get '/diseases', to: "disease#index"
  root "home#index"
end
