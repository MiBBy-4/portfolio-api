# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :projects, except: %i[new edit] do
        resources :comments, only: :create
      end
      resources :news, except: %i[new edit] do
        resources :comments, only: :create
      end
    end
  end

  namespace :users do
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
    delete :logout, to: 'sessions#logout'
    get :logged_in, to: 'sessions#logged_in'
  end
end
