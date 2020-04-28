Rails.application.routes.draw do

  resources :questions
  resources :moods
  resources :entries
  resources :answers
  post "/sign_in", to: "users#sign_in"
  get "/validate", to: "users#validate"
  get "/initial_data", to: "users#initial_data"
  # post "/create", to: "users#create"
  get "/index", to: "users#index"
  post "/index", to: "users#create"
end
