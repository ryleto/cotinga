Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, :controller => 'users'
  
  root                 'static_pages#home'
  get   'about'     => 'static_pages#about'
  get   'dashboard' => 'static_pages#dashboard'
  get   'contact',  to: 'messages#new', as: 'contact'
  post  'contact',  to: 'messages#create'
  get   'tags/:tag',to: 'articles#index', as: :tag
  
  resources :users
  resources :articles
  resources :comments, only: [:create, :destroy]
  resources :messages, only: [:new, :create]

end
