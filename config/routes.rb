Rails.application.routes.draw do
  devise_for :users

  root to: 'boats#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "profiles", to: "profiles#index"
  get "profiles/bookings", to: "profiles#bookings"
  get "profiles/boats", to: "profiles#boats"

  resources :boats do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [ :new, :create ]
  end


  resources :bookings, only: [:index, :show, :destroy]


end
