Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # static page routes
  root                'static_pages#home'
  get    'about'   => 'static_pages#about'
  get    'products'=> 'static_pages#products'
  #get    'contact' => 'static_pages#contact'
  get    'dashboard' => 'static_pages#dashboard'
  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'
  
  resources :users
  resources :articles
  resources :comments, only: [:create, :destroy]
  resources :messages, only: [:new, :create]
end
