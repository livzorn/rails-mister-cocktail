Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'
  get '/about', to: 'pages#about'

  resources :cocktails, only: %i[index create new show] do
    resources :doses, only: %i[create new]
  end
  resources :doses, only: [:destroy]

  get '/home', to: 'pages#home'
  get '/mix', to: 'pages#admin'
end
