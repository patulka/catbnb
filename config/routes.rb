Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :cats, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show]
  get "my_bookings", to: "bookings#my_bookings"
end
