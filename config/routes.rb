Rails.application.routes.draw do
  resources :subscriptions
  resources :users
  resources :trips
  resources :destinations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post "/destinations/:id", to: "destinations#book"
  post "/login", to: "auth#login"
  get '/auto_login', to: "auth#auto_login"
end
