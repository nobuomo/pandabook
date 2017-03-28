Rails.application.routes.draw do

  root 'top#index'
  resources :users, only: [:index]
  resources :relationships, only: [:create, :destroy]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
      registrations: "users/registrations",
      omniauth_callbacks: "users/omniauth_callbacks"
  }


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
      collection do
      post :confirm
    end
  end


  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
