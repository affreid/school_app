Rails.application.routes.draw do
  binding.pry
  resources :students, only: [:index]
  root 'home#show'

end
