Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do 
  	get "sign_in", to: "devise/sessions#new"
  end
  resources :students 
  resources :projects

  get '/search', to: 'projects#index'
  # post '/login', to: 'sessions#create'
  # get '/login', to: 'sessions#new'
  # delete '/logout', to: 'sessions#destroy'
  # get '/logout', to: 'home#show'
  
  root 'home#show'
  
end
