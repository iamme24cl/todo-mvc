Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  get '/sessions' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/auth/github/callback' => 'sessions#create'


  resources :users, only: [:new, :create, :index]

  resources :lists do
    resources :items
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'lists#index'
end
