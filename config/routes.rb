Rails.application.routes.draw do
  
  get 'messages/new'

  devise_for :admins
  devise_for :users
  # static page routes
  root                'static_pages#home'
  get    'about'   => 'static_pages#about'
  get    'products'=> 'static_pages#products'
  get    'contact' => 'static_pages#contact'
  get    'dashboard' => 'static_pages#dashboard'
  
  resources :users
  resources :articles
  resources :comments, only: [:create, :destroy]
end
