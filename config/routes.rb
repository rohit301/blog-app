Rails.application.routes.draw do

  resources :blogs
  #get 'login', to: 'blogs#index' 
  #post 'login', to: 'blogs#new'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy' 
  root to: 'blogs#index'
  post "blog_url", to: 'blogs#index' 

  resources :users
  
  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  get 'authorized', to: 'sessions#page_requires_login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
