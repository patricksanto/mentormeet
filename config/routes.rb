Rails.application.routes.draw do
  devise_for :users
  root to: "mentorships#index"

  resources :mentorships do
   resources :mentorship_tags, only: [:new, :create]
    resources :bookings, only: [:new, :create, :edit] do
      resources :reviews, only: [:new, :create]
    end
  end

  resources :bookings, only: [:destroy, :update]
  resources :reviews, only: [:destroy]
  resources :users, only: [:show]

  get "dashboard", to: "users#dashboard"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
