Rails.application.routes.draw do
  
  resources :articles
  devise_for :admins
  devise_for :users
  # static page routes
  root                'static_pages#home'
  get    'about'   => 'static_pages#about'
  get    'products'=> 'static_pages#products'
  get    'contact' => 'static_pages#contact'
  get    'dashboard' => 'static_pages#dashboard'
  
  resources :users
end
