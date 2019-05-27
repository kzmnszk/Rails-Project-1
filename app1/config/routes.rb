Rails.application.routes.draw do
  get 'follows/create'

  get 'posts/new'
  resources :posts

  get 'users/new'
  get 'users/login'
  get 'users/logout'
  get 'users/index'
  post 'users/send_login'
  resources :users

  resources :follows

  get 'home/index'

  get 'welcome/index'
  
  root  'home#index'
end
