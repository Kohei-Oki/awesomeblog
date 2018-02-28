Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to:'static_pages#help'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  get '/signup', to:'users#new', as: 'signup'
  get '/login', to:'sessions#new', as: 'login'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts,  only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :account_activations, only: [:edit]

  #get 'static_pages/home'
  #get 'static_pages/help'
  #get 'static_pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
