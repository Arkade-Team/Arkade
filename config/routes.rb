Rails.application.routes.draw do
  post '/appointments', to: "appointment#create"
  root "home#index"
end
