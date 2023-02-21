Rails.application.routes.draw do
  # get 'posts/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :users
  resources :posts
  resources :comments
end
