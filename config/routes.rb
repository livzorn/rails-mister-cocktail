Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'
  get '/about', to: 'pages#about'

  resources :cocktails do
    resources :doses, only: %i[new create]
  end
  resources :ingredients, only: %i[new create destroy]
  resources :doses, only: [:destroy]

  get '/home', to: 'pages#home'
  get '/mix', to: 'pages#admin'
end
