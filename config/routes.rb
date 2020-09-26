Rails.application.routes.draw do
  post '/appointments', to: "appointment#create"
  get '/appointments', to: "appointment#index"
  root "home#index"
end
