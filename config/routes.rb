Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'home#index'


  get '/profile', to: 'profile#new'
  post '/profile', to: 'profile#create'

  get '/posts', to: 'posts#index'

  get '/newPost', to: 'posts#new'
  post '/posts', to: 'posts#create'



end
