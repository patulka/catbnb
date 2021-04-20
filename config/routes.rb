Rails.application.routes.draw do
  get 'cats/new'
  get 'cats/create'
  devise_for :users
  root to: 'pages#home'
  resources :cats, only: [:new, :create]
end
