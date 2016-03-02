Rails.application.routes.draw do
  resources :kitties, :reservations, :castles

  get "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
