Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :home, only: [:index]

  root to: "home#index"

  get "users/index"
  get "users/new"
  post "users/create"
  get "users/login_form"
  post "users/login"
end
