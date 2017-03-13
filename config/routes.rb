Rails.application.routes.draw do

  get 'relationships/create'

  get 'relationships/destroy'

 root 'top#index'
  resources :users, only: [:index]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
      registrations: "users/registrations",
      omniauth_callbacks: "users/omniauth_callbacks"
  }


  resources :topics, only: [:index, :new, :create, :edit, :show, :update, :destroy] do

  end

  resources :topics do
    resources :comments

    collection do
        post :confirm
      end
  end

  resources :users, only: [:index]

  resources :relationships, only: [:create, :destroy]

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
