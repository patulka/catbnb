Rails.application.routes.draw do
  
  devise_for :users
  root to: 'pages#home'

  resources :cats, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:new, :create]
  end
end
