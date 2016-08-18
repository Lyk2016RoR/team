Rails.application.routes.draw do
  #devise_for :admins
  #devise_for :users
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  devise_for :admins, controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resources :votes, only: [:create, :update ]
  end
  resources :authors
  resources :categories, only: [:show, :index]
  resources :comments, only: [:create, :destroy]
  root 'books#index'
end
