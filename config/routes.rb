Rails.application.routes.draw do

  root 'top#index'


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
      registrations: "users/registrations",
      omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]

  resources :followed_users, only: [:index]
  resources :followers, only: [:index]

  resources :topics, only: [:index, :new, :create, :edit, :show, :update, :destroy] do
    collection do
        post :confirm
      end
  end

  resources :conversations do
    resources :messages
  end

  resources :topics do
    resources :comments
      post :confirm, on: :collection
  end

  devise_scope :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
