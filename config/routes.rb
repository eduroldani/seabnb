Rails.application.routes.draw do
  devise_for :users

  root to: 'boats#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :boats do
    resources :bookings, only: [:new, :create]
  end


  resources :bookings, only: [:index, :show, :destroy]

end
