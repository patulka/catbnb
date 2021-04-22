Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :cats, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:new, :create]
  end

  get "my_bookings", to: "bookings#my_bookings"
  get "my_cats", to: "cats#my_cats"
end
