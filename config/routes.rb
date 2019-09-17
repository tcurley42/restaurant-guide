Rails.application.routes.draw do
  root 'application#welcome'
  get 'signin' => 'sessions#new'
  get '/auth/facebook/callback' => 'sessions#create'
  post 'logout' => 'sessions#destroy'

  resources :users, only: [:show, :create, :new]
  resources :restaurants, only:[:new, :index, :create, :show, :edit, :update] do
    resources :experiences, only: [:new, :index, :show, :edit]
  end
  resources :sessions, only: :create
  resources :experiences, only: [:index, :show, :create, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
