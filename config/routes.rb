Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #boats

  # get "boats", to: "boats#index", as: 'boats'
  # get "boats/:id", to: "boats#show", as: 'boat'
  # get  "users/:user_id/boats/new", to: "boats#new", as: 'new_user_boat'
  # post "users/:user_id/boats/", to: "boats#create"

  resources :boats
  resources :bookings

end
